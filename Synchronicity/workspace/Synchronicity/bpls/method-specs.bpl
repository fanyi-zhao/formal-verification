                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/method-specs.anchor:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f1() {                                                                            
        synchronized (this) {                                                                       
          int tmp1;                                                                                 
          int tmp2;                                                                                 
          tmp2 := this.x;                                                                           
          tmp1 = tmp2 + 1;                                                                          
          this.x := tmp1;                                                                           
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 2;                                                          
      }                                                                                             
      public void f1Bad() {                                                                         
        synchronized (this) {                                                                       
          int tmp3;                                                                                 
          int tmp4;                                                                                 
          tmp4 := this.x;                                                                           
          tmp3 = tmp4 + 1;                                                                          
          this.x := tmp3;                                                                           
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f2() {                                                                            
        synchronized (this) {                                                                       
          int tmp5;                                                                                 
          int tmp6;                                                                                 
          tmp6 := this.x;                                                                           
          tmp5 = tmp6 + 1;                                                                          
          this.x := tmp5;                                                                           
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp7;                                                                                 
          int tmp8;                                                                                 
          tmp8 := this.x;                                                                           
          tmp7 = tmp8 + 1;                                                                          
          this.x := tmp7;                                                                           
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f3() {                                                                            
        synchronized (this) {                                                                       
          int tmp9;                                                                                 
          int tmp10;                                                                                
          tmp10 := this.x;                                                                          
          tmp9 = tmp10 + 1;                                                                         
          this.x := tmp9;                                                                           
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp11;                                                                                
          int tmp12;                                                                                
          tmp12 := this.x;                                                                          
          tmp11 = tmp12 + 1;                                                                        
          this.x := tmp11;                                                                          
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f4() {                                                                            
        synchronized (this) {                                                                       
          int tmp13;                                                                                
          int tmp14;                                                                                
          tmp14 := this.x;                                                                          
          tmp13 = tmp14 + 1;                                                                        
          this.x := tmp13;                                                                          
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp15;                                                                                
          int tmp16;                                                                                
          tmp16 := this.x;                                                                          
          tmp15 = tmp16 + 1;                                                                        
          this.x := tmp15;                                                                          
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp17;                                                                                
          int tmp18;                                                                                
          tmp18 := this.x;                                                                          
          tmp17 = tmp18 + 1;                                                                        
          this.x := tmp17;                                                                          
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void stutter() {                                                                       
        synchronized (this) {                                                                       
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp19;                                                                                
          int tmp20;                                                                                
          tmp20 := this.x;                                                                          
          tmp19 = tmp20 + 1;                                                                        
          this.x := tmp19;                                                                          
        }                                                                                           
        synchronized (this) {                                                                       
          int tmp21;                                                                                
          int tmp22;                                                                                
          tmp22 := this.x;                                                                          
          tmp21 = tmp22 + 1;                                                                        
          this.x := tmp21;                                                                          
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
      public void abs() {                                                                           
        synchronized (this) {                                                                       
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp23;                                                                                
          int tmp24;                                                                                
          tmp24 := this.x;                                                                          
          tmp23 = tmp24 + 1;                                                                        
          this.x := tmp23;                                                                          
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this.x;                                                                            
        ensures this.x == old(this.x) + 1;                                                          
      }*                                                                                            
      public void f5() {                                                                            
        synchronized (this) {                                                                       
          int tmp25;                                                                                
          int tmp26;                                                                                
          tmp26 := this.x;                                                                          
          tmp25 = tmp26 + 1;                                                                        
          this.x := tmp25;                                                                          
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp27;                                                                                
          int tmp28;                                                                                
          tmp28 := this.x;                                                                          
          tmp27 = tmp28 + 1;                                                                        
          this.x := tmp27;                                                                          
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          int tmp29;                                                                                
          int tmp30;                                                                                
          tmp30 := this.x;                                                                          
          tmp29 = tmp30 + 1;                                                                        
          this.x := tmp29;                                                                          
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
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
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f1() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.x;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.x := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 2;                                                          
      }                                                                                             
      public void f1Bad() {                                                                         
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp3;                                                                               
            int tmp4;                                                                               
            tmp4 := this.x;                                                                         
            tmp3 = tmp4 + 1;                                                                        
            this.x := tmp3;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp5;                                                                               
            int tmp6;                                                                               
            tmp6 := this.x;                                                                         
            tmp5 = tmp6 + 1;                                                                        
            this.x := tmp5;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp7;                                                                               
            int tmp8;                                                                               
            tmp8 := this.x;                                                                         
            tmp7 = tmp8 + 1;                                                                        
            this.x := tmp7;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f3() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp9;                                                                               
            int tmp10;                                                                              
            tmp10 := this.x;                                                                        
            tmp9 = tmp10 + 1;                                                                       
            this.x := tmp9;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp11;                                                                              
            int tmp12;                                                                              
            tmp12 := this.x;                                                                        
            tmp11 = tmp12 + 1;                                                                      
            this.x := tmp11;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f4() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp13;                                                                              
            int tmp14;                                                                              
            tmp14 := this.x;                                                                        
            tmp13 = tmp14 + 1;                                                                      
            this.x := tmp13;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp15;                                                                              
            int tmp16;                                                                              
            tmp16 := this.x;                                                                        
            tmp15 = tmp16 + 1;                                                                      
            this.x := tmp15;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp17;                                                                              
            int tmp18;                                                                              
            tmp18 := this.x;                                                                        
            tmp17 = tmp18 + 1;                                                                      
            this.x := tmp17;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void stutter() {                                                                       
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
                                                                                                    
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp19;                                                                              
            int tmp20;                                                                              
            tmp20 := this.x;                                                                        
            tmp19 = tmp20 + 1;                                                                      
            this.x := tmp19;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp21;                                                                              
            int tmp22;                                                                              
            tmp22 := this.x;                                                                        
            tmp21 = tmp22 + 1;                                                                      
            this.x := tmp21;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
      public void abs() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
                                                                                                    
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp23;                                                                              
            int tmp24;                                                                              
            tmp24 := this.x;                                                                        
            tmp23 = tmp24 + 1;                                                                      
            this.x := tmp23;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this.x;                                                                            
        ensures this.x == old(this.x) + 1;                                                          
      }*                                                                                            
      public void f5() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp25;                                                                              
            int tmp26;                                                                              
            tmp26 := this.x;                                                                        
            tmp25 = tmp26 + 1;                                                                      
            this.x := tmp25;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp27;                                                                              
            int tmp28;                                                                              
            tmp28 := this.x;                                                                        
            tmp27 = tmp28 + 1;                                                                      
            this.x := tmp27;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp29;                                                                              
            int tmp30;                                                                              
            tmp30 := this.x;                                                                        
            tmp29 = tmp30 + 1;                                                                      
            this.x := tmp29;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
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
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f1() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.x;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.x := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 2;                                                          
      }                                                                                             
      public void f1Bad() {                                                                         
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp3;                                                                               
            int tmp4;                                                                               
            tmp4 := this.x;                                                                         
            tmp3 = tmp4 + 1;                                                                        
            this.x := tmp3;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp5;                                                                               
            int tmp6;                                                                               
            tmp6 := this.x;                                                                         
            tmp5 = tmp6 + 1;                                                                        
            this.x := tmp5;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp7;                                                                               
            int tmp8;                                                                               
            tmp8 := this.x;                                                                         
            tmp7 = tmp8 + 1;                                                                        
            this.x := tmp7;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f3() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp9;                                                                               
            int tmp10;                                                                              
            tmp10 := this.x;                                                                        
            tmp9 = tmp10 + 1;                                                                       
            this.x := tmp9;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp11;                                                                              
            int tmp12;                                                                              
            tmp12 := this.x;                                                                        
            tmp11 = tmp12 + 1;                                                                      
            this.x := tmp11;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f4() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp13;                                                                              
            int tmp14;                                                                              
            tmp14 := this.x;                                                                        
            tmp13 = tmp14 + 1;                                                                      
            this.x := tmp13;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp15;                                                                              
            int tmp16;                                                                              
            tmp16 := this.x;                                                                        
            tmp15 = tmp16 + 1;                                                                      
            this.x := tmp15;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp17;                                                                              
            int tmp18;                                                                              
            tmp18 := this.x;                                                                        
            tmp17 = tmp18 + 1;                                                                      
            this.x := tmp17;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void stutter() {                                                                       
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
                                                                                                    
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp19;                                                                              
            int tmp20;                                                                              
            tmp20 := this.x;                                                                        
            tmp19 = tmp20 + 1;                                                                      
            this.x := tmp19;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp21;                                                                              
            int tmp22;                                                                              
            tmp22 := this.x;                                                                        
            tmp21 = tmp22 + 1;                                                                      
            this.x := tmp21;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
      public void abs() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
                                                                                                    
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp23;                                                                              
            int tmp24;                                                                              
            tmp24 := this.x;                                                                        
            tmp23 = tmp24 + 1;                                                                      
            this.x := tmp23;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this.x;                                                                            
        ensures this.x == old(this.x) + 1;                                                          
      }*                                                                                            
      public void f5() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp25;                                                                              
            int tmp26;                                                                              
            tmp26 := this.x;                                                                        
            tmp25 = tmp26 + 1;                                                                      
            this.x := tmp25;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp27;                                                                              
            int tmp28;                                                                              
            tmp28 := this.x;                                                                        
            tmp27 = tmp28 + 1;                                                                      
            this.x := tmp27;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp29;                                                                              
            int tmp30;                                                                              
            tmp30 := this.x;                                                                        
            tmp29 = tmp30 + 1;                                                                      
            this.x := tmp29;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
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
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f1() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.x;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.x := tmp1;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 2;                                                          
      }                                                                                             
      public void f1Bad() {                                                                         
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp3;                                                                               
            int tmp4;                                                                               
            tmp4 := this.x;                                                                         
            tmp3 = tmp4 + 1;                                                                        
            this.x := tmp3;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp5;                                                                               
            int tmp6;                                                                               
            tmp6 := this.x;                                                                         
            tmp5 = tmp6 + 1;                                                                        
            this.x := tmp5;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp7;                                                                               
            int tmp8;                                                                               
            tmp8 := this.x;                                                                         
            tmp7 = tmp8 + 1;                                                                        
            this.x := tmp7;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f3() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp9;                                                                               
            int tmp10;                                                                              
            tmp10 := this.x;                                                                        
            tmp9 = tmp10 + 1;                                                                       
            this.x := tmp9;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp11;                                                                              
            int tmp12;                                                                              
            tmp12 := this.x;                                                                        
            tmp11 = tmp12 + 1;                                                                      
            this.x := tmp11;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void f4() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp13;                                                                              
            int tmp14;                                                                              
            tmp14 := this.x;                                                                        
            tmp13 = tmp14 + 1;                                                                      
            this.x := tmp13;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp15;                                                                              
            int tmp16;                                                                              
            tmp16 := this.x;                                                                        
            tmp15 = tmp16 + 1;                                                                      
            this.x := tmp15;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp17;                                                                              
            int tmp18;                                                                              
            tmp18 := this.x;                                                                        
            tmp17 = tmp18 + 1;                                                                      
            this.x := tmp17;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.x == old(this.x) + 1;                                                          
      }                                                                                             
      public void stutter() {                                                                       
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
                                                                                                    
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp19;                                                                              
            int tmp20;                                                                              
            tmp20 := this.x;                                                                        
            tmp19 = tmp20 + 1;                                                                      
            this.x := tmp19;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp21;                                                                              
            int tmp22;                                                                              
            tmp22 := this.x;                                                                        
            tmp21 = tmp22 + 1;                                                                      
            this.x := tmp21;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures true;                                                                               
      }                                                                                             
      public void abs() {                                                                           
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
                                                                                                    
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp23;                                                                              
            int tmp24;                                                                              
            tmp24 := this.x;                                                                        
            tmp23 = tmp24 + 1;                                                                      
            this.x := tmp23;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this.x;                                                                            
        ensures this.x == old(this.x) + 1;                                                          
      }*                                                                                            
      public void f5() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp25;                                                                              
            int tmp26;                                                                              
            tmp26 := this.x;                                                                        
            tmp25 = tmp26 + 1;                                                                      
            this.x := tmp25;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp27;                                                                              
            int tmp28;                                                                              
            tmp28 := this.x;                                                                        
            tmp27 = tmp28 + 1;                                                                      
            this.x := tmp27;                                                                        
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp29;                                                                              
            int tmp30;                                                                              
            tmp30 := this.x;                                                                        
            tmp29 = tmp30 + 1;                                                                      
            this.x := tmp29;                                                                        
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
                                                                                                    
                                                                                                    
/*** Class Decl Cow ***/                                                                            
                                                                                                    
type Cow;                                                                                           
const unique Cow.null: Cow;                                                                         
var Cow._state: [Cow]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.x: [Cow]int;                                                                                
                                                                                                    
function {:inline} ReadEval.Cow.x(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.x(tid: Tid,this : Cow,newValue: int,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(Cow._state[this], tid) && Cow._lock[this] == tid)) then                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  Cow.f1(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (6.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var Cow._state2684077: [Cow]State;                                                                 
 var Cow.x2684077: [Cow]int;                                                                        
 var path2684077: int;                                                                              
 var $pc2684077: Phase;                                                                             
 var Cow._lock2684082: [Cow]Tid;                                                                    
 var mover2684067: Mover;                                                                           
 var tmp12684067: int;                                                                              
 var Cow._state2684082: [Cow]State;                                                                 
 var tid2684077: Tid;                                                                               
 var $recorded.state2684067: int;                                                                   
 var Cow._state2684067: [Cow]State;                                                                 
 var Cow._lock2684067: [Cow]Tid;                                                                    
 var mover2684077: Mover;                                                                           
 var this2684082: Cow;                                                                              
 var Cow.x2684067: [Cow]int;                                                                        
 var tmp22684077: int;                                                                              
 var tmp1: int;                                                                                     
 var tid2684082: Tid;                                                                               
 var tmp12684077: int;                                                                              
 var $pc2684082: Phase;                                                                             
 var tmp22684067: int;                                                                              
 var Cow._lock2684077: [Cow]Tid;                                                                    
 var $pc2684067: Phase;                                                                             
 var this2684077: Cow;                                                                              
 var path2684067: int;                                                                              
 var tmp2: int;                                                                                     
 var this2684067: Cow;                                                                              
 var moverPath2684067: MoverPath;                                                                   
 var moverPath2684077: MoverPath;                                                                   
 var $recorded.state2684082: int;                                                                   
 var Cow.x2684082: [Cow]int;                                                                        
 var tid2684067: Tid;                                                                               
 var $recorded.state2684077: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (8.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (8.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 9.9: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: int tmp2;                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: tmp2 := this.x;                                                                            
                                                                                                    
                                                                                                    
 moverPath2684067 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684067 := m#moverPath(moverPath2684067);                                                     
 path2684067 := p#moverPath(moverPath2684067);                                                      
 assume Cow._state2684067 == Cow._state && Cow.x2684067 == Cow.x && Cow._lock2684067 == Cow._lock && tmp22684067 == tmp2 && tmp12684067 == tmp1 && this2684067 == this && tid2684067 == tid && $pc2684067 == $pc;
 assume $recorded.state2684067 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684067);                                                              
 assert $pc != PhaseError;                                                                                 // (9.9): Reduction failure
 tmp2 := Cow.x[this];                                                                               
                                                                                                    
 // 9.9: tmp1 = tmp2 + 1;                                                                           
                                                                                                    
 tmp1 := (tmp2+1);                                                                                  
                                                                                                    
                                                                                                    
 // 9.9: this.x := tmp1;                                                                            
                                                                                                    
                                                                                                    
 moverPath2684077 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp1: int,Cow._state,Cow.x,Cow._lock);      
 mover2684077 := m#moverPath(moverPath2684077);                                                     
 path2684077 := p#moverPath(moverPath2684077);                                                      
 assume Cow._state2684077 == Cow._state && Cow.x2684077 == Cow.x && Cow._lock2684077 == Cow._lock && tmp22684077 == tmp2 && tmp12684077 == tmp1 && this2684077 == this && tid2684077 == tid && $pc2684077 == $pc;
 assume $recorded.state2684077 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684077);                                                              
 assert $pc != PhaseError;                                                                                 // (9.9): Reduction failure
 Cow.x[this] := tmp1;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (10.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (10.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 7.22: // return;                                                                                
                                                                                                    
 assume Cow._state2684082 == Cow._state && Cow.x2684082 == Cow.x && Cow._lock2684082 == Cow._lock && this2684082 == this && tid2684082 == tid;
 assume $recorded.state2684082 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f1Bad(tid:Tid, this : Cow)                                                           
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (13.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (13.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var Cow.x2684111: [Cow]int;                                                                        
 var Cow._lock2684106: [Cow]Tid;                                                                    
 var Cow.x2684096: [Cow]int;                                                                        
 var Cow._state2684096: [Cow]State;                                                                 
 var Cow.x2684106: [Cow]int;                                                                        
 var $recorded.state2684106: int;                                                                   
 var this2684106: Cow;                                                                              
 var moverPath2684106: MoverPath;                                                                   
 var path2684106: int;                                                                              
 var $recorded.state2684096: int;                                                                   
 var mover2684096: Mover;                                                                           
 var Cow._state2684106: [Cow]State;                                                                 
 var this2684111: Cow;                                                                              
 var Cow._lock2684096: [Cow]Tid;                                                                    
 var tmp42684096: int;                                                                              
 var tmp42684106: int;                                                                              
 var moverPath2684096: MoverPath;                                                                   
 var tmp32684106: int;                                                                              
 var this2684096: Cow;                                                                              
 var $pc2684106: Phase;                                                                             
 var Cow._lock2684111: [Cow]Tid;                                                                    
 var $pc2684111: Phase;                                                                             
 var tid2684106: Tid;                                                                               
 var Cow._state2684111: [Cow]State;                                                                 
 var tmp3: int;                                                                                     
 var tid2684111: Tid;                                                                               
 var tid2684096: Tid;                                                                               
 var $pc2684096: Phase;                                                                             
 var mover2684106: Mover;                                                                           
 var tmp4: int;                                                                                     
 var tmp32684096: int;                                                                              
 var path2684096: int;                                                                              
 var $recorded.state2684111: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (15.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (15.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 16.9: int tmp3;                                                                                 
                                                                                                    
                                                                                                    
 // 16.9: int tmp4;                                                                                 
                                                                                                    
                                                                                                    
 // 16.9: tmp4 := this.x;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684096 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684096 := m#moverPath(moverPath2684096);                                                     
 path2684096 := p#moverPath(moverPath2684096);                                                      
 assume Cow._state2684096 == Cow._state && Cow.x2684096 == Cow.x && Cow._lock2684096 == Cow._lock && tmp42684096 == tmp4 && tmp32684096 == tmp3 && this2684096 == this && tid2684096 == tid && $pc2684096 == $pc;
 assume $recorded.state2684096 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (16.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684096);                                                              
 assert $pc != PhaseError;                                                                                 // (16.9): Reduction failure
 tmp4 := Cow.x[this];                                                                               
                                                                                                    
 // 16.9: tmp3 = tmp4 + 1;                                                                          
                                                                                                    
 tmp3 := (tmp4+1);                                                                                  
                                                                                                    
                                                                                                    
 // 16.9: this.x := tmp3;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684106 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp3: int,Cow._state,Cow.x,Cow._lock);      
 mover2684106 := m#moverPath(moverPath2684106);                                                     
 path2684106 := p#moverPath(moverPath2684106);                                                      
 assume Cow._state2684106 == Cow._state && Cow.x2684106 == Cow.x && Cow._lock2684106 == Cow._lock && tmp42684106 == tmp4 && tmp32684106 == tmp3 && this2684106 == this && tid2684106 == tid && $pc2684106 == $pc;
 assume $recorded.state2684106 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (16.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684106);                                                              
 assert $pc != PhaseError;                                                                                 // (16.9): Reduction failure
 Cow.x[this] := tmp3;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (17.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (17.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (17.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 14.25: // return;                                                                               
                                                                                                    
 assume Cow._state2684111 == Cow._state && Cow.x2684111 == Cow.x && Cow._lock2684111 == Cow._lock && this2684111 == this && tid2684111 == tid;
 assume $recorded.state2684111 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f2(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (20.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (20.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var moverPath2684161: MoverPath;                                                                   
 var tid2684140_post: Tid;                                                                          
 var tmp5: int;                                                                                     
 var Cow._state2684125: [Cow]State;                                                                 
 var Cow._state2684135: [Cow]State;                                                                 
 var path2684135: int;                                                                              
 var tmp8: int;                                                                                     
 var Cow._state2684140: [Cow]State;                                                                 
 var tid2684140: Tid;                                                                               
 var $recorded.state2684140: int;                                                                   
 var this2684151: Cow;                                                                              
 var tid2684151: Tid;                                                                               
 var $pc2684125: Phase;                                                                             
 var moverPath2684135: MoverPath;                                                                   
 var Cow.x2684125: [Cow]int;                                                                        
 var $pc2684151: Phase;                                                                             
 var Cow.x2684151: [Cow]int;                                                                        
 var tmp62684135: int;                                                                              
 var Cow._lock2684140_post: [Cow]Tid;                                                               
 var $recorded.state2684161: int;                                                                   
 var moverPath2684125: MoverPath;                                                                   
 var $pc2684161: Phase;                                                                             
 var tmp82684151: int;                                                                              
 var Cow.x2684166: [Cow]int;                                                                        
 var Cow._state2684166: [Cow]State;                                                                 
 var path2684161: int;                                                                              
 var tmp52684135: int;                                                                              
 var $pc2684140_post: Phase;                                                                        
 var moverPath2684151: MoverPath;                                                                   
 var $recorded.state2684125: int;                                                                   
 var tmp62684125: int;                                                                              
 var this2684166: Cow;                                                                              
 var this2684125: Cow;                                                                              
 var path2684151: int;                                                                              
 var Cow.x2684140_post: [Cow]int;                                                                   
 var $recorded.state2684140_post: int;                                                              
 var Cow._lock2684151: [Cow]Tid;                                                                    
 var $recorded.state2684135: int;                                                                   
 var Cow._state2684161: [Cow]State;                                                                 
 var Cow.x2684135: [Cow]int;                                                                        
 var tid2684135: Tid;                                                                               
 var Cow._lock2684140: [Cow]Tid;                                                                    
 var this2684161: Cow;                                                                              
 var Cow._state2684151: [Cow]State;                                                                 
 var Cow.x2684140: [Cow]int;                                                                        
 var $pc2684166: Phase;                                                                             
 var Cow._lock2684135: [Cow]Tid;                                                                    
 var Cow._lock2684125: [Cow]Tid;                                                                    
 var tid2684125: Tid;                                                                               
 var mover2684151: Mover;                                                                           
 var tid2684166: Tid;                                                                               
 var path2684125: int;                                                                              
 var this2684140: Cow;                                                                              
 var tmp82684161: int;                                                                              
 var tmp72684161: int;                                                                              
 var Cow._lock2684166: [Cow]Tid;                                                                    
 var mover2684125: Mover;                                                                           
 var Cow.x2684161: [Cow]int;                                                                        
 var tmp7: int;                                                                                     
 var Cow._lock2684161: [Cow]Tid;                                                                    
 var tmp52684125: int;                                                                              
 var mover2684161: Mover;                                                                           
 var Cow._state2684140_post: [Cow]State;                                                            
 var this2684140_post: Cow;                                                                         
 var $pc2684140: Phase;                                                                             
 var tmp72684151: int;                                                                              
 var tid2684161: Tid;                                                                               
 var mover2684135: Mover;                                                                           
 var $recorded.state2684151: int;                                                                   
 var $pc2684135: Phase;                                                                             
 var this2684135: Cow;                                                                              
 var tmp6: int;                                                                                     
 var $recorded.state2684166: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (24.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (24.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 25.9: int tmp5;                                                                                 
                                                                                                    
                                                                                                    
 // 25.9: int tmp6;                                                                                 
                                                                                                    
                                                                                                    
 // 25.9: tmp6 := this.x;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684125 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684125 := m#moverPath(moverPath2684125);                                                     
 path2684125 := p#moverPath(moverPath2684125);                                                      
 assume Cow._state2684125 == Cow._state && Cow.x2684125 == Cow.x && Cow._lock2684125 == Cow._lock && tmp62684125 == tmp6 && tmp52684125 == tmp5 && this2684125 == this && tid2684125 == tid && $pc2684125 == $pc;
 assume $recorded.state2684125 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (25.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684125);                                                              
 assert $pc != PhaseError;                                                                                 // (25.9): Reduction failure
 tmp6 := Cow.x[this];                                                                               
                                                                                                    
 // 25.9: tmp5 = tmp6 + 1;                                                                          
                                                                                                    
 tmp5 := (tmp6+1);                                                                                  
                                                                                                    
                                                                                                    
 // 25.9: this.x := tmp5;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684135 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp5: int,Cow._state,Cow.x,Cow._lock);      
 mover2684135 := m#moverPath(moverPath2684135);                                                     
 path2684135 := p#moverPath(moverPath2684135);                                                      
 assume Cow._state2684135 == Cow._state && Cow.x2684135 == Cow.x && Cow._lock2684135 == Cow._lock && tmp62684135 == tmp6 && tmp52684135 == tmp5 && this2684135 == this && tid2684135 == tid && $pc2684135 == $pc;
 assume $recorded.state2684135 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (25.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684135);                                                              
 assert $pc != PhaseError;                                                                                 // (25.9): Reduction failure
 Cow.x[this] := tmp5;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (26.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (26.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (26.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 27.7: yield;                                                                                    
                                                                                                    
 assume Cow._state2684140 == Cow._state && Cow.x2684140 == Cow.x && Cow._lock2684140 == Cow._lock && this2684140 == this && tid2684140 == tid;
 assume $recorded.state2684140 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684140_post == Cow._state && Cow.x2684140_post == Cow.x && Cow._lock2684140_post == Cow._lock && this2684140_post == this && tid2684140_post == tid;
 assume $recorded.state2684140_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (28.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (28.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 29.9: int tmp7;                                                                                 
                                                                                                    
                                                                                                    
 // 29.9: int tmp8;                                                                                 
                                                                                                    
                                                                                                    
 // 29.9: tmp8 := this.x;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684151 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684151 := m#moverPath(moverPath2684151);                                                     
 path2684151 := p#moverPath(moverPath2684151);                                                      
 assume Cow._state2684151 == Cow._state && Cow.x2684151 == Cow.x && Cow._lock2684151 == Cow._lock && tmp82684151 == tmp8 && tmp72684151 == tmp7 && this2684151 == this && tid2684151 == tid && $pc2684151 == $pc;
 assume $recorded.state2684151 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (29.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684151);                                                              
 assert $pc != PhaseError;                                                                                 // (29.9): Reduction failure
 tmp8 := Cow.x[this];                                                                               
                                                                                                    
 // 29.9: tmp7 = tmp8 + 1;                                                                          
                                                                                                    
 tmp7 := (tmp8+1);                                                                                  
                                                                                                    
                                                                                                    
 // 29.9: this.x := tmp7;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684161 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp7: int,Cow._state,Cow.x,Cow._lock);      
 mover2684161 := m#moverPath(moverPath2684161);                                                     
 path2684161 := p#moverPath(moverPath2684161);                                                      
 assume Cow._state2684161 == Cow._state && Cow.x2684161 == Cow.x && Cow._lock2684161 == Cow._lock && tmp82684161 == tmp8 && tmp72684161 == tmp7 && this2684161 == this && tid2684161 == tid && $pc2684161 == $pc;
 assume $recorded.state2684161 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (29.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684161);                                                              
 assert $pc != PhaseError;                                                                                 // (29.9): Reduction failure
 Cow.x[this] := tmp7;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (30.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (30.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (30.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 23.22: // return;                                                                               
                                                                                                    
 assume Cow._state2684166 == Cow._state && Cow.x2684166 == Cow.x && Cow._lock2684166 == Cow._lock && this2684166 == this && tid2684166 == tid;
 assume $recorded.state2684166 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f3(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (33.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (33.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var $pc2684216: Phase;                                                                             
 var tid2684195: Tid;                                                                               
 var Cow.x2684180: [Cow]int;                                                                        
 var Cow._lock2684216: [Cow]Tid;                                                                    
 var this2684190: Cow;                                                                              
 var tid2684195_post: Tid;                                                                          
 var tmp102684190: int;                                                                             
 var tid2684216: Tid;                                                                               
 var Cow.x2684190: [Cow]int;                                                                        
 var $recorded.state2684216: int;                                                                   
 var tmp92684180: int;                                                                              
 var mover2684180: Mover;                                                                           
 var Cow.x2684195_post: [Cow]int;                                                                   
 var $pc2684180: Phase;                                                                             
 var path2684206: int;                                                                              
 var $pc2684195: Phase;                                                                             
 var Cow._state2684221: [Cow]State;                                                                 
 var $recorded.state2684195: int;                                                                   
 var tmp9: int;                                                                                     
 var $pc2684206: Phase;                                                                             
 var path2684216: int;                                                                              
 var tmp102684180: int;                                                                             
 var moverPath2684180: MoverPath;                                                                   
 var this2684195: Cow;                                                                              
 var Cow._state2684195_post: [Cow]State;                                                            
 var Cow._state2684206: [Cow]State;                                                                 
 var $pc2684190: Phase;                                                                             
 var mover2684190: Mover;                                                                           
 var moverPath2684206: MoverPath;                                                                   
 var Cow.x2684206: [Cow]int;                                                                        
 var mover2684206: Mover;                                                                           
 var tmp11: int;                                                                                    
 var tmp92684190: int;                                                                              
 var Cow._lock2684180: [Cow]Tid;                                                                    
 var Cow._state2684216: [Cow]State;                                                                 
 var Cow._lock2684195: [Cow]Tid;                                                                    
 var tid2684206: Tid;                                                                               
 var Cow._state2684180: [Cow]State;                                                                 
 var moverPath2684190: MoverPath;                                                                   
 var this2684195_post: Cow;                                                                         
 var Cow.x2684216: [Cow]int;                                                                        
 var tmp10: int;                                                                                    
 var tid2684221: Tid;                                                                               
 var this2684180: Cow;                                                                              
 var $pc2684221: Phase;                                                                             
 var this2684206: Cow;                                                                              
 var tmp112684206: int;                                                                             
 var $recorded.state2684221: int;                                                                   
 var moverPath2684216: MoverPath;                                                                   
 var $recorded.state2684190: int;                                                                   
 var tmp12: int;                                                                                    
 var mover2684216: Mover;                                                                           
 var this2684221: Cow;                                                                              
 var path2684190: int;                                                                              
 var Cow._lock2684221: [Cow]Tid;                                                                    
 var Cow._state2684190: [Cow]State;                                                                 
 var tmp122684206: int;                                                                             
 var tid2684190: Tid;                                                                               
 var tmp112684216: int;                                                                             
 var this2684216: Cow;                                                                              
 var $recorded.state2684206: int;                                                                   
 var $recorded.state2684180: int;                                                                   
 var Cow._lock2684195_post: [Cow]Tid;                                                               
 var Cow._state2684195: [Cow]State;                                                                 
 var path2684180: int;                                                                              
 var tmp122684216: int;                                                                             
 var $recorded.state2684195_post: int;                                                              
 var Cow._lock2684206: [Cow]Tid;                                                                    
 var $pc2684195_post: Phase;                                                                        
 var tid2684180: Tid;                                                                               
 var Cow.x2684221: [Cow]int;                                                                        
 var Cow.x2684195: [Cow]int;                                                                        
 var Cow._lock2684190: [Cow]Tid;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (39.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (39.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 40.9: int tmp9;                                                                                 
                                                                                                    
                                                                                                    
 // 40.9: int tmp10;                                                                                
                                                                                                    
                                                                                                    
 // 40.9: tmp10 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684180 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684180 := m#moverPath(moverPath2684180);                                                     
 path2684180 := p#moverPath(moverPath2684180);                                                      
 assume Cow._state2684180 == Cow._state && Cow.x2684180 == Cow.x && Cow._lock2684180 == Cow._lock && tmp102684180 == tmp10 && tmp92684180 == tmp9 && this2684180 == this && tid2684180 == tid && $pc2684180 == $pc;
 assume $recorded.state2684180 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (40.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684180);                                                              
 assert $pc != PhaseError;                                                                                 // (40.9): Reduction failure
 tmp10 := Cow.x[this];                                                                              
                                                                                                    
 // 40.9: tmp9 = tmp10 + 1;                                                                         
                                                                                                    
 tmp9 := (tmp10+1);                                                                                 
                                                                                                    
                                                                                                    
 // 40.9: this.x := tmp9;                                                                           
                                                                                                    
                                                                                                    
 moverPath2684190 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp9: int,Cow._state,Cow.x,Cow._lock);      
 mover2684190 := m#moverPath(moverPath2684190);                                                     
 path2684190 := p#moverPath(moverPath2684190);                                                      
 assume Cow._state2684190 == Cow._state && Cow.x2684190 == Cow.x && Cow._lock2684190 == Cow._lock && tmp102684190 == tmp10 && tmp92684190 == tmp9 && this2684190 == this && tid2684190 == tid && $pc2684190 == $pc;
 assume $recorded.state2684190 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (40.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684190);                                                              
 assert $pc != PhaseError;                                                                                 // (40.9): Reduction failure
 Cow.x[this] := tmp9;                                                                               
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (41.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (41.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (41.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 42.7: yield;                                                                                    
                                                                                                    
 assume Cow._state2684195 == Cow._state && Cow.x2684195 == Cow.x && Cow._lock2684195 == Cow._lock && this2684195 == this && tid2684195 == tid;
 assume $recorded.state2684195 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684195_post == Cow._state && Cow.x2684195_post == Cow.x && Cow._lock2684195_post == Cow._lock && this2684195_post == this && tid2684195_post == tid;
 assume $recorded.state2684195_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (43.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (43.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 44.9: int tmp11;                                                                                
                                                                                                    
                                                                                                    
 // 44.9: int tmp12;                                                                                
                                                                                                    
                                                                                                    
 // 44.9: tmp12 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684206 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684206 := m#moverPath(moverPath2684206);                                                     
 path2684206 := p#moverPath(moverPath2684206);                                                      
 assume Cow._state2684206 == Cow._state && Cow.x2684206 == Cow.x && Cow._lock2684206 == Cow._lock && tmp122684206 == tmp12 && tmp112684206 == tmp11 && this2684206 == this && tid2684206 == tid && $pc2684206 == $pc;
 assume $recorded.state2684206 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (44.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684206);                                                              
 assert $pc != PhaseError;                                                                                 // (44.9): Reduction failure
 tmp12 := Cow.x[this];                                                                              
                                                                                                    
 // 44.9: tmp11 = tmp12 + 1;                                                                        
                                                                                                    
 tmp11 := (tmp12+1);                                                                                
                                                                                                    
                                                                                                    
 // 44.9: this.x := tmp11;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684216 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp11: int,Cow._state,Cow.x,Cow._lock);     
 mover2684216 := m#moverPath(moverPath2684216);                                                     
 path2684216 := p#moverPath(moverPath2684216);                                                      
 assume Cow._state2684216 == Cow._state && Cow.x2684216 == Cow.x && Cow._lock2684216 == Cow._lock && tmp122684216 == tmp12 && tmp112684216 == tmp11 && this2684216 == this && tid2684216 == tid && $pc2684216 == $pc;
 assume $recorded.state2684216 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (44.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684216);                                                              
 assert $pc != PhaseError;                                                                                 // (44.9): Reduction failure
 Cow.x[this] := tmp11;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (45.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (45.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (45.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 38.22: // return;                                                                               
                                                                                                    
 assume Cow._state2684221 == Cow._state && Cow.x2684221 == Cow.x && Cow._lock2684221 == Cow._lock && this2684221 == this && tid2684221 == tid;
 assume $recorded.state2684221 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f4(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (48.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (48.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var path2684235: int;                                                                              
 var $recorded.state2684276: int;                                                                   
 var $recorded.state2684250: int;                                                                   
 var this2684297: Cow;                                                                              
 var moverPath2684245: MoverPath;                                                                   
 var tmp17: int;                                                                                    
 var $recorded.state2684271: int;                                                                   
 var Cow.x2684245: [Cow]int;                                                                        
 var Cow._lock2684250: [Cow]Tid;                                                                    
 var mover2684287: Mover;                                                                           
 var moverPath2684297: MoverPath;                                                                   
 var this2684276_post: Cow;                                                                         
 var Cow._state2684297: [Cow]State;                                                                 
 var this2684276: Cow;                                                                              
 var path2684287: int;                                                                              
 var Cow._state2684276_post: [Cow]State;                                                            
 var path2684271: int;                                                                              
 var Cow.x2684250: [Cow]int;                                                                        
 var Cow.x2684276: [Cow]int;                                                                        
 var $recorded.state2684287: int;                                                                   
 var mover2684261: Mover;                                                                           
 var $recorded.state2684276_post: int;                                                              
 var Cow._lock2684302: [Cow]Tid;                                                                    
 var tmp132684235: int;                                                                             
 var tmp182684297: int;                                                                             
 var $pc2684302: Phase;                                                                             
 var Cow.x2684302: [Cow]int;                                                                        
 var $recorded.state2684261: int;                                                                   
 var $pc2684245: Phase;                                                                             
 var mover2684271: Mover;                                                                           
 var Cow.x2684297: [Cow]int;                                                                        
 var $recorded.state2684302: int;                                                                   
 var tid2684297: Tid;                                                                               
 var $pc2684271: Phase;                                                                             
 var this2684287: Cow;                                                                              
 var tid2684250: Tid;                                                                               
 var Cow.x2684287: [Cow]int;                                                                        
 var tmp142684235: int;                                                                             
 var tmp14: int;                                                                                    
 var $pc2684261: Phase;                                                                             
 var Cow._lock2684276_post: [Cow]Tid;                                                               
 var this2684271: Cow;                                                                              
 var $pc2684276: Phase;                                                                             
 var path2684245: int;                                                                              
 var moverPath2684287: MoverPath;                                                                   
 var tmp152684271: int;                                                                             
 var $pc2684287: Phase;                                                                             
 var Cow._state2684287: [Cow]State;                                                                 
 var this2684250: Cow;                                                                              
 var tmp172684287: int;                                                                             
 var $recorded.state2684250_post: int;                                                              
 var tmp152684261: int;                                                                             
 var tmp162684261: int;                                                                             
 var tid2684250_post: Tid;                                                                          
 var tid2684276_post: Tid;                                                                          
 var Cow._state2684250_post: [Cow]State;                                                            
 var tmp18: int;                                                                                    
 var tid2684245: Tid;                                                                               
 var this2684261: Cow;                                                                              
 var $pc2684276_post: Phase;                                                                        
 var tmp172684297: int;                                                                             
 var this2684235: Cow;                                                                              
 var Cow._lock2684297: [Cow]Tid;                                                                    
 var moverPath2684271: MoverPath;                                                                   
 var Cow._lock2684235: [Cow]Tid;                                                                    
 var path2684297: int;                                                                              
 var tmp15: int;                                                                                    
 var tmp13: int;                                                                                    
 var mover2684235: Mover;                                                                           
 var Cow.x2684276_post: [Cow]int;                                                                   
 var moverPath2684235: MoverPath;                                                                   
 var moverPath2684261: MoverPath;                                                                   
 var tmp162684271: int;                                                                             
 var path2684261: int;                                                                              
 var Cow.x2684261: [Cow]int;                                                                        
 var Cow._state2684235: [Cow]State;                                                                 
 var tid2684276: Tid;                                                                               
 var mover2684245: Mover;                                                                           
 var Cow.x2684250_post: [Cow]int;                                                                   
 var tid2684271: Tid;                                                                               
 var tmp182684287: int;                                                                             
 var tid2684235: Tid;                                                                               
 var Cow._lock2684250_post: [Cow]Tid;                                                               
 var Cow._state2684276: [Cow]State;                                                                 
 var tid2684302: Tid;                                                                               
 var $recorded.state2684235: int;                                                                   
 var tmp142684245: int;                                                                             
 var Cow._lock2684271: [Cow]Tid;                                                                    
 var Cow._lock2684276: [Cow]Tid;                                                                    
 var $pc2684297: Phase;                                                                             
 var $recorded.state2684245: int;                                                                   
 var Cow._state2684302: [Cow]State;                                                                 
 var Cow._state2684261: [Cow]State;                                                                 
 var tid2684287: Tid;                                                                               
 var mover2684297: Mover;                                                                           
 var Cow._lock2684245: [Cow]Tid;                                                                    
 var $pc2684250_post: Phase;                                                                        
 var $pc2684250: Phase;                                                                             
 var $pc2684235: Phase;                                                                             
 var Cow._state2684250: [Cow]State;                                                                 
 var Cow._lock2684261: [Cow]Tid;                                                                    
 var Cow.x2684271: [Cow]int;                                                                        
 var this2684245: Cow;                                                                              
 var Cow._lock2684287: [Cow]Tid;                                                                    
 var this2684302: Cow;                                                                              
 var tid2684261: Tid;                                                                               
 var tmp132684245: int;                                                                             
 var this2684250_post: Cow;                                                                         
 var Cow._state2684245: [Cow]State;                                                                 
 var tmp16: int;                                                                                    
 var Cow.x2684235: [Cow]int;                                                                        
 var $recorded.state2684297: int;                                                                   
 var Cow._state2684271: [Cow]State;                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (54.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (54.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 55.9: int tmp13;                                                                                
                                                                                                    
                                                                                                    
 // 55.9: int tmp14;                                                                                
                                                                                                    
                                                                                                    
 // 55.9: tmp14 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684235 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684235 := m#moverPath(moverPath2684235);                                                     
 path2684235 := p#moverPath(moverPath2684235);                                                      
 assume Cow._state2684235 == Cow._state && Cow.x2684235 == Cow.x && Cow._lock2684235 == Cow._lock && tmp142684235 == tmp14 && tmp132684235 == tmp13 && this2684235 == this && tid2684235 == tid && $pc2684235 == $pc;
 assume $recorded.state2684235 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (55.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684235);                                                              
 assert $pc != PhaseError;                                                                                 // (55.9): Reduction failure
 tmp14 := Cow.x[this];                                                                              
                                                                                                    
 // 55.9: tmp13 = tmp14 + 1;                                                                        
                                                                                                    
 tmp13 := (tmp14+1);                                                                                
                                                                                                    
                                                                                                    
 // 55.9: this.x := tmp13;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684245 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp13: int,Cow._state,Cow.x,Cow._lock);     
 mover2684245 := m#moverPath(moverPath2684245);                                                     
 path2684245 := p#moverPath(moverPath2684245);                                                      
 assume Cow._state2684245 == Cow._state && Cow.x2684245 == Cow.x && Cow._lock2684245 == Cow._lock && tmp142684245 == tmp14 && tmp132684245 == tmp13 && this2684245 == this && tid2684245 == tid && $pc2684245 == $pc;
 assume $recorded.state2684245 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (55.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684245);                                                              
 assert $pc != PhaseError;                                                                                 // (55.9): Reduction failure
 Cow.x[this] := tmp13;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (56.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (56.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (56.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 57.7: yield;                                                                                    
                                                                                                    
 assume Cow._state2684250 == Cow._state && Cow.x2684250 == Cow.x && Cow._lock2684250 == Cow._lock && this2684250 == this && tid2684250 == tid;
 assume $recorded.state2684250 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684250_post == Cow._state && Cow.x2684250_post == Cow.x && Cow._lock2684250_post == Cow._lock && this2684250_post == this && tid2684250_post == tid;
 assume $recorded.state2684250_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (58.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (58.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 59.9: int tmp15;                                                                                
                                                                                                    
                                                                                                    
 // 59.9: int tmp16;                                                                                
                                                                                                    
                                                                                                    
 // 59.9: tmp16 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684261 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684261 := m#moverPath(moverPath2684261);                                                     
 path2684261 := p#moverPath(moverPath2684261);                                                      
 assume Cow._state2684261 == Cow._state && Cow.x2684261 == Cow.x && Cow._lock2684261 == Cow._lock && tmp162684261 == tmp16 && tmp152684261 == tmp15 && this2684261 == this && tid2684261 == tid && $pc2684261 == $pc;
 assume $recorded.state2684261 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (59.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684261);                                                              
 assert $pc != PhaseError;                                                                                 // (59.9): Reduction failure
 tmp16 := Cow.x[this];                                                                              
                                                                                                    
 // 59.9: tmp15 = tmp16 + 1;                                                                        
                                                                                                    
 tmp15 := (tmp16+1);                                                                                
                                                                                                    
                                                                                                    
 // 59.9: this.x := tmp15;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684271 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp15: int,Cow._state,Cow.x,Cow._lock);     
 mover2684271 := m#moverPath(moverPath2684271);                                                     
 path2684271 := p#moverPath(moverPath2684271);                                                      
 assume Cow._state2684271 == Cow._state && Cow.x2684271 == Cow.x && Cow._lock2684271 == Cow._lock && tmp162684271 == tmp16 && tmp152684271 == tmp15 && this2684271 == this && tid2684271 == tid && $pc2684271 == $pc;
 assume $recorded.state2684271 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (59.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684271);                                                              
 assert $pc != PhaseError;                                                                                 // (59.9): Reduction failure
 Cow.x[this] := tmp15;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (60.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (60.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (60.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 61.7: yield;                                                                                    
                                                                                                    
 assume Cow._state2684276 == Cow._state && Cow.x2684276 == Cow.x && Cow._lock2684276 == Cow._lock && this2684276 == this && tid2684276 == tid;
 assume $recorded.state2684276 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684276_post == Cow._state && Cow.x2684276_post == Cow.x && Cow._lock2684276_post == Cow._lock && this2684276_post == this && tid2684276_post == tid;
 assume $recorded.state2684276_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (62.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (62.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 63.9: int tmp17;                                                                                
                                                                                                    
                                                                                                    
 // 63.9: int tmp18;                                                                                
                                                                                                    
                                                                                                    
 // 63.9: tmp18 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684287 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684287 := m#moverPath(moverPath2684287);                                                     
 path2684287 := p#moverPath(moverPath2684287);                                                      
 assume Cow._state2684287 == Cow._state && Cow.x2684287 == Cow.x && Cow._lock2684287 == Cow._lock && tmp182684287 == tmp18 && tmp172684287 == tmp17 && this2684287 == this && tid2684287 == tid && $pc2684287 == $pc;
 assume $recorded.state2684287 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (63.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684287);                                                              
 assert $pc != PhaseError;                                                                                 // (63.9): Reduction failure
 tmp18 := Cow.x[this];                                                                              
                                                                                                    
 // 63.9: tmp17 = tmp18 + 1;                                                                        
                                                                                                    
 tmp17 := (tmp18+1);                                                                                
                                                                                                    
                                                                                                    
 // 63.9: this.x := tmp17;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684297 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp17: int,Cow._state,Cow.x,Cow._lock);     
 mover2684297 := m#moverPath(moverPath2684297);                                                     
 path2684297 := p#moverPath(moverPath2684297);                                                      
 assume Cow._state2684297 == Cow._state && Cow.x2684297 == Cow.x && Cow._lock2684297 == Cow._lock && tmp182684297 == tmp18 && tmp172684297 == tmp17 && this2684297 == this && tid2684297 == tid && $pc2684297 == $pc;
 assume $recorded.state2684297 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (63.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684297);                                                              
 assert $pc != PhaseError;                                                                                 // (63.9): Reduction failure
 Cow.x[this] := tmp17;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (64.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (64.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (64.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 53.22: // return;                                                                               
                                                                                                    
 assume Cow._state2684302 == Cow._state && Cow.x2684302 == Cow.x && Cow._lock2684302 == Cow._lock && this2684302 == this && tid2684302 == tid;
 assume $recorded.state2684302 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.stutter(tid:Tid, this : Cow)                                                         
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (67.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (67.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var this2684333: Cow;                                                                              
 var Cow.x2684358: [Cow]int;                                                                        
 var Cow._state2684312: [Cow]State;                                                                 
 var $pc2684348: Phase;                                                                             
 var $pc2684333: Phase;                                                                             
 var mover2684333: Mover;                                                                           
 var this2684363: Cow;                                                                              
 var tmp222684358: int;                                                                             
 var $pc2684312: Phase;                                                                             
 var tmp192684333: int;                                                                             
 var mover2684358: Mover;                                                                           
 var tid2684348: Tid;                                                                               
 var tmp212684358: int;                                                                             
 var tmp202684333: int;                                                                             
 var $recorded.state2684323: int;                                                                   
 var moverPath2684358: MoverPath;                                                                   
 var Cow._state2684358: [Cow]State;                                                                 
 var this2684358: Cow;                                                                              
 var $pc2684323: Phase;                                                                             
 var tmp22: int;                                                                                    
 var $recorded.state2684312: int;                                                                   
 var tid2684323: Tid;                                                                               
 var $recorded.state2684312_post: int;                                                              
 var path2684358: int;                                                                              
 var tmp21: int;                                                                                    
 var moverPath2684323: MoverPath;                                                                   
 var this2684323: Cow;                                                                              
 var this2684312: Cow;                                                                              
 var Cow.x2684323: [Cow]int;                                                                        
 var Cow._state2684323: [Cow]State;                                                                 
 var tmp212684348: int;                                                                             
 var Cow._state2684348: [Cow]State;                                                                 
 var tmp222684348: int;                                                                             
 var Cow._lock2684333: [Cow]Tid;                                                                    
 var tmp202684323: int;                                                                             
 var tid2684363: Tid;                                                                               
 var Cow._state2684333: [Cow]State;                                                                 
 var Cow._lock2684348: [Cow]Tid;                                                                    
 var Cow.x2684312_post: [Cow]int;                                                                   
 var path2684323: int;                                                                              
 var Cow._lock2684312: [Cow]Tid;                                                                    
 var tid2684333: Tid;                                                                               
 var $recorded.state2684363: int;                                                                   
 var Cow.x2684312: [Cow]int;                                                                        
 var moverPath2684348: MoverPath;                                                                   
 var moverPath2684333: MoverPath;                                                                   
 var tmp19: int;                                                                                    
 var $pc2684312_post: Phase;                                                                        
 var this2684348: Cow;                                                                              
 var mover2684348: Mover;                                                                           
 var this2684312_post: Cow;                                                                         
 var Cow._lock2684323: [Cow]Tid;                                                                    
 var Cow.x2684348: [Cow]int;                                                                        
 var Cow._state2684312_post: [Cow]State;                                                            
 var $pc2684363: Phase;                                                                             
 var Cow.x2684333: [Cow]int;                                                                        
 var Cow._lock2684312_post: [Cow]Tid;                                                               
 var mover2684323: Mover;                                                                           
 var Cow._state2684363: [Cow]State;                                                                 
 var tmp20: int;                                                                                    
 var Cow.x2684363: [Cow]int;                                                                        
 var path2684333: int;                                                                              
 var $pc2684358: Phase;                                                                             
 var tid2684358: Tid;                                                                               
 var Cow._lock2684358: [Cow]Tid;                                                                    
 var tid2684312_post: Tid;                                                                          
 var tid2684312: Tid;                                                                               
 var $recorded.state2684358: int;                                                                   
 var tmp192684323: int;                                                                             
 var path2684348: int;                                                                              
 var $recorded.state2684348: int;                                                                   
 var Cow._lock2684363: [Cow]Tid;                                                                    
 var $recorded.state2684333: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (69.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (69.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (70.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (70.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (70.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 71.7: yield;                                                                                    
                                                                                                    
 assume Cow._state2684312 == Cow._state && Cow.x2684312 == Cow.x && Cow._lock2684312 == Cow._lock && this2684312 == this && tid2684312 == tid;
 assume $recorded.state2684312 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684312_post == Cow._state && Cow.x2684312_post == Cow.x && Cow._lock2684312_post == Cow._lock && this2684312_post == this && tid2684312_post == tid;
 assume $recorded.state2684312_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (72.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (72.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 73.9: int tmp19;                                                                                
                                                                                                    
                                                                                                    
 // 73.9: int tmp20;                                                                                
                                                                                                    
                                                                                                    
 // 73.9: tmp20 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684323 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684323 := m#moverPath(moverPath2684323);                                                     
 path2684323 := p#moverPath(moverPath2684323);                                                      
 assume Cow._state2684323 == Cow._state && Cow.x2684323 == Cow.x && Cow._lock2684323 == Cow._lock && tmp202684323 == tmp20 && tmp192684323 == tmp19 && this2684323 == this && tid2684323 == tid && $pc2684323 == $pc;
 assume $recorded.state2684323 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (73.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684323);                                                              
 assert $pc != PhaseError;                                                                                 // (73.9): Reduction failure
 tmp20 := Cow.x[this];                                                                              
                                                                                                    
 // 73.9: tmp19 = tmp20 + 1;                                                                        
                                                                                                    
 tmp19 := (tmp20+1);                                                                                
                                                                                                    
                                                                                                    
 // 73.9: this.x := tmp19;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684333 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp19: int,Cow._state,Cow.x,Cow._lock);     
 mover2684333 := m#moverPath(moverPath2684333);                                                     
 path2684333 := p#moverPath(moverPath2684333);                                                      
 assume Cow._state2684333 == Cow._state && Cow.x2684333 == Cow.x && Cow._lock2684333 == Cow._lock && tmp202684333 == tmp20 && tmp192684333 == tmp19 && this2684333 == this && tid2684333 == tid && $pc2684333 == $pc;
 assume $recorded.state2684333 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (73.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684333);                                                              
 assert $pc != PhaseError;                                                                                 // (73.9): Reduction failure
 Cow.x[this] := tmp19;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (74.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (74.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (74.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (75.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (75.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 76.9: int tmp21;                                                                                
                                                                                                    
                                                                                                    
 // 76.9: int tmp22;                                                                                
                                                                                                    
                                                                                                    
 // 76.9: tmp22 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684348 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684348 := m#moverPath(moverPath2684348);                                                     
 path2684348 := p#moverPath(moverPath2684348);                                                      
 assume Cow._state2684348 == Cow._state && Cow.x2684348 == Cow.x && Cow._lock2684348 == Cow._lock && tmp222684348 == tmp22 && tmp212684348 == tmp21 && this2684348 == this && tid2684348 == tid && $pc2684348 == $pc;
 assume $recorded.state2684348 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (76.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684348);                                                              
 assert $pc != PhaseError;                                                                                 // (76.9): Reduction failure
 tmp22 := Cow.x[this];                                                                              
                                                                                                    
 // 76.9: tmp21 = tmp22 + 1;                                                                        
                                                                                                    
 tmp21 := (tmp22+1);                                                                                
                                                                                                    
                                                                                                    
 // 76.9: this.x := tmp21;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684358 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp21: int,Cow._state,Cow.x,Cow._lock);     
 mover2684358 := m#moverPath(moverPath2684358);                                                     
 path2684358 := p#moverPath(moverPath2684358);                                                      
 assume Cow._state2684358 == Cow._state && Cow.x2684358 == Cow.x && Cow._lock2684358 == Cow._lock && tmp222684358 == tmp22 && tmp212684358 == tmp21 && this2684358 == this && tid2684358 == tid && $pc2684358 == $pc;
 assume $recorded.state2684358 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (76.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684358);                                                              
 assert $pc != PhaseError;                                                                                 // (76.9): Reduction failure
 Cow.x[this] := tmp21;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (77.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (77.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (77.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 68.27: // return;                                                                               
                                                                                                    
 assume Cow._state2684363 == Cow._state && Cow.x2684363 == Cow.x && Cow._lock2684363 == Cow._lock && this2684363 == this && tid2684363 == tid;
 assume $recorded.state2684363 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.abs(tid:Tid, this : Cow)                                                             
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (81.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (81.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var Cow._state2684373_post: [Cow]State;                                                            
 var this2684394: Cow;                                                                              
 var tid2684394: Tid;                                                                               
 var Cow.x2684373_post: [Cow]int;                                                                   
 var Cow._lock2684394: [Cow]Tid;                                                                    
 var Cow._state2684384: [Cow]State;                                                                 
 var Cow.x2684394: [Cow]int;                                                                        
 var mover2684384: Mover;                                                                           
 var Cow._state2684399: [Cow]State;                                                                 
 var $pc2684373_post: Phase;                                                                        
 var Cow._state2684394: [Cow]State;                                                                 
 var Cow._lock2684399: [Cow]Tid;                                                                    
 var tid2684373: Tid;                                                                               
 var moverPath2684394: MoverPath;                                                                   
 var moverPath2684384: MoverPath;                                                                   
 var this2684384: Cow;                                                                              
 var this2684373: Cow;                                                                              
 var $pc2684373: Phase;                                                                             
 var $pc2684399: Phase;                                                                             
 var $pc2684394: Phase;                                                                             
 var Cow.x2684384: [Cow]int;                                                                        
 var tid2684384: Tid;                                                                               
 var mover2684394: Mover;                                                                           
 var $recorded.state2684394: int;                                                                   
 var tmp242684394: int;                                                                             
 var tid2684399: Tid;                                                                               
 var path2684394: int;                                                                              
 var tmp232684384: int;                                                                             
 var Cow._state2684373: [Cow]State;                                                                 
 var Cow._lock2684373: [Cow]Tid;                                                                    
 var tmp23: int;                                                                                    
 var $recorded.state2684399: int;                                                                   
 var tid2684373_post: Tid;                                                                          
 var Cow.x2684399: [Cow]int;                                                                        
 var Cow._lock2684384: [Cow]Tid;                                                                    
 var path2684384: int;                                                                              
 var tmp24: int;                                                                                    
 var this2684373_post: Cow;                                                                         
 var $pc2684384: Phase;                                                                             
 var Cow.x2684373: [Cow]int;                                                                        
 var this2684399: Cow;                                                                              
 var tmp242684384: int;                                                                             
 var $recorded.state2684373: int;                                                                   
 var Cow._lock2684373_post: [Cow]Tid;                                                               
 var $recorded.state2684373_post: int;                                                              
 var tmp232684394: int;                                                                             
 var $recorded.state2684384: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (83.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (83.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (84.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (84.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (84.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 85.7: yield;                                                                                    
                                                                                                    
 assume Cow._state2684373 == Cow._state && Cow.x2684373 == Cow.x && Cow._lock2684373 == Cow._lock && this2684373 == this && tid2684373 == tid;
 assume $recorded.state2684373 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684373_post == Cow._state && Cow.x2684373_post == Cow.x && Cow._lock2684373_post == Cow._lock && this2684373_post == this && tid2684373_post == tid;
 assume $recorded.state2684373_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (86.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (86.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 87.9: int tmp23;                                                                                
                                                                                                    
                                                                                                    
 // 87.9: int tmp24;                                                                                
                                                                                                    
                                                                                                    
 // 87.9: tmp24 := this.x;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684384 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684384 := m#moverPath(moverPath2684384);                                                     
 path2684384 := p#moverPath(moverPath2684384);                                                      
 assume Cow._state2684384 == Cow._state && Cow.x2684384 == Cow.x && Cow._lock2684384 == Cow._lock && tmp242684384 == tmp24 && tmp232684384 == tmp23 && this2684384 == this && tid2684384 == tid && $pc2684384 == $pc;
 assume $recorded.state2684384 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (87.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684384);                                                              
 assert $pc != PhaseError;                                                                                 // (87.9): Reduction failure
 tmp24 := Cow.x[this];                                                                              
                                                                                                    
 // 87.9: tmp23 = tmp24 + 1;                                                                        
                                                                                                    
 tmp23 := (tmp24+1);                                                                                
                                                                                                    
                                                                                                    
 // 87.9: this.x := tmp23;                                                                          
                                                                                                    
                                                                                                    
 moverPath2684394 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp23: int,Cow._state,Cow.x,Cow._lock);     
 mover2684394 := m#moverPath(moverPath2684394);                                                     
 path2684394 := p#moverPath(moverPath2684394);                                                      
 assume Cow._state2684394 == Cow._state && Cow.x2684394 == Cow.x && Cow._lock2684394 == Cow._lock && tmp242684394 == tmp24 && tmp232684394 == tmp23 && this2684394 == this && tid2684394 == tid && $pc2684394 == $pc;
 assume $recorded.state2684394 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (87.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684394);                                                              
 assert $pc != PhaseError;                                                                                 // (87.9): Reduction failure
 Cow.x[this] := tmp23;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (88.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (88.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (88.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 82.23: // return;                                                                               
                                                                                                    
 assume Cow._state2684399 == Cow._state && Cow.x2684399 == Cow.x && Cow._lock2684399 == Cow._lock && this2684399 == this && tid2684399 == tid;
 assume $recorded.state2684399 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  Cow.f5(tid:Tid, this : Cow)                                                              
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (94.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (94.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
                                                                                                    
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
{                                                                                                   
 var Cow._lock2684449: [Cow]Tid;                                                                    
 var $recorded.state2684439: int;                                                                   
 var tmp30: int;                                                                                    
 var Cow.x2684454_post: [Cow]int;                                                                   
 var Cow._state2684428_post: [Cow]State;                                                            
 var mover2684439: Mover;                                                                           
 var $pc2684413: Phase;                                                                             
 var tmp272684449: int;                                                                             
 var Cow._state2684480: [Cow]State;                                                                 
 var this2684423: Cow;                                                                              
 var moverPath2684475: MoverPath;                                                                   
 var Cow._lock2684454_post: [Cow]Tid;                                                               
 var tmp262684423: int;                                                                             
 var tmp252684413: int;                                                                             
 var Cow.x2684439: [Cow]int;                                                                        
 var tid2684439: Tid;                                                                               
 var Cow._lock2684413: [Cow]Tid;                                                                    
 var $recorded.state2684454: int;                                                                   
 var Cow._state2684449: [Cow]State;                                                                 
 var tmp292684475: int;                                                                             
 var mover2684423: Mover;                                                                           
 var $recorded.state2684475: int;                                                                   
 var Cow._lock2684475: [Cow]Tid;                                                                    
 var $pc2684449: Phase;                                                                             
 var tmp282684439: int;                                                                             
 var tid2684480: Tid;                                                                               
 var $pc2684475: Phase;                                                                             
 var $recorded.state2684454_post: int;                                                              
 var Cow._lock2684423: [Cow]Tid;                                                                    
 var this2684428: Cow;                                                                              
 var this2684413: Cow;                                                                              
 var Cow.x2684475: [Cow]int;                                                                        
 var Cow.x2684480: [Cow]int;                                                                        
 var Cow.x2684465: [Cow]int;                                                                        
 var tid2684428_post: Tid;                                                                          
 var tid2684423: Tid;                                                                               
 var Cow._lock2684480: [Cow]Tid;                                                                    
 var Cow.x2684449: [Cow]int;                                                                        
 var this2684454: Cow;                                                                              
 var tmp292684465: int;                                                                             
 var moverPath2684423: MoverPath;                                                                   
 var tmp302684475: int;                                                                             
 var Cow._lock2684465: [Cow]Tid;                                                                    
 var Cow._lock2684454: [Cow]Tid;                                                                    
 var $pc2684454: Phase;                                                                             
 var Cow._lock2684439: [Cow]Tid;                                                                    
 var tmp302684465: int;                                                                             
 var path2684449: int;                                                                              
 var tmp28: int;                                                                                    
 var Cow._lock2684428_post: [Cow]Tid;                                                               
 var Cow.x2684454: [Cow]int;                                                                        
 var tid2684475: Tid;                                                                               
 var $pc2684428_post: Phase;                                                                        
 var $pc2684428: Phase;                                                                             
 var moverPath2684449: MoverPath;                                                                   
 var Cow._state2684423: [Cow]State;                                                                 
 var tmp27: int;                                                                                    
 var path2684439: int;                                                                              
 var $pc2684423: Phase;                                                                             
 var this2684465: Cow;                                                                              
 var tid2684454_post: Tid;                                                                          
 var $recorded.state2684480: int;                                                                   
 var mover2684449: Mover;                                                                           
 var Cow._state2684454: [Cow]State;                                                                 
 var moverPath2684465: MoverPath;                                                                   
 var Cow._state2684428: [Cow]State;                                                                 
 var tid2684465: Tid;                                                                               
 var Cow._state2684465: [Cow]State;                                                                 
 var mover2684475: Mover;                                                                           
 var $recorded.state2684449: int;                                                                   
 var Cow._state2684439: [Cow]State;                                                                 
 var $recorded.state2684428: int;                                                                   
 var tmp272684439: int;                                                                             
 var $pc2684439: Phase;                                                                             
 var moverPath2684413: MoverPath;                                                                   
 var tmp26: int;                                                                                    
 var tid2684428: Tid;                                                                               
 var path2684465: int;                                                                              
 var Cow._lock2684428: [Cow]Tid;                                                                    
 var tid2684413: Tid;                                                                               
 var tmp252684423: int;                                                                             
 var path2684475: int;                                                                              
 var $recorded.state2684413: int;                                                                   
 var moverPath2684439: MoverPath;                                                                   
 var $pc2684454_post: Phase;                                                                        
 var tid2684454: Tid;                                                                               
 var Cow.x2684413: [Cow]int;                                                                        
 var Cow._state2684454_post: [Cow]State;                                                            
 var tmp262684413: int;                                                                             
 var path2684413: int;                                                                              
 var Cow.x2684428: [Cow]int;                                                                        
 var this2684480: Cow;                                                                              
 var Cow.x2684428_post: [Cow]int;                                                                   
 var $recorded.state2684428_post: int;                                                              
 var mover2684413: Mover;                                                                           
 var this2684475: Cow;                                                                              
 var $pc2684480: Phase;                                                                             
 var this2684449: Cow;                                                                              
 var Cow.x2684423: [Cow]int;                                                                        
 var tid2684449: Tid;                                                                               
 var tmp25: int;                                                                                    
 var this2684454_post: Cow;                                                                         
 var this2684428_post: Cow;                                                                         
 var path2684423: int;                                                                              
 var $pc2684465: Phase;                                                                             
 var tmp282684449: int;                                                                             
 var this2684439: Cow;                                                                              
 var Cow._state2684413: [Cow]State;                                                                 
 var tmp29: int;                                                                                    
 var $recorded.state2684423: int;                                                                   
 var Cow._state2684475: [Cow]State;                                                                 
 var mover2684465: Mover;                                                                           
 var $recorded.state2684465: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (99.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (99.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 100.9: int tmp25;                                                                               
                                                                                                    
                                                                                                    
 // 100.9: int tmp26;                                                                               
                                                                                                    
                                                                                                    
 // 100.9: tmp26 := this.x;                                                                         
                                                                                                    
                                                                                                    
 moverPath2684413 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684413 := m#moverPath(moverPath2684413);                                                     
 path2684413 := p#moverPath(moverPath2684413);                                                      
 assume Cow._state2684413 == Cow._state && Cow.x2684413 == Cow.x && Cow._lock2684413 == Cow._lock && tmp262684413 == tmp26 && tmp252684413 == tmp25 && this2684413 == this && tid2684413 == tid && $pc2684413 == $pc;
 assume $recorded.state2684413 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (100.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684413);                                                              
 assert $pc != PhaseError;                                                                                 // (100.9): Reduction failure
 tmp26 := Cow.x[this];                                                                              
                                                                                                    
 // 100.9: tmp25 = tmp26 + 1;                                                                       
                                                                                                    
 tmp25 := (tmp26+1);                                                                                
                                                                                                    
                                                                                                    
 // 100.9: this.x := tmp25;                                                                         
                                                                                                    
                                                                                                    
 moverPath2684423 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp25: int,Cow._state,Cow.x,Cow._lock);     
 mover2684423 := m#moverPath(moverPath2684423);                                                     
 path2684423 := p#moverPath(moverPath2684423);                                                      
 assume Cow._state2684423 == Cow._state && Cow.x2684423 == Cow.x && Cow._lock2684423 == Cow._lock && tmp262684423 == tmp26 && tmp252684423 == tmp25 && this2684423 == this && tid2684423 == tid && $pc2684423 == $pc;
 assume $recorded.state2684423 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (100.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684423);                                                              
 assert $pc != PhaseError;                                                                                 // (100.9): Reduction failure
 Cow.x[this] := tmp25;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (101.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (101.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (101.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 102.7: yield;                                                                                   
                                                                                                    
 assume Cow._state2684428 == Cow._state && Cow.x2684428 == Cow.x && Cow._lock2684428 == Cow._lock && this2684428 == this && tid2684428 == tid;
 assume $recorded.state2684428 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684428_post == Cow._state && Cow.x2684428_post == Cow.x && Cow._lock2684428_post == Cow._lock && this2684428_post == this && tid2684428_post == tid;
 assume $recorded.state2684428_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (103.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (103.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 104.9: int tmp27;                                                                               
                                                                                                    
                                                                                                    
 // 104.9: int tmp28;                                                                               
                                                                                                    
                                                                                                    
 // 104.9: tmp28 := this.x;                                                                         
                                                                                                    
                                                                                                    
 moverPath2684439 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684439 := m#moverPath(moverPath2684439);                                                     
 path2684439 := p#moverPath(moverPath2684439);                                                      
 assume Cow._state2684439 == Cow._state && Cow.x2684439 == Cow.x && Cow._lock2684439 == Cow._lock && tmp282684439 == tmp28 && tmp272684439 == tmp27 && this2684439 == this && tid2684439 == tid && $pc2684439 == $pc;
 assume $recorded.state2684439 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (104.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684439);                                                              
 assert $pc != PhaseError;                                                                                 // (104.9): Reduction failure
 tmp28 := Cow.x[this];                                                                              
                                                                                                    
 // 104.9: tmp27 = tmp28 + 1;                                                                       
                                                                                                    
 tmp27 := (tmp28+1);                                                                                
                                                                                                    
                                                                                                    
 // 104.9: this.x := tmp27;                                                                         
                                                                                                    
                                                                                                    
 moverPath2684449 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp27: int,Cow._state,Cow.x,Cow._lock);     
 mover2684449 := m#moverPath(moverPath2684449);                                                     
 path2684449 := p#moverPath(moverPath2684449);                                                      
 assume Cow._state2684449 == Cow._state && Cow.x2684449 == Cow.x && Cow._lock2684449 == Cow._lock && tmp282684449 == tmp28 && tmp272684449 == tmp27 && this2684449 == this && tid2684449 == tid && $pc2684449 == $pc;
 assume $recorded.state2684449 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (104.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684449);                                                              
 assert $pc != PhaseError;                                                                                 // (104.9): Reduction failure
 Cow.x[this] := tmp27;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (105.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (105.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (105.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 106.7: yield;                                                                                   
                                                                                                    
 assume Cow._state2684454 == Cow._state && Cow.x2684454 == Cow.x && Cow._lock2684454 == Cow._lock && this2684454 == this && tid2684454 == tid;
 assume $recorded.state2684454 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Cow._state2684454_post == Cow._state && Cow.x2684454_post == Cow.x && Cow._lock2684454_post == Cow._lock && this2684454_post == this && tid2684454_post == tid;
 assume $recorded.state2684454_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (107.20): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume Cow._lock[this] == Tid.null;                                                                
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (107.20): Reduction failure
 Cow._lock[this] := tid;                                                                            
                                                                                                    
 // 108.9: int tmp29;                                                                               
                                                                                                    
                                                                                                    
 // 108.9: int tmp30;                                                                               
                                                                                                    
                                                                                                    
 // 108.9: tmp30 := this.x;                                                                         
                                                                                                    
                                                                                                    
 moverPath2684465 := ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock);                 
 mover2684465 := m#moverPath(moverPath2684465);                                                     
 path2684465 := p#moverPath(moverPath2684465);                                                      
 assume Cow._state2684465 == Cow._state && Cow.x2684465 == Cow.x && Cow._lock2684465 == Cow._lock && tmp302684465 == tmp30 && tmp292684465 == tmp29 && this2684465 == this && tid2684465 == tid && $pc2684465 == $pc;
 assume $recorded.state2684465 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (108.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2684465);                                                              
 assert $pc != PhaseError;                                                                                 // (108.9): Reduction failure
 tmp30 := Cow.x[this];                                                                              
                                                                                                    
 // 108.9: tmp29 = tmp30 + 1;                                                                       
                                                                                                    
 tmp29 := (tmp30+1);                                                                                
                                                                                                    
                                                                                                    
 // 108.9: this.x := tmp29;                                                                         
                                                                                                    
                                                                                                    
 moverPath2684475 := WriteEval.Cow.x(tid: Tid,this: Cow,tmp29: int,Cow._state,Cow.x,Cow._lock);     
 mover2684475 := m#moverPath(moverPath2684475);                                                     
 path2684475 := p#moverPath(moverPath2684475);                                                      
 assume Cow._state2684475 == Cow._state && Cow.x2684475 == Cow.x && Cow._lock2684475 == Cow._lock && tmp302684475 == tmp30 && tmp292684475 == tmp29 && this2684475 == this && tid2684475 == tid && $pc2684475 == $pc;
 assume $recorded.state2684475 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (108.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2684475);                                                              
 assert $pc != PhaseError;                                                                                 // (108.9): Reduction failure
 Cow.x[this] := tmp29;                                                                              
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (109.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert Cow._lock[this] == tid;                                                                            // (109.7): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (109.7): Reduction failure
 Cow._lock[this] := Tid.null;                                                                       
                                                                                                    
 // 98.22: // return;                                                                               
                                                                                                    
 assume Cow._state2684480 == Cow._state && Cow.x2684480 == Cow.x && Cow._lock2684480 == Cow._lock && this2684480 == this && tid2684480 == tid;
 assume $recorded.state2684480 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.x: [Cow]int,Cow._lock: [Cow]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                 
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                  
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Cow.x[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.x(u: Tid,x: Cow,Cow._state,Cow.x,Cow._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Cow.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                      
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.x(t: Tid, u: Tid, v: int, w: int, x: Cow)                       
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Cow.x[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.x[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,x: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Cow.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)      
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)     
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Cow;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.x_mid: [Cow]int;                                                                           
 var x_mid: Cow;                                                                                    
 var w_mid: int;                                                                                    
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.x[x];                                                                                  
 Cow.x[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.x_mid == Cow.x && Cow._lock_mid == Cow._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.x[x] := tmpV;                                                                                  
 Cow.x[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.x(u: Tid,y: Cow,w: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.x(t: Tid,x: Cow,Cow._state,Cow.x,Cow._lock);                          
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.x.Cow.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: Cow, y: Cow)    
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.x;                                                                                    
 modifies Cow.x;                                                                                    
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Cow.x_pre: [Cow]int;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow.x_post: [Cow]int;                                                                          
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.x(t: Tid,x: Cow,v: int,Cow._state,Cow.x,Cow._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.x[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.x_post == Cow.x && Cow._lock_post == Cow._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.x(u: Tid,y: Cow,Cow._state,Cow.x,Cow._lock);                          
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                              
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.x;                                                                                     
modifies Cow._lock;                                                                                 
ensures StateInvariant(Cow._state, Cow.x, Cow._lock);                                               
ensures Y(tid , old(Cow._state), old(Cow.x), old(Cow._lock) , Cow._state, Cow.x, Cow._lock);        
                                                                                                    
// Cow.x:                                                                                           
                                                                                                    
function {:inline} Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.x(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock)), _R)) ==> (Cow.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.x(tid : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.x(u: Tid,this: Cow,newValue: int,Cow._state,Cow.x,Cow._lock)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.x, Cow._lock);                                
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.x(tid, this, Cow.x[this] , Cow._state, Cow.x, Cow._lock);                             
}                                                                                                   
                                                                                                    
procedure Y_Cow.x.Transitive(tid : Tid, this: Cow, newValue : int , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow._lock_p);                                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow._lock , Cow._state_p, Cow.x_p, Cow._lock_p);                 
 assume Y_Cow.x(tid, this, newValue , Cow._state_p, Cow.x_p, Cow._lock_p);                          
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.x(tid, this, newValue , Cow._state, Cow.x, Cow._lock);                                
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.x,Cow._lock)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.x,Cow._lock)), _N);    
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.x, Cow._lock);                            
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Cow.x_yield: [Cow]int;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.x_yield == Cow.x && Cow._lock_yield == Cow._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.x, Cow._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid)
 requires StateInvariant(Cow._state, Cow.x, Cow._lock);                                             
 requires StateInvariant(Cow._state_p, Cow.x_p, Cow._lock_p);                                       
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow.x_pre: [Cow]int;                                                                            
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow.x_post: [Cow]int;                                                                           
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.x_pre == Cow.x && Cow._lock_pre == Cow._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.x, Cow._lock , Cow._state_p, Cow.x_p, Cow._lock_p);                 
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.x_p, Cow._lock_p);                      
assume Cow._state_post == Cow._state_p && Cow.x_post == Cow.x_p && Cow._lock_post == Cow._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.x, Cow._lock);                            
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.x: [Cow]int, Cow._lock: [Cow]Tid , Cow._state_p: [Cow]State, Cow.x_p: [Cow]int, Cow._lock_p: [Cow]Tid): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.x(tid : Tid, this, Cow.x_p[this] , Cow._state, Cow.x, Cow._lock))       
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.x, Cow._lock))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1472.1-1594.2: (Method:6.5)
// 1479.1-1479.24: (6.5): Bad tid
// 1480.1-1480.37: (6.5): this is not global
// 1527.1-1527.27: (8.20): Cannot have potential null deference in left-mover part.
// 1531.1-1531.27: (8.20): Reduction failure
// 1533.2-1535.2: (class anchor.sink.VarDeclStmt:9.9)
// 1536.2-1538.2: (class anchor.sink.VarDeclStmt:9.9)
// 1539.2-1556.22: (class anchor.sink.Read:9.9)
// 1551.1-1551.27: (9.9): Cannot have potential null deference in left-mover part.
// 1555.1-1555.27: (9.9): Reduction failure
// 1557.2-1560.19: (class anchor.sink.Assign:9.9)
// 1562.2-1578.22: (class anchor.sink.Write:9.9)
// 1574.1-1574.27: (9.9): Cannot have potential null deference in left-mover part.
// 1577.1-1577.27: (9.9): Reduction failure
// 1582.1-1582.27: (10.7): Cannot have potential null deference in left-mover part.
// 1584.1-1584.32: (10.7): lock not held
// 1586.1-1586.27: (10.7): Reduction failure
// 1588.2-1593.9: (class anchor.sink.Return:7.22)
// 1595.1-1717.2: (Method:13.5)
// 1602.1-1602.24: (13.5): Bad tid
// 1603.1-1603.37: (13.5): this is not global
// 1650.1-1650.27: (15.20): Cannot have potential null deference in left-mover part.
// 1654.1-1654.27: (15.20): Reduction failure
// 1656.2-1658.2: (class anchor.sink.VarDeclStmt:16.9)
// 1659.2-1661.2: (class anchor.sink.VarDeclStmt:16.9)
// 1662.2-1679.22: (class anchor.sink.Read:16.9)
// 1674.1-1674.27: (16.9): Cannot have potential null deference in left-mover part.
// 1678.1-1678.27: (16.9): Reduction failure
// 1680.2-1683.19: (class anchor.sink.Assign:16.9)
// 1685.2-1701.22: (class anchor.sink.Write:16.9)
// 1697.1-1697.27: (16.9): Cannot have potential null deference in left-mover part.
// 1700.1-1700.27: (16.9): Reduction failure
// 1705.1-1705.27: (17.7): Cannot have potential null deference in left-mover part.
// 1707.1-1707.32: (17.7): lock not held
// 1709.1-1709.27: (17.7): Reduction failure
// 1711.2-1716.9: (class anchor.sink.Return:14.25)
// 1718.1-1953.2: (Method:20.5)
// 1725.1-1725.24: (20.5): Bad tid
// 1726.1-1726.37: (20.5): this is not global
// 1813.1-1813.27: (24.20): Cannot have potential null deference in left-mover part.
// 1817.1-1817.27: (24.20): Reduction failure
// 1819.2-1821.2: (class anchor.sink.VarDeclStmt:25.9)
// 1822.2-1824.2: (class anchor.sink.VarDeclStmt:25.9)
// 1825.2-1842.22: (class anchor.sink.Read:25.9)
// 1837.1-1837.27: (25.9): Cannot have potential null deference in left-mover part.
// 1841.1-1841.27: (25.9): Reduction failure
// 1843.2-1846.19: (class anchor.sink.Assign:25.9)
// 1848.2-1864.22: (class anchor.sink.Write:25.9)
// 1860.1-1860.27: (25.9): Cannot have potential null deference in left-mover part.
// 1863.1-1863.27: (25.9): Reduction failure
// 1868.1-1868.27: (26.7): Cannot have potential null deference in left-mover part.
// 1870.1-1870.32: (26.7): lock not held
// 1872.1-1872.27: (26.7): Reduction failure
// 1874.2-1882.42: (class anchor.sink.Yield:27.7)
// 1886.1-1886.27: (28.20): Cannot have potential null deference in left-mover part.
// 1890.1-1890.27: (28.20): Reduction failure
// 1892.2-1894.2: (class anchor.sink.VarDeclStmt:29.9)
// 1895.2-1897.2: (class anchor.sink.VarDeclStmt:29.9)
// 1898.2-1915.22: (class anchor.sink.Read:29.9)
// 1910.1-1910.27: (29.9): Cannot have potential null deference in left-mover part.
// 1914.1-1914.27: (29.9): Reduction failure
// 1916.2-1919.19: (class anchor.sink.Assign:29.9)
// 1921.2-1937.22: (class anchor.sink.Write:29.9)
// 1933.1-1933.27: (29.9): Cannot have potential null deference in left-mover part.
// 1936.1-1936.27: (29.9): Reduction failure
// 1941.1-1941.27: (30.7): Cannot have potential null deference in left-mover part.
// 1943.1-1943.32: (30.7): lock not held
// 1945.1-1945.27: (30.7): Reduction failure
// 1947.2-1952.9: (class anchor.sink.Return:23.22)
// 1954.1-2189.2: (Method:33.5)
// 1961.1-1961.24: (33.5): Bad tid
// 1962.1-1962.37: (33.5): this is not global
// 2049.1-2049.27: (39.20): Cannot have potential null deference in left-mover part.
// 2053.1-2053.27: (39.20): Reduction failure
// 2055.2-2057.2: (class anchor.sink.VarDeclStmt:40.9)
// 2058.2-2060.2: (class anchor.sink.VarDeclStmt:40.9)
// 2061.2-2078.23: (class anchor.sink.Read:40.9)
// 2073.1-2073.27: (40.9): Cannot have potential null deference in left-mover part.
// 2077.1-2077.27: (40.9): Reduction failure
// 2079.2-2082.20: (class anchor.sink.Assign:40.9)
// 2084.2-2100.22: (class anchor.sink.Write:40.9)
// 2096.1-2096.27: (40.9): Cannot have potential null deference in left-mover part.
// 2099.1-2099.27: (40.9): Reduction failure
// 2104.1-2104.27: (41.7): Cannot have potential null deference in left-mover part.
// 2106.1-2106.32: (41.7): lock not held
// 2108.1-2108.27: (41.7): Reduction failure
// 2110.2-2118.42: (class anchor.sink.Yield:42.7)
// 2122.1-2122.27: (43.20): Cannot have potential null deference in left-mover part.
// 2126.1-2126.27: (43.20): Reduction failure
// 2128.2-2130.2: (class anchor.sink.VarDeclStmt:44.9)
// 2131.2-2133.2: (class anchor.sink.VarDeclStmt:44.9)
// 2134.2-2151.23: (class anchor.sink.Read:44.9)
// 2146.1-2146.27: (44.9): Cannot have potential null deference in left-mover part.
// 2150.1-2150.27: (44.9): Reduction failure
// 2152.2-2155.21: (class anchor.sink.Assign:44.9)
// 2157.2-2173.23: (class anchor.sink.Write:44.9)
// 2169.1-2169.27: (44.9): Cannot have potential null deference in left-mover part.
// 2172.1-2172.27: (44.9): Reduction failure
// 2177.1-2177.27: (45.7): Cannot have potential null deference in left-mover part.
// 2179.1-2179.32: (45.7): lock not held
// 2181.1-2181.27: (45.7): Reduction failure
// 2183.2-2188.9: (class anchor.sink.Return:38.22)
// 2190.1-2538.2: (Method:48.5)
// 2197.1-2197.24: (48.5): Bad tid
// 2198.1-2198.37: (48.5): this is not global
// 2325.1-2325.27: (54.20): Cannot have potential null deference in left-mover part.
// 2329.1-2329.27: (54.20): Reduction failure
// 2331.2-2333.2: (class anchor.sink.VarDeclStmt:55.9)
// 2334.2-2336.2: (class anchor.sink.VarDeclStmt:55.9)
// 2337.2-2354.23: (class anchor.sink.Read:55.9)
// 2349.1-2349.27: (55.9): Cannot have potential null deference in left-mover part.
// 2353.1-2353.27: (55.9): Reduction failure
// 2355.2-2358.21: (class anchor.sink.Assign:55.9)
// 2360.2-2376.23: (class anchor.sink.Write:55.9)
// 2372.1-2372.27: (55.9): Cannot have potential null deference in left-mover part.
// 2375.1-2375.27: (55.9): Reduction failure
// 2380.1-2380.27: (56.7): Cannot have potential null deference in left-mover part.
// 2382.1-2382.32: (56.7): lock not held
// 2384.1-2384.27: (56.7): Reduction failure
// 2386.2-2394.42: (class anchor.sink.Yield:57.7)
// 2398.1-2398.27: (58.20): Cannot have potential null deference in left-mover part.
// 2402.1-2402.27: (58.20): Reduction failure
// 2404.2-2406.2: (class anchor.sink.VarDeclStmt:59.9)
// 2407.2-2409.2: (class anchor.sink.VarDeclStmt:59.9)
// 2410.2-2427.23: (class anchor.sink.Read:59.9)
// 2422.1-2422.27: (59.9): Cannot have potential null deference in left-mover part.
// 2426.1-2426.27: (59.9): Reduction failure
// 2428.2-2431.21: (class anchor.sink.Assign:59.9)
// 2433.2-2449.23: (class anchor.sink.Write:59.9)
// 2445.1-2445.27: (59.9): Cannot have potential null deference in left-mover part.
// 2448.1-2448.27: (59.9): Reduction failure
// 2453.1-2453.27: (60.7): Cannot have potential null deference in left-mover part.
// 2455.1-2455.32: (60.7): lock not held
// 2457.1-2457.27: (60.7): Reduction failure
// 2459.2-2467.42: (class anchor.sink.Yield:61.7)
// 2471.1-2471.27: (62.20): Cannot have potential null deference in left-mover part.
// 2475.1-2475.27: (62.20): Reduction failure
// 2477.2-2479.2: (class anchor.sink.VarDeclStmt:63.9)
// 2480.2-2482.2: (class anchor.sink.VarDeclStmt:63.9)
// 2483.2-2500.23: (class anchor.sink.Read:63.9)
// 2495.1-2495.27: (63.9): Cannot have potential null deference in left-mover part.
// 2499.1-2499.27: (63.9): Reduction failure
// 2501.2-2504.21: (class anchor.sink.Assign:63.9)
// 2506.2-2522.23: (class anchor.sink.Write:63.9)
// 2518.1-2518.27: (63.9): Cannot have potential null deference in left-mover part.
// 2521.1-2521.27: (63.9): Reduction failure
// 2526.1-2526.27: (64.7): Cannot have potential null deference in left-mover part.
// 2528.1-2528.32: (64.7): lock not held
// 2530.1-2530.27: (64.7): Reduction failure
// 2532.2-2537.9: (class anchor.sink.Return:53.22)
// 2539.1-2792.2: (Method:67.5)
// 2546.1-2546.24: (67.5): Bad tid
// 2547.1-2547.37: (67.5): this is not global
// 2634.1-2634.27: (69.20): Cannot have potential null deference in left-mover part.
// 2638.1-2638.27: (69.20): Reduction failure
// 2643.1-2643.27: (70.7): Cannot have potential null deference in left-mover part.
// 2645.1-2645.32: (70.7): lock not held
// 2647.1-2647.27: (70.7): Reduction failure
// 2649.2-2657.42: (class anchor.sink.Yield:71.7)
// 2661.1-2661.27: (72.20): Cannot have potential null deference in left-mover part.
// 2665.1-2665.27: (72.20): Reduction failure
// 2667.2-2669.2: (class anchor.sink.VarDeclStmt:73.9)
// 2670.2-2672.2: (class anchor.sink.VarDeclStmt:73.9)
// 2673.2-2690.23: (class anchor.sink.Read:73.9)
// 2685.1-2685.27: (73.9): Cannot have potential null deference in left-mover part.
// 2689.1-2689.27: (73.9): Reduction failure
// 2691.2-2694.21: (class anchor.sink.Assign:73.9)
// 2696.2-2712.23: (class anchor.sink.Write:73.9)
// 2708.1-2708.27: (73.9): Cannot have potential null deference in left-mover part.
// 2711.1-2711.27: (73.9): Reduction failure
// 2716.1-2716.27: (74.7): Cannot have potential null deference in left-mover part.
// 2718.1-2718.32: (74.7): lock not held
// 2720.1-2720.27: (74.7): Reduction failure
// 2725.1-2725.27: (75.20): Cannot have potential null deference in left-mover part.
// 2729.1-2729.27: (75.20): Reduction failure
// 2731.2-2733.2: (class anchor.sink.VarDeclStmt:76.9)
// 2734.2-2736.2: (class anchor.sink.VarDeclStmt:76.9)
// 2737.2-2754.23: (class anchor.sink.Read:76.9)
// 2749.1-2749.27: (76.9): Cannot have potential null deference in left-mover part.
// 2753.1-2753.27: (76.9): Reduction failure
// 2755.2-2758.21: (class anchor.sink.Assign:76.9)
// 2760.2-2776.23: (class anchor.sink.Write:76.9)
// 2772.1-2772.27: (76.9): Cannot have potential null deference in left-mover part.
// 2775.1-2775.27: (76.9): Reduction failure
// 2780.1-2780.27: (77.7): Cannot have potential null deference in left-mover part.
// 2782.1-2782.32: (77.7): lock not held
// 2784.1-2784.27: (77.7): Reduction failure
// 2786.2-2791.9: (class anchor.sink.Return:68.27)
// 2793.1-2956.2: (Method:81.5)
// 2800.1-2800.24: (81.5): Bad tid
// 2801.1-2801.37: (81.5): this is not global
// 2862.1-2862.27: (83.20): Cannot have potential null deference in left-mover part.
// 2866.1-2866.27: (83.20): Reduction failure
// 2871.1-2871.27: (84.7): Cannot have potential null deference in left-mover part.
// 2873.1-2873.32: (84.7): lock not held
// 2875.1-2875.27: (84.7): Reduction failure
// 2877.2-2885.42: (class anchor.sink.Yield:85.7)
// 2889.1-2889.27: (86.20): Cannot have potential null deference in left-mover part.
// 2893.1-2893.27: (86.20): Reduction failure
// 2895.2-2897.2: (class anchor.sink.VarDeclStmt:87.9)
// 2898.2-2900.2: (class anchor.sink.VarDeclStmt:87.9)
// 2901.2-2918.23: (class anchor.sink.Read:87.9)
// 2913.1-2913.27: (87.9): Cannot have potential null deference in left-mover part.
// 2917.1-2917.27: (87.9): Reduction failure
// 2919.2-2922.21: (class anchor.sink.Assign:87.9)
// 2924.2-2940.23: (class anchor.sink.Write:87.9)
// 2936.1-2936.27: (87.9): Cannot have potential null deference in left-mover part.
// 2939.1-2939.27: (87.9): Reduction failure
// 2944.1-2944.27: (88.7): Cannot have potential null deference in left-mover part.
// 2946.1-2946.32: (88.7): lock not held
// 2948.1-2948.27: (88.7): Reduction failure
// 2950.2-2955.9: (class anchor.sink.Return:82.23)
// 2957.1-3305.2: (Method:94.5)
// 2964.1-2964.24: (94.5): Bad tid
// 2965.1-2965.37: (94.5): this is not global
// 3092.1-3092.27: (99.20): Cannot have potential null deference in left-mover part.
// 3096.1-3096.27: (99.20): Reduction failure
// 3098.2-3100.2: (class anchor.sink.VarDeclStmt:100.9)
// 3101.2-3103.2: (class anchor.sink.VarDeclStmt:100.9)
// 3104.2-3121.23: (class anchor.sink.Read:100.9)
// 3116.1-3116.27: (100.9): Cannot have potential null deference in left-mover part.
// 3120.1-3120.27: (100.9): Reduction failure
// 3122.2-3125.21: (class anchor.sink.Assign:100.9)
// 3127.2-3143.23: (class anchor.sink.Write:100.9)
// 3139.1-3139.27: (100.9): Cannot have potential null deference in left-mover part.
// 3142.1-3142.27: (100.9): Reduction failure
// 3147.1-3147.27: (101.7): Cannot have potential null deference in left-mover part.
// 3149.1-3149.32: (101.7): lock not held
// 3151.1-3151.27: (101.7): Reduction failure
// 3153.2-3161.42: (class anchor.sink.Yield:102.7)
// 3165.1-3165.27: (103.20): Cannot have potential null deference in left-mover part.
// 3169.1-3169.27: (103.20): Reduction failure
// 3171.2-3173.2: (class anchor.sink.VarDeclStmt:104.9)
// 3174.2-3176.2: (class anchor.sink.VarDeclStmt:104.9)
// 3177.2-3194.23: (class anchor.sink.Read:104.9)
// 3189.1-3189.27: (104.9): Cannot have potential null deference in left-mover part.
// 3193.1-3193.27: (104.9): Reduction failure
// 3195.2-3198.21: (class anchor.sink.Assign:104.9)
// 3200.2-3216.23: (class anchor.sink.Write:104.9)
// 3212.1-3212.27: (104.9): Cannot have potential null deference in left-mover part.
// 3215.1-3215.27: (104.9): Reduction failure
// 3220.1-3220.27: (105.7): Cannot have potential null deference in left-mover part.
// 3222.1-3222.32: (105.7): lock not held
// 3224.1-3224.27: (105.7): Reduction failure
// 3226.2-3234.42: (class anchor.sink.Yield:106.7)
// 3238.1-3238.27: (107.20): Cannot have potential null deference in left-mover part.
// 3242.1-3242.27: (107.20): Reduction failure
// 3244.2-3246.2: (class anchor.sink.VarDeclStmt:108.9)
// 3247.2-3249.2: (class anchor.sink.VarDeclStmt:108.9)
// 3250.2-3267.23: (class anchor.sink.Read:108.9)
// 3262.1-3262.27: (108.9): Cannot have potential null deference in left-mover part.
// 3266.1-3266.27: (108.9): Reduction failure
// 3268.2-3271.21: (class anchor.sink.Assign:108.9)
// 3273.2-3289.23: (class anchor.sink.Write:108.9)
// 3285.1-3285.27: (108.9): Cannot have potential null deference in left-mover part.
// 3288.1-3288.27: (108.9): Reduction failure
// 3293.1-3293.27: (109.7): Cannot have potential null deference in left-mover part.
// 3295.1-3295.32: (109.7): lock not held
// 3297.1-3297.27: (109.7): Reduction failure
// 3299.2-3304.9: (class anchor.sink.Return:98.22)
// 3379.1-3379.34: (4.5): Cow.x failed Write-Write Right-Mover Check
// 3436.1-3436.30: (4.5): Cow.x failed Write-Read Right-Mover Check
// 3497.1-3497.34: (4.5): Cow.x failed Write-Write Left-Mover Check
// 3555.1-3555.30: (4.5): Cow.x failed Write-Read Left-Mover Check
// 3610.1-3610.34: (4.5): Cow.x failed Read-Write Right-Mover Check
// 3668.1-3668.34: (4.5): Cow.x failed Read-Write Left-Mover Check
// 3737.1-3737.140: (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.1)
// 3738.1-3738.101: (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.2)
// 3739.1-3739.158: (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case A.3)
// 3832.1-3832.140: (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case C)
// 3930.1-3930.144: (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case D)
// 3931.1-3931.144: (4.5): Cow.x is not Write-Write Stable with respect to Cow.x (case R)
// 4000.1-4000.136: (4.5): Cow.x is not Read-Write Stable with respect to Cow.x (case F)
// 4001.1-4001.136: (4.5): Cow.x is not Read-Write Stable with respect to Cow.x (case H)
// 4002.1-4002.146: (4.5): Cow.x is not Read-Write Stable with respect to Cow.x (case I)
// 4070.1-4070.136: (4.5): Cow.x is not Write-Read Stable with respect to Cow.x (case J)
// 4071.1-4071.136: (4.5): Cow.x is not Write-Read Stable with respect to Cow.x (case K)
// 4072.1-4072.99: (4.5): Cow.x is not Write-Read Stable with respect to Cow.x (case L)
// 4103.1-4122.2: (4.5): yields_as clause for Cow.x is not valid
// 4127.1-4141.2: (4.5): yields_as clause for Cow.x is not reflexive
// 4147.1-4175.2: (4.5): yields_as clause for Cow.x is not transitive
// 4195.1-4214.2: (7.32): yields_as clause for Cow._lock is not valid
// 4219.1-4233.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 4239.1-4267.2: (7.32): yields_as clause for Cow._lock is not transitive
