                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/monotone-array-macro.sink:              
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
      array T = int[!this.b                                                                         
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == index ? B : E                                                 
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       [SX.T{this}] a !this.b                                                                       
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void notSharedYetWrite() {                                                             
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          synchronized (this) {                                                                     
            [SX.T{this}] a;                                                                         
            a := this.a;                                                                            
            a[tid] := 3;                                                                            
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void shared() {                                                                        
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          synchronized (this) {                                                                     
            [SX.T{this}] a;                                                                         
            a := this.a;                                                                            
            a[tid] := 3;                                                                            
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedBad() {                                                                     
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          synchronized (this) {                                                                     
            [SX.T{this}] a;                                                                         
            a := this.a;                                                                            
            int tmp_5;                                                                              
            tmp_5 = 0;                                                                              
            a[tmp_5] := 3;                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead1() {                                                                   
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          synchronized (this) {                                                                     
            [SX.T{this}] a;                                                                         
            a := this.a;                                                                            
            int y;                                                                                  
            int tmp_7;                                                                              
            tmp_7 = 0;                                                                              
            y := a[tmp_7];                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead2Bad() {                                                                
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          [SX.T{this}] a;                                                                           
          a := this.a;                                                                              
          if (tid < a.length) {                                                                     
            int y;                                                                                  
            y := a[tid];                                                                            
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
      array T = int[!this.b                                                                         
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == index ? B : E                                                 
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       [SX.T{this}] a !this.b                                                                       
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
                                                                                                    
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
      public void notSharedYetWrite() {                                                             
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              a[tid] := 3;                                                                          
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void shared() {                                                                        
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              a[tid] := 3;                                                                          
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedBad() {                                                                     
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              int tmp_5;                                                                            
              tmp_5 = 0;                                                                            
              a[tmp_5] := 3;                                                                        
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead1() {                                                                   
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              int y;                                                                                
              int tmp_7;                                                                            
              tmp_7 = 0;                                                                            
              y := a[tmp_7];                                                                        
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead2Bad() {                                                                
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          [SX.T{this}] a;                                                                           
          a := this.a;                                                                              
          if (tid < a.length) {                                                                     
            int y;                                                                                  
            y := a[tid];                                                                            
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
      array T = int[!this.b                                                                         
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == index ? B : E                                                 
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       [SX.T{this}] a !this.b                                                                       
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
                                                                                                    
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
      public void notSharedYetWrite() {                                                             
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              a[tid] := 3;                                                                          
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void shared() {                                                                        
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              a[tid] := 3;                                                                          
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedBad() {                                                                     
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              int tmp_5;                                                                            
              tmp_5 = 0;                                                                            
              a[tmp_5] := 3;                                                                        
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead1() {                                                                   
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              int y;                                                                                
              int tmp_7;                                                                            
              tmp_7 = 0;                                                                            
              y := a[tmp_7];                                                                        
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead2Bad() {                                                                
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          [SX.T{this}] a;                                                                           
          a := this.a;                                                                              
          if (tid < a.length) {                                                                     
            int y;                                                                                  
            y := a[tid];                                                                            
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
      array T = int[!this.b                                                                         
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == index ? B : E                                                 
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       [SX.T{this}] a !this.b                                                                       
       ? holds(this, tid) ? B : E                                                                   
       : holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
                                                                                                    
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
      public void notSharedYetWrite() {                                                             
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              a[tid] := 3;                                                                          
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void shared() {                                                                        
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              a[tid] := 3;                                                                          
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedBad() {                                                                     
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              int tmp_5;                                                                            
              tmp_5 = 0;                                                                            
              a[tmp_5] := 3;                                                                        
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead1() {                                                                   
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              [SX.T{this}] a;                                                                       
              a := this.a;                                                                          
              int y;                                                                                
              int tmp_7;                                                                            
              tmp_7 = 0;                                                                            
              y := a[tmp_7];                                                                        
            }                                                                                       
            release(this);                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedRead2Bad() {                                                                
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          [SX.T{this}] a;                                                                           
          a := this.a;                                                                              
          if (tid < a.length) {                                                                     
            int y;                                                                                  
            y := a[tid];                                                                            
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        } else {                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
/*** Class Decl SX ***/                                                                             
                                                                                                    
type SX;                                                                                            
const unique SX.null: SX;                                                                           
var SX._state: [SX]State;                                                                           
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var SX.b: [SX]bool;                                                                                 
                                                                                                    
function {:inline} ReadEval.SX.b(tid: Tid,this : SX,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   if (isRead) then                                                                                 
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_R, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.SX.b(tid: Tid,this : SX,newValue: bool,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   if (isRead) then                                                                                 
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_R, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var SX.a: [SX]Array.SX.T;                                                                           
                                                                                                    
function {:inline} ReadEval.SX.a(tid: Tid,this : SX,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.SX.T.null;                                                                  
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   if (isRead) then                                                                                 
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_N, 2)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.SX.a(tid: Tid,this : SX,newValue: Array.SX.T,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   if (isRead) then                                                                                 
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_N, 2)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var SX._lock: [SX]Tid;                                                                              
                                                                                                    
function {:inline} ReadEval.SX._lock(tid: Tid,this : SX,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(SX._state[this], tid)) then                                                            
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((SX._lock[this]==tid)) then                                                                  
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((SX._lock[this]==Tid.null)&&(newValue==tid))) then                                          
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((SX._lock[this]==tid)&&(newValue==Tid.null))) then                                         
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.SX._lock(tid: Tid,this : SX,newValue: Tid,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(SX._state[this], tid)) then                                                            
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((SX._lock[this]==tid)) then                                                                  
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((SX._lock[this]==Tid.null)&&(newValue==tid))) then                                          
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((SX._lock[this]==tid)&&(newValue==Tid.null))) then                                         
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  SX.notSharedYetWrite(tid:Tid, this : SX)                                                 
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
modifies Array.SX.T._state;                                                                         
modifies Array.SX.T._elems;                                                                         
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (13.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
{                                                                                                   
 var SX._lock2728748_post: [SX]Tid;                                                                 
 var Array.SX.T._length2728747: [Array.SX.T]int;                                                    
 var Array.SX.T._length2728757: [Array.SX.T]int;                                                    
 var SX._state2728770: [SX]State;                                                                   
 var SX._lock2728770: [SX]Tid;                                                                      
 var SX._lock2728757: [SX]Tid;                                                                      
 var mover2728757: Mover;                                                                           
 var SX.a2728748: [SX]Array.SX.T;                                                                   
 var Array.SX.T._length2728762: [Array.SX.T]int;                                                    
 var SX.a2728770: [SX]Array.SX.T;                                                                   
 var SX._lock2728748: [SX]Tid;                                                                      
 var tid2728757: Tid;                                                                               
 var SX.a2728747: [SX]Array.SX.T;                                                                   
 var $pc2728748_post: Phase;                                                                        
 var moverPath2728757: MoverPath;                                                                   
 var Array.SX.T._elems2728747: [Array.SX.T]([int]int);                                              
 var Array.SX.T._state2728762: [Array.SX.T]State;                                                   
 var SX.b2728747: [SX]bool;                                                                         
 var $recorded.state2728757: int;                                                                   
 var SX._state2728747: [SX]State;                                                                   
 var Array.SX.T._elems2728757: [Array.SX.T]([int]int);                                              
 var path2728757: int;                                                                              
 var $recorded.state2728762: int;                                                                   
 var mover2728747: Mover;                                                                           
 var mover2728762: Mover;                                                                           
 var SX._state2728748: [SX]State;                                                                   
 var Array.SX.T._state2728770: [Array.SX.T]State;                                                   
 var Array.SX.T._elems2728748_post: [Array.SX.T]([int]int);                                         
 var $recorded.state2728748: int;                                                                   
 var SX.a2728748_post: [SX]Array.SX.T;                                                              
 var temp2728748_post: bool;                                                                        
 var SX.b2728770: [SX]bool;                                                                         
 var SX.b2728757: [SX]bool;                                                                         
 var tid2728747: Tid;                                                                               
 var SX.a2728762: [SX]Array.SX.T;                                                                   
 var tid2728748: Tid;                                                                               
 var this2728748: SX;                                                                               
 var SX.a2728757: [SX]Array.SX.T;                                                                   
 var SX._state2728762: [SX]State;                                                                   
 var temp2728762: bool;                                                                             
 var temp: bool;                                                                                    
 var path2728747: int;                                                                              
 var tid2728770: Tid;                                                                               
 var $pc2728762: Phase;                                                                             
 var $pc2728757: Phase;                                                                             
 var this2728757: SX;                                                                               
 var $pc2728748: Phase;                                                                             
 var path2728762: int;                                                                              
 var SX._state2728757: [SX]State;                                                                   
 var SX.b2728748: [SX]bool;                                                                         
 var tid2728748_post: Tid;                                                                          
 var Array.SX.T._state2728757: [Array.SX.T]State;                                                   
 var SX.b2728748_post: [SX]bool;                                                                    
 var SX._lock2728762: [SX]Tid;                                                                      
 var temp2728748: bool;                                                                             
 var temp2728747: bool;                                                                             
 var Array.SX.T._length2728770: [Array.SX.T]int;                                                    
 var temp2728770: bool;                                                                             
 var a2728757: Array.SX.T;                                                                          
 var this2728747: SX;                                                                               
 var temp2728757: bool;                                                                             
 var SX._state2728748_post: [SX]State;                                                              
 var $pc2728747: Phase;                                                                             
 var Array.SX.T._state2728748: [Array.SX.T]State;                                                   
 var $recorded.state2728748_post: int;                                                              
 var this2728748_post: SX;                                                                          
 var moverPath2728747: MoverPath;                                                                   
 var $pc2728770: Phase;                                                                             
 var moverPath2728762: MoverPath;                                                                   
 var Array.SX.T._state2728748_post: [Array.SX.T]State;                                              
 var a2728762: Array.SX.T;                                                                          
 var a: Array.SX.T;                                                                                 
 var SX.b2728762: [SX]bool;                                                                         
 var Array.SX.T._length2728748: [Array.SX.T]int;                                                    
 var Array.SX.T._elems2728770: [Array.SX.T]([int]int);                                              
 var Array.SX.T._elems2728762: [Array.SX.T]([int]int);                                              
 var Array.SX.T._length2728748_post: [Array.SX.T]int;                                               
 var this2728770: SX;                                                                               
 var $recorded.state2728747: int;                                                                   
 var Array.SX.T._elems2728748: [Array.SX.T]([int]int);                                              
 var tid2728762: Tid;                                                                               
 var Array.SX.T._state2728747: [Array.SX.T]State;                                                   
 var this2728762: SX;                                                                               
 var SX._lock2728747: [SX]Tid;                                                                      
 var $recorded.state2728770: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 14.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 14.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2728747 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 mover2728747 := m#moverPath(moverPath2728747);                                                     
 path2728747 := p#moverPath(moverPath2728747);                                                      
 assume SX._state2728747 == SX._state && SX.b2728747 == SX.b && SX.a2728747 == SX.a && SX._lock2728747 == SX._lock && Array.SX.T._state2728747 == Array.SX.T._state && Array.SX.T._elems2728747 == Array.SX.T._elems && Array.SX.T._length2728747 == Array.SX.T._length && temp2728747 == temp && this2728747 == this && tid2728747 == tid && $pc2728747 == $pc;
 assume $recorded.state2728747 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2728747);                                                              
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 temp := SX.b[this];                                                                                
 if (!(temp)) {                                                                                     
                                                                                                    
  // 16.13: yield;                                                                                  
                                                                                                    
  assume SX._state2728748 == SX._state && SX.b2728748 == SX.b && SX.a2728748 == SX.a && SX._lock2728748 == SX._lock && Array.SX.T._state2728748 == Array.SX.T._state && Array.SX.T._elems2728748 == Array.SX.T._elems && Array.SX.T._length2728748 == Array.SX.T._length && temp2728748 == temp && this2728748 == this && tid2728748 == tid;
  assume $recorded.state2728748 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume SX._state2728748_post == SX._state && SX.b2728748_post == SX.b && SX.a2728748_post == SX.a && SX._lock2728748_post == SX._lock && Array.SX.T._state2728748_post == Array.SX.T._state && Array.SX.T._elems2728748_post == Array.SX.T._elems && Array.SX.T._length2728748_post == Array.SX.T._length && temp2728748_post == temp && this2728748_post == this && tid2728748_post == tid;
  assume $recorded.state2728748_post == 1;                                                          
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (17.26): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume SX._lock[this] == Tid.null;                                                                
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (17.26): Reduction failure
  SX._lock[this] := tid;                                                                            
                                                                                                    
  // 18.17: [SX.T{this}] a;                                                                         
                                                                                                    
                                                                                                    
  // 18.17: a := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728757 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728757 := m#moverPath(moverPath2728757);                                                    
  path2728757 := p#moverPath(moverPath2728757);                                                     
  assume SX._state2728757 == SX._state && SX.b2728757 == SX.b && SX.a2728757 == SX.a && SX._lock2728757 == SX._lock && Array.SX.T._state2728757 == Array.SX.T._state && Array.SX.T._elems2728757 == Array.SX.T._elems && Array.SX.T._length2728757 == Array.SX.T._length && a2728757 == a && temp2728757 == temp && this2728757 == this && tid2728757 == tid && $pc2728757 == $pc;
  assume $recorded.state2728757 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (18.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728757);                                                             
  assert $pc != PhaseError;                                                                                // (18.17): Reduction failure
  a := SX.a[this];                                                                                  
                                                                                                    
  // 19.17: a[tid] := 3;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728762 := WriteEval.Array.SX.T(tid: Tid,this: SX,a: Array.SX.T,tid: int,3: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728762 := m#moverPath(moverPath2728762);                                                    
  path2728762 := p#moverPath(moverPath2728762);                                                     
  assume SX._state2728762 == SX._state && SX.b2728762 == SX.b && SX.a2728762 == SX.a && SX._lock2728762 == SX._lock && Array.SX.T._state2728762 == Array.SX.T._state && Array.SX.T._elems2728762 == Array.SX.T._elems && Array.SX.T._length2728762 == Array.SX.T._length && a2728762 == a && temp2728762 == temp && this2728762 == this && tid2728762 == tid && $pc2728762 == $pc;
  assume $recorded.state2728762 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume a != Array.SX.T.null;                                                                     
  } else {                                                                                          
   assert a != Array.SX.T.null;                                                                            // (19.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= tid;                                                                                 
  } else {                                                                                          
   assert 0 <= tid;                                                                                        // (19.17): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume tid < Array.SX.T._length[a];                                                              
  } else {                                                                                          
   assert tid < Array.SX.T._length[a];                                                                     // (19.17): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728762);                                                             
  assert $pc != PhaseError;                                                                                // (19.17): Reduction failure
  Array.SX.T._elems[a][tid] := 3;                                                                   
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (20.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (20.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (20.13): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 13.37: // return;                                                                               
                                                                                                    
 assume SX._state2728770 == SX._state && SX.b2728770 == SX.b && SX.a2728770 == SX.a && SX._lock2728770 == SX._lock && Array.SX.T._state2728770 == Array.SX.T._state && Array.SX.T._elems2728770 == Array.SX.T._elems && Array.SX.T._length2728770 == Array.SX.T._length && temp2728770 == temp && this2728770 == this && tid2728770 == tid;
 assume $recorded.state2728770 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.shared(tid:Tid, this : SX)                                                            
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
modifies Array.SX.T._state;                                                                         
modifies Array.SX.T._elems;                                                                         
                                                                                                    
requires ValidTid(tid);                                                                                    // (24.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (24.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
{                                                                                                   
 var mover2728788: Mover;                                                                           
 var SX._state2728793: [SX]State;                                                                   
 var path2728779: int;                                                                              
 var SX._lock2728801: [SX]Tid;                                                                      
 var SX.b2728788: [SX]bool;                                                                         
 var SX._lock2728793: [SX]Tid;                                                                      
 var SX.b2728801: [SX]bool;                                                                         
 var Array.SX.T._elems2728793: [Array.SX.T]([int]int);                                              
 var temp2728801: bool;                                                                             
 var mover2728779: Mover;                                                                           
 var Array.SX.T._state2728793: [Array.SX.T]State;                                                   
 var Array.SX.T._elems2728801: [Array.SX.T]([int]int);                                              
 var this2728779: SX;                                                                               
 var Array.SX.T._state2728801: [Array.SX.T]State;                                                   
 var this2728788: SX;                                                                               
 var Array.SX.T._length2728788: [Array.SX.T]int;                                                    
 var $recorded.state2728788: int;                                                                   
 var Array.SX.T._elems2728788: [Array.SX.T]([int]int);                                              
 var Array.SX.T._state2728779: [Array.SX.T]State;                                                   
 var Array.SX.T._length2728779: [Array.SX.T]int;                                                    
 var path2728793: int;                                                                              
 var $recorded.state2728793: int;                                                                   
 var SX._state2728788: [SX]State;                                                                   
 var moverPath2728779: MoverPath;                                                                   
 var tid2728788: Tid;                                                                               
 var $pc2728779: Phase;                                                                             
 var Array.SX.T._elems2728779: [Array.SX.T]([int]int);                                              
 var mover2728793: Mover;                                                                           
 var $pc2728801: Phase;                                                                             
 var $recorded.state2728801: int;                                                                   
 var SX.a2728788: [SX]Array.SX.T;                                                                   
 var a2728788: Array.SX.T;                                                                          
 var Array.SX.T._length2728793: [Array.SX.T]int;                                                    
 var Array.SX.T._length2728801: [Array.SX.T]int;                                                    
 var temp: bool;                                                                                    
 var SX.a2728779: [SX]Array.SX.T;                                                                   
 var SX.b2728793: [SX]bool;                                                                         
 var SX._state2728801: [SX]State;                                                                   
 var path2728788: int;                                                                              
 var SX._lock2728779: [SX]Tid;                                                                      
 var temp2728779: bool;                                                                             
 var temp2728788: bool;                                                                             
 var moverPath2728793: MoverPath;                                                                   
 var SX._state2728779: [SX]State;                                                                   
 var this2728801: SX;                                                                               
 var this2728793: SX;                                                                               
 var temp2728793: bool;                                                                             
 var SX.b2728779: [SX]bool;                                                                         
 var tid2728779: Tid;                                                                               
 var SX._lock2728788: [SX]Tid;                                                                      
 var $recorded.state2728779: int;                                                                   
 var Array.SX.T._state2728788: [Array.SX.T]State;                                                   
 var moverPath2728788: MoverPath;                                                                   
 var a2728793: Array.SX.T;                                                                          
 var SX.a2728793: [SX]Array.SX.T;                                                                   
 var tid2728793: Tid;                                                                               
 var $pc2728788: Phase;                                                                             
 var SX.a2728801: [SX]Array.SX.T;                                                                   
 var a: Array.SX.T;                                                                                 
 var $pc2728793: Phase;                                                                             
 var tid2728801: Tid;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 25.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 25.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2728779 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 mover2728779 := m#moverPath(moverPath2728779);                                                     
 path2728779 := p#moverPath(moverPath2728779);                                                      
 assume SX._state2728779 == SX._state && SX.b2728779 == SX.b && SX.a2728779 == SX.a && SX._lock2728779 == SX._lock && Array.SX.T._state2728779 == Array.SX.T._state && Array.SX.T._elems2728779 == Array.SX.T._elems && Array.SX.T._length2728779 == Array.SX.T._length && temp2728779 == temp && this2728779 == this && tid2728779 == tid && $pc2728779 == $pc;
 assume $recorded.state2728779 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (25.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2728779);                                                              
 assert $pc != PhaseError;                                                                                 // (25.9): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (27.26): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume SX._lock[this] == Tid.null;                                                                
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (27.26): Reduction failure
  SX._lock[this] := tid;                                                                            
                                                                                                    
  // 28.17: [SX.T{this}] a;                                                                         
                                                                                                    
                                                                                                    
  // 28.17: a := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728788 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728788 := m#moverPath(moverPath2728788);                                                    
  path2728788 := p#moverPath(moverPath2728788);                                                     
  assume SX._state2728788 == SX._state && SX.b2728788 == SX.b && SX.a2728788 == SX.a && SX._lock2728788 == SX._lock && Array.SX.T._state2728788 == Array.SX.T._state && Array.SX.T._elems2728788 == Array.SX.T._elems && Array.SX.T._length2728788 == Array.SX.T._length && a2728788 == a && temp2728788 == temp && this2728788 == this && tid2728788 == tid && $pc2728788 == $pc;
  assume $recorded.state2728788 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (28.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728788);                                                             
  assert $pc != PhaseError;                                                                                // (28.17): Reduction failure
  a := SX.a[this];                                                                                  
                                                                                                    
  // 29.17: a[tid] := 3;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728793 := WriteEval.Array.SX.T(tid: Tid,this: SX,a: Array.SX.T,tid: int,3: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728793 := m#moverPath(moverPath2728793);                                                    
  path2728793 := p#moverPath(moverPath2728793);                                                     
  assume SX._state2728793 == SX._state && SX.b2728793 == SX.b && SX.a2728793 == SX.a && SX._lock2728793 == SX._lock && Array.SX.T._state2728793 == Array.SX.T._state && Array.SX.T._elems2728793 == Array.SX.T._elems && Array.SX.T._length2728793 == Array.SX.T._length && a2728793 == a && temp2728793 == temp && this2728793 == this && tid2728793 == tid && $pc2728793 == $pc;
  assume $recorded.state2728793 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume a != Array.SX.T.null;                                                                     
  } else {                                                                                          
   assert a != Array.SX.T.null;                                                                            // (29.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= tid;                                                                                 
  } else {                                                                                          
   assert 0 <= tid;                                                                                        // (29.17): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume tid < Array.SX.T._length[a];                                                              
  } else {                                                                                          
   assert tid < Array.SX.T._length[a];                                                                     // (29.17): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728793);                                                             
  assert $pc != PhaseError;                                                                                // (29.17): Reduction failure
  Array.SX.T._elems[a][tid] := 3;                                                                   
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (30.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (30.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (30.13): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 24.26: // return;                                                                               
                                                                                                    
 assume SX._state2728801 == SX._state && SX.b2728801 == SX.b && SX.a2728801 == SX.a && SX._lock2728801 == SX._lock && Array.SX.T._state2728801 == Array.SX.T._state && Array.SX.T._elems2728801 == Array.SX.T._elems && Array.SX.T._length2728801 == Array.SX.T._length && temp2728801 == temp && this2728801 == this && tid2728801 == tid;
 assume $recorded.state2728801 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.sharedBad(tid:Tid, this : SX)                                                         
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
modifies Array.SX.T._state;                                                                         
modifies Array.SX.T._elems;                                                                         
                                                                                                    
requires ValidTid(tid);                                                                                    // (33.9): Bad tid
requires isShared(SX._state[this]);                                                                        // (33.9): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
{                                                                                                   
 var $recorded.state2728819: int;                                                                   
 var $recorded.state2728831: int;                                                                   
 var $pc2728839: Phase;                                                                             
 var SX._lock2728810: [SX]Tid;                                                                      
 var SX.b2728819: [SX]bool;                                                                         
 var SX.b2728831: [SX]bool;                                                                         
 var a2728819: Array.SX.T;                                                                          
 var $recorded.state2728839: int;                                                                   
 var moverPath2728810: MoverPath;                                                                   
 var this2728831: SX;                                                                               
 var SX._state2728819: [SX]State;                                                                   
 var tid2728819: Tid;                                                                               
 var path2728810: int;                                                                              
 var Array.SX.T._elems2728819: [Array.SX.T]([int]int);                                              
 var SX._state2728831: [SX]State;                                                                   
 var Array.SX.T._state2728831: [Array.SX.T]State;                                                   
 var SX._state2728810: [SX]State;                                                                   
 var Array.SX.T._length2728831: [Array.SX.T]int;                                                    
 var a2728831: Array.SX.T;                                                                          
 var Array.SX.T._length2728810: [Array.SX.T]int;                                                    
 var Array.SX.T._state2728810: [Array.SX.T]State;                                                   
 var tid2728839: Tid;                                                                               
 var Array.SX.T._elems2728810: [Array.SX.T]([int]int);                                              
 var temp2728831: bool;                                                                             
 var moverPath2728819: MoverPath;                                                                   
 var SX._lock2728819: [SX]Tid;                                                                      
 var tmp_5: int;                                                                                    
 var Array.SX.T._length2728839: [Array.SX.T]int;                                                    
 var SX.b2728810: [SX]bool;                                                                         
 var Array.SX.T._elems2728839: [Array.SX.T]([int]int);                                              
 var this2728839: SX;                                                                               
 var temp: bool;                                                                                    
 var SX.a2728819: [SX]Array.SX.T;                                                                   
 var Array.SX.T._state2728819: [Array.SX.T]State;                                                   
 var this2728810: SX;                                                                               
 var Array.SX.T._length2728819: [Array.SX.T]int;                                                    
 var SX._lock2728831: [SX]Tid;                                                                      
 var temp2728819: bool;                                                                             
 var temp2728839: bool;                                                                             
 var this2728819: SX;                                                                               
 var mover2728831: Mover;                                                                           
 var mover2728810: Mover;                                                                           
 var temp2728810: bool;                                                                             
 var SX.a2728810: [SX]Array.SX.T;                                                                   
 var $pc2728831: Phase;                                                                             
 var tmp_52728831: int;                                                                             
 var SX.b2728839: [SX]bool;                                                                         
 var SX.a2728831: [SX]Array.SX.T;                                                                   
 var SX._lock2728839: [SX]Tid;                                                                      
 var path2728831: int;                                                                              
 var SX.a2728839: [SX]Array.SX.T;                                                                   
 var SX._state2728839: [SX]State;                                                                   
 var Array.SX.T._state2728839: [Array.SX.T]State;                                                   
 var path2728819: int;                                                                              
 var a: Array.SX.T;                                                                                 
 var $pc2728810: Phase;                                                                             
 var Array.SX.T._elems2728831: [Array.SX.T]([int]int);                                              
 var $recorded.state2728810: int;                                                                   
 var moverPath2728831: MoverPath;                                                                   
 var tid2728831: Tid;                                                                               
 var tid2728810: Tid;                                                                               
 var mover2728819: Mover;                                                                           
 var $pc2728819: Phase;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 34.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 34.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2728810 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 mover2728810 := m#moverPath(moverPath2728810);                                                     
 path2728810 := p#moverPath(moverPath2728810);                                                      
 assume SX._state2728810 == SX._state && SX.b2728810 == SX.b && SX.a2728810 == SX.a && SX._lock2728810 == SX._lock && Array.SX.T._state2728810 == Array.SX.T._state && Array.SX.T._elems2728810 == Array.SX.T._elems && Array.SX.T._length2728810 == Array.SX.T._length && temp2728810 == temp && this2728810 == this && tid2728810 == tid && $pc2728810 == $pc;
 assume $recorded.state2728810 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (34.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2728810);                                                              
 assert $pc != PhaseError;                                                                                 // (34.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (36.30): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume SX._lock[this] == Tid.null;                                                                
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (36.30): Reduction failure
  SX._lock[this] := tid;                                                                            
                                                                                                    
  // 37.21: [SX.T{this}] a;                                                                         
                                                                                                    
                                                                                                    
  // 37.21: a := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728819 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728819 := m#moverPath(moverPath2728819);                                                    
  path2728819 := p#moverPath(moverPath2728819);                                                     
  assume SX._state2728819 == SX._state && SX.b2728819 == SX.b && SX.a2728819 == SX.a && SX._lock2728819 == SX._lock && Array.SX.T._state2728819 == Array.SX.T._state && Array.SX.T._elems2728819 == Array.SX.T._elems && Array.SX.T._length2728819 == Array.SX.T._length && a2728819 == a && temp2728819 == temp && this2728819 == this && tid2728819 == tid && $pc2728819 == $pc;
  assume $recorded.state2728819 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (37.21): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728819);                                                             
  assert $pc != PhaseError;                                                                                // (37.21): Reduction failure
  a := SX.a[this];                                                                                  
                                                                                                    
  // 38.23: int tmp_5;                                                                              
                                                                                                    
                                                                                                    
  // 38.23: tmp_5 = 0;                                                                              
                                                                                                    
  tmp_5 := 0;                                                                                       
                                                                                                    
  // 38.21: a[tmp_5] := 3;                                                                          
                                                                                                    
                                                                                                    
  moverPath2728831 := WriteEval.Array.SX.T(tid: Tid,this: SX,a: Array.SX.T,tmp_5: int,3: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728831 := m#moverPath(moverPath2728831);                                                    
  path2728831 := p#moverPath(moverPath2728831);                                                     
  assume SX._state2728831 == SX._state && SX.b2728831 == SX.b && SX.a2728831 == SX.a && SX._lock2728831 == SX._lock && Array.SX.T._state2728831 == Array.SX.T._state && Array.SX.T._elems2728831 == Array.SX.T._elems && Array.SX.T._length2728831 == Array.SX.T._length && tmp_52728831 == tmp_5 && a2728831 == a && temp2728831 == temp && this2728831 == this && tid2728831 == tid && $pc2728831 == $pc;
  assume $recorded.state2728831 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume a != Array.SX.T.null;                                                                     
  } else {                                                                                          
   assert a != Array.SX.T.null;                                                                            // (38.21): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= tmp_5;                                                                               
  } else {                                                                                          
   assert 0 <= tmp_5;                                                                                      // (38.21): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume tmp_5 < Array.SX.T._length[a];                                                            
  } else {                                                                                          
   assert tmp_5 < Array.SX.T._length[a];                                                                   // (38.21): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728831);                                                             
  assert $pc != PhaseError;                                                                                // (38.21): Reduction failure
  Array.SX.T._elems[a][tmp_5] := 3;                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (39.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (39.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (39.17): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 33.33: // return;                                                                               
                                                                                                    
 assume SX._state2728839 == SX._state && SX.b2728839 == SX.b && SX.a2728839 == SX.a && SX._lock2728839 == SX._lock && Array.SX.T._state2728839 == Array.SX.T._state && Array.SX.T._elems2728839 == Array.SX.T._elems && Array.SX.T._length2728839 == Array.SX.T._length && temp2728839 == temp && this2728839 == this && tid2728839 == tid;
 assume $recorded.state2728839 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.sharedRead1(tid:Tid, this : SX)                                                       
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
modifies Array.SX.T._state;                                                                         
modifies Array.SX.T._elems;                                                                         
                                                                                                    
requires ValidTid(tid);                                                                                    // (43.9): Bad tid
requires isShared(SX._state[this]);                                                                        // (43.9): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
{                                                                                                   
 var Array.SX.T._length2728871: [Array.SX.T]int;                                                    
 var a2728857: Array.SX.T;                                                                          
 var temp2728857: bool;                                                                             
 var $pc2728871: Phase;                                                                             
 var SX.b2728857: [SX]bool;                                                                         
 var Array.SX.T._length2728848: [Array.SX.T]int;                                                    
 var y2728871: int;                                                                                 
 var this2728857: SX;                                                                               
 var $recorded.state2728857: int;                                                                   
 var SX.a2728871: [SX]Array.SX.T;                                                                   
 var Array.SX.T._state2728848: [Array.SX.T]State;                                                   
 var this2728879: SX;                                                                               
 var this2728871: SX;                                                                               
 var $recorded.state2728879: int;                                                                   
 var SX.a2728857: [SX]Array.SX.T;                                                                   
 var SX.b2728879: [SX]bool;                                                                         
 var tid2728879: Tid;                                                                               
 var Array.SX.T._elems2728857: [Array.SX.T]([int]int);                                              
 var $pc2728857: Phase;                                                                             
 var path2728848: int;                                                                              
 var Array.SX.T._elems2728848: [Array.SX.T]([int]int);                                              
 var SX._lock2728871: [SX]Tid;                                                                      
 var this2728848: SX;                                                                               
 var SX._lock2728857: [SX]Tid;                                                                      
 var SX._lock2728879: [SX]Tid;                                                                      
 var SX.a2728879: [SX]Array.SX.T;                                                                   
 var SX._state2728857: [SX]State;                                                                   
 var moverPath2728848: MoverPath;                                                                   
 var Array.SX.T._state2728871: [Array.SX.T]State;                                                   
 var temp2728879: bool;                                                                             
 var moverPath2728857: MoverPath;                                                                   
 var mover2728857: Mover;                                                                           
 var SX._lock2728848: [SX]Tid;                                                                      
 var temp: bool;                                                                                    
 var mover2728871: Mover;                                                                           
 var SX.b2728848: [SX]bool;                                                                         
 var tid2728848: Tid;                                                                               
 var Array.SX.T._state2728879: [Array.SX.T]State;                                                   
 var SX.b2728871: [SX]bool;                                                                         
 var y: int;                                                                                        
 var Array.SX.T._length2728879: [Array.SX.T]int;                                                    
 var Array.SX.T._length2728857: [Array.SX.T]int;                                                    
 var Array.SX.T._elems2728871: [Array.SX.T]([int]int);                                              
 var temp2728871: bool;                                                                             
 var mover2728848: Mover;                                                                           
 var Array.SX.T._state2728857: [Array.SX.T]State;                                                   
 var $pc2728848: Phase;                                                                             
 var moverPath2728871: MoverPath;                                                                   
 var path2728857: int;                                                                              
 var SX._state2728879: [SX]State;                                                                   
 var a2728871: Array.SX.T;                                                                          
 var tmp_7: int;                                                                                    
 var tmp_72728871: int;                                                                             
 var tid2728857: Tid;                                                                               
 var $recorded.state2728848: int;                                                                   
 var a: Array.SX.T;                                                                                 
 var path2728871: int;                                                                              
 var Array.SX.T._elems2728879: [Array.SX.T]([int]int);                                              
 var SX._state2728848: [SX]State;                                                                   
 var $pc2728879: Phase;                                                                             
 var $recorded.state2728871: int;                                                                   
 var SX.a2728848: [SX]Array.SX.T;                                                                   
 var tid2728871: Tid;                                                                               
 var SX._state2728871: [SX]State;                                                                   
 var temp2728848: bool;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 44.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 44.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2728848 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 mover2728848 := m#moverPath(moverPath2728848);                                                     
 path2728848 := p#moverPath(moverPath2728848);                                                      
 assume SX._state2728848 == SX._state && SX.b2728848 == SX.b && SX.a2728848 == SX.a && SX._lock2728848 == SX._lock && Array.SX.T._state2728848 == Array.SX.T._state && Array.SX.T._elems2728848 == Array.SX.T._elems && Array.SX.T._length2728848 == Array.SX.T._length && temp2728848 == temp && this2728848 == this && tid2728848 == tid && $pc2728848 == $pc;
 assume $recorded.state2728848 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (44.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2728848);                                                              
 assert $pc != PhaseError;                                                                                 // (44.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (46.30): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume SX._lock[this] == Tid.null;                                                                
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (46.30): Reduction failure
  SX._lock[this] := tid;                                                                            
                                                                                                    
  // 47.21: [SX.T{this}] a;                                                                         
                                                                                                    
                                                                                                    
  // 47.21: a := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728857 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728857 := m#moverPath(moverPath2728857);                                                    
  path2728857 := p#moverPath(moverPath2728857);                                                     
  assume SX._state2728857 == SX._state && SX.b2728857 == SX.b && SX.a2728857 == SX.a && SX._lock2728857 == SX._lock && Array.SX.T._state2728857 == Array.SX.T._state && Array.SX.T._elems2728857 == Array.SX.T._elems && Array.SX.T._length2728857 == Array.SX.T._length && a2728857 == a && temp2728857 == temp && this2728857 == this && tid2728857 == tid && $pc2728857 == $pc;
  assume $recorded.state2728857 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (47.21): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728857);                                                             
  assert $pc != PhaseError;                                                                                // (47.21): Reduction failure
  a := SX.a[this];                                                                                  
                                                                                                    
  // 48.21: int y;                                                                                  
                                                                                                    
                                                                                                    
  // 48.32: int tmp_7;                                                                              
                                                                                                    
                                                                                                    
  // 48.32: tmp_7 = 0;                                                                              
                                                                                                    
  tmp_7 := 0;                                                                                       
                                                                                                    
  // 48.21: y := a[tmp_7];                                                                          
                                                                                                    
                                                                                                    
  moverPath2728871 := ReadEval.Array.SX.T(tid: Tid,this: SX,a: Array.SX.T,tmp_7: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728871 := m#moverPath(moverPath2728871);                                                    
  path2728871 := p#moverPath(moverPath2728871);                                                     
  assume SX._state2728871 == SX._state && SX.b2728871 == SX.b && SX.a2728871 == SX.a && SX._lock2728871 == SX._lock && Array.SX.T._state2728871 == Array.SX.T._state && Array.SX.T._elems2728871 == Array.SX.T._elems && Array.SX.T._length2728871 == Array.SX.T._length && tmp_72728871 == tmp_7 && y2728871 == y && a2728871 == a && temp2728871 == temp && this2728871 == this && tid2728871 == tid && $pc2728871 == $pc;
  assume $recorded.state2728871 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume a != Array.SX.T.null;                                                                     
  } else {                                                                                          
   assert a != Array.SX.T.null;                                                                            // (48.21): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= tmp_7;                                                                               
  } else {                                                                                          
   assert 0 <= tmp_7;                                                                                      // (48.21): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume tmp_7 < Array.SX.T._length[a];                                                            
  } else {                                                                                          
   assert tmp_7 < Array.SX.T._length[a];                                                                   // (48.21): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728871);                                                             
  assert $pc != PhaseError;                                                                                // (48.21): Reduction failure
  y := Array.SX.T._elems[a][tmp_7];                                                                 
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (49.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (49.17): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (49.17): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 43.35: // return;                                                                               
                                                                                                    
 assume SX._state2728879 == SX._state && SX.b2728879 == SX.b && SX.a2728879 == SX.a && SX._lock2728879 == SX._lock && Array.SX.T._state2728879 == Array.SX.T._state && Array.SX.T._elems2728879 == Array.SX.T._elems && Array.SX.T._length2728879 == Array.SX.T._length && temp2728879 == temp && this2728879 == this && tid2728879 == tid;
 assume $recorded.state2728879 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.sharedRead2Bad(tid:Tid, this : SX)                                                    
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
modifies Array.SX.T._state;                                                                         
modifies Array.SX.T._elems;                                                                         
                                                                                                    
requires ValidTid(tid);                                                                                    // (53.9): Bad tid
requires isShared(SX._state[this]);                                                                        // (53.9): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
{                                                                                                   
 var Array.SX.T._elems2728909: [Array.SX.T]([int]int);                                              
 var path2728888: int;                                                                              
 var $pc2728909: Phase;                                                                             
 var Array.SX.T._length2728895: [Array.SX.T]int;                                                    
 var SX._lock2728888: [SX]Tid;                                                                      
 var mover2728895: Mover;                                                                           
 var $pc2728902: Phase;                                                                             
 var mover2728902: Mover;                                                                           
 var this2728902: SX;                                                                               
 var SX.b2728909: [SX]bool;                                                                         
 var $pc2728888: Phase;                                                                             
 var Array.SX.T._elems2728888: [Array.SX.T]([int]int);                                              
 var Array.SX.T._length2728909: [Array.SX.T]int;                                                    
 var Array.SX.T._length2728902: [Array.SX.T]int;                                                    
 var SX._lock2728909: [SX]Tid;                                                                      
 var a2728895: Array.SX.T;                                                                          
 var moverPath2728902: MoverPath;                                                                   
 var moverPath2728895: MoverPath;                                                                   
 var Array.SX.T._state2728895: [Array.SX.T]State;                                                   
 var temp2728895: bool;                                                                             
 var SX._state2728902: [SX]State;                                                                   
 var SX.a2728909: [SX]Array.SX.T;                                                                   
 var SX.b2728902: [SX]bool;                                                                         
 var temp2728909: bool;                                                                             
 var tid2728902: Tid;                                                                               
 var Array.SX.T._elems2728902: [Array.SX.T]([int]int);                                              
 var SX.b2728895: [SX]bool;                                                                         
 var Array.SX.T._state2728909: [Array.SX.T]State;                                                   
 var temp: bool;                                                                                    
 var temp2728888: bool;                                                                             
 var mover2728888: Mover;                                                                           
 var this2728888: SX;                                                                               
 var SX._state2728895: [SX]State;                                                                   
 var this2728909: SX;                                                                               
 var path2728902: int;                                                                              
 var SX.b2728888: [SX]bool;                                                                         
 var y: int;                                                                                        
 var SX._state2728909: [SX]State;                                                                   
 var SX._lock2728902: [SX]Tid;                                                                      
 var SX.a2728895: [SX]Array.SX.T;                                                                   
 var $recorded.state2728909: int;                                                                   
 var SX._lock2728895: [SX]Tid;                                                                      
 var tid2728909: Tid;                                                                               
 var $recorded.state2728895: int;                                                                   
 var SX._state2728888: [SX]State;                                                                   
 var SX.a2728888: [SX]Array.SX.T;                                                                   
 var Array.SX.T._length2728888: [Array.SX.T]int;                                                    
 var $recorded.state2728888: int;                                                                   
 var Array.SX.T._state2728902: [Array.SX.T]State;                                                   
 var this2728895: SX;                                                                               
 var y2728902: int;                                                                                 
 var tid2728888: Tid;                                                                               
 var Array.SX.T._elems2728895: [Array.SX.T]([int]int);                                              
 var moverPath2728888: MoverPath;                                                                   
 var temp2728902: bool;                                                                             
 var a2728902: Array.SX.T;                                                                          
 var Array.SX.T._state2728888: [Array.SX.T]State;                                                   
 var a: Array.SX.T;                                                                                 
 var tid2728895: Tid;                                                                               
 var SX.a2728902: [SX]Array.SX.T;                                                                   
 var path2728895: int;                                                                              
 var $recorded.state2728902: int;                                                                   
 var $pc2728895: Phase;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 54.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 54.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2728888 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 mover2728888 := m#moverPath(moverPath2728888);                                                     
 path2728888 := p#moverPath(moverPath2728888);                                                      
 assume SX._state2728888 == SX._state && SX.b2728888 == SX.b && SX.a2728888 == SX.a && SX._lock2728888 == SX._lock && Array.SX.T._state2728888 == Array.SX.T._state && Array.SX.T._elems2728888 == Array.SX.T._elems && Array.SX.T._length2728888 == Array.SX.T._length && temp2728888 == temp && this2728888 == this && tid2728888 == tid && $pc2728888 == $pc;
 assume $recorded.state2728888 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (54.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2728888);                                                              
 assert $pc != PhaseError;                                                                                 // (54.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
                                                                                                    
  // 56.21: [SX.T{this}] a;                                                                         
                                                                                                    
                                                                                                    
  // 56.21: a := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2728895 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
  mover2728895 := m#moverPath(moverPath2728895);                                                    
  path2728895 := p#moverPath(moverPath2728895);                                                     
  assume SX._state2728895 == SX._state && SX.b2728895 == SX.b && SX.a2728895 == SX.a && SX._lock2728895 == SX._lock && Array.SX.T._state2728895 == Array.SX.T._state && Array.SX.T._elems2728895 == Array.SX.T._elems && Array.SX.T._length2728895 == Array.SX.T._length && a2728895 == a && temp2728895 == temp && this2728895 == this && tid2728895 == tid && $pc2728895 == $pc;
  assume $recorded.state2728895 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (56.21): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2728895);                                                             
  assert $pc != PhaseError;                                                                                // (56.21): Reduction failure
  a := SX.a[this];                                                                                  
  if ((tid<Array.SX.T._length[a])) {                                                                
                                                                                                    
   // 58.25: int y;                                                                                 
                                                                                                    
                                                                                                    
   // 58.25: y := a[tid];                                                                           
                                                                                                    
                                                                                                    
   moverPath2728902 := ReadEval.Array.SX.T(tid: Tid,this: SX,a: Array.SX.T,tid: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
   mover2728902 := m#moverPath(moverPath2728902);                                                   
   path2728902 := p#moverPath(moverPath2728902);                                                    
   assume SX._state2728902 == SX._state && SX.b2728902 == SX.b && SX.a2728902 == SX.a && SX._lock2728902 == SX._lock && Array.SX.T._state2728902 == Array.SX.T._state && Array.SX.T._elems2728902 == Array.SX.T._elems && Array.SX.T._length2728902 == Array.SX.T._length && y2728902 == y && a2728902 == a && temp2728902 == temp && this2728902 == this && tid2728902 == tid && $pc2728902 == $pc;
   assume $recorded.state2728902 == 1;                                                              
   if ($pc == PreCommit) {                                                                          
    assume a != Array.SX.T.null;                                                                    
   } else {                                                                                         
    assert a != Array.SX.T.null;                                                                           // (58.25): Cannot have potential null deference in left-mover part.
   }                                                                                                
   if ($pc == PreCommit) {                                                                          
    assume 0 <= tid;                                                                                
   } else {                                                                                         
    assert 0 <= tid;                                                                                       // (58.25): index < 0.
   }                                                                                                
   if ($pc == PreCommit) {                                                                          
    assume tid < Array.SX.T._length[a];                                                             
   } else {                                                                                         
    assert tid < Array.SX.T._length[a];                                                                    // (58.25): index is >= length.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover2728902);                                                            
   assert $pc != PhaseError;                                                                               // (58.25): Reduction failure
   y := Array.SX.T._elems[a][tid];                                                                  
  } else {                                                                                          
  }                                                                                                 
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 53.38: // return;                                                                               
                                                                                                    
 assume SX._state2728909 == SX._state && SX.b2728909 == SX.b && SX.a2728909 == SX.a && SX._lock2728909 == SX._lock && Array.SX.T._state2728909 == Array.SX.T._state && Array.SX.T._elems2728909 == Array.SX.T._elems && Array.SX.T._length2728909 == Array.SX.T._length && temp2728909 == temp && this2728909 == this && tid2728909 == tid;
 assume $recorded.state2728909 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.SX.T ***/                                                                          
                                                                                                    
type Array.SX.T;                                                                                    
const unique Array.SX.T.null: Array.SX.T;                                                           
var Array.SX.T._state: [Array.SX.T]State;                                                           
                                                                                                    
const Array.SX.T._this : [Array.SX.T]SX;                                                            
const Array.SX.T._length : [Array.SX.T]int;                                                         
var Array.SX.T._elems  : [Array.SX.T]([int]int);                                                    
                                                                                                    
axiom (forall $this : Array.SX.T :: Array.SX.T._length[$this] >= 0);                                
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.SX.T: Spec(Cond(UnaryExpr(FieldAccess(VarAccess(this),b),Not()),Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),Cond(BinaryExpr(Holds(VarAccess(this),VarAccess(tid)),BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),Or()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(BinaryExpr(Holds(VarAccess(this),VarAccess(tid)),BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),And()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.SX.T(tid: Tid,this : SX,athis : Array.SX.T,index : int,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)||(tid==index))) then          
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)&&(tid==index))) then          
    moverPath(_B, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.SX.T: Spec(Cond(UnaryExpr(FieldAccess(VarAccess(this),b),Not()),Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),Cond(BinaryExpr(Holds(VarAccess(this),VarAccess(tid)),BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),Or()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(BinaryExpr(Holds(VarAccess(this),VarAccess(tid)),BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),And()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.SX.T(tid: Tid,this : SX,athis : Array.SX.T,index : int,newValue: int,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)||(tid==index))) then          
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)&&(tid==index))) then          
    moverPath(_B, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]Array.SX.T,SX._lock: [SX]Tid,Array.SX.T._state: [Array.SX.T]State,Array.SX.T._elems: [Array.SX.T]([int]int),Array.SX.T._length: [Array.SX.T]int) returns (bool) {
  true &&                                                                                           
  (forall _i: SX  :: _i == SX.null <==> isNull(SX._state[_i])) &&                                   
  (forall _i: Array.SX.T  :: _i == Array.SX.T.null <==> isNull(Array.SX.T._state[_i])) &&           
  (forall _t: Tid, _i: Array.SX.T  :: ValidTid(_t) && isAccessible(Array.SX.T._state[_i], _t) ==> isAccessible(SX._state[Array.SX.T._this[_i]], _t)) &&
  (forall _i: SX ::  (isShared(SX._state[_i]) ==> isSharedAssignable(Array.SX.T._state[SX.a[_i]]))) &&
  (forall _i: SX ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(SX._state[_i],_t) ==> isLocalAssignable(Array.SX.T._state[SX.a[_i]], _t)))) &&
  (forall _i: SX :: { SX.a[_i] } Array.SX.T._this[SX.a[_i]] == _i) &&                               
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): SX.b failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                 
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.SX.b(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (9.5): SX.b failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                 
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.b[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 SX.b[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (9.5): SX.b failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                  
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.b[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.SX.b(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (9.5): SX.b failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): SX.b failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == SX.b[x];                                                                               
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 SX.b[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (9.5): SX.b failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, x: SX)    
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (11.5): SX.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, x: SX)     
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.SX.a(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (11.5): SX.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, x: SX)     
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.SX.T;                                                                       
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.a[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 SX.a[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (11.5): SX.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, x: SX)      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.SX.T;                                                                       
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.a[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.SX.a(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (11.5): SX.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, x: SX)          
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (11.5): SX.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, x: SX)           
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[x], u);                                                            
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.SX.T;                                                                       
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == SX.a[x];                                                                               
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 SX.a[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (11.5): SX.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: SX, x: Array.SX.T, i: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[x], u);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.SX.T(u: Tid,x_owner: SX,x: Array.SX.T,i: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.SX.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: SX, x: Array.SX.T, i: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[x], u);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.SX.T(u: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.SX.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: SX, x: Array.SX.T, i: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[x], u);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.SX.T._elems[x][i];                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.SX.T._elems[x][i] := havocValue;                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.SX.T(u: Tid,x_owner: SX,x: Array.SX.T,i: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.SX.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: SX, x: Array.SX.T, i: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[x], u);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.SX.T._elems[x][i];                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.SX.T(u: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.SX.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: SX, x: Array.SX.T, i: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[x], u);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.SX.T(u: Tid,x_owner: SX,x: Array.SX.T,i: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.SX.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: SX, x: Array.SX.T, i: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[x], u);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.SX.T._elems[x][i];                                                               
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.SX.T._elems[x][i] := havocValue;                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.SX.T(u: Tid,x_owner: SX,x: Array.SX.T,i: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.SX.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): SX.b is not Write-Write Stable with respect to SX.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: bool;                                                                                   
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: bool;                                                                                   
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)     
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to SX.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to SX.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to SX.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)     
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): SX.b is not Write-Read Stable with respect to SX.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): SX.b is not Write-Read Stable with respect to SX.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): SX.b is not Write-Read Stable with respect to SX.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.5): SX.a is not Write-Write Stable with respect to SX.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var SX._lock_pre: [SX]Tid;                                                                         
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var w0_mid: Array.SX.T;                                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var w0_mid: Array.SX.T;                                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to SX.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to SX.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to SX.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.b;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): SX.a is not Write-Read Stable with respect to SX.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): SX.a is not Write-Read Stable with respect to SX.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.5): SX.a is not Write-Read Stable with respect to SX.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.b.Array.SX.T._elems(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.b;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.b.Array.SX.T._elems(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.b;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var y_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var j_mid: int;                                                                                    
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_owner_mid: SX;                                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.b.Array.SX.T._elems(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.b;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var tmpV : bool;                                                                                   
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var y_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var j_mid: int;                                                                                    
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_owner_mid: SX;                                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.b.Array.SX.T._elems(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.b;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to Array Array.SX.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to Array Array.SX.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (9.5): SX.b is not Read-Write Stable with respect to Array Array.SX.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.b.Array.SX.T._elems(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.b;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.a.SX.b(t: Tid, u: Tid, v: Array.SX.T, w: bool, w0: bool, x: SX, y: SX) 
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): SX.b is not Write-Write Stable with respect to SX.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to SX.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.a.SX.b(t: Tid, u: Tid, v: Array.SX.T, w: bool, w0: bool, x: SX, y: SX) 
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : Array.SX.T;                                                                             
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: bool;                                                                                   
 var v_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.a.SX.b(t: Tid, u: Tid, v: Array.SX.T, w: bool, w0: bool, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : Array.SX.T;                                                                             
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: bool;                                                                                   
 var v_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.a.SX.b(t: Tid, u: Tid, v: Array.SX.T, w: bool, w0: bool, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to SX.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to SX.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to SX.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.a.SX.b(t: Tid, u: Tid, v: Array.SX.T, w: bool, w0: bool, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): SX.b is not Write-Read Stable with respect to SX.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): SX.b is not Write-Read Stable with respect to SX.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): SX.b is not Write-Read Stable with respect to SX.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.a.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.5): SX.a is not Write-Write Stable with respect to SX.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.a.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : Array.SX.T;                                                                             
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: Array.SX.T;                                                                             
 var v_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var w0_mid: Array.SX.T;                                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.a.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
 {                                                                                                  
 var tmpV : Array.SX.T;                                                                             
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var w_mid: Array.SX.T;                                                                             
 var v_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var w0_mid: Array.SX.T;                                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to SX.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.a.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to SX.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to SX.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to SX.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.a.SX.a(t: Tid, u: Tid, v: Array.SX.T, w: Array.SX.T, w0: Array.SX.T, x: SX, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): SX.a is not Write-Read Stable with respect to SX.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): SX.a is not Write-Read Stable with respect to SX.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.5): SX.a is not Write-Read Stable with respect to SX.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.a.Array.SX.T._elems(t: Tid, u: Tid, v: Array.SX.T, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.a;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.a.Array.SX.T._elems(t: Tid, u: Tid, v: Array.SX.T, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.a;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var tmpV : Array.SX.T;                                                                             
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var y_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var j_mid: int;                                                                                    
 var v_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_owner_mid: SX;                                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.a.Array.SX.T._elems(t: Tid, u: Tid, v: Array.SX.T, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.a;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
 {                                                                                                  
 var tmpV : Array.SX.T;                                                                             
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var y_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var j_mid: int;                                                                                    
 var v_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var y_owner_mid: SX;                                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.a.Array.SX.T._elems(t: Tid, u: Tid, v: Array.SX.T, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.a;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to Array Array.SX.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to Array Array.SX.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.5): SX.a is not Read-Write Stable with respect to Array Array.SX.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.a.Array.SX.T._elems(t: Tid, u: Tid, v: Array.SX.T, w: int, w0: int, x: SX, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies SX.a;                                                                                     
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: Array.SX.T;                                                                             
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var v_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.SX.T._elems.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.SX.T._elems.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var x_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var x_owner_mid: SX;                                                                               
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.SX.T._elems[x][i];                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.SX.T._elems[x][i] := tmpV;                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.SX.T._elems.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var x_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var x_owner_mid: SX;                                                                               
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.SX.T._elems[x][i];                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.SX.T._elems[x][i] := tmpV;                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.SX.T._elems.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.b (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.SX.T._elems.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.b;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w0_pre: bool;                                                                                  
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var w_post: bool;                                                                                  
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): SX.b is not Write-Read Stable with respect to Array Array.SX.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (9.5): SX.b is not Write-Read Stable with respect to Array Array.SX.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (9.5): SX.b is not Write-Read Stable with respect to Array Array.SX.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.SX.T._elems.SX.a(t: Tid, u: Tid, v: int, w: Array.SX.T, w0: Array.SX.T, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.SX.T._elems.SX.a(t: Tid, u: Tid, v: int, w: Array.SX.T, w0: Array.SX.T, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var SX._state_mid: [SX]State;                                                                      
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var x_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var v_mid: int;                                                                                    
 var w_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var x_owner_mid: SX;                                                                               
 var y_mid: SX;                                                                                     
 var w0_mid: Array.SX.T;                                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.SX.T._elems[x][i];                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.SX.T._elems[x][i] := tmpV;                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.SX.T._elems.SX.a(t: Tid, u: Tid, v: int, w: Array.SX.T, w0: Array.SX.T, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var SX._state_mid: [SX]State;                                                                      
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var x_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var v_mid: int;                                                                                    
 var w_mid: Array.SX.T;                                                                             
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var x_owner_mid: SX;                                                                               
 var y_mid: SX;                                                                                     
 var w0_mid: Array.SX.T;                                                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.SX.T._elems[x][i];                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.SX.T._elems[x][i] := tmpV;                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.SX.T._elems.SX.a(t: Tid, u: Tid, v: int, w: Array.SX.T, w0: Array.SX.T, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.SX.T._elems.SX.a(t: Tid, u: Tid, v: int, w: Array.SX.T, w0: Array.SX.T, x_owner: SX, x: Array.SX.T, i: int, y: SX)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(SX._state[y], u);                                                            
 modifies Array.SX.T._elems;                                                                        
 modifies SX.a;                                                                                     
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.SX.T;                                                                             
 var u_pre: Tid;                                                                                    
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
 var w0_pre: Array.SX.T;                                                                            
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var w0_post: Array.SX.T;                                                                           
 var w_post: Array.SX.T;                                                                            
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): SX.a is not Write-Read Stable with respect to Array Array.SX.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.5): SX.a is not Write-Read Stable with respect to Array Array.SX.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.5): SX.a is not Write-Read Stable with respect to Array Array.SX.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.SX.T._elems.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: SX, x: Array.SX.T, i: int, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.SX.T._elems.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: SX, x: Array.SX.T, i: int, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var x_mid: Array.SX.T;                                                                             
 var y_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var x_owner_mid: SX;                                                                               
 var y_owner_mid: SX;                                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.SX.T._elems[x][i];                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.SX.T._elems[x][i] := tmpV;                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 _writeByTPost := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.SX.T._elems.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: SX, x: Array.SX.T, i: int, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Array.SX.T._elems_mid: [Array.SX.T]([int]int);                                                 
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var SX.a_mid: [SX]Array.SX.T;                                                                      
 var x_mid: Array.SX.T;                                                                             
 var y_mid: Array.SX.T;                                                                             
 var Array.SX.T._length_mid: [Array.SX.T]int;                                                       
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var Array.SX.T._state_mid: [Array.SX.T]State;                                                      
 var SX.b_mid: [SX]bool;                                                                            
 var x_owner_mid: SX;                                                                               
 var y_owner_mid: SX;                                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.SX.T._elems[x][i];                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && Array.SX.T._state_mid == Array.SX.T._state && Array.SX.T._elems_mid == Array.SX.T._elems && Array.SX.T._length_mid == Array.SX.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.SX.T._elems[x][i] := tmpV;                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 _writeByTPost := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.SX.T._elems.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: SX, x: Array.SX.T, i: int, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,w: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[y][j] := w;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to Array Array.SX.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to Array Array.SX.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.SX.T is not Read-Write Stable with respect to Array Array.SX.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.SX.T._elems.Array.SX.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: SX, x: Array.SX.T, i: int, y_owner: SX, y: Array.SX.T, j: int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.SX.T._state[x], t);                                                    
 requires Array.SX.T._this[x] == x_owner;                                                           
 requires isAccessible(Array.SX.T._state[y], u);                                                    
 requires Array.SX.T._this[y] == y_owner;                                                           
 modifies Array.SX.T._elems;                                                                        
 modifies Array.SX.T._elems;                                                                        
                                                                                                    
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
 var SX._lock_pre: [SX]Tid;                                                                         
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var x_owner_pre: SX;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.SX.T;                                                                             
 var Array.SX.T._length_pre: [Array.SX.T]int;                                                       
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var x_pre: Array.SX.T;                                                                             
 var Array.SX.T._state_pre: [Array.SX.T]State;                                                      
 var y_owner_pre: SX;                                                                               
 var t_pre: Tid;                                                                                    
 var SX.a_pre: [SX]Array.SX.T;                                                                      
 var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                 
                                                                                                    
 var x_post: Array.SX.T;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var y_owner_post: SX;                                                                              
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                
 var Array.SX.T._state_post: [Array.SX.T]State;                                                     
 var x_owner_post: SX;                                                                              
 var w_post: int;                                                                                   
 var y_post: Array.SX.T;                                                                            
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var SX.a_post: [SX]Array.SX.T;                                                                     
 var Array.SX.T._length_post: [Array.SX.T]int;                                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.SX.T(t: Tid,x_owner: SX,x: Array.SX.T,i: int,v: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.SX.T._elems[x][i] := v;                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && Array.SX.T._state_post == Array.SX.T._state && Array.SX.T._elems_post == Array.SX.T._elems && Array.SX.T._length_post == Array.SX.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.SX.T(u: Tid,y_owner: SX,y: Array.SX.T,j: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Read Stable with respect to Array Array.SX.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.SX.T is not Write-Read Stable with respect to Array Array.SX.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.SX.T is not Write-Read Stable with respect to Array Array.SX.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
requires ValidTid(tid);                                                                             
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
modifies Array.SX.T._state;                                                                         
modifies Array.SX.T._elems;                                                                         
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
ensures Y(tid , old(SX._state), old(SX.b), old(SX.a), old(SX._lock), old(Array.SX.T._state), old(Array.SX.T._elems), old(Array.SX.T._length) , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
                                                                                                    
// SX.b:                                                                                            
                                                                                                    
function {:inline} Y_SX.b(tid : Tid, this: SX, newValue: bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
 ((isAccessible(SX._state[this], tid) && leq(m#moverPath(ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)), _R)) ==> (SX.b[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SX.b(tid : Tid, this: SX, newValue: bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SX.b.Subsumes.W(tid : Tid, u : Tid, this: SX, newValue: bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var this_yield: SX;                                                                                 
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var u_yield: Tid;                                                                                   
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume isAccessible(SX._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.SX.b(u: Tid,this: SX,newValue: bool,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)));
                                                                                                    
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.b(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_SX.b.Reflexive(tid : Tid, this: SX , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.b(tid, this, SX.b[this] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_SX.b.Transitive(tid : Tid, this: SX, newValue : bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]Array.SX.T, SX._lock_p: [SX]Tid, Array.SX.T._state_p: [Array.SX.T]State, Array.SX.T._elems_p: [Array.SX.T]([int]int), Array.SX.T._length_p: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var newValue_pre: bool;                                                                             
var $recorded.state_pre: int;                                                                       
var Array.SX.T._length_pre: [Array.SX.T]int;                                                        
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Array.SX.T._state_pre: [Array.SX.T]State;                                                       
var this_pre: SX;                                                                                   
var SX.a_pre: [SX]Array.SX.T;                                                                       
var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var $pc_post: Phase;                                                                                
var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                 
var tid_post: Tid;                                                                                  
var Array.SX.T._state_post: [Array.SX.T]State;                                                      
var SX._lock_post: [SX]Tid;                                                                         
var newValue_post: bool;                                                                            
var SX._state_post: [SX]State;                                                                      
var SX.a_post: [SX]Array.SX.T;                                                                      
var this_post: SX;                                                                                  
var Array.SX.T._length_post: [Array.SX.T]int;                                                       
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 assume Y_SX.b(tid, this, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && Array.SX.T._state_post == Array.SX.T._state_p && Array.SX.T._elems_post == Array.SX.T._elems_p && Array.SX.T._length_post == Array.SX.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SX.b(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
// SX.a:                                                                                            
                                                                                                    
function {:inline} Y_SX.a(tid : Tid, this: SX, newValue: Array.SX.T , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
 ((isAccessible(SX._state[this], tid) && leq(m#moverPath(ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)), _R)) ==> (SX.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SX.a(tid : Tid, this: SX, newValue: Array.SX.T , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SX.a.Subsumes.W(tid : Tid, u : Tid, this: SX, newValue: Array.SX.T , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var newValue_yield: Array.SX.T;                                                                     
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var u_yield: Tid;                                                                                   
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume isAccessible(SX._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.SX.a(u: Tid,this: SX,newValue: Array.SX.T,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)));
                                                                                                    
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.a(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_SX.a.Reflexive(tid : Tid, this: SX , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.a(tid, this, SX.a[this] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_SX.a.Transitive(tid : Tid, this: SX, newValue : Array.SX.T , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]Array.SX.T, SX._lock_p: [SX]Tid, Array.SX.T._state_p: [Array.SX.T]State, Array.SX.T._elems_p: [Array.SX.T]([int]int), Array.SX.T._length_p: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var $recorded.state_pre: int;                                                                       
var newValue_pre: Array.SX.T;                                                                       
var Array.SX.T._length_pre: [Array.SX.T]int;                                                        
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Array.SX.T._state_pre: [Array.SX.T]State;                                                       
var this_pre: SX;                                                                                   
var SX.a_pre: [SX]Array.SX.T;                                                                       
var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var $pc_post: Phase;                                                                                
var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                 
var tid_post: Tid;                                                                                  
var newValue_post: Array.SX.T;                                                                      
var Array.SX.T._state_post: [Array.SX.T]State;                                                      
var SX._lock_post: [SX]Tid;                                                                         
var SX._state_post: [SX]State;                                                                      
var SX.a_post: [SX]Array.SX.T;                                                                      
var this_post: SX;                                                                                  
var Array.SX.T._length_post: [Array.SX.T]int;                                                       
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 assume Y_SX.a(tid, this, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && Array.SX.T._state_post == Array.SX.T._state_p && Array.SX.T._elems_post == Array.SX.T._elems_p && Array.SX.T._length_post == Array.SX.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SX.a(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
// SX._lock:                                                                                        
                                                                                                    
function {:inline} Y_SX._lock(tid : Tid, this: SX, newValue: Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
 ((isAccessible(SX._state[this], tid) && leq(m#moverPath(ReadEval.SX._lock(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)), _R)) ==> (SX._lock[this] == newValue))
 &&(((SX._lock[this]==tid)==(newValue==tid)))                                                       
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SX._lock(tid : Tid, this: SX, newValue: Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SX._lock.Subsumes.W(tid : Tid, u : Tid, this: SX, newValue: Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var newValue_yield: Tid;                                                                            
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var u_yield: Tid;                                                                                   
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume isAccessible(SX._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.SX._lock(u: Tid,this: SX,newValue: Tid,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)));
 assume leq(m#moverPath(ReadEval.SX._lock(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)), _N);
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX._lock(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_SX._lock.Reflexive(tid : Tid, this: SX , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX._lock(tid, this, SX._lock[this] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_SX._lock.Transitive(tid : Tid, this: SX, newValue : Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]Array.SX.T, SX._lock_p: [SX]Tid, Array.SX.T._state_p: [Array.SX.T]State, Array.SX.T._elems_p: [Array.SX.T]([int]int), Array.SX.T._length_p: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var $recorded.state_pre: int;                                                                       
var Array.SX.T._length_pre: [Array.SX.T]int;                                                        
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var Array.SX.T._state_pre: [Array.SX.T]State;                                                       
var this_pre: SX;                                                                                   
var newValue_pre: Tid;                                                                              
var SX.a_pre: [SX]Array.SX.T;                                                                       
var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var $pc_post: Phase;                                                                                
var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                 
var tid_post: Tid;                                                                                  
var Array.SX.T._state_post: [Array.SX.T]State;                                                      
var SX._lock_post: [SX]Tid;                                                                         
var SX._state_post: [SX]State;                                                                      
var SX.a_post: [SX]Array.SX.T;                                                                      
var newValue_post: Tid;                                                                             
var this_post: SX;                                                                                  
var Array.SX.T._length_post: [Array.SX.T]int;                                                       
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 assume Y_SX._lock(tid, this, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && Array.SX.T._state_post == Array.SX.T._state_p && Array.SX.T._elems_post == Array.SX.T._elems_p && Array.SX.T._length_post == Array.SX.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SX._lock(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
// Array.SX.T:                                                                                      
                                                                                                    
function {:inline} Y_Array.SX.T(tid : Tid, athis: Array.SX.T, index: int, newValue: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
(var this := Array.SX.T._this[athis];                                                               
 ((isAccessible(Array.SX.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.SX.T(tid: Tid,Array.SX.T._this[athis]: SX,athis: Array.SX.T,index: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)), _R)) ==> (Array.SX.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.SX.T(tid : Tid, athis: Array.SX.T, index: int, newValue: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int): bool
{                                                                                                   
(var this := Array.SX.T._this[athis];                                                               
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.SX.T.Subsumes.W(tid : Tid, u : Tid, this: SX, athis: Array.SX.T, index: int, newValue: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.SX.T._this[athis];                                                          
{                                                                                                   
var this_yield: SX;                                                                                 
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var index_yield: int;                                                                               
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var athis_yield: Array.SX.T;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.SX.T._state[athis], u);                                                  
 assume !isError(m#moverPath(WriteEval.Array.SX.T(u: Tid,Array.SX.T._this[athis]: SX,athis: Array.SX.T,index: int,newValue: int,SX._state,SX.b,SX.a,SX._lock,Array.SX.T._state,Array.SX.T._elems,Array.SX.T._length)));
                                                                                                    
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.SX.T(tid, athis, index, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.SX.T.Reflexive(tid : Tid, this: SX, athis: Array.SX.T, index: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.SX.T._this[athis];                                                          
{                                                                                                   
var this_yield: SX;                                                                                 
var Array.SX.T._length_yield: [Array.SX.T]int;                                                      
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]Array.SX.T;                                                                     
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var Array.SX.T._elems_yield: [Array.SX.T]([int]int);                                                
var SX._lock_yield: [SX]Tid;                                                                        
var index_yield: int;                                                                               
var Array.SX.T._state_yield: [Array.SX.T]State;                                                     
var athis_yield: Array.SX.T;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.SX.T._state[athis], tid);                                                
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && Array.SX.T._state_yield == Array.SX.T._state && Array.SX.T._elems_yield == Array.SX.T._elems && Array.SX.T._length_yield == Array.SX.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.SX.T(tid, athis, index, Array.SX.T._elems[athis][index] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.SX.T.Transitive(tid : Tid, this: SX, athis: Array.SX.T, index: int, newValue : int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]Array.SX.T, SX._lock_p: [SX]Tid, Array.SX.T._state_p: [Array.SX.T]State, Array.SX.T._elems_p: [Array.SX.T]([int]int), Array.SX.T._length_p: [Array.SX.T]int)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
                                                                                                    
 requires this == Array.SX.T._this[athis];                                                          
 requires ValidTid(tid);                                                                            
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var $recorded.state_pre: int;                                                                       
var index_pre: int;                                                                                 
var Array.SX.T._length_pre: [Array.SX.T]int;                                                        
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var athis_pre: Array.SX.T;                                                                          
var $pc_pre: Phase;                                                                                 
var Array.SX.T._state_pre: [Array.SX.T]State;                                                       
var this_pre: SX;                                                                                   
var SX.a_pre: [SX]Array.SX.T;                                                                       
var Array.SX.T._elems_pre: [Array.SX.T]([int]int);                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var athis_post: Array.SX.T;                                                                         
var $pc_post: Phase;                                                                                
var Array.SX.T._elems_post: [Array.SX.T]([int]int);                                                 
var tid_post: Tid;                                                                                  
var Array.SX.T._state_post: [Array.SX.T]State;                                                      
var SX._lock_post: [SX]Tid;                                                                         
var index_post: int;                                                                                
var SX._state_post: [SX]State;                                                                      
var SX.a_post: [SX]Array.SX.T;                                                                      
var this_post: SX;                                                                                  
var Array.SX.T._length_post: [Array.SX.T]int;                                                       
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && Array.SX.T._state_pre == Array.SX.T._state && Array.SX.T._elems_pre == Array.SX.T._elems && Array.SX.T._length_pre == Array.SX.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && Array.SX.T._state_post == Array.SX.T._state_p && Array.SX.T._elems_post == Array.SX.T._elems_p && Array.SX.T._length_post == Array.SX.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.SX.T._state[athis], tid);                                                
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 assume Y_Array.SX.T(tid, athis, index, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p, Array.SX.T._state_p, Array.SX.T._elems_p, Array.SX.T._length_p);
 assert Y_Array.SX.T(tid, athis, index, newValue , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]Array.SX.T, SX._lock: [SX]Tid, Array.SX.T._state: [Array.SX.T]State, Array.SX.T._elems: [Array.SX.T]([int]int), Array.SX.T._length: [Array.SX.T]int , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]Array.SX.T, SX._lock_p: [SX]Tid, Array.SX.T._state_p: [Array.SX.T]State, Array.SX.T._elems_p: [Array.SX.T]([int]int), Array.SX.T._length_p: [Array.SX.T]int): bool
{                                                                                                   
 (forall this: SX :: Y_SX.b(tid : Tid, this, SX.b_p[this] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length))
 && (forall this: SX :: Y_SX.a(tid : Tid, this, SX.a_p[this] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length))
 && (forall this: SX :: Y_SX._lock(tid : Tid, this, SX._lock_p[this] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length))
 && (forall athis: Array.SX.T, index: int :: Y_Array.SX.T(tid : Tid, athis, index, Array.SX.T._elems_p[athis][index] , SX._state, SX.b, SX.a, SX._lock, Array.SX.T._state, Array.SX.T._elems, Array.SX.T._length))
 && (forall _i : SX :: isShared(SX._state[_i]) ==> isShared(SX._state_p[_i]))                       
 && (forall _i : SX :: isLocal(SX._state[_i], tid) <==> isLocal(SX._state_p[_i], tid))              
 && (forall _i : Array.SX.T :: isShared(Array.SX.T._state[_i]) ==> isShared(Array.SX.T._state_p[_i]))
 && (forall _i : Array.SX.T :: Array.SX.T._length[_i] == Array.SX.T._length_p[_i])                  
 && (forall _i : Array.SX.T :: isLocal(Array.SX.T._state[_i], tid) <==> isLocal(Array.SX.T._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 978.1-1191.2: (Method:13.5)
// 988.1-988.24: (13.5): Bad tid
// 989.1-989.36: (13.5): this is not global
// 1085.2-1087.2: (class anchor.sink.VarDeclStmt:14.9)
// 1088.2-1105.21: (class anchor.sink.Read:14.9)
// 1100.1-1100.26: (14.9): Cannot have potential null deference in left-mover part.
// 1104.1-1104.27: (14.9): Reduction failure
// 1107.3-1115.43: (class anchor.sink.Yield:16.13)
// 1119.1-1119.27: (17.26): Cannot have potential null deference in left-mover part.
// 1123.1-1123.28: (17.26): Reduction failure
// 1125.3-1127.3: (class anchor.sink.VarDeclStmt:18.17)
// 1128.3-1145.19: (class anchor.sink.Read:18.17)
// 1140.1-1140.27: (18.17): Cannot have potential null deference in left-mover part.
// 1144.1-1144.28: (18.17): Reduction failure
// 1146.3-1173.34: (class anchor.sink.AWrite:19.17)
// 1158.1-1158.32: (19.17): Cannot have potential null deference in left-mover part.
// 1163.1-1163.20: (19.17): index < 0.
// 1168.1-1168.39: (19.17): index is >= length.
// 1172.1-1172.28: (19.17): Reduction failure
// 1177.1-1177.27: (20.13): Cannot have potential null deference in left-mover part.
// 1179.1-1179.32: (20.13): lock not held
// 1181.1-1181.28: (20.13): Reduction failure
// 1185.2-1190.9: (class anchor.sink.Return:13.37)
// 1192.1-1372.2: (Method:24.5)
// 1202.1-1202.24: (24.5): Bad tid
// 1203.1-1203.36: (24.5): this is not global
// 1275.2-1277.2: (class anchor.sink.VarDeclStmt:25.9)
// 1278.2-1295.21: (class anchor.sink.Read:25.9)
// 1290.1-1290.26: (25.9): Cannot have potential null deference in left-mover part.
// 1294.1-1294.27: (25.9): Reduction failure
// 1300.1-1300.27: (27.26): Cannot have potential null deference in left-mover part.
// 1304.1-1304.28: (27.26): Reduction failure
// 1306.3-1308.3: (class anchor.sink.VarDeclStmt:28.17)
// 1309.3-1326.19: (class anchor.sink.Read:28.17)
// 1321.1-1321.27: (28.17): Cannot have potential null deference in left-mover part.
// 1325.1-1325.28: (28.17): Reduction failure
// 1327.3-1354.34: (class anchor.sink.AWrite:29.17)
// 1339.1-1339.32: (29.17): Cannot have potential null deference in left-mover part.
// 1344.1-1344.20: (29.17): index < 0.
// 1349.1-1349.39: (29.17): index is >= length.
// 1353.1-1353.28: (29.17): Reduction failure
// 1358.1-1358.27: (30.13): Cannot have potential null deference in left-mover part.
// 1360.1-1360.32: (30.13): lock not held
// 1362.1-1362.28: (30.13): Reduction failure
// 1366.2-1371.9: (class anchor.sink.Return:24.26)
// 1373.1-1562.2: (Method:33.9)
// 1383.1-1383.24: (33.9): Bad tid
// 1384.1-1384.36: (33.9): this is not global
// 1458.2-1460.2: (class anchor.sink.VarDeclStmt:34.13)
// 1461.2-1478.21: (class anchor.sink.Read:34.13)
// 1473.1-1473.26: (34.13): Cannot have potential null deference in left-mover part.
// 1477.1-1477.27: (34.13): Reduction failure
// 1483.1-1483.27: (36.30): Cannot have potential null deference in left-mover part.
// 1487.1-1487.28: (36.30): Reduction failure
// 1489.3-1491.3: (class anchor.sink.VarDeclStmt:37.21)
// 1492.3-1509.19: (class anchor.sink.Read:37.21)
// 1504.1-1504.27: (37.21): Cannot have potential null deference in left-mover part.
// 1508.1-1508.28: (37.21): Reduction failure
// 1510.3-1512.3: (class anchor.sink.VarDeclStmt:38.23)
// 1513.3-1516.14: (class anchor.sink.Assign:38.23)
// 1517.3-1544.36: (class anchor.sink.AWrite:38.21)
// 1529.1-1529.32: (38.21): Cannot have potential null deference in left-mover part.
// 1534.1-1534.22: (38.21): index < 0.
// 1539.1-1539.41: (38.21): index is >= length.
// 1543.1-1543.28: (38.21): Reduction failure
// 1548.1-1548.27: (39.17): Cannot have potential null deference in left-mover part.
// 1550.1-1550.32: (39.17): lock not held
// 1552.1-1552.28: (39.17): Reduction failure
// 1556.2-1561.9: (class anchor.sink.Return:33.33)
// 1563.1-1757.2: (Method:43.9)
// 1573.1-1573.24: (43.9): Bad tid
// 1574.1-1574.36: (43.9): this is not global
// 1650.2-1652.2: (class anchor.sink.VarDeclStmt:44.13)
// 1653.2-1670.21: (class anchor.sink.Read:44.13)
// 1665.1-1665.26: (44.13): Cannot have potential null deference in left-mover part.
// 1669.1-1669.27: (44.13): Reduction failure
// 1675.1-1675.27: (46.30): Cannot have potential null deference in left-mover part.
// 1679.1-1679.28: (46.30): Reduction failure
// 1681.3-1683.3: (class anchor.sink.VarDeclStmt:47.21)
// 1684.3-1701.19: (class anchor.sink.Read:47.21)
// 1696.1-1696.27: (47.21): Cannot have potential null deference in left-mover part.
// 1700.1-1700.28: (47.21): Reduction failure
// 1702.3-1704.3: (class anchor.sink.VarDeclStmt:48.21)
// 1705.3-1707.3: (class anchor.sink.VarDeclStmt:48.32)
// 1708.3-1711.14: (class anchor.sink.Assign:48.32)
// 1712.3-1739.36: (class anchor.sink.ARead:48.21)
// 1724.1-1724.32: (48.21): Cannot have potential null deference in left-mover part.
// 1729.1-1729.22: (48.21): index < 0.
// 1734.1-1734.41: (48.21): index is >= length.
// 1738.1-1738.28: (48.21): Reduction failure
// 1743.1-1743.27: (49.17): Cannot have potential null deference in left-mover part.
// 1745.1-1745.32: (49.17): lock not held
// 1747.1-1747.28: (49.17): Reduction failure
// 1751.2-1756.9: (class anchor.sink.Return:43.35)
// 1758.1-1928.2: (Method:53.9)
// 1768.1-1768.24: (53.9): Bad tid
// 1769.1-1769.36: (53.9): this is not global
// 1843.2-1845.2: (class anchor.sink.VarDeclStmt:54.13)
// 1846.2-1863.21: (class anchor.sink.Read:54.13)
// 1858.1-1858.26: (54.13): Cannot have potential null deference in left-mover part.
// 1862.1-1862.27: (54.13): Reduction failure
// 1865.3-1867.3: (class anchor.sink.VarDeclStmt:56.21)
// 1868.3-1885.19: (class anchor.sink.Read:56.21)
// 1880.1-1880.27: (56.21): Cannot have potential null deference in left-mover part.
// 1884.1-1884.28: (56.21): Reduction failure
// 1887.4-1889.4: (class anchor.sink.VarDeclStmt:58.25)
// 1890.4-1917.35: (class anchor.sink.ARead:58.25)
// 1902.1-1902.33: (58.25): Cannot have potential null deference in left-mover part.
// 1907.1-1907.21: (58.25): index < 0.
// 1912.1-1912.40: (58.25): index is >= length.
// 1916.1-1916.29: (58.25): Reduction failure
// 1922.2-1927.9: (class anchor.sink.Return:53.38)
// 2080.1-2080.34: (9.5): SX.b failed Write-Write Right-Mover Check
// 2145.1-2145.30: (9.5): SX.b failed Write-Read Right-Mover Check
// 2214.1-2214.34: (9.5): SX.b failed Write-Write Left-Mover Check
// 2280.1-2280.30: (9.5): SX.b failed Write-Read Left-Mover Check
// 2343.1-2343.34: (9.5): SX.b failed Read-Write Right-Mover Check
// 2409.1-2409.34: (9.5): SX.b failed Read-Write Left-Mover Check
// 2474.1-2474.34: (11.5): SX.a failed Write-Write Right-Mover Check
// 2539.1-2539.30: (11.5): SX.a failed Write-Read Right-Mover Check
// 2608.1-2608.34: (11.5): SX.a failed Write-Write Left-Mover Check
// 2674.1-2674.30: (11.5): SX.a failed Write-Read Left-Mover Check
// 2737.1-2737.34: (11.5): SX.a failed Read-Write Right-Mover Check
// 2803.1-2803.34: (11.5): SX.a failed Read-Write Left-Mover Check
// 2874.1-2874.34: (4.5): Array Array.SX.T failed Write-Write Right-Mover Check
// 2945.1-2945.30: (4.5): Array Array.SX.T failed Write-Read Right-Mover Check
// 3020.1-3020.34: (4.5): Array Array.SX.T failed Write-Write Left-Mover Check
// 3092.1-3092.30: (4.5): Array Array.SX.T failed Write-Read Left-Mover Check
// 3161.1-3161.34: (4.5): Array Array.SX.T failed Read-Write Right-Mover Check
// 3233.1-3233.34: (4.5): Array Array.SX.T failed Read-Write Left-Mover Check
// 3310.1-3310.140: (9.5): SX.b is not Write-Write Stable with respect to SX.b (case A.1)
// 3311.1-3311.101: (9.5): SX.b is not Write-Write Stable with respect to SX.b (case A.2)
// 3312.1-3312.158: (9.5): SX.b is not Write-Write Stable with respect to SX.b (case A.3)
// 3417.1-3417.140: (9.5): SX.b is not Write-Write Stable with respect to SX.b (case C)
// 3527.1-3527.144: (9.5): SX.b is not Write-Write Stable with respect to SX.b (case D)
// 3528.1-3528.144: (9.5): SX.b is not Write-Write Stable with respect to SX.b (case R)
// 3605.1-3605.136: (9.5): SX.b is not Read-Write Stable with respect to SX.b (case F)
// 3606.1-3606.136: (9.5): SX.b is not Read-Write Stable with respect to SX.b (case H)
// 3607.1-3607.146: (9.5): SX.b is not Read-Write Stable with respect to SX.b (case I)
// 3683.1-3683.136: (9.5): SX.b is not Write-Read Stable with respect to SX.b (case J)
// 3684.1-3684.136: (9.5): SX.b is not Write-Read Stable with respect to SX.b (case K)
// 3685.1-3685.99: (9.5): SX.b is not Write-Read Stable with respect to SX.b (case L)
// 3763.1-3763.140: (11.5): SX.a is not Write-Write Stable with respect to SX.b (case A.1)
// 3764.1-3764.101: (11.5): SX.a is not Write-Write Stable with respect to SX.b (case A.2)
// 3765.1-3765.158: (11.5): SX.a is not Write-Write Stable with respect to SX.b (case A.3)
// 3870.1-3870.140: (9.5): SX.b is not Write-Write Stable with respect to SX.a (case C)
// 3980.1-3980.144: (9.5): SX.b is not Write-Write Stable with respect to SX.a (case D)
// 3981.1-3981.144: (9.5): SX.b is not Write-Write Stable with respect to SX.a (case R)
// 4058.1-4058.136: (9.5): SX.b is not Read-Write Stable with respect to SX.a (case F)
// 4059.1-4059.136: (9.5): SX.b is not Read-Write Stable with respect to SX.a (case H)
// 4060.1-4060.146: (9.5): SX.b is not Read-Write Stable with respect to SX.a (case I)
// 4136.1-4136.136: (11.5): SX.a is not Write-Read Stable with respect to SX.b (case J)
// 4137.1-4137.136: (11.5): SX.a is not Write-Read Stable with respect to SX.b (case K)
// 4138.1-4138.99: (11.5): SX.a is not Write-Read Stable with respect to SX.b (case L)
// 4221.1-4221.140: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case A.1)
// 4222.1-4222.101: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case A.2)
// 4223.1-4223.156: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case A.3)
// 4335.1-4335.140: (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case C)
// 4452.1-4452.144: (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case D)
// 4453.1-4453.144: (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case R)
// 4535.1-4535.136: (9.5): SX.b is not Read-Write Stable with respect to Array Array.SX.T (case F)
// 4536.1-4536.136: (9.5): SX.b is not Read-Write Stable with respect to Array Array.SX.T (case H)
// 4537.1-4537.144: (9.5): SX.b is not Read-Write Stable with respect to Array Array.SX.T (case I)
// 4618.1-4618.136: (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.b (case J)
// 4619.1-4619.136: (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.b (case K)
// 4620.1-4620.99: (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.b (case L)
// 4698.1-4698.140: (9.5): SX.b is not Write-Write Stable with respect to SX.a (case A.1)
// 4699.1-4699.101: (9.5): SX.b is not Write-Write Stable with respect to SX.a (case A.2)
// 4700.1-4700.158: (9.5): SX.b is not Write-Write Stable with respect to SX.a (case A.3)
// 4805.1-4805.140: (11.5): SX.a is not Write-Write Stable with respect to SX.b (case C)
// 4915.1-4915.144: (11.5): SX.a is not Write-Write Stable with respect to SX.b (case D)
// 4916.1-4916.144: (11.5): SX.a is not Write-Write Stable with respect to SX.b (case R)
// 4993.1-4993.136: (11.5): SX.a is not Read-Write Stable with respect to SX.b (case F)
// 4994.1-4994.136: (11.5): SX.a is not Read-Write Stable with respect to SX.b (case H)
// 4995.1-4995.146: (11.5): SX.a is not Read-Write Stable with respect to SX.b (case I)
// 5071.1-5071.136: (9.5): SX.b is not Write-Read Stable with respect to SX.a (case J)
// 5072.1-5072.136: (9.5): SX.b is not Write-Read Stable with respect to SX.a (case K)
// 5073.1-5073.99: (9.5): SX.b is not Write-Read Stable with respect to SX.a (case L)
// 5151.1-5151.140: (11.5): SX.a is not Write-Write Stable with respect to SX.a (case A.1)
// 5152.1-5152.101: (11.5): SX.a is not Write-Write Stable with respect to SX.a (case A.2)
// 5153.1-5153.158: (11.5): SX.a is not Write-Write Stable with respect to SX.a (case A.3)
// 5258.1-5258.140: (11.5): SX.a is not Write-Write Stable with respect to SX.a (case C)
// 5368.1-5368.144: (11.5): SX.a is not Write-Write Stable with respect to SX.a (case D)
// 5369.1-5369.144: (11.5): SX.a is not Write-Write Stable with respect to SX.a (case R)
// 5446.1-5446.136: (11.5): SX.a is not Read-Write Stable with respect to SX.a (case F)
// 5447.1-5447.136: (11.5): SX.a is not Read-Write Stable with respect to SX.a (case H)
// 5448.1-5448.146: (11.5): SX.a is not Read-Write Stable with respect to SX.a (case I)
// 5524.1-5524.136: (11.5): SX.a is not Write-Read Stable with respect to SX.a (case J)
// 5525.1-5525.136: (11.5): SX.a is not Write-Read Stable with respect to SX.a (case K)
// 5526.1-5526.99: (11.5): SX.a is not Write-Read Stable with respect to SX.a (case L)
// 5609.1-5609.140: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case A.1)
// 5610.1-5610.101: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case A.2)
// 5611.1-5611.156: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case A.3)
// 5723.1-5723.140: (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case C)
// 5840.1-5840.144: (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case D)
// 5841.1-5841.144: (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case R)
// 5923.1-5923.136: (11.5): SX.a is not Read-Write Stable with respect to Array Array.SX.T (case F)
// 5924.1-5924.136: (11.5): SX.a is not Read-Write Stable with respect to Array Array.SX.T (case H)
// 5925.1-5925.144: (11.5): SX.a is not Read-Write Stable with respect to Array Array.SX.T (case I)
// 6006.1-6006.136: (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.a (case J)
// 6007.1-6007.136: (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.a (case K)
// 6008.1-6008.99: (4.5): Array Array.SX.T is not Write-Read Stable with respect to SX.a (case L)
// 6091.1-6091.140: (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case A.1)
// 6092.1-6092.101: (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case A.2)
// 6093.1-6093.156: (9.5): SX.b is not Write-Write Stable with respect to Array Array.SX.T (case A.3)
// 6205.1-6205.140: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case C)
// 6322.1-6322.144: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case D)
// 6323.1-6323.144: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.b (case R)
// 6405.1-6405.136: (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.b (case F)
// 6406.1-6406.136: (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.b (case H)
// 6407.1-6407.144: (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.b (case I)
// 6488.1-6488.136: (9.5): SX.b is not Write-Read Stable with respect to Array Array.SX.T (case J)
// 6489.1-6489.136: (9.5): SX.b is not Write-Read Stable with respect to Array Array.SX.T (case K)
// 6490.1-6490.99: (9.5): SX.b is not Write-Read Stable with respect to Array Array.SX.T (case L)
// 6573.1-6573.140: (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case A.1)
// 6574.1-6574.101: (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case A.2)
// 6575.1-6575.156: (11.5): SX.a is not Write-Write Stable with respect to Array Array.SX.T (case A.3)
// 6687.1-6687.140: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case C)
// 6804.1-6804.144: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case D)
// 6805.1-6805.144: (4.5): Array Array.SX.T is not Write-Write Stable with respect to SX.a (case R)
// 6887.1-6887.136: (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.a (case F)
// 6888.1-6888.136: (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.a (case H)
// 6889.1-6889.144: (4.5): Array Array.SX.T is not Read-Write Stable with respect to SX.a (case I)
// 6970.1-6970.136: (11.5): SX.a is not Write-Read Stable with respect to Array Array.SX.T (case J)
// 6971.1-6971.136: (11.5): SX.a is not Write-Read Stable with respect to Array Array.SX.T (case K)
// 6972.1-6972.99: (11.5): SX.a is not Write-Read Stable with respect to Array Array.SX.T (case L)
// 7060.1-7060.140: (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case A.1)
// 7061.1-7061.101: (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case A.2)
// 7062.1-7062.156: (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case A.3)
// 7181.1-7181.140: (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case C)
// 7305.1-7305.144: (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case D)
// 7306.1-7306.144: (4.5): Array Array.SX.T is not Write-Write Stable with respect to Array Array.SX.T (case R)
// 7393.1-7393.136: (4.5): Array Array.SX.T is not Read-Write Stable with respect to Array Array.SX.T (case F)
// 7394.1-7394.136: (4.5): Array Array.SX.T is not Read-Write Stable with respect to Array Array.SX.T (case H)
// 7395.1-7395.144: (4.5): Array Array.SX.T is not Read-Write Stable with respect to Array Array.SX.T (case I)
// 7481.1-7481.136: (4.5): Array Array.SX.T is not Write-Read Stable with respect to Array Array.SX.T (case J)
// 7482.1-7482.136: (4.5): Array Array.SX.T is not Write-Read Stable with respect to Array Array.SX.T (case K)
// 7483.1-7483.99: (4.5): Array Array.SX.T is not Write-Read Stable with respect to Array Array.SX.T (case L)
// 7517.1-7540.2: (9.5): yields_as clause for SX.b is not valid
// 7545.1-7563.2: (9.5): yields_as clause for SX.b is not reflexive
// 7569.1-7605.2: (9.5): yields_as clause for SX.b is not transitive
// 7624.1-7647.2: (11.5): yields_as clause for SX.a is not valid
// 7652.1-7670.2: (11.5): yields_as clause for SX.a is not reflexive
// 7676.1-7712.2: (11.5): yields_as clause for SX.a is not transitive
// 7732.1-7755.2: (7.32): yields_as clause for SX._lock is not valid
// 7760.1-7778.2: (7.32): yields_as clause for SX._lock is not reflexive
// 7784.1-7820.2: (7.32): yields_as clause for SX._lock is not transitive
// 7838.1-7865.2: (4.5): yields_as clause for Array.SX.T is not valid
// 7866.1-7890.2: (4.5): yields_as clause for Array.SX.T is not reflexive
// 7895.1-7935.2: (4.5): yields_as clause for Array.SX.T is not transitive
