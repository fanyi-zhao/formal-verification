                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/houdini-2.sink:                         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array Array = int[isLocal(this, tid)                                                          
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E]                                                                            
                                                                                                    
       [Cow.Array{this}] elems isLocal(this, tid)                                                   
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
      invariant  p5 ==> this.elems != [Cow.Array{this}].null;                                       
      invariant  p6 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;      
      invariant  p7 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == 2;      
      invariant  p8 ==> this.elems == [Cow.Array{this}].null;                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant p1 ==> forall int k ::0 <= k && k < i ==> elems[k] == k;                        
          invariant p4 ==> forall int k ::0 <= k && k <= i ==> elems[k] == k;                       
          invariant p2 ==> isLocal(elems, tid);                                                     
          invariant p3 ==> isShared(elems);                                                         
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
      public void f() {                                                                             
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
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
    boolean p1;                                                                                     
    boolean p2;                                                                                     
    boolean p3;                                                                                     
    boolean p4;                                                                                     
    boolean p5;                                                                                     
    boolean p6;                                                                                     
    boolean p7;                                                                                     
    boolean p8;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  p5 ==> this.elems != [Cow.Array{this}].null;                                       
      invariant  p6 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;      
      invariant  p7 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == 2;      
      invariant  p8 ==> this.elems == [Cow.Array{this}].null;                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant p1 ==> forall int k ::0 <= k && k < i ==> elems[k] == k;                        
          invariant p4 ==> forall int k ::0 <= k && k <= i ==> elems[k] == k;                       
          invariant p2 ==> isLocal(elems, tid);                                                     
          invariant p3 ==> isShared(elems);                                                         
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
      public void f() {                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
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
    boolean p1;                                                                                     
    boolean p2;                                                                                     
    boolean p3;                                                                                     
    boolean p4;                                                                                     
    boolean p5;                                                                                     
    boolean p6;                                                                                     
    boolean p7;                                                                                     
    boolean p8;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  p5 ==> this.elems != [Cow.Array{this}].null;                                       
      invariant  p6 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;      
      invariant  p7 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == 2;      
      invariant  p8 ==> this.elems == [Cow.Array{this}].null;                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant p1 ==> forall int k ::0 <= k && k < i ==> elems[k] == k;                        
          invariant p4 ==> forall int k ::0 <= k && k <= i ==> elems[k] == k;                       
          invariant p2 ==> isLocal(elems, tid);                                                     
          invariant p3 ==> isShared(elems);                                                         
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
      public void f() {                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void main() {                                                                          
        Cow c;                                                                                      
        c = new Cow();                                                                              
        {                                                                                           
          inlined c.init();                                                                         
          exit$170: {                                                                               
            Cow this$170;                                                                           
            this$170 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$170}] elems$170;                                                      
              elems$170 = new [Cow.Array{this$170}](16);                                            
              int i$170;                                                                            
              i$170 = 0;                                                                            
              while (i$170 < 16)                                                                    
                invariant p1 ==> forall int k$170 ::0 <= k$170 && k$170 < i$170 ==> elems$170[k$170] == k$170;
                invariant p4 ==> forall int k$170 ::0 <= k$170 && k$170 <= i$170 ==> elems$170[k$170] == k$170;
                invariant p2 ==> isLocal(elems$170, tid);                                           
                invariant p3 ==> isShared(elems$170);                                               
                {                                                                                   
                elems$170[i$170] := i$170;                                                          
                i$170 = i$170 + 1;                                                                  
              }                                                                                     
              this$170.elems := elems$170;                                                          
              {                                                                                     
                break exit$170;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        int y;                                                                                      
        {                                                                                           
          inlined y = c.get(5);                                                                     
          exit$171: {                                                                               
            int i$171;                                                                              
            Cow this$171;                                                                           
            i$171 = 5;                                                                              
            this$171 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$171}] elems$171;                                                      
              elems$171 := this$171.elems;                                                          
              int result$171;                                                                       
              result$171 := elems$171[i$171];                                                       
              {                                                                                     
                {                                                                                   
                  y = result$171;                                                                   
                  break exit$171;                                                                   
                }                                                                                   
              }                                                                                     
              {                                                                                     
                {                                                                                   
                  y = -1;                                                                           
                  break exit$171;                                                                   
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
    boolean p1;                                                                                     
    boolean p2;                                                                                     
    boolean p3;                                                                                     
    boolean p4;                                                                                     
    boolean p5;                                                                                     
    boolean p6;                                                                                     
    boolean p7;                                                                                     
    boolean p8;                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  p5 ==> this.elems != [Cow.Array{this}].null;                                       
      invariant  p6 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == i;      
      invariant  p7 ==> forall int i ::0 <= i && i < this.elems.length ==> this.elems[i] == 2;      
      invariant  p8 ==> this.elems == [Cow.Array{this}].null;                                       
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      void init() {                                                                                 
        [Cow.Array{this}] elems;                                                                    
        elems = new [Cow.Array{this}](16);                                                          
        int i;                                                                                      
        i = 0;                                                                                      
        while (i < 16)                                                                              
          invariant p1 ==> forall int k ::0 <= k && k < i ==> elems[k] == k;                        
          invariant p4 ==> forall int k ::0 <= k && k <= i ==> elems[k] == k;                       
          invariant p2 ==> isLocal(elems, tid);                                                     
          invariant p3 ==> isShared(elems);                                                         
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
      public void f() {                                                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void main() {                                                                          
        Cow c;                                                                                      
        c = new Cow();                                                                              
        {                                                                                           
          inlined c.init();                                                                         
          exit$170: {                                                                               
            Cow this$170;                                                                           
            this$170 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$170}] elems$170;                                                      
              elems$170 = new [Cow.Array{this$170}](16);                                            
              int i$170;                                                                            
              i$170 = 0;                                                                            
              while (i$170 < 16)                                                                    
                invariant p1 ==> forall int k$170 ::0 <= k$170 && k$170 < i$170 ==> elems$170[k$170] == k$170;
                invariant p4 ==> forall int k$170 ::0 <= k$170 && k$170 <= i$170 ==> elems$170[k$170] == k$170;
                invariant p2 ==> isLocal(elems$170, tid);                                           
                invariant p3 ==> isShared(elems$170);                                               
                {                                                                                   
                elems$170[i$170] := i$170;                                                          
                i$170 = i$170 + 1;                                                                  
              }                                                                                     
              this$170.elems := elems$170;                                                          
              {                                                                                     
                break exit$170;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        int y;                                                                                      
        {                                                                                           
          inlined y = c.get(5);                                                                     
          exit$171: {                                                                               
            int i$171;                                                                              
            Cow this$171;                                                                           
            i$171 = 5;                                                                              
            this$171 = c;                                                                           
            {                                                                                       
              [Cow.Array{this$171}] elems$171;                                                      
              elems$171 := this$171.elems;                                                          
              int result$171;                                                                       
              result$171 := elems$171[i$171];                                                       
              {                                                                                     
                {                                                                                   
                  y = result$171;                                                                   
                  break exit$171;                                                                   
                }                                                                                   
              }                                                                                     
              {                                                                                     
                {                                                                                   
                  y = -1;                                                                           
                  break exit$171;                                                                   
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
    boolean p1;                                                                                     
    boolean p2;                                                                                     
    boolean p3;                                                                                     
    boolean p4;                                                                                     
    boolean p5;                                                                                     
    boolean p6;                                                                                     
    boolean p7;                                                                                     
    boolean p8;                                                                                     
                                                                                                    
                                                                                                    
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
                                                                                                    
function {:inline} Invariant.Cow.2075855(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 (Cow.elems[this]!=Array.Cow.Array.null)                                                            
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Cow.2075886(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.elems: [Cow]Array.Cow.Array,Cow._lock: [Cow]Tid,Array.Cow.Array._state: [Array.Cow.Array]State,Array.Cow.Array._elems: [Array.Cow.Array]([int]int),Array.Cow.Array._length: [Array.Cow.Array]int,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
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
                                                                                                    
                                                                                                    
procedure  Main.f(tid:Tid, this : Main)                                                             
modifies Cow._state;                                                                                
modifies Cow.elems;                                                                                 
modifies Cow._lock;                                                                                 
modifies Array.Cow.Array._state;                                                                    
modifies Array.Cow.Array._elems;                                                                    
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (39.4): Bad tid
requires isShared(Main._state[this]);                                                                      // (39.4): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (39.4): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (39.4): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (39.4): Object invariant may not hold.
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (39.4): Object invariant may not hold.
{                                                                                                   
 var Array.Cow.Array._state2075980: [Array.Cow.Array]State;                                         
 var Main._state2075980: [Main]State;                                                               
 var $recorded.state2075980: int;                                                                   
 var this2075980: Main;                                                                             
 var Array.Cow.Array._elems2075980: [Array.Cow.Array]([int]int);                                    
 var Cow._lock2075980: [Cow]Tid;                                                                    
 var Array.Cow.Array._length2075980: [Array.Cow.Array]int;                                          
 var Main._lock2075980: [Main]Tid;                                                                  
 var Cow._state2075980: [Cow]State;                                                                 
 var tid2075980: Tid;                                                                               
 var $pc2075980: Phase;                                                                             
 var Cow.elems2075980: [Cow]Array.Cow.Array;                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 39.20: // return;                                                                               
                                                                                                    
 assume Cow._state2075980 == Cow._state && Cow.elems2075980 == Cow.elems && Cow._lock2075980 == Cow._lock && Array.Cow.Array._state2075980 == Array.Cow.Array._state && Array.Cow.Array._elems2075980 == Array.Cow.Array._elems && Array.Cow.Array._length2075980 == Array.Cow.Array._length && Main._state2075980 == Main._state && Main._lock2075980 == Main._lock && this2075980 == this && tid2075980 == tid;
 assume $recorded.state2075980 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (39.20): Object invariant may not hold.
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (39.20): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Main.main(tid:Tid, this : Main)                                                          
modifies Cow._state;                                                                                
modifies Cow.elems;                                                                                 
modifies Cow._lock;                                                                                 
modifies Array.Cow.Array._state;                                                                    
modifies Array.Cow.Array._elems;                                                                    
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (42.4): Bad tid
requires isShared(Main._state[this]);                                                                      // (42.4): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (42.4): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (42.4): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (42.4): Object invariant may not hold.
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (42.4): Object invariant may not hold.
{                                                                                                   
 var mover2076026: Mover;                                                                           
 var Main._lock2076075: [Main]Tid;                                                                  
 var i$1702076026: int;                                                                             
 var $recorded.state2076072_bottom: int;                                                            
 var mover2076110: Mover;                                                                           
 var $pc2076140: Phase;                                                                             
 var this2076110: Main;                                                                             
 var result$1712076117: int;                                                                        
 var Cow._lock2076072_bottom: [Cow]Tid;                                                             
 var elems$1712076110: Array.Cow.Array;                                                             
 var c2076072_bottom: Cow;                                                                          
 var Cow._lock2076140: [Cow]Tid;                                                                    
 var Cow._lock2076110: [Cow]Tid;                                                                    
 var this2076026: Main;                                                                             
 var path2076026: int;                                                                              
 var $recorded.state2076117: int;                                                                   
 var c2076140: Cow;                                                                                 
 var Cow.elems2076140: [Cow]Array.Cow.Array;                                                        
 var this2076141: Main;                                                                             
 var Cow._state2076075: [Cow]State;                                                                 
 var i$1702076072: int;                                                                             
 var Cow._state2076072: [Cow]State;                                                                 
 var Cow._lock2076117: [Cow]Tid;                                                                    
 var Cow._state2076072_bottom: [Cow]State;                                                          
 var mover2076117: Mover;                                                                           
 var mover2076075: Mover;                                                                           
 var this$1702076072: Cow;                                                                          
 var Cow._lock2076026: [Cow]Tid;                                                                    
 var moverPath2076110: MoverPath;                                                                   
 var this$1702076072_bottom: Cow;                                                                   
 var this2076072_bottom: Main;                                                                      
 var $pc2076072_bottom: Phase;                                                                      
 var y2076110: int;                                                                                 
 var $recorded.state2076141: int;                                                                   
 var i$1702076075: int;                                                                             
 var Array.Cow.Array._length2076140: [Array.Cow.Array]int;                                          
 var this$1712076110: Cow;                                                                          
 var Array.Cow.Array._elems2076072_bottom: [Array.Cow.Array]([int]int);                             
 var $recorded.state2076075: int;                                                                   
 var elems$1702076072_bottom: Array.Cow.Array;                                                      
 var c2076141: Cow;                                                                                 
 var i$1712076110: int;                                                                             
 var this2076072: Main;                                                                             
 var $recorded.state2076110: int;                                                                   
 var moverPath2076117: MoverPath;                                                                   
 var c2076117: Cow;                                                                                 
 var Cow._lock2076072: [Cow]Tid;                                                                    
 var Array.Cow.Array._state2076072_bottom: [Array.Cow.Array]State;                                  
 var $recorded.state2076026: int;                                                                   
 var $pc2076075: Phase;                                                                             
 var $pc2076026: Phase;                                                                             
 var Main._state2076117: [Main]State;                                                               
 var Main._lock2076072: [Main]Tid;                                                                  
 var Cow.elems2076117: [Cow]Array.Cow.Array;                                                        
 var y2076140: int;                                                                                 
 var Array.Cow.Array._elems2076026: [Array.Cow.Array]([int]int);                                    
 var this$171: Cow;                                                                                 
 var this$1702076075: Cow;                                                                          
 var c2076075: Cow;                                                                                 
 var Main._state2076072_bottom: [Main]State;                                                        
 var Main._lock2076117: [Main]Tid;                                                                  
 var Array.Cow.Array._elems2076075: [Array.Cow.Array]([int]int);                                    
 var Array.Cow.Array._state2076075: [Array.Cow.Array]State;                                         
 var Array.Cow.Array._state2076110: [Array.Cow.Array]State;                                         
 var Array.Cow.Array._length2076026: [Array.Cow.Array]int;                                          
 var Array.Cow.Array._elems2076141: [Array.Cow.Array]([int]int);                                    
 var this$1702076026: Cow;                                                                          
 var Array.Cow.Array._state2076072: [Array.Cow.Array]State;                                         
 var result$171: int;                                                                               
 var Main._state2076141: [Main]State;                                                               
 var phase2076072: Phase;                                                                           
 var tid2076117: Tid;                                                                               
 var this$170: Cow;                                                                                 
 var Main._state2076072: [Main]State;                                                               
 var Array.Cow.Array._elems2076117: [Array.Cow.Array]([int]int);                                    
 var Array.Cow.Array._elems2076110: [Array.Cow.Array]([int]int);                                    
 var tid2076075: Tid;                                                                               
 var path2076110: int;                                                                              
 var Array.Cow.Array._length2076110: [Array.Cow.Array]int;                                          
 var tid2076072: Tid;                                                                               
 var Cow._lock2076141: [Cow]Tid;                                                                    
 var moverPath2076075: MoverPath;                                                                   
 var tid2076141: Tid;                                                                               
 var Cow.elems2076072: [Cow]Array.Cow.Array;                                                        
 var tid2076140: Tid;                                                                               
 var $recorded.state2076072: int;                                                                   
 var y: int;                                                                                        
 var Main._state2076140: [Main]State;                                                               
 var this2076140: Main;                                                                             
 var i$170: int;                                                                                    
 var Array.Cow.Array._length2076072_bottom: [Array.Cow.Array]int;                                   
 var Array.Cow.Array._state2076026: [Array.Cow.Array]State;                                         
 var elems$171: Array.Cow.Array;                                                                    
 var this$1712076117: Cow;                                                                          
 var path2076117: int;                                                                              
 var moverPath2076026: MoverPath;                                                                   
 var this2076075: Main;                                                                             
 var $pc2076072: Phase;                                                                             
 var Cow._lock2076075: [Cow]Tid;                                                                    
 var elems$1702076072: Array.Cow.Array;                                                             
 var path2076075: int;                                                                              
 var $pc2076110: Phase;                                                                             
 var tid2076110: Tid;                                                                               
 var $recorded.state2076140: int;                                                                   
 var Array.Cow.Array._state2076140: [Array.Cow.Array]State;                                         
 var Array.Cow.Array._length2076075: [Array.Cow.Array]int;                                          
 var Array.Cow.Array._elems2076140: [Array.Cow.Array]([int]int);                                    
 var c2076026: Cow;                                                                                 
 var elems$170: Array.Cow.Array;                                                                    
 var i$171: int;                                                                                    
 var Cow.elems2076110: [Cow]Array.Cow.Array;                                                        
 var elems$1702076075: Array.Cow.Array;                                                             
 var Array.Cow.Array._length2076072: [Array.Cow.Array]int;                                          
 var tid2076072_bottom: Tid;                                                                        
 var Main._state2076026: [Main]State;                                                               
 var Cow.elems2076141: [Cow]Array.Cow.Array;                                                        
 var Array.Cow.Array._state2076141: [Array.Cow.Array]State;                                         
 var elems$1712076117: Array.Cow.Array;                                                             
 var Main._lock2076141: [Main]Tid;                                                                  
 var tid2076026: Tid;                                                                               
 var Array.Cow.Array._length2076117: [Array.Cow.Array]int;                                          
 var i$1712076117: int;                                                                             
 var Cow.elems2076072_bottom: [Cow]Array.Cow.Array;                                                 
 var Main._lock2076026: [Main]Tid;                                                                  
 var Main._lock2076110: [Main]Tid;                                                                  
 var elems$1702076026: Array.Cow.Array;                                                             
 var $pc2076141: Phase;                                                                             
 var y2076117: int;                                                                                 
 var Array.Cow.Array._state2076117: [Array.Cow.Array]State;                                         
 var Cow.elems2076026: [Cow]Array.Cow.Array;                                                        
 var c2076072: Cow;                                                                                 
 var Cow._state2076117: [Cow]State;                                                                 
 var i$1702076072_bottom: int;                                                                      
 var Array.Cow.Array._length2076141: [Array.Cow.Array]int;                                          
 var Main._lock2076072_bottom: [Main]Tid;                                                           
 var c: Cow;                                                                                        
 var $pc2076117: Phase;                                                                             
 var Main._lock2076140: [Main]Tid;                                                                  
 var this2076117: Main;                                                                             
 var Main._state2076110: [Main]State;                                                               
 var Cow._state2076140: [Cow]State;                                                                 
 var Cow._state2076026: [Cow]State;                                                                 
 var Cow._state2076110: [Cow]State;                                                                 
 var y2076141: int;                                                                                 
 var Array.Cow.Array._elems2076072: [Array.Cow.Array]([int]int);                                    
 var c2076110: Cow;                                                                                 
 var Cow._state2076141: [Cow]State;                                                                 
 var Cow.elems2076075: [Cow]Array.Cow.Array;                                                        
 var Main._state2076075: [Main]State;                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 43.8: Cow c;                                                                                    
                                                                                                    
                                                                                                    
 // 43.8: c = new Cow();                                                                            
                                                                                                    
 havoc c;                                                                                           
 assume c != Cow.null && isFresh(Cow._state[c]);                                                    
 Cow._state[c] := LOCAL(tid);                                                                       
 assume Cow.elems[c]  == Array.Cow.Array.null;                                                      
 assume Cow._lock[c]  == Tid.null;                                                                  
 // inlined: c.init()}                                                                              
 exit$170_top:                                                                                      
                                                                                                    
 // 44.8: Cow this$170;                                                                             
                                                                                                    
                                                                                                    
 // 44.8: this$170 = c;                                                                             
                                                                                                    
 this$170 := c;                                                                                     
                                                                                                    
 // 16.9: [Cow.Array{this$170}] elems$170;                                                          
                                                                                                    
                                                                                                    
 // 16.9: elems$170 = new [Cow.Array{this$170}](16);                                                
                                                                                                    
 havoc elems$170;                                                                                   
 assume isFresh(Array.Cow.Array._state[elems$170]);                                                 
 assume Array.Cow.Array._length[elems$170] == 16;                                                   
 assume Array.Cow.Array._this[elems$170] == this$170;                                               
 Array.Cow.Array._state[elems$170] := LOCAL(tid);                                                   
 assume (forall _i : int :: 0 <= _i ==> Array.Cow.Array._elems[elems$170][_i] == 0);                
                                                                                                    
 // 19.14: int i$170;                                                                               
                                                                                                    
                                                                                                    
 // 19.22: i$170 = 0;                                                                               
                                                                                                    
 i$170 := 0;                                                                                        
 assume Cow._state2076072 == Cow._state && Cow.elems2076072 == Cow.elems && Cow._lock2076072 == Cow._lock && Array.Cow.Array._state2076072 == Array.Cow.Array._state && Array.Cow.Array._elems2076072 == Array.Cow.Array._elems && Array.Cow.Array._length2076072 == Array.Cow.Array._length && Main._state2076072 == Main._state && Main._lock2076072 == Main._lock && i$1702076072 == i$170 && elems$1702076072 == elems$170 && this$1702076072 == this$170 && c2076072 == c && this2076072 == this && tid2076072 == tid;
 assume $recorded.state2076072 == 1;                                                                
                                                                                                    
 // 19.27: while (i$170 < 16)                                                                       
                                                                                                    
 phase2076072 := $pc;                                                                               
 while ((i$170<16))                                                                                 
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (42.4): Bad tid
  invariant isShared(Main._state[this]);                                                                   // (42.4): this is not global
                                                                                                    
  invariant StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && _this != c ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (19.27): Object invariant may not hold.
  invariant  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && _this != c ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (19.27): Object invariant may not hold.
  invariant (forall k$170: int ::  ((((0<=k$170)&&(k$170<i$170))==>(Array.Cow.Array._elems[elems$170][k$170]==k$170))));
  invariant isLocal(Array.Cow.Array._state[elems$170], tid);                                        
  invariant (forall _this : Cow :: Invariant.Y_Cow.elems(tid : Tid, _this, Cow.elems[_this] ,Cow._state2076072,Cow.elems2076072,Cow._lock2076072,Array.Cow.Array._state2076072,Array.Cow.Array._elems2076072,Array.Cow.Array._length2076072,Main._state2076072,Main._lock2076072));       // (19.27): Loop does not preserve yields_as annotation for field elems
  invariant (forall _athis : Array.Cow.Array, _index : int :: Invariant.Y_Array.Cow.Array(tid : Tid, _athis, _index, Array.Cow.Array._elems[_athis][_index] ,Cow._state2076072,Cow.elems2076072,Cow._lock2076072,Array.Cow.Array._state2076072,Array.Cow.Array._elems2076072,Array.Cow.Array._length2076072,Main._state2076072,Main._lock2076072));       // (19.27): Loop does not preserve yields_as annotation for field ArrayDecl(Array,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
  invariant phase2076072 == $pc;                                                                           // (19.27): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (19.27): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 25.13: elems$170[i$170] := i$170;                                                              
                                                                                                    
                                                                                                    
  moverPath2076026 := WriteEval.Array.Cow.Array(tid: Tid,this$170: Cow,elems$170: Array.Cow.Array,i$170: int,i$170: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
  mover2076026 := m#moverPath(moverPath2076026);                                                    
  path2076026 := p#moverPath(moverPath2076026);                                                     
  assume Cow._state2076026 == Cow._state && Cow.elems2076026 == Cow.elems && Cow._lock2076026 == Cow._lock && Array.Cow.Array._state2076026 == Array.Cow.Array._state && Array.Cow.Array._elems2076026 == Array.Cow.Array._elems && Array.Cow.Array._length2076026 == Array.Cow.Array._length && Main._state2076026 == Main._state && Main._lock2076026 == Main._lock && i$1702076026 == i$170 && elems$1702076026 == elems$170 && this$1702076026 == this$170 && c2076026 == c && this2076026 == this && tid2076026 == tid && $pc2076026 == $pc;
  assume $recorded.state2076026 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume elems$170 != Array.Cow.Array.null;                                                        
  } else {                                                                                          
   assert elems$170 != Array.Cow.Array.null;                                                               // (25.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i$170;                                                                               
  } else {                                                                                          
   assert 0 <= i$170;                                                                                      // (25.13): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i$170 < Array.Cow.Array._length[elems$170];                                               
  } else {                                                                                          
   assert i$170 < Array.Cow.Array._length[elems$170];                                                      // (25.13): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2076026);                                                             
  assert $pc != PhaseError;                                                                                // (25.13): Reduction failure
  Array.Cow.Array._elems[elems$170][i$170] := i$170;                                                
                                                                                                    
  // 19.39: i$170 = i$170 + 1;                                                                      
                                                                                                    
  i$170 := (i$170+1);                                                                               
  assume Cow._state2076072_bottom == Cow._state && Cow.elems2076072_bottom == Cow.elems && Cow._lock2076072_bottom == Cow._lock && Array.Cow.Array._state2076072_bottom == Array.Cow.Array._state && Array.Cow.Array._elems2076072_bottom == Array.Cow.Array._elems && Array.Cow.Array._length2076072_bottom == Array.Cow.Array._length && Main._state2076072_bottom == Main._state && Main._lock2076072_bottom == Main._lock && i$1702076072_bottom == i$170 && elems$1702076072_bottom == elems$170 && this$1702076072_bottom == this$170 && c2076072_bottom == c && this2076072_bottom == this && tid2076072_bottom == tid;
  assume $recorded.state2076072_bottom == 1;                                                        
  assert phase2076072 == $pc;                                                                              // (19.27): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 27.9: this$170.elems := elems$170;                                                              
                                                                                                    
                                                                                                    
 moverPath2076075 := WriteEval.Cow.elems(tid: Tid,this$170: Cow,elems$170: Array.Cow.Array,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 mover2076075 := m#moverPath(moverPath2076075);                                                     
 path2076075 := p#moverPath(moverPath2076075);                                                      
 assume Cow._state2076075 == Cow._state && Cow.elems2076075 == Cow.elems && Cow._lock2076075 == Cow._lock && Array.Cow.Array._state2076075 == Array.Cow.Array._state && Array.Cow.Array._elems2076075 == Array.Cow.Array._elems && Array.Cow.Array._length2076075 == Array.Cow.Array._length && Main._state2076075 == Main._state && Main._lock2076075 == Main._lock && i$1702076075 == i$170 && elems$1702076075 == elems$170 && this$1702076075 == this$170 && c2076075 == c && this2076075 == this && tid2076075 == tid && $pc2076075 == $pc;
 assume $recorded.state2076075 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$170 != Cow.null;                                                                      
 } else {                                                                                           
  assert this$170 != Cow.null;                                                                             // (27.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2076075);                                                              
 assert $pc != PhaseError;                                                                                 // (27.9): Reduction failure
 Cow.elems[this$170] := elems$170;                                                                  
 if (isLocal(Array.Cow.Array._state[elems$170], tid)) {                                             
  Array.Cow.Array._state[elems$170] := SHARED();                                                    
  if (isLocal(Cow._state[Array.Cow.Array._this[elems$170]], tid)) {                                 
   Cow._state[Array.Cow.Array._this[elems$170]] := SHARED();                                        
   assert isSharedAssignable(Array.Cow.Array._state[Cow.elems[Array.Cow.Array._this[elems$170]]]);         // (27.9): elems$170 became shared, but Array.Cow.Array._this[elems$170].elems may not be shared.
  }                                                                                                 
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 15.17: break exit$170;                                                                          
                                                                                                    
 goto exit$170_bottom;                                                                              
 exit$170_bottom:                                                                                   
                                                                                                    
 // 45.8: int y;                                                                                    
                                                                                                    
 // inlined: c.get(5)}                                                                              
 exit$171_top:                                                                                      
                                                                                                    
 // 45.8: int i$171;                                                                                
                                                                                                    
                                                                                                    
 // 45.8: Cow this$171;                                                                             
                                                                                                    
                                                                                                    
 // 45.8: i$171 = 5;                                                                                
                                                                                                    
 i$171 := 5;                                                                                        
                                                                                                    
 // 45.8: this$171 = c;                                                                             
                                                                                                    
 this$171 := c;                                                                                     
                                                                                                    
 // 31.9: [Cow.Array{this$171}] elems$171;                                                          
                                                                                                    
                                                                                                    
 // 31.9: elems$171 := this$171.elems;                                                              
                                                                                                    
                                                                                                    
 moverPath2076110 := ReadEval.Cow.elems(tid: Tid,this$171: Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 mover2076110 := m#moverPath(moverPath2076110);                                                     
 path2076110 := p#moverPath(moverPath2076110);                                                      
 assume Cow._state2076110 == Cow._state && Cow.elems2076110 == Cow.elems && Cow._lock2076110 == Cow._lock && Array.Cow.Array._state2076110 == Array.Cow.Array._state && Array.Cow.Array._elems2076110 == Array.Cow.Array._elems && Array.Cow.Array._length2076110 == Array.Cow.Array._length && Main._state2076110 == Main._state && Main._lock2076110 == Main._lock && elems$1712076110 == elems$171 && this$1712076110 == this$171 && i$1712076110 == i$171 && y2076110 == y && c2076110 == c && this2076110 == this && tid2076110 == tid && $pc2076110 == $pc;
 assume $recorded.state2076110 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$171 != Cow.null;                                                                      
 } else {                                                                                           
  assert this$171 != Cow.null;                                                                             // (31.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2076110);                                                              
 assert $pc != PhaseError;                                                                                 // (31.9): Reduction failure
 elems$171 := Cow.elems[this$171];                                                                  
                                                                                                    
 // 32.9: int result$171;                                                                           
                                                                                                    
                                                                                                    
 // 32.9: result$171 := elems$171[i$171];                                                           
                                                                                                    
                                                                                                    
 moverPath2076117 := ReadEval.Array.Cow.Array(tid: Tid,this$171: Cow,elems$171: Array.Cow.Array,i$171: int,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock);
 mover2076117 := m#moverPath(moverPath2076117);                                                     
 path2076117 := p#moverPath(moverPath2076117);                                                      
 assume Cow._state2076117 == Cow._state && Cow.elems2076117 == Cow.elems && Cow._lock2076117 == Cow._lock && Array.Cow.Array._state2076117 == Array.Cow.Array._state && Array.Cow.Array._elems2076117 == Array.Cow.Array._elems && Array.Cow.Array._length2076117 == Array.Cow.Array._length && Main._state2076117 == Main._state && Main._lock2076117 == Main._lock && result$1712076117 == result$171 && elems$1712076117 == elems$171 && this$1712076117 == this$171 && i$1712076117 == i$171 && y2076117 == y && c2076117 == c && this2076117 == this && tid2076117 == tid && $pc2076117 == $pc;
 assume $recorded.state2076117 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume elems$171 != Array.Cow.Array.null;                                                         
 } else {                                                                                           
  assert elems$171 != Array.Cow.Array.null;                                                                // (32.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume 0 <= i$171;                                                                                
 } else {                                                                                           
  assert 0 <= i$171;                                                                                       // (32.9): index < 0.
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume i$171 < Array.Cow.Array._length[elems$171];                                                
 } else {                                                                                           
  assert i$171 < Array.Cow.Array._length[elems$171];                                                       // (32.9): index is >= length.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2076117);                                                              
 assert $pc != PhaseError;                                                                                 // (32.9): Reduction failure
 result$171 := Array.Cow.Array._elems[elems$171][i$171];                                            
                                                                                                    
 // 33.9: y = result$171;                                                                           
                                                                                                    
 y := result$171;                                                                                   
                                                                                                    
 // 33.9: break exit$171;                                                                           
                                                                                                    
 goto exit$171_bottom;                                                                              
                                                                                                    
 // 30.20: y = -1;                                                                                  
                                                                                                    
 y := -1;                                                                                           
                                                                                                    
 // 30.20: break exit$171;                                                                          
                                                                                                    
 goto exit$171_bottom;                                                                              
 exit$171_bottom:                                                                                   
                                                                                                    
 // 46.8: assert y == 5;                                                                            
                                                                                                    
 assume Cow._state2076140 == Cow._state && Cow.elems2076140 == Cow.elems && Cow._lock2076140 == Cow._lock && Array.Cow.Array._state2076140 == Array.Cow.Array._state && Array.Cow.Array._elems2076140 == Array.Cow.Array._elems && Array.Cow.Array._length2076140 == Array.Cow.Array._length && Main._state2076140 == Main._state && Main._lock2076140 == Main._lock && y2076140 == y && c2076140 == c && this2076140 == this && tid2076140 == tid;
 assume $recorded.state2076140 == 1;                                                                
 assert (y==5);                                                                                            // (46.8): This assertion may not hold.
                                                                                                    
 // 42.23: // return;                                                                               
                                                                                                    
 assume Cow._state2076141 == Cow._state && Cow.elems2076141 == Cow.elems && Cow._lock2076141 == Cow._lock && Array.Cow.Array._state2076141 == Array.Cow.Array._state && Array.Cow.Array._elems2076141 == Array.Cow.Array._elems && Array.Cow.Array._length2076141 == Array.Cow.Array._length && Main._state2076141 == Main._state && Main._lock2076141 == Main._lock && y2076141 == y && c2076141 == c && this2076141 == this && tid2076141 == tid;
 assume $recorded.state2076141 == 1;                                                                
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (42.23): Object invariant may not hold.
 assert  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (42.23): Object invariant may not hold.
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
 assert isError(_writeByU_Mover);                                                                          // (7.5): Cow.elems failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (7.5): Cow.elems failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (7.5): Cow.elems failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.5): Cow.elems failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): Cow.elems failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): Cow.elems failed Read-Write Left-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (5.5): Array Array.Cow.Array failed Write-Write Right-Mover Check
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
 assert _readByU_Mover == _E;                                                                              // (5.5): Array Array.Cow.Array failed Write-Read Right-Mover Check
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
 assert isError(_writeByU_Mover);                                                                          // (5.5): Array Array.Cow.Array failed Write-Write Left-Mover Check
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
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): Array Array.Cow.Array failed Write-Read Left-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Array Array.Cow.Array failed Read-Write Right-Mover Check
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
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): Array Array.Cow.Array failed Read-Write Left-Mover Check
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
                                                                                                    
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
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
                                                                                                    
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
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
                                                                                                    
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
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
requires ValidTid(tid);                                                                             
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
modifies Cow._state;                                                                                
modifies Cow.elems;                                                                                 
modifies Cow._lock;                                                                                 
modifies Array.Cow.Array._state;                                                                    
modifies Array.Cow.Array._elems;                                                                    
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
ensures StateInvariant(Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures Y(tid , old(Cow._state), old(Cow.elems), old(Cow._lock), old(Array.Cow.Array._state), old(Array.Cow.Array._elems), old(Array.Cow.Array._length), old(Main._state), old(Main._lock) , Cow._state, Cow.elems, Cow._lock, Array.Cow.Array._state, Array.Cow.Array._elems, Array.Cow.Array._length, Main._state, Main._lock);
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (7.26): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (7.26): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (3.1): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (3.1): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (5.23): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (5.23): Object invariant may not hold.
                                                                                                    
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
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075855(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (38.1): Object invariant may not hold.
requires  (forall _this : Cow ::  { Cow._state[_this] } isAccessible(Cow._state[_this], tid) && true ==> Invariant.Cow.2075886(tid: Tid,_this : Cow,Cow._state,Cow.elems,Cow._lock,Array.Cow.Array._state,Array.Cow.Array._elems,Array.Cow.Array._length,Main._state,Main._lock));       // (38.1): Object invariant may not hold.
                                                                                                    
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
                                                                                                    
                                                                                                    
// 972.1-1019.2: (Method:39.4)
// 983.1-983.24: (39.4): Bad tid
// 984.1-984.38: (39.4): this is not global
// 987.1-987.275: (39.4): Object invariant may not hold.
// 988.1-988.275: (39.4): Object invariant may not hold.
// 991.1-991.274: (39.4): Object invariant may not hold.
// 992.1-992.274: (39.4): Object invariant may not hold.
// 1011.2-1018.9: (class anchor.sink.Return:39.20)
// 1016.1-1016.274: (39.20): Object invariant may not hold.
// 1017.1-1017.274: (39.20): Object invariant may not hold.
// 1020.1-1425.2: (Method:42.4)
// 1031.1-1031.24: (42.4): Bad tid
// 1032.1-1032.38: (42.4): this is not global
// 1035.1-1035.275: (42.4): Object invariant may not hold.
// 1036.1-1036.275: (42.4): Object invariant may not hold.
// 1039.1-1039.274: (42.4): Object invariant may not hold.
// 1040.1-1040.274: (42.4): Object invariant may not hold.
// 1196.2-1198.2: (class anchor.sink.VarDeclStmt:43.8)
// 1199.2-1206.35: (class anchor.sink.Alloc:43.8)
// 1209.2-1211.2: (class anchor.sink.VarDeclStmt:44.8)
// 1212.2-1215.16: (class anchor.sink.Assign:44.8)
// 1216.2-1218.2: (class anchor.sink.VarDeclStmt:16.9)
// 1219.2-1227.85: (class anchor.sink.AAlloc:16.9)
// 1228.2-1230.2: (class anchor.sink.VarDeclStmt:19.14)
// 1231.2-1234.13: (class anchor.sink.Assign:19.22)
// 1237.2-1241.20: (class anchor.sink.While:19.27)
// 1243.1-1243.27: (42.4): Bad tid
// 1244.1-1244.41: (42.4): this is not global
// 1247.1-1247.284: (19.27): Object invariant may not hold.
// 1248.1-1248.284: (19.27): Object invariant may not hold.
// 1248.284-1249.121: (19.27): invariant forall int k$170 ::0 <= k$170 && k$170 < i$170 ==> elems$170[k$170] == k$170 may not hold
// 1249.121-1250.61: (19.27): invariant isLocal(elems$170, tid) may not hold
// 1251.1-1251.276: (19.27): Loop does not preserve yields_as annotation for field elems
// 1252.1-1252.340: (19.27): Loop does not preserve yields_as annotation for field ArrayDecl(Array,IntType(),index,Spec(Cond(IsLocal(VarAccess(this),VarAccess(tid)),Cond(IsLocal(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
// 1253.1-1253.33: (19.27): Phase must be invariant at loop head
// 1254.1-1254.30: (19.27): Potentially infinite loop cannot be in post-commit phase.
// 1256.3-1283.53: (class anchor.sink.AWrite:25.13)
// 1268.1-1268.45: (25.13): Cannot have potential null deference in left-mover part.
// 1273.1-1273.22: (25.13): index < 0.
// 1278.1-1278.54: (25.13): index is >= length.
// 1282.1-1282.28: (25.13): Reduction failure
// 1284.3-1287.22: (class anchor.sink.Assign:19.39)
// 1290.1-1290.30: (19.27): Phase must be invariant at loop head
// 1293.2-1317.2: (class anchor.sink.Write:27.9)
// 1305.1-1305.31: (27.9): Cannot have potential null deference in left-mover part.
// 1308.1-1308.27: (27.9): Reduction failure
// 1314.1-1314.99: (27.9): elems$170 became shared, but Array.Cow.Array._this[elems$170].elems may not be shared.
// 1318.2-1321.23: (class anchor.sink.Break:15.17)
// 1323.2-1325.2: (class anchor.sink.VarDeclStmt:45.8)
// 1328.2-1330.2: (class anchor.sink.VarDeclStmt:45.8)
// 1331.2-1333.2: (class anchor.sink.VarDeclStmt:45.8)
// 1334.2-1337.13: (class anchor.sink.Assign:45.8)
// 1338.2-1341.16: (class anchor.sink.Assign:45.8)
// 1342.2-1344.2: (class anchor.sink.VarDeclStmt:31.9)
// 1345.2-1362.35: (class anchor.sink.Read:31.9)
// 1357.1-1357.31: (31.9): Cannot have potential null deference in left-mover part.
// 1361.1-1361.27: (31.9): Reduction failure
// 1363.2-1365.2: (class anchor.sink.VarDeclStmt:32.9)
// 1366.2-1393.57: (class anchor.sink.ARead:32.9)
// 1378.1-1378.44: (32.9): Cannot have potential null deference in left-mover part.
// 1383.1-1383.21: (32.9): index < 0.
// 1388.1-1388.53: (32.9): index is >= length.
// 1392.1-1392.27: (32.9): Reduction failure
// 1394.2-1397.18: (class anchor.sink.Assign:33.9)
// 1398.2-1401.23: (class anchor.sink.Break:33.9)
// 1402.2-1405.10: (class anchor.sink.Assign:30.20)
// 1406.2-1409.23: (class anchor.sink.Break:30.20)
// 1411.2-1416.16: (class anchor.sink.Assert:46.8)
// 1416.1-1416.16: (46.8): This assertion may not hold.
// 1417.2-1424.9: (class anchor.sink.Return:42.23)
// 1422.1-1422.274: (42.23): Object invariant may not hold.
// 1423.1-1423.274: (42.23): Object invariant may not hold.
// 1515.1-1515.34: (7.5): Cow.elems failed Write-Write Right-Mover Check
// 1582.1-1582.30: (7.5): Cow.elems failed Write-Read Right-Mover Check
// 1653.1-1653.34: (7.5): Cow.elems failed Write-Write Left-Mover Check
// 1721.1-1721.30: (7.5): Cow.elems failed Write-Read Left-Mover Check
// 1786.1-1786.34: (7.5): Cow.elems failed Read-Write Right-Mover Check
// 1854.1-1854.34: (7.5): Cow.elems failed Read-Write Left-Mover Check
// 1927.1-1927.34: (5.5): Array Array.Cow.Array failed Write-Write Right-Mover Check
// 2000.1-2000.30: (5.5): Array Array.Cow.Array failed Write-Read Right-Mover Check
// 2077.1-2077.34: (5.5): Array Array.Cow.Array failed Write-Write Left-Mover Check
// 2151.1-2151.30: (5.5): Array Array.Cow.Array failed Write-Read Left-Mover Check
// 2222.1-2222.34: (5.5): Array Array.Cow.Array failed Read-Write Right-Mover Check
// 2296.1-2296.34: (5.5): Array Array.Cow.Array failed Read-Write Left-Mover Check
// 2375.1-2375.140: (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.1)
// 2376.1-2376.101: (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.2)
// 2377.1-2377.158: (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case A.3)
// 2485.1-2485.140: (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case C)
// 2598.1-2598.144: (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case D)
// 2599.1-2599.144: (7.5): Cow.elems is not Write-Write Stable with respect to Cow.elems (case R)
// 2678.1-2678.136: (7.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case F)
// 2679.1-2679.136: (7.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case H)
// 2680.1-2680.146: (7.5): Cow.elems is not Read-Write Stable with respect to Cow.elems (case I)
// 2758.1-2758.136: (7.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case J)
// 2759.1-2759.136: (7.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case K)
// 2760.1-2760.99: (7.5): Cow.elems is not Write-Read Stable with respect to Cow.elems (case L)
// 2845.1-2845.140: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.1)
// 2846.1-2846.101: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.2)
// 2847.1-2847.156: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case A.3)
// 2962.1-2962.140: (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
// 3082.1-3082.144: (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
// 3083.1-3083.144: (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
// 3167.1-3167.136: (7.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
// 3168.1-3168.136: (7.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
// 3169.1-3169.144: (7.5): Cow.elems is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
// 3252.1-3252.136: (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case J)
// 3253.1-3253.136: (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case K)
// 3254.1-3254.99: (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Cow.elems (case L)
// 3339.1-3339.140: (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
// 3340.1-3340.101: (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
// 3341.1-3341.156: (7.5): Cow.elems is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
// 3456.1-3456.140: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case C)
// 3576.1-3576.144: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case D)
// 3577.1-3577.144: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Cow.elems (case R)
// 3661.1-3661.136: (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case F)
// 3662.1-3662.136: (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case H)
// 3663.1-3663.144: (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Cow.elems (case I)
// 3746.1-3746.136: (7.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
// 3747.1-3747.136: (7.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
// 3748.1-3748.99: (7.5): Cow.elems is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
// 3838.1-3838.140: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.1)
// 3839.1-3839.101: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.2)
// 3840.1-3840.156: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case A.3)
// 3962.1-3962.140: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case C)
// 4089.1-4089.144: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case D)
// 4090.1-4090.144: (5.5): Array Array.Cow.Array is not Write-Write Stable with respect to Array Array.Cow.Array (case R)
// 4179.1-4179.136: (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case F)
// 4180.1-4180.136: (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case H)
// 4181.1-4181.144: (5.5): Array Array.Cow.Array is not Read-Write Stable with respect to Array Array.Cow.Array (case I)
// 4269.1-4269.136: (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case J)
// 4270.1-4270.136: (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case K)
// 4271.1-4271.99: (5.5): Array Array.Cow.Array is not Write-Read Stable with respect to Array Array.Cow.Array (case L)
// 4278.1-4278.275: (<undefined position>): Object invariant may not hold.
// 4279.1-4279.275: (<undefined position>): Object invariant may not hold.
// 4289.1-4289.274: (<undefined position>): Object invariant may not hold.
// 4290.1-4290.274: (<undefined position>): Object invariant may not hold.
// 4310.1-4334.2: (7.5): yields_as clause for Cow.elems is not valid
// 4339.1-4358.2: (7.5): yields_as clause for Cow.elems is not reflexive
// 4364.1-4364.275: (7.26): Object invariant may not hold.
// 4365.1-4365.275: (7.26): Object invariant may not hold.
// 4366.1-4404.2: (7.5): yields_as clause for Cow.elems is not transitive
// 4424.1-4448.2: (7.32): yields_as clause for Cow._lock is not valid
// 4453.1-4472.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4478.1-4478.275: (3.1): Object invariant may not hold.
// 4479.1-4479.275: (3.1): Object invariant may not hold.
// 4480.1-4518.2: (7.32): yields_as clause for Cow._lock is not transitive
// 4536.1-4564.2: (5.5): yields_as clause for Array.Cow.Array is not valid
// 4565.1-4590.2: (5.5): yields_as clause for Array.Cow.Array is not reflexive
// 4595.1-4595.275: (5.23): Object invariant may not hold.
// 4596.1-4596.275: (5.23): Object invariant may not hold.
// 4597.1-4639.2: (5.5): yields_as clause for Array.Cow.Array is not transitive
// 4659.1-4683.2: (7.32): yields_as clause for Main._lock is not valid
// 4688.1-4707.2: (7.32): yields_as clause for Main._lock is not reflexive
// 4713.1-4713.275: (38.1): Object invariant may not hold.
// 4714.1-4714.275: (38.1): Object invariant may not hold.
// 4715.1-4753.2: (7.32): yields_as clause for Main._lock is not transitive
