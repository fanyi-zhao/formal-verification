                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/monotone.sink:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       int a !this.b                                                                                
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == 0 ? B : E                                                     
         : holds(this, tid) && tid == 0 ? B : E                                                     
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void notSharedYet() {                                                                  
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          synchronized (this) {                                                                     
            this.a := 3;                                                                            
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedWrite() {                                                                   
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          synchronized (this) {                                                                     
            this.a := 3;                                                                            
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void sharedReadByTid0() {                                                              
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void BadSharedReadByTidNot0() {                                                        
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void okSharedReadByTidNot0() {                                                         
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          synchronized (this) {                                                                     
            int x;                                                                                  
            x := this.a;                                                                            
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        synchronized (this) {                                                                       
          boolean temp;                                                                             
          temp := this.b;                                                                           
          if (!temp) {                                                                              
            this.b := false;                                                                        
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          yield;                                                                                    
          this.b := true;                                                                           
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          boolean temp;                                                                             
          temp := this.b;                                                                           
          if (!temp) {                                                                              
            this.b := false;                                                                        
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        synchronized (this) {                                                                       
          boolean temp;                                                                             
          temp := this.b;                                                                           
          if (!temp) {                                                                              
            this.b := false;                                                                        
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        synchronized (this) {                                                                       
          boolean temp;                                                                             
          temp := this.b;                                                                           
          if (!temp) {                                                                              
            this.b := false;                                                                        
          } else {                                                                                  
                                                                                                    
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       int a !this.b                                                                                
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == 0 ? B : E                                                     
         : holds(this, tid) && tid == 0 ? B : E                                                     
                                                                                                    
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
      public void notSharedYet() {                                                                  
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              this.a := 3;                                                                          
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
      public void sharedWrite() {                                                                   
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              this.a := 3;                                                                          
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
      public void sharedReadByTid0() {                                                              
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void BadSharedReadByTidNot0() {                                                        
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void okSharedReadByTidNot0() {                                                         
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              int x;                                                                                
              x := this.a;                                                                          
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
      public void f() {                                                                             
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
            this.b := true;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       int a !this.b                                                                                
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == 0 ? B : E                                                     
         : holds(this, tid) && tid == 0 ? B : E                                                     
                                                                                                    
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
      public void notSharedYet() {                                                                  
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              this.a := 3;                                                                          
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
      public void sharedWrite() {                                                                   
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              this.a := 3;                                                                          
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
      public void sharedReadByTid0() {                                                              
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void BadSharedReadByTidNot0() {                                                        
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void okSharedReadByTidNot0() {                                                         
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              int x;                                                                                
              x := this.a;                                                                          
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
      public void f() {                                                                             
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
            this.b := true;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class SX {                                                                                      
       boolean b !this.b                                                                            
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
       int a !this.b                                                                                
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid) || tid == 0 ? B : E                                                     
         : holds(this, tid) && tid == 0 ? B : E                                                     
                                                                                                    
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
      public void notSharedYet() {                                                                  
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (!temp) {                                                                                
          yield;                                                                                    
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              this.a := 3;                                                                          
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
      public void sharedWrite() {                                                                   
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              this.a := 3;                                                                          
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
      public void sharedReadByTid0() {                                                              
        assume tid == 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void BadSharedReadByTidNot0() {                                                        
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          int x;                                                                                    
          x := this.a;                                                                              
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void okSharedReadByTidNot0() {                                                         
        assume tid != 0;                                                                            
        boolean temp;                                                                               
        temp := this.b;                                                                             
        if (temp) {                                                                                 
          {                                                                                         
            acquire(this);                                                                          
            {                                                                                       
              int x;                                                                                
              x := this.a;                                                                          
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
      public void f() {                                                                             
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
            this.b := true;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f2() {                                                                            
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        yield;                                                                                      
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            boolean temp;                                                                           
            temp := this.b;                                                                         
            if (!temp) {                                                                            
              this.b := false;                                                                      
            } else {                                                                                
                                                                                                    
            }                                                                                       
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
                                                                                                    
                                                                                                    
/*** Class Decl SX ***/                                                                             
                                                                                                    
type SX;                                                                                            
const unique SX.null: SX;                                                                           
var SX._state: [SX]State;                                                                           
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var SX.b: [SX]bool;                                                                                 
                                                                                                    
function {:inline} ReadEval.SX.b(tid: Tid,this : SX,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.SX.b(tid: Tid,this : SX,newValue: bool,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (MoverPath) {
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
                                                                                                    
var SX.a: [SX]int;                                                                                  
                                                                                                    
function {:inline} ReadEval.SX.a(tid: Tid,this : SX,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)||(tid==0))) then              
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)&&(tid==0))) then              
    moverPath(_B, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.SX.a(tid: Tid,this : SX,newValue: int,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (!(SX.b[this])) then                                                                            
  if ((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)) then                           
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)||(tid==0))) then              
    moverPath(_B, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((isAccessible(SX._state[this], tid) && SX._lock[this] == tid)&&(tid==0))) then              
    moverPath(_B, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var SX._lock: [SX]Tid;                                                                              
                                                                                                    
function {:inline} ReadEval.SX._lock(tid: Tid,this : SX,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.SX._lock(tid: Tid,this : SX,newValue: Tid,SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (MoverPath) {
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
                                                                                                    
                                                                                                    
procedure  SX.notSharedYet(tid:Tid, this : SX)                                                      
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (12.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (12.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var tid2740774: Tid;                                                                               
 var SX._lock2740775: [SX]Tid;                                                                      
 var SX.b2740789: [SX]bool;                                                                         
 var $recorded.state2740774: int;                                                                   
 var $pc2740775: Phase;                                                                             
 var this2740789: SX;                                                                               
 var SX._state2740781: [SX]State;                                                                   
 var temp2740775: bool;                                                                             
 var mover2740774: Mover;                                                                           
 var temp2740774: bool;                                                                             
 var $recorded.state2740789: int;                                                                   
 var temp2740775_post: bool;                                                                        
 var SX.a2740789: [SX]int;                                                                          
 var $recorded.state2740775_post: int;                                                              
 var path2740774: int;                                                                              
 var SX.a2740775: [SX]int;                                                                          
 var this2740781: SX;                                                                               
 var SX.a2740775_post: [SX]int;                                                                     
 var SX._state2740775: [SX]State;                                                                   
 var $pc2740789: Phase;                                                                             
 var SX._lock2740775_post: [SX]Tid;                                                                 
 var SX._lock2740789: [SX]Tid;                                                                      
 var SX.b2740774: [SX]bool;                                                                         
 var SX.b2740775: [SX]bool;                                                                         
 var this2740774: SX;                                                                               
 var temp: bool;                                                                                    
 var $recorded.state2740781: int;                                                                   
 var tid2740775: Tid;                                                                               
 var SX._lock2740781: [SX]Tid;                                                                      
 var moverPath2740774: MoverPath;                                                                   
 var this2740775_post: SX;                                                                          
 var temp2740781: bool;                                                                             
 var SX._lock2740774: [SX]Tid;                                                                      
 var moverPath2740781: MoverPath;                                                                   
 var SX.b2740775_post: [SX]bool;                                                                    
 var SX._state2740774: [SX]State;                                                                   
 var mover2740781: Mover;                                                                           
 var $pc2740781: Phase;                                                                             
 var $recorded.state2740775: int;                                                                   
 var tid2740775_post: Tid;                                                                          
 var $pc2740774: Phase;                                                                             
 var SX.a2740774: [SX]int;                                                                          
 var path2740781: int;                                                                              
 var tid2740781: Tid;                                                                               
 var tid2740789: Tid;                                                                               
 var SX.b2740781: [SX]bool;                                                                         
 var SX._state2740789: [SX]State;                                                                   
 var temp2740789: bool;                                                                             
 var this2740775: SX;                                                                               
 var SX.a2740781: [SX]int;                                                                          
 var SX._state2740775_post: [SX]State;                                                              
 var $pc2740775_post: Phase;                                                                        
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 13.9: assume tid == 0;                                                                          
                                                                                                    
 assume (tid==0);                                                                                   
                                                                                                    
 // 14.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 14.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2740774 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740774 := m#moverPath(moverPath2740774);                                                     
 path2740774 := p#moverPath(moverPath2740774);                                                      
 assume SX._state2740774 == SX._state && SX.b2740774 == SX.b && SX.a2740774 == SX.a && SX._lock2740774 == SX._lock && temp2740774 == temp && this2740774 == this && tid2740774 == tid && $pc2740774 == $pc;
 assume $recorded.state2740774 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (14.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740774);                                                              
 assert $pc != PhaseError;                                                                                 // (14.9): Reduction failure
 temp := SX.b[this];                                                                                
 if (!(temp)) {                                                                                     
                                                                                                    
  // 16.13: yield;                                                                                  
                                                                                                    
  assume SX._state2740775 == SX._state && SX.b2740775 == SX.b && SX.a2740775 == SX.a && SX._lock2740775 == SX._lock && temp2740775 == temp && this2740775 == this && tid2740775 == tid;
  assume $recorded.state2740775 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume SX._state2740775_post == SX._state && SX.b2740775_post == SX.b && SX.a2740775_post == SX.a && SX._lock2740775_post == SX._lock && temp2740775_post == temp && this2740775_post == this && tid2740775_post == tid;
  assume $recorded.state2740775_post == 1;                                                          
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (17.26): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume SX._lock[this] == Tid.null;                                                                
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (17.26): Reduction failure
  SX._lock[this] := tid;                                                                            
                                                                                                    
                                                                                                    
  // 18.17: this.a := 3;                                                                            
                                                                                                    
                                                                                                    
  moverPath2740781 := WriteEval.SX.a(tid: Tid,this: SX,3: int,SX._state,SX.b,SX.a,SX._lock);        
  mover2740781 := m#moverPath(moverPath2740781);                                                    
  path2740781 := p#moverPath(moverPath2740781);                                                     
  assume SX._state2740781 == SX._state && SX.b2740781 == SX.b && SX.a2740781 == SX.a && SX._lock2740781 == SX._lock && temp2740781 == temp && this2740781 == this && tid2740781 == tid && $pc2740781 == $pc;
  assume $recorded.state2740781 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (18.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover2740781);                                                             
  assert $pc != PhaseError;                                                                                // (18.17): Reduction failure
  SX.a[this] := 3;                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (19.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (19.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (19.13): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 12.32: // return;                                                                               
                                                                                                    
 assume SX._state2740789 == SX._state && SX.b2740789 == SX.b && SX.a2740789 == SX.a && SX._lock2740789 == SX._lock && temp2740789 == temp && this2740789 == this && tid2740789 == tid;
 assume $recorded.state2740789 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.sharedWrite(tid:Tid, this : SX)                                                       
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (23.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (23.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var SX._lock2740804: [SX]Tid;                                                                      
 var SX._lock2740810: [SX]Tid;                                                                      
 var $pc2740804: Phase;                                                                             
 var temp2740804: bool;                                                                             
 var temp2740818: bool;                                                                             
 var SX._state2740818: [SX]State;                                                                   
 var moverPath2740810: MoverPath;                                                                   
 var $recorded.state2740818: int;                                                                   
 var moverPath2740804: MoverPath;                                                                   
 var SX.a2740804: [SX]int;                                                                          
 var SX.b2740818: [SX]bool;                                                                         
 var path2740804: int;                                                                              
 var this2740804: SX;                                                                               
 var tid2740810: Tid;                                                                               
 var temp: bool;                                                                                    
 var $pc2740810: Phase;                                                                             
 var SX.a2740818: [SX]int;                                                                          
 var SX.a2740810: [SX]int;                                                                          
 var mover2740810: Mover;                                                                           
 var SX.b2740810: [SX]bool;                                                                         
 var SX._lock2740818: [SX]Tid;                                                                      
 var $recorded.state2740804: int;                                                                   
 var SX.b2740804: [SX]bool;                                                                         
 var $pc2740818: Phase;                                                                             
 var tid2740818: Tid;                                                                               
 var this2740818: SX;                                                                               
 var temp2740810: bool;                                                                             
 var tid2740804: Tid;                                                                               
 var SX._state2740804: [SX]State;                                                                   
 var $recorded.state2740810: int;                                                                   
 var SX._state2740810: [SX]State;                                                                   
 var this2740810: SX;                                                                               
 var mover2740804: Mover;                                                                           
 var path2740810: int;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 24.9: assume tid == 0;                                                                          
                                                                                                    
 assume (tid==0);                                                                                   
                                                                                                    
 // 25.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 25.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2740804 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740804 := m#moverPath(moverPath2740804);                                                     
 path2740804 := p#moverPath(moverPath2740804);                                                      
 assume SX._state2740804 == SX._state && SX.b2740804 == SX.b && SX.a2740804 == SX.a && SX._lock2740804 == SX._lock && temp2740804 == temp && this2740804 == this && tid2740804 == tid && $pc2740804 == $pc;
 assume $recorded.state2740804 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (25.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740804);                                                              
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
                                                                                                    
                                                                                                    
  // 28.17: this.a := 3;                                                                            
                                                                                                    
                                                                                                    
  moverPath2740810 := WriteEval.SX.a(tid: Tid,this: SX,3: int,SX._state,SX.b,SX.a,SX._lock);        
  mover2740810 := m#moverPath(moverPath2740810);                                                    
  path2740810 := p#moverPath(moverPath2740810);                                                     
  assume SX._state2740810 == SX._state && SX.b2740810 == SX.b && SX.a2740810 == SX.a && SX._lock2740810 == SX._lock && temp2740810 == temp && this2740810 == this && tid2740810 == tid && $pc2740810 == $pc;
  assume $recorded.state2740810 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (28.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover2740810);                                                             
  assert $pc != PhaseError;                                                                                // (28.17): Reduction failure
  SX.a[this] := 3;                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (29.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (29.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (29.13): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 23.31: // return;                                                                               
                                                                                                    
 assume SX._state2740818 == SX._state && SX.b2740818 == SX.b && SX.a2740818 == SX.a && SX._lock2740818 == SX._lock && temp2740818 == temp && this2740818 == this && tid2740818 == tid;
 assume $recorded.state2740818 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.sharedReadByTid0(tid:Tid, this : SX)                                                  
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (33.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (33.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var tid2740843: Tid;                                                                               
 var path2740833: int;                                                                              
 var mover2740839: Mover;                                                                           
 var temp2740833: bool;                                                                             
 var x: int;                                                                                        
 var SX.a2740843: [SX]int;                                                                          
 var $recorded.state2740839: int;                                                                   
 var SX._lock2740843: [SX]Tid;                                                                      
 var $recorded.state2740833: int;                                                                   
 var this2740839: SX;                                                                               
 var $pc2740839: Phase;                                                                             
 var tid2740839: Tid;                                                                               
 var temp2740839: bool;                                                                             
 var mover2740833: Mover;                                                                           
 var $pc2740833: Phase;                                                                             
 var tid2740833: Tid;                                                                               
 var SX.a2740839: [SX]int;                                                                          
 var SX._state2740843: [SX]State;                                                                   
 var this2740833: SX;                                                                               
 var SX._state2740839: [SX]State;                                                                   
 var temp: bool;                                                                                    
 var SX.b2740833: [SX]bool;                                                                         
 var SX._lock2740833: [SX]Tid;                                                                      
 var SX._lock2740839: [SX]Tid;                                                                      
 var SX.b2740843: [SX]bool;                                                                         
 var SX.b2740839: [SX]bool;                                                                         
 var SX._state2740833: [SX]State;                                                                   
 var moverPath2740833: MoverPath;                                                                   
 var this2740843: SX;                                                                               
 var x2740839: int;                                                                                 
 var path2740839: int;                                                                              
 var $pc2740843: Phase;                                                                             
 var SX.a2740833: [SX]int;                                                                          
 var temp2740843: bool;                                                                             
 var moverPath2740839: MoverPath;                                                                   
 var $recorded.state2740843: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 34.9: assume tid == 0;                                                                          
                                                                                                    
 assume (tid==0);                                                                                   
                                                                                                    
 // 35.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 35.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2740833 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740833 := m#moverPath(moverPath2740833);                                                     
 path2740833 := p#moverPath(moverPath2740833);                                                      
 assume SX._state2740833 == SX._state && SX.b2740833 == SX.b && SX.a2740833 == SX.a && SX._lock2740833 == SX._lock && temp2740833 == temp && this2740833 == this && tid2740833 == tid && $pc2740833 == $pc;
 assume $recorded.state2740833 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (35.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740833);                                                              
 assert $pc != PhaseError;                                                                                 // (35.9): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
                                                                                                    
  // 37.13: int x;                                                                                  
                                                                                                    
                                                                                                    
  // 37.13: x := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2740839 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                
  mover2740839 := m#moverPath(moverPath2740839);                                                    
  path2740839 := p#moverPath(moverPath2740839);                                                     
  assume SX._state2740839 == SX._state && SX.b2740839 == SX.b && SX.a2740839 == SX.a && SX._lock2740839 == SX._lock && x2740839 == x && temp2740839 == temp && this2740839 == this && tid2740839 == tid && $pc2740839 == $pc;
  assume $recorded.state2740839 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (37.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2740839);                                                             
  assert $pc != PhaseError;                                                                                // (37.13): Reduction failure
  x := SX.a[this];                                                                                  
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 33.36: // return;                                                                               
                                                                                                    
 assume SX._state2740843 == SX._state && SX.b2740843 == SX.b && SX.a2740843 == SX.a && SX._lock2740843 == SX._lock && temp2740843 == temp && this2740843 == this && tid2740843 == tid;
 assume $recorded.state2740843 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.BadSharedReadByTidNot0(tid:Tid, this : SX)                                            
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (41.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (41.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var $recorded.state2740858: int;                                                                   
 var SX.a2740868: [SX]int;                                                                          
 var this2740864: SX;                                                                               
 var $pc2740858: Phase;                                                                             
 var path2740858: int;                                                                              
 var x: int;                                                                                        
 var SX.a2740864: [SX]int;                                                                          
 var temp2740868: bool;                                                                             
 var tid2740868: Tid;                                                                               
 var SX._lock2740864: [SX]Tid;                                                                      
 var $pc2740864: Phase;                                                                             
 var SX._state2740864: [SX]State;                                                                   
 var temp2740864: bool;                                                                             
 var moverPath2740858: MoverPath;                                                                   
 var mover2740858: Mover;                                                                           
 var this2740868: SX;                                                                               
 var mover2740864: Mover;                                                                           
 var temp: bool;                                                                                    
 var tid2740864: Tid;                                                                               
 var SX._state2740868: [SX]State;                                                                   
 var temp2740858: bool;                                                                             
 var SX.b2740858: [SX]bool;                                                                         
 var moverPath2740864: MoverPath;                                                                   
 var this2740858: SX;                                                                               
 var $pc2740868: Phase;                                                                             
 var SX.b2740864: [SX]bool;                                                                         
 var SX.b2740868: [SX]bool;                                                                         
 var SX._lock2740858: [SX]Tid;                                                                      
 var path2740864: int;                                                                              
 var SX.a2740858: [SX]int;                                                                          
 var $recorded.state2740868: int;                                                                   
 var $recorded.state2740864: int;                                                                   
 var SX._lock2740868: [SX]Tid;                                                                      
 var SX._state2740858: [SX]State;                                                                   
 var tid2740858: Tid;                                                                               
 var x2740864: int;                                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 42.9: assume tid != 0;                                                                          
                                                                                                    
 assume (tid!=0);                                                                                   
                                                                                                    
 // 43.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 43.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2740858 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740858 := m#moverPath(moverPath2740858);                                                     
 path2740858 := p#moverPath(moverPath2740858);                                                      
 assume SX._state2740858 == SX._state && SX.b2740858 == SX.b && SX.a2740858 == SX.a && SX._lock2740858 == SX._lock && temp2740858 == temp && this2740858 == this && tid2740858 == tid && $pc2740858 == $pc;
 assume $recorded.state2740858 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (43.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740858);                                                              
 assert $pc != PhaseError;                                                                                 // (43.9): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
                                                                                                    
  // 45.13: int x;                                                                                  
                                                                                                    
                                                                                                    
  // 45.13: x := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2740864 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                
  mover2740864 := m#moverPath(moverPath2740864);                                                    
  path2740864 := p#moverPath(moverPath2740864);                                                     
  assume SX._state2740864 == SX._state && SX.b2740864 == SX.b && SX.a2740864 == SX.a && SX._lock2740864 == SX._lock && x2740864 == x && temp2740864 == temp && this2740864 == this && tid2740864 == tid && $pc2740864 == $pc;
  assume $recorded.state2740864 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (45.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2740864);                                                             
  assert $pc != PhaseError;                                                                                // (45.13): Reduction failure
  x := SX.a[this];                                                                                  
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 41.42: // return;                                                                               
                                                                                                    
 assume SX._state2740868 == SX._state && SX.b2740868 == SX.b && SX.a2740868 == SX.a && SX._lock2740868 == SX._lock && temp2740868 == temp && this2740868 == this && tid2740868 == tid;
 assume $recorded.state2740868 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.okSharedReadByTidNot0(tid:Tid, this : SX)                                             
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (49.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (49.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var $recorded.state2740883: int;                                                                   
 var mover2740891: Mover;                                                                           
 var x2740891: int;                                                                                 
 var temp2740899: bool;                                                                             
 var tid2740883: Tid;                                                                               
 var x: int;                                                                                        
 var SX.a2740883: [SX]int;                                                                          
 var SX._state2740891: [SX]State;                                                                   
 var temp2740883: bool;                                                                             
 var SX.b2740899: [SX]bool;                                                                         
 var $recorded.state2740891: int;                                                                   
 var SX.b2740891: [SX]bool;                                                                         
 var this2740883: SX;                                                                               
 var tid2740891: Tid;                                                                               
 var mover2740883: Mover;                                                                           
 var SX._state2740899: [SX]State;                                                                   
 var $pc2740883: Phase;                                                                             
 var $pc2740899: Phase;                                                                             
 var tid2740899: Tid;                                                                               
 var $pc2740891: Phase;                                                                             
 var SX._lock2740883: [SX]Tid;                                                                      
 var moverPath2740883: MoverPath;                                                                   
 var path2740883: int;                                                                              
 var temp: bool;                                                                                    
 var SX.a2740899: [SX]int;                                                                          
 var temp2740891: bool;                                                                             
 var moverPath2740891: MoverPath;                                                                   
 var SX._lock2740891: [SX]Tid;                                                                      
 var SX._lock2740899: [SX]Tid;                                                                      
 var path2740891: int;                                                                              
 var SX.a2740891: [SX]int;                                                                          
 var $recorded.state2740899: int;                                                                   
 var SX.b2740883: [SX]bool;                                                                         
 var SX._state2740883: [SX]State;                                                                   
 var this2740899: SX;                                                                               
 var this2740891: SX;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 50.9: assume tid != 0;                                                                          
                                                                                                    
 assume (tid!=0);                                                                                   
                                                                                                    
 // 51.9: boolean temp;                                                                             
                                                                                                    
                                                                                                    
 // 51.9: temp := this.b;                                                                           
                                                                                                    
                                                                                                    
 moverPath2740883 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740883 := m#moverPath(moverPath2740883);                                                     
 path2740883 := p#moverPath(moverPath2740883);                                                      
 assume SX._state2740883 == SX._state && SX.b2740883 == SX.b && SX.a2740883 == SX.a && SX._lock2740883 == SX._lock && temp2740883 == temp && this2740883 == this && tid2740883 == tid && $pc2740883 == $pc;
 assume $recorded.state2740883 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (51.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740883);                                                              
 assert $pc != PhaseError;                                                                                 // (51.9): Reduction failure
 temp := SX.b[this];                                                                                
 if (temp) {                                                                                        
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (53.26): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume SX._lock[this] == Tid.null;                                                                
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (53.26): Reduction failure
  SX._lock[this] := tid;                                                                            
                                                                                                    
  // 54.17: int x;                                                                                  
                                                                                                    
                                                                                                    
  // 54.17: x := this.a;                                                                            
                                                                                                    
                                                                                                    
  moverPath2740891 := ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                
  mover2740891 := m#moverPath(moverPath2740891);                                                    
  path2740891 := p#moverPath(moverPath2740891);                                                     
  assume SX._state2740891 == SX._state && SX.b2740891 == SX.b && SX.a2740891 == SX.a && SX._lock2740891 == SX._lock && x2740891 == x && temp2740891 == temp && this2740891 == this && tid2740891 == tid && $pc2740891 == $pc;
  assume $recorded.state2740891 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (54.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover2740891);                                                             
  assert $pc != PhaseError;                                                                                // (54.17): Reduction failure
  x := SX.a[this];                                                                                  
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (55.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert SX._lock[this] == tid;                                                                            // (55.13): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (55.13): Reduction failure
  SX._lock[this] := Tid.null;                                                                       
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 49.41: // return;                                                                               
                                                                                                    
 assume SX._state2740899 == SX._state && SX.b2740899 == SX.b && SX.a2740899 == SX.a && SX._lock2740899 == SX._lock && temp2740899 == temp && this2740899 == this && tid2740899 == tid;
 assume $recorded.state2740899 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.f(tid:Tid, this : SX)                                                                 
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (59.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (59.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var moverPath2740910: MoverPath;                                                                   
 var SX._lock2740914: [SX]Tid;                                                                      
 var SX.a2740922: [SX]int;                                                                          
 var $pc2740914: Phase;                                                                             
 var $pc2740935: Phase;                                                                             
 var SX.b2740918: [SX]bool;                                                                         
 var $pc2740918_post: Phase;                                                                        
 var $recorded.state2740935: int;                                                                   
 var tid2740918_post: Tid;                                                                          
 var SX._state2740927: [SX]State;                                                                   
 var SX.b2740918_post: [SX]bool;                                                                    
 var moverPath2740914: MoverPath;                                                                   
 var $recorded.state2740910: int;                                                                   
 var this2740939: SX;                                                                               
 var $pc2740918: Phase;                                                                             
 var path2740939: int;                                                                              
 var temp2740918: bool;                                                                             
 var tid2740927: Tid;                                                                               
 var SX._state2740918: [SX]State;                                                                   
 var $pc2740922: Phase;                                                                             
 var tid2740918: Tid;                                                                               
 var temp2740939: bool;                                                                             
 var tid2740914: Tid;                                                                               
 var this2740918: SX;                                                                               
 var temp2740914: bool;                                                                             
 var temp2740922: bool;                                                                             
 var mover2740922: Mover;                                                                           
 var SX._state2740910: [SX]State;                                                                   
 var moverPath2740935: MoverPath;                                                                   
 var this2740914: SX;                                                                               
 var SX._state2740918_post: [SX]State;                                                              
 var tid2740927_post: Tid;                                                                          
 var SX.b2740914: [SX]bool;                                                                         
 var SX._lock2740918_post: [SX]Tid;                                                                 
 var mover2740939: Mover;                                                                           
 var this2740918_post: SX;                                                                          
 var tid2740910: Tid;                                                                               
 var SX._lock2740927: [SX]Tid;                                                                      
 var SX.b2740947: [SX]bool;                                                                         
 var $pc2740910: Phase;                                                                             
 var SX.a2740927_post: [SX]int;                                                                     
 var SX.a2740914: [SX]int;                                                                          
 var $recorded.state2740927_post: int;                                                              
 var SX.b2740927_post: [SX]bool;                                                                    
 var SX.a2740918_post: [SX]int;                                                                     
 var path2740910: int;                                                                              
 var this2740910: SX;                                                                               
 var SX._state2740927_post: [SX]State;                                                              
 var $pc2740927: Phase;                                                                             
 var mover2740914: Mover;                                                                           
 var SX._lock2740922: [SX]Tid;                                                                      
 var temp: bool;                                                                                    
 var $pc2740947: Phase;                                                                             
 var SX._lock2740927_post: [SX]Tid;                                                                 
 var tid2740935: Tid;                                                                               
 var mover2740910: Mover;                                                                           
 var SX._lock2740939: [SX]Tid;                                                                      
 var $recorded.state2740914: int;                                                                   
 var tid2740947: Tid;                                                                               
 var SX.a2740910: [SX]int;                                                                          
 var SX._state2740935: [SX]State;                                                                   
 var mover2740935: Mover;                                                                           
 var SX._lock2740918: [SX]Tid;                                                                      
 var $pc2740927_post: Phase;                                                                        
 var $recorded.state2740922: int;                                                                   
 var SX.a2740947: [SX]int;                                                                          
 var SX.b2740935: [SX]bool;                                                                         
 var tid2740922: Tid;                                                                               
 var SX.b2740922: [SX]bool;                                                                         
 var temp2740935: bool;                                                                             
 var SX.b2740927: [SX]bool;                                                                         
 var SX.a2740939: [SX]int;                                                                          
 var SX.a2740935: [SX]int;                                                                          
 var path2740914: int;                                                                              
 var SX._state2740947: [SX]State;                                                                   
 var this2740927_post: SX;                                                                          
 var this2740927: SX;                                                                               
 var path2740935: int;                                                                              
 var SX._state2740922: [SX]State;                                                                   
 var SX.a2740927: [SX]int;                                                                          
 var SX._lock2740947: [SX]Tid;                                                                      
 var moverPath2740939: MoverPath;                                                                   
 var this2740922: SX;                                                                               
 var $pc2740939: Phase;                                                                             
 var SX.a2740918: [SX]int;                                                                          
 var $recorded.state2740927: int;                                                                   
 var SX._lock2740935: [SX]Tid;                                                                      
 var temp2740918_post: bool;                                                                        
 var SX._state2740939: [SX]State;                                                                   
 var this2740947: SX;                                                                               
 var path2740922: int;                                                                              
 var tid2740939: Tid;                                                                               
 var SX._state2740914: [SX]State;                                                                   
 var $recorded.state2740918_post: int;                                                              
 var SX._lock2740910: [SX]Tid;                                                                      
 var $recorded.state2740918: int;                                                                   
 var moverPath2740922: MoverPath;                                                                   
 var temp2740910: bool;                                                                             
 var $recorded.state2740939: int;                                                                   
 var this2740935: SX;                                                                               
 var SX.b2740910: [SX]bool;                                                                         
 var SX.b2740939: [SX]bool;                                                                         
 var $recorded.state2740947: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (60.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume SX._lock[this] == Tid.null;                                                                 
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (60.22): Reduction failure
 SX._lock[this] := tid;                                                                             
                                                                                                    
 // 61.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 61.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2740910 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740910 := m#moverPath(moverPath2740910);                                                     
 path2740910 := p#moverPath(moverPath2740910);                                                      
 assume SX._state2740910 == SX._state && SX.b2740910 == SX.b && SX.a2740910 == SX.a && SX._lock2740910 == SX._lock && temp2740910 == temp && this2740910 == this && tid2740910 == tid && $pc2740910 == $pc;
 assume $recorded.state2740910 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (61.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740910);                                                              
 assert $pc != PhaseError;                                                                                 // (61.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (!(temp)) {                                                                                     
                                                                                                    
                                                                                                    
  // 64.17: this.b := false;                                                                        
                                                                                                    
                                                                                                    
  moverPath2740914 := WriteEval.SX.b(tid: Tid,this: SX,false: bool,SX._state,SX.b,SX.a,SX._lock);   
  mover2740914 := m#moverPath(moverPath2740914);                                                    
  path2740914 := p#moverPath(moverPath2740914);                                                     
  assume SX._state2740914 == SX._state && SX.b2740914 == SX.b && SX.a2740914 == SX.a && SX._lock2740914 == SX._lock && temp2740914 == temp && this2740914 == this && tid2740914 == tid && $pc2740914 == $pc;
  assume $recorded.state2740914 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (64.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover2740914);                                                             
  assert $pc != PhaseError;                                                                                // (64.17): Reduction failure
  SX.b[this] := false;                                                                              
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 66.13: yield;                                                                                   
                                                                                                    
 assume SX._state2740918 == SX._state && SX.b2740918 == SX.b && SX.a2740918 == SX.a && SX._lock2740918 == SX._lock && temp2740918 == temp && this2740918 == this && tid2740918 == tid;
 assume $recorded.state2740918 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume SX._state2740918_post == SX._state && SX.b2740918_post == SX.b && SX.a2740918_post == SX.a && SX._lock2740918_post == SX._lock && temp2740918_post == temp && this2740918_post == this && tid2740918_post == tid;
 assume $recorded.state2740918_post == 1;                                                           
                                                                                                    
                                                                                                    
 // 68.13: this.b := true;                                                                          
                                                                                                    
                                                                                                    
 moverPath2740922 := WriteEval.SX.b(tid: Tid,this: SX,true: bool,SX._state,SX.b,SX.a,SX._lock);     
 mover2740922 := m#moverPath(moverPath2740922);                                                     
 path2740922 := p#moverPath(moverPath2740922);                                                      
 assume SX._state2740922 == SX._state && SX.b2740922 == SX.b && SX.a2740922 == SX.a && SX._lock2740922 == SX._lock && temp2740922 == temp && this2740922 == this && tid2740922 == tid && $pc2740922 == $pc;
 assume $recorded.state2740922 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (68.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2740922);                                                              
 assert $pc != PhaseError;                                                                                 // (68.13): Reduction failure
 SX.b[this] := true;                                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (69.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert SX._lock[this] == tid;                                                                             // (69.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (69.9): Reduction failure
 SX._lock[this] := Tid.null;                                                                        
                                                                                                    
 // 70.9: yield;                                                                                    
                                                                                                    
 assume SX._state2740927 == SX._state && SX.b2740927 == SX.b && SX.a2740927 == SX.a && SX._lock2740927 == SX._lock && this2740927 == this && tid2740927 == tid;
 assume $recorded.state2740927 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume SX._state2740927_post == SX._state && SX.b2740927_post == SX.b && SX.a2740927_post == SX.a && SX._lock2740927_post == SX._lock && this2740927_post == this && tid2740927_post == tid;
 assume $recorded.state2740927_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (71.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume SX._lock[this] == Tid.null;                                                                 
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (71.22): Reduction failure
 SX._lock[this] := tid;                                                                             
                                                                                                    
 // 72.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 72.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2740935 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740935 := m#moverPath(moverPath2740935);                                                     
 path2740935 := p#moverPath(moverPath2740935);                                                      
 assume SX._state2740935 == SX._state && SX.b2740935 == SX.b && SX.a2740935 == SX.a && SX._lock2740935 == SX._lock && temp2740935 == temp && this2740935 == this && tid2740935 == tid && $pc2740935 == $pc;
 assume $recorded.state2740935 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (72.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740935);                                                              
 assert $pc != PhaseError;                                                                                 // (72.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (!(temp)) {                                                                                     
                                                                                                    
                                                                                                    
  // 75.17: this.b := false;                                                                        
                                                                                                    
                                                                                                    
  moverPath2740939 := WriteEval.SX.b(tid: Tid,this: SX,false: bool,SX._state,SX.b,SX.a,SX._lock);   
  mover2740939 := m#moverPath(moverPath2740939);                                                    
  path2740939 := p#moverPath(moverPath2740939);                                                     
  assume SX._state2740939 == SX._state && SX.b2740939 == SX.b && SX.a2740939 == SX.a && SX._lock2740939 == SX._lock && temp2740939 == temp && this2740939 == this && tid2740939 == tid && $pc2740939 == $pc;
  assume $recorded.state2740939 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (75.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover2740939);                                                             
  assert $pc != PhaseError;                                                                                // (75.17): Reduction failure
  SX.b[this] := false;                                                                              
 } else {                                                                                           
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (77.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert SX._lock[this] == tid;                                                                             // (77.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (77.9): Reduction failure
 SX._lock[this] := Tid.null;                                                                        
                                                                                                    
 // 59.21: // return;                                                                               
                                                                                                    
 assume SX._state2740947 == SX._state && SX.b2740947 == SX.b && SX.a2740947 == SX.a && SX._lock2740947 == SX._lock && this2740947 == this && tid2740947 == tid;
 assume $recorded.state2740947 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  SX.f2(tid:Tid, this : SX)                                                                
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
                                                                                                    
requires ValidTid(tid);                                                                                    // (80.5): Bad tid
requires isShared(SX._state[this]);                                                                        // (80.5): this is not global
                                                                                                    
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
                                                                                                    
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
{                                                                                                   
 var tid2740978: Tid;                                                                               
 var temp2740978: bool;                                                                             
 var SX.a2740962: [SX]int;                                                                          
 var mover2740982: Mover;                                                                           
 var $recorded.state2740970: int;                                                                   
 var this2740962: SX;                                                                               
 var this2740970: SX;                                                                               
 var SX.a2740970: [SX]int;                                                                          
 var SX._lock2740970_post: [SX]Tid;                                                                 
 var SX._state2740982: [SX]State;                                                                   
 var tid2740962: Tid;                                                                               
 var $pc2740982: Phase;                                                                             
 var path2740982: int;                                                                              
 var path2740978: int;                                                                              
 var SX._lock2740970: [SX]Tid;                                                                      
 var SX.b2740982: [SX]bool;                                                                         
 var this2740982: SX;                                                                               
 var tid2740982: Tid;                                                                               
 var SX.a2740978: [SX]int;                                                                          
 var $pc2740970: Phase;                                                                             
 var SX.b2740978: [SX]bool;                                                                         
 var SX.a2740990: [SX]int;                                                                          
 var SX.b2740970_post: [SX]bool;                                                                    
 var SX.b2740962: [SX]bool;                                                                         
 var SX._lock2740958: [SX]Tid;                                                                      
 var SX._lock2740962: [SX]Tid;                                                                      
 var tid2740970_post: Tid;                                                                          
 var moverPath2740978: MoverPath;                                                                   
 var SX.b2740990: [SX]bool;                                                                         
 var this2740978: SX;                                                                               
 var temp2740982: bool;                                                                             
 var $recorded.state2740990: int;                                                                   
 var $pc2740958: Phase;                                                                             
 var temp: bool;                                                                                    
 var path2740958: int;                                                                              
 var SX._state2740990: [SX]State;                                                                   
 var this2740958: SX;                                                                               
 var $recorded.state2740982: int;                                                                   
 var tid2740990: Tid;                                                                               
 var $recorded.state2740970_post: int;                                                              
 var SX.a2740958: [SX]int;                                                                          
 var moverPath2740958: MoverPath;                                                                   
 var SX._state2740978: [SX]State;                                                                   
 var SX.b2740958: [SX]bool;                                                                         
 var mover2740978: Mover;                                                                           
 var moverPath2740982: MoverPath;                                                                   
 var temp2740958: bool;                                                                             
 var this2740970_post: SX;                                                                          
 var tid2740970: Tid;                                                                               
 var temp2740962: bool;                                                                             
 var SX._state2740962: [SX]State;                                                                   
 var $recorded.state2740958: int;                                                                   
 var SX.a2740970_post: [SX]int;                                                                     
 var path2740962: int;                                                                              
 var $recorded.state2740978: int;                                                                   
 var SX.b2740970: [SX]bool;                                                                         
 var SX._lock2740990: [SX]Tid;                                                                      
 var $pc2740990: Phase;                                                                             
 var moverPath2740962: MoverPath;                                                                   
 var SX._lock2740978: [SX]Tid;                                                                      
 var $recorded.state2740962: int;                                                                   
 var mover2740962: Mover;                                                                           
 var $pc2740970_post: Phase;                                                                        
 var $pc2740978: Phase;                                                                             
 var SX.a2740982: [SX]int;                                                                          
 var tid2740958: Tid;                                                                               
 var SX._state2740970_post: [SX]State;                                                              
 var this2740990: SX;                                                                               
 var SX._state2740970: [SX]State;                                                                   
 var $pc2740962: Phase;                                                                             
 var SX._state2740958: [SX]State;                                                                   
 var mover2740958: Mover;                                                                           
 var SX._lock2740982: [SX]Tid;                                                                      
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (81.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume SX._lock[this] == Tid.null;                                                                 
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (81.22): Reduction failure
 SX._lock[this] := tid;                                                                             
                                                                                                    
 // 82.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 82.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2740958 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740958 := m#moverPath(moverPath2740958);                                                     
 path2740958 := p#moverPath(moverPath2740958);                                                      
 assume SX._state2740958 == SX._state && SX.b2740958 == SX.b && SX.a2740958 == SX.a && SX._lock2740958 == SX._lock && temp2740958 == temp && this2740958 == this && tid2740958 == tid && $pc2740958 == $pc;
 assume $recorded.state2740958 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (82.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740958);                                                              
 assert $pc != PhaseError;                                                                                 // (82.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (!(temp)) {                                                                                     
                                                                                                    
                                                                                                    
  // 85.17: this.b := false;                                                                        
                                                                                                    
                                                                                                    
  moverPath2740962 := WriteEval.SX.b(tid: Tid,this: SX,false: bool,SX._state,SX.b,SX.a,SX._lock);   
  mover2740962 := m#moverPath(moverPath2740962);                                                    
  path2740962 := p#moverPath(moverPath2740962);                                                     
  assume SX._state2740962 == SX._state && SX.b2740962 == SX.b && SX.a2740962 == SX.a && SX._lock2740962 == SX._lock && temp2740962 == temp && this2740962 == this && tid2740962 == tid && $pc2740962 == $pc;
  assume $recorded.state2740962 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (85.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover2740962);                                                             
  assert $pc != PhaseError;                                                                                // (85.17): Reduction failure
  SX.b[this] := false;                                                                              
 } else {                                                                                           
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (87.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert SX._lock[this] == tid;                                                                             // (87.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (87.9): Reduction failure
 SX._lock[this] := Tid.null;                                                                        
                                                                                                    
 // 88.9: yield;                                                                                    
                                                                                                    
 assume SX._state2740970 == SX._state && SX.b2740970 == SX.b && SX.a2740970 == SX.a && SX._lock2740970 == SX._lock && this2740970 == this && tid2740970 == tid;
 assume $recorded.state2740970 == 1;                                                                
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume SX._state2740970_post == SX._state && SX.b2740970_post == SX.b && SX.a2740970_post == SX.a && SX._lock2740970_post == SX._lock && this2740970_post == this && tid2740970_post == tid;
 assume $recorded.state2740970_post == 1;                                                           
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (89.22): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume SX._lock[this] == Tid.null;                                                                 
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (89.22): Reduction failure
 SX._lock[this] := tid;                                                                             
                                                                                                    
 // 90.13: boolean temp;                                                                            
                                                                                                    
                                                                                                    
 // 90.13: temp := this.b;                                                                          
                                                                                                    
                                                                                                    
 moverPath2740978 := ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock);                 
 mover2740978 := m#moverPath(moverPath2740978);                                                     
 path2740978 := p#moverPath(moverPath2740978);                                                      
 assume SX._state2740978 == SX._state && SX.b2740978 == SX.b && SX.a2740978 == SX.a && SX._lock2740978 == SX._lock && temp2740978 == temp && this2740978 == this && tid2740978 == tid && $pc2740978 == $pc;
 assume $recorded.state2740978 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (90.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2740978);                                                              
 assert $pc != PhaseError;                                                                                 // (90.13): Reduction failure
 temp := SX.b[this];                                                                                
 if (!(temp)) {                                                                                     
                                                                                                    
                                                                                                    
  // 93.17: this.b := false;                                                                        
                                                                                                    
                                                                                                    
  moverPath2740982 := WriteEval.SX.b(tid: Tid,this: SX,false: bool,SX._state,SX.b,SX.a,SX._lock);   
  mover2740982 := m#moverPath(moverPath2740982);                                                    
  path2740982 := p#moverPath(moverPath2740982);                                                     
  assume SX._state2740982 == SX._state && SX.b2740982 == SX.b && SX.a2740982 == SX.a && SX._lock2740982 == SX._lock && temp2740982 == temp && this2740982 == this && tid2740982 == tid && $pc2740982 == $pc;
  assume $recorded.state2740982 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != SX.null;                                                                          
  } else {                                                                                          
   assert this != SX.null;                                                                                 // (93.17): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover2740982);                                                             
  assert $pc != PhaseError;                                                                                // (93.17): Reduction failure
  SX.b[this] := false;                                                                              
 } else {                                                                                           
 }                                                                                                  
 if ($pc == PreCommit) {                                                                            
  assume this != SX.null;                                                                           
 } else {                                                                                           
  assert this != SX.null;                                                                                  // (95.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert SX._lock[this] == tid;                                                                             // (95.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (95.9): Reduction failure
 SX._lock[this] := Tid.null;                                                                        
                                                                                                    
 // 80.22: // return;                                                                               
                                                                                                    
 assume SX._state2740990 == SX._state && SX.b2740990 == SX.b && SX.a2740990 == SX.a && SX._lock2740990 == SX._lock && this2740990 == this && tid2740990 == tid;
 assume $recorded.state2740990 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(SX._state: [SX]State,SX.b: [SX]bool,SX.a: [SX]int,SX._lock: [SX]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: SX  :: _i == SX.null <==> isNull(SX._state[_i])) &&                                   
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): SX.b failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                 
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.SX.b(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): SX.b failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                 
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.b[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 SX.b[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): SX.b failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                  
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.b[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.SX.b(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): SX.b failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): SX.b failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.SX.b(t: Tid, u: Tid, v: bool, w: bool, x: SX)                       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == SX.b[x];                                                                               
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 SX.b[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.SX.b(u: Tid,x: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): SX.b failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.SX.a(t: Tid, u: Tid, v: int, w: int, x: SX)                  
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): SX.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.SX.a(t: Tid, u: Tid, v: int, w: int, x: SX)                   
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.SX.a(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.5): SX.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.SX.a(t: Tid, u: Tid, v: int, w: int, x: SX)                   
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var havocValue : int;                                                                              
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.a[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 SX.a[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): SX.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.SX.a(t: Tid, u: Tid, v: int, w: int, x: SX)                    
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var havocValue : int;                                                                              
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == SX.a[x];                                                                               
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.SX.a(u: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.5): SX.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.SX.a(t: Tid, u: Tid, v: int, w: int, x: SX)                        
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): SX.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.SX.a(t: Tid, u: Tid, v: int, w: int, x: SX)                         
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var havocValue : int;                                                                              
 var SX._lock_pre: [SX]Tid;                                                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == SX.a[x];                                                                               
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 SX.a[x] := havocValue;                                                                             
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.SX.a(u: Tid,x: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): SX.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): SX.b is not Write-Write Stable with respect to SX.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var w_mid: bool;                                                                                   
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var w_mid: bool;                                                                                   
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)     
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): SX.b is not Read-Write Stable with respect to SX.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): SX.b is not Read-Write Stable with respect to SX.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): SX.b is not Read-Write Stable with respect to SX.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.b.SX.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: SX, y: SX)     
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): SX.b is not Write-Read Stable with respect to SX.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): SX.b is not Write-Read Stable with respect to SX.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): SX.b is not Write-Read Stable with respect to SX.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y: SX)         
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): SX.a is not Write-Write Stable with respect to SX.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y: SX)         
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y: SX)        
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var v_mid: bool;                                                                                   
 var x_mid: SX;                                                                                     
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.b[x];                                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.b[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.b(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): SX.b is not Read-Write Stable with respect to SX.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): SX.b is not Read-Write Stable with respect to SX.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): SX.b is not Read-Write Stable with respect to SX.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.b.SX.a(t: Tid, u: Tid, v: bool, w: int, w0: int, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var v_pre: bool;                                                                                   
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: bool;                                                                                  
 var SX._lock_post: [SX]Tid;                                                                        
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.b(t: Tid,x: SX,v: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): SX.a is not Write-Read Stable with respect to SX.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): SX.a is not Write-Read Stable with respect to SX.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): SX.a is not Write-Read Stable with respect to SX.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.a.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: SX, y: SX)        
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): SX.b is not Write-Write Stable with respect to SX.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): SX.b is not Write-Write Stable with respect to SX.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.a.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: SX, y: SX)        
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.a.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: SX, y: SX)       
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w0_mid: bool;                                                                                  
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var v_mid: int;                                                                                    
 var w_mid: bool;                                                                                   
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.b[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.a.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: SX, y: SX)      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.b(u: Tid,y: SX,w: bool,SX._state,SX.b,SX.a,SX._lock);                    
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.b[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): SX.a is not Read-Write Stable with respect to SX.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): SX.a is not Read-Write Stable with respect to SX.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): SX.a is not Read-Write Stable with respect to SX.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.a.SX.b(t: Tid, u: Tid, v: int, w: bool, w0: bool, x: SX, y: SX)      
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var w_pre: bool;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w0_pre: bool;                                                                                  
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var w_post: bool;                                                                                  
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.b(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): SX.b is not Write-Read Stable with respect to SX.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): SX.b is not Write-Read Stable with respect to SX.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): SX.b is not Write-Read Stable with respect to SX.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.SX.a.SX.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: SX, y: SX)          
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): SX.a is not Write-Write Stable with respect to SX.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.SX.a.SX.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: SX, y: SX)          
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var v_mid: int;                                                                                    
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
                                                                                                    
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.SX.a.SX.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: SX, y: SX)         
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(SX._state[x], t);                                                            
 requires isAccessible(SX._state[y], u);                                                            
 modifies SX.a;                                                                                     
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var SX.a_mid: [SX]int;                                                                             
 var SX._lock_mid: [SX]Tid;                                                                         
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var SX._state_mid: [SX]State;                                                                      
 var x_mid: SX;                                                                                     
 var v_mid: int;                                                                                    
 var SX.b_mid: [SX]bool;                                                                            
 var y_mid: SX;                                                                                     
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := SX.a[x];                                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_mid == SX._state && SX.b_mid == SX.b && SX.a_mid == SX.a && SX._lock_mid == SX._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 SX.a[x] := tmpV;                                                                                   
 SX.a[y] := w;                                                                                      
 _writeByTPost := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                 
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): SX.a is not Write-Write Stable with respect to SX.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.SX.a.SX.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: SX, y: SX)        
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.SX.a(u: Tid,y: SX,w: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[y] := w;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.SX.a(t: Tid,x: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): SX.a is not Read-Write Stable with respect to SX.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): SX.a is not Read-Write Stable with respect to SX.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): SX.a is not Read-Write Stable with respect to SX.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.SX.a.SX.a(t: Tid, u: Tid, v: int, w: int, w0: int, x: SX, y: SX)        
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
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
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var SX.b_pre: [SX]bool;                                                                            
 var SX._state_pre: [SX]State;                                                                      
 var w_pre: int;                                                                                    
 var SX.a_pre: [SX]int;                                                                             
 var $pc_pre: Phase;                                                                                
 var x_pre: SX;                                                                                     
 var t_pre: Tid;                                                                                    
 var y_pre: SX;                                                                                     
                                                                                                    
 var SX.a_post: [SX]int;                                                                            
 var $recorded.state_post: int;                                                                     
 var SX.b_post: [SX]bool;                                                                           
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var SX._lock_post: [SX]Tid;                                                                        
 var v_post: int;                                                                                   
 var y_post: SX;                                                                                    
 var SX._state_post: [SX]State;                                                                     
 var x_post: SX;                                                                                    
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                              
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.SX.a(t: Tid,x: SX,v: int,SX._state,SX.b,SX.a,SX._lock);                     
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 SX.a[x] := v;                                                                                      
 assume SX._state_post == SX._state && SX.b_post == SX.b && SX.a_post == SX.a && SX._lock_post == SX._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.SX.a(u: Tid,y: SX,SX._state,SX.b,SX.a,SX._lock);                          
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): SX.a is not Write-Read Stable with respect to SX.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): SX.a is not Write-Read Stable with respect to SX.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): SX.a is not Write-Read Stable with respect to SX.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                           
requires ValidTid(tid);                                                                             
modifies SX._state;                                                                                 
modifies SX.b;                                                                                      
modifies SX.a;                                                                                      
modifies SX._lock;                                                                                  
ensures StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                            
ensures Y(tid , old(SX._state), old(SX.b), old(SX.a), old(SX._lock) , SX._state, SX.b, SX.a, SX._lock);
                                                                                                    
// SX.b:                                                                                            
                                                                                                    
function {:inline} Y_SX.b(tid : Tid, this: SX, newValue: bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid): bool
{                                                                                                   
 ((isAccessible(SX._state[this], tid) && leq(m#moverPath(ReadEval.SX.b(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock)), _R)) ==> (SX.b[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SX.b(tid : Tid, this: SX, newValue: bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SX.b.Subsumes.W(tid : Tid, u : Tid, this: SX, newValue: bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: bool;                                                                           
var this_yield: SX;                                                                                 
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]int;                                                                            
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var u_yield: Tid;                                                                                   
var SX._lock_yield: [SX]Tid;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume isAccessible(SX._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.SX.b(u: Tid,this: SX,newValue: bool,SX._state,SX.b,SX.a,SX._lock)));
                                                                                                    
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.b(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_SX.b.Reflexive(tid : Tid, this: SX , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]int;                                                                            
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var SX._lock_yield: [SX]Tid;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.b(tid, this, SX.b[this] , SX._state, SX.b, SX.a, SX._lock);                            
}                                                                                                   
                                                                                                    
procedure Y_SX.b.Transitive(tid : Tid, this: SX, newValue : bool , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]int, SX._lock_p: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p);                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var newValue_pre: bool;                                                                             
var $recorded.state_pre: int;                                                                       
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var SX.a_pre: [SX]int;                                                                              
var $pc_pre: Phase;                                                                                 
var this_pre: SX;                                                                                   
                                                                                                    
var SX.a_post: [SX]int;                                                                             
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var SX._lock_post: [SX]Tid;                                                                         
var newValue_post: bool;                                                                            
var SX._state_post: [SX]State;                                                                      
var this_post: SX;                                                                                  
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock , SX._state_p, SX.b_p, SX.a_p, SX._lock_p);         
 assume Y_SX.b(tid, this, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p);                      
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SX.b(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock);                              
}                                                                                                   
// SX.a:                                                                                            
                                                                                                    
function {:inline} Y_SX.a(tid : Tid, this: SX, newValue: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid): bool
{                                                                                                   
 ((isAccessible(SX._state[this], tid) && leq(m#moverPath(ReadEval.SX.a(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock)), _R)) ==> (SX.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SX.a(tid : Tid, this: SX, newValue: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SX.a.Subsumes.W(tid : Tid, u : Tid, this: SX, newValue: int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]int;                                                                            
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var u_yield: Tid;                                                                                   
var SX._lock_yield: [SX]Tid;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume isAccessible(SX._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.SX.a(u: Tid,this: SX,newValue: int,SX._state,SX.b,SX.a,SX._lock)));
                                                                                                    
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.a(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_SX.a.Reflexive(tid : Tid, this: SX , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]int;                                                                            
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var SX._lock_yield: [SX]Tid;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX.a(tid, this, SX.a[this] , SX._state, SX.b, SX.a, SX._lock);                            
}                                                                                                   
                                                                                                    
procedure Y_SX.a.Transitive(tid : Tid, this: SX, newValue : int , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]int, SX._lock_p: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p);                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var SX.a_pre: [SX]int;                                                                              
var $pc_pre: Phase;                                                                                 
var this_pre: SX;                                                                                   
                                                                                                    
var SX.a_post: [SX]int;                                                                             
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var SX._lock_post: [SX]Tid;                                                                         
var SX._state_post: [SX]State;                                                                      
var this_post: SX;                                                                                  
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock , SX._state_p, SX.b_p, SX.a_p, SX._lock_p);         
 assume Y_SX.a(tid, this, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p);                      
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SX.a(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock);                              
}                                                                                                   
// SX._lock:                                                                                        
                                                                                                    
function {:inline} Y_SX._lock(tid : Tid, this: SX, newValue: Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid): bool
{                                                                                                   
 ((isAccessible(SX._state[this], tid) && leq(m#moverPath(ReadEval.SX._lock(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock)), _R)) ==> (SX._lock[this] == newValue))
 &&(((SX._lock[this]==tid)==(newValue==tid)))                                                       
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_SX._lock(tid : Tid, this: SX, newValue: Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_SX._lock.Subsumes.W(tid : Tid, u : Tid, this: SX, newValue: Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]int;                                                                            
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var u_yield: Tid;                                                                                   
var SX._lock_yield: [SX]Tid;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume isAccessible(SX._state[this], u);                                                           
 assume !isError(m#moverPath(WriteEval.SX._lock(u: Tid,this: SX,newValue: Tid,SX._state,SX.b,SX.a,SX._lock)));
 assume leq(m#moverPath(ReadEval.SX._lock(tid: Tid,this: SX,SX._state,SX.b,SX.a,SX._lock)), _N);    
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX._lock(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_SX._lock.Reflexive(tid : Tid, this: SX , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: SX;                                                                                 
var tid_yield: Tid;                                                                                 
var SX.a_yield: [SX]int;                                                                            
var $pc_yield: Phase;                                                                               
var SX._state_yield: [SX]State;                                                                     
var SX.b_yield: [SX]bool;                                                                           
var SX._lock_yield: [SX]Tid;                                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
assume SX._state_yield == SX._state && SX.b_yield == SX.b && SX.a_yield == SX.a && SX._lock_yield == SX._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_SX._lock(tid, this, SX._lock[this] , SX._state, SX.b, SX.a, SX._lock);                    
}                                                                                                   
                                                                                                    
procedure Y_SX._lock.Transitive(tid : Tid, this: SX, newValue : Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]int, SX._lock_p: [SX]Tid)
 requires StateInvariant(SX._state, SX.b, SX.a, SX._lock);                                          
 requires StateInvariant(SX._state_p, SX.b_p, SX.a_p, SX._lock_p);                                  
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var SX._lock_pre: [SX]Tid;                                                                          
var $recorded.state_pre: int;                                                                       
var SX.b_pre: [SX]bool;                                                                             
var SX._state_pre: [SX]State;                                                                       
var tid_pre: Tid;                                                                                   
var SX.a_pre: [SX]int;                                                                              
var $pc_pre: Phase;                                                                                 
var this_pre: SX;                                                                                   
var newValue_pre: Tid;                                                                              
                                                                                                    
var SX.a_post: [SX]int;                                                                             
var $recorded.state_post: int;                                                                      
var SX.b_post: [SX]bool;                                                                            
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var SX._lock_post: [SX]Tid;                                                                         
var SX._state_post: [SX]State;                                                                      
var newValue_post: Tid;                                                                             
var this_post: SX;                                                                                  
                                                                                                    
assume SX._state_pre == SX._state && SX.b_pre == SX.b && SX.a_pre == SX.a && SX._lock_pre == SX._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(SX._state[this], tid);                                                         
 assume Y(tid , SX._state, SX.b, SX.a, SX._lock , SX._state_p, SX.b_p, SX.a_p, SX._lock_p);         
 assume Y_SX._lock(tid, this, newValue , SX._state_p, SX.b_p, SX.a_p, SX._lock_p);                  
assume SX._state_post == SX._state_p && SX.b_post == SX.b_p && SX.a_post == SX.a_p && SX._lock_post == SX._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_SX._lock(tid, this, newValue , SX._state, SX.b, SX.a, SX._lock);                          
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , SX._state: [SX]State, SX.b: [SX]bool, SX.a: [SX]int, SX._lock: [SX]Tid , SX._state_p: [SX]State, SX.b_p: [SX]bool, SX.a_p: [SX]int, SX._lock_p: [SX]Tid): bool
{                                                                                                   
 (forall this: SX :: Y_SX.b(tid : Tid, this, SX.b_p[this] , SX._state, SX.b, SX.a, SX._lock))       
 && (forall this: SX :: Y_SX.a(tid : Tid, this, SX.a_p[this] , SX._state, SX.b, SX.a, SX._lock))    
 && (forall this: SX :: Y_SX._lock(tid : Tid, this, SX._lock_p[this] , SX._state, SX.b, SX.a, SX._lock))
 && (forall _i : SX :: isShared(SX._state[_i]) ==> isShared(SX._state_p[_i]))                       
 && (forall _i : SX :: isLocal(SX._state[_i], tid) <==> isLocal(SX._state_p[_i], tid))              
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1178.1-1329.2: (Method:12.5)
// 1186.1-1186.24: (12.5): Bad tid
// 1187.1-1187.36: (12.5): this is not global
// 1250.2-1253.18: (class anchor.sink.Assume:13.9)
// 1254.2-1256.2: (class anchor.sink.VarDeclStmt:14.9)
// 1257.2-1274.21: (class anchor.sink.Read:14.9)
// 1269.1-1269.26: (14.9): Cannot have potential null deference in left-mover part.
// 1273.1-1273.27: (14.9): Reduction failure
// 1276.3-1284.43: (class anchor.sink.Yield:16.13)
// 1288.1-1288.27: (17.26): Cannot have potential null deference in left-mover part.
// 1292.1-1292.28: (17.26): Reduction failure
// 1295.3-1311.19: (class anchor.sink.Write:18.17)
// 1307.1-1307.27: (18.17): Cannot have potential null deference in left-mover part.
// 1310.1-1310.28: (18.17): Reduction failure
// 1315.1-1315.27: (19.13): Cannot have potential null deference in left-mover part.
// 1317.1-1317.32: (19.13): lock not held
// 1319.1-1319.28: (19.13): Reduction failure
// 1323.2-1328.9: (class anchor.sink.Return:12.32)
// 1330.1-1454.2: (Method:23.5)
// 1338.1-1338.24: (23.5): Bad tid
// 1339.1-1339.36: (23.5): this is not global
// 1384.2-1387.18: (class anchor.sink.Assume:24.9)
// 1388.2-1390.2: (class anchor.sink.VarDeclStmt:25.9)
// 1391.2-1408.21: (class anchor.sink.Read:25.9)
// 1403.1-1403.26: (25.9): Cannot have potential null deference in left-mover part.
// 1407.1-1407.27: (25.9): Reduction failure
// 1413.1-1413.27: (27.26): Cannot have potential null deference in left-mover part.
// 1417.1-1417.28: (27.26): Reduction failure
// 1420.3-1436.19: (class anchor.sink.Write:28.17)
// 1432.1-1432.27: (28.17): Cannot have potential null deference in left-mover part.
// 1435.1-1435.28: (28.17): Reduction failure
// 1440.1-1440.27: (29.13): Cannot have potential null deference in left-mover part.
// 1442.1-1442.32: (29.13): lock not held
// 1444.1-1444.28: (29.13): Reduction failure
// 1448.2-1453.9: (class anchor.sink.Return:23.31)
// 1455.1-1566.2: (Method:33.5)
// 1463.1-1463.24: (33.5): Bad tid
// 1464.1-1464.36: (33.5): this is not global
// 1511.2-1514.18: (class anchor.sink.Assume:34.9)
// 1515.2-1517.2: (class anchor.sink.VarDeclStmt:35.9)
// 1518.2-1535.21: (class anchor.sink.Read:35.9)
// 1530.1-1530.26: (35.9): Cannot have potential null deference in left-mover part.
// 1534.1-1534.27: (35.9): Reduction failure
// 1537.3-1539.3: (class anchor.sink.VarDeclStmt:37.13)
// 1540.3-1557.19: (class anchor.sink.Read:37.13)
// 1552.1-1552.27: (37.13): Cannot have potential null deference in left-mover part.
// 1556.1-1556.28: (37.13): Reduction failure
// 1560.2-1565.9: (class anchor.sink.Return:33.36)
// 1567.1-1678.2: (Method:41.5)
// 1575.1-1575.24: (41.5): Bad tid
// 1576.1-1576.36: (41.5): this is not global
// 1623.2-1626.18: (class anchor.sink.Assume:42.9)
// 1627.2-1629.2: (class anchor.sink.VarDeclStmt:43.9)
// 1630.2-1647.21: (class anchor.sink.Read:43.9)
// 1642.1-1642.26: (43.9): Cannot have potential null deference in left-mover part.
// 1646.1-1646.27: (43.9): Reduction failure
// 1649.3-1651.3: (class anchor.sink.VarDeclStmt:45.13)
// 1652.3-1669.19: (class anchor.sink.Read:45.13)
// 1664.1-1664.27: (45.13): Cannot have potential null deference in left-mover part.
// 1668.1-1668.28: (45.13): Reduction failure
// 1672.2-1677.9: (class anchor.sink.Return:41.42)
// 1679.1-1808.2: (Method:49.5)
// 1687.1-1687.24: (49.5): Bad tid
// 1688.1-1688.36: (49.5): this is not global
// 1735.2-1738.18: (class anchor.sink.Assume:50.9)
// 1739.2-1741.2: (class anchor.sink.VarDeclStmt:51.9)
// 1742.2-1759.21: (class anchor.sink.Read:51.9)
// 1754.1-1754.26: (51.9): Cannot have potential null deference in left-mover part.
// 1758.1-1758.27: (51.9): Reduction failure
// 1764.1-1764.27: (53.26): Cannot have potential null deference in left-mover part.
// 1768.1-1768.28: (53.26): Reduction failure
// 1770.3-1772.3: (class anchor.sink.VarDeclStmt:54.17)
// 1773.3-1790.19: (class anchor.sink.Read:54.17)
// 1785.1-1785.27: (54.17): Cannot have potential null deference in left-mover part.
// 1789.1-1789.28: (54.17): Reduction failure
// 1794.1-1794.27: (55.13): Cannot have potential null deference in left-mover part.
// 1796.1-1796.32: (55.13): lock not held
// 1798.1-1798.28: (55.13): Reduction failure
// 1802.2-1807.9: (class anchor.sink.Return:49.41)
// 1809.1-2094.2: (Method:59.5)
// 1817.1-1817.24: (59.5): Bad tid
// 1818.1-1818.36: (59.5): this is not global
// 1935.1-1935.26: (60.22): Cannot have potential null deference in left-mover part.
// 1939.1-1939.27: (60.22): Reduction failure
// 1941.2-1943.2: (class anchor.sink.VarDeclStmt:61.13)
// 1944.2-1961.21: (class anchor.sink.Read:61.13)
// 1956.1-1956.26: (61.13): Cannot have potential null deference in left-mover part.
// 1960.1-1960.27: (61.13): Reduction failure
// 1964.3-1980.23: (class anchor.sink.Write:64.17)
// 1976.1-1976.27: (64.17): Cannot have potential null deference in left-mover part.
// 1979.1-1979.28: (64.17): Reduction failure
// 1983.2-1991.42: (class anchor.sink.Yield:66.13)
// 1993.2-2009.21: (class anchor.sink.Write:68.13)
// 2005.1-2005.26: (68.13): Cannot have potential null deference in left-mover part.
// 2008.1-2008.27: (68.13): Reduction failure
// 2013.1-2013.26: (69.9): Cannot have potential null deference in left-mover part.
// 2015.1-2015.31: (69.9): lock not held
// 2017.1-2017.27: (69.9): Reduction failure
// 2019.2-2027.42: (class anchor.sink.Yield:70.9)
// 2031.1-2031.26: (71.22): Cannot have potential null deference in left-mover part.
// 2035.1-2035.27: (71.22): Reduction failure
// 2037.2-2039.2: (class anchor.sink.VarDeclStmt:72.13)
// 2040.2-2057.21: (class anchor.sink.Read:72.13)
// 2052.1-2052.26: (72.13): Cannot have potential null deference in left-mover part.
// 2056.1-2056.27: (72.13): Reduction failure
// 2060.3-2076.23: (class anchor.sink.Write:75.17)
// 2072.1-2072.27: (75.17): Cannot have potential null deference in left-mover part.
// 2075.1-2075.28: (75.17): Reduction failure
// 2082.1-2082.26: (77.9): Cannot have potential null deference in left-mover part.
// 2084.1-2084.31: (77.9): lock not held
// 2086.1-2086.27: (77.9): Reduction failure
// 2088.2-2093.9: (class anchor.sink.Return:59.21)
// 2095.1-2323.2: (Method:80.5)
// 2103.1-2103.24: (80.5): Bad tid
// 2104.1-2104.36: (80.5): this is not global
// 2191.1-2191.26: (81.22): Cannot have potential null deference in left-mover part.
// 2195.1-2195.27: (81.22): Reduction failure
// 2197.2-2199.2: (class anchor.sink.VarDeclStmt:82.13)
// 2200.2-2217.21: (class anchor.sink.Read:82.13)
// 2212.1-2212.26: (82.13): Cannot have potential null deference in left-mover part.
// 2216.1-2216.27: (82.13): Reduction failure
// 2220.3-2236.23: (class anchor.sink.Write:85.17)
// 2232.1-2232.27: (85.17): Cannot have potential null deference in left-mover part.
// 2235.1-2235.28: (85.17): Reduction failure
// 2242.1-2242.26: (87.9): Cannot have potential null deference in left-mover part.
// 2244.1-2244.31: (87.9): lock not held
// 2246.1-2246.27: (87.9): Reduction failure
// 2248.2-2256.42: (class anchor.sink.Yield:88.9)
// 2260.1-2260.26: (89.22): Cannot have potential null deference in left-mover part.
// 2264.1-2264.27: (89.22): Reduction failure
// 2266.2-2268.2: (class anchor.sink.VarDeclStmt:90.13)
// 2269.2-2286.21: (class anchor.sink.Read:90.13)
// 2281.1-2281.26: (90.13): Cannot have potential null deference in left-mover part.
// 2285.1-2285.27: (90.13): Reduction failure
// 2289.3-2305.23: (class anchor.sink.Write:93.17)
// 2301.1-2301.27: (93.17): Cannot have potential null deference in left-mover part.
// 2304.1-2304.28: (93.17): Reduction failure
// 2311.1-2311.26: (95.9): Cannot have potential null deference in left-mover part.
// 2313.1-2313.31: (95.9): lock not held
// 2315.1-2315.27: (95.9): Reduction failure
// 2317.2-2322.9: (class anchor.sink.Return:80.22)
// 2399.1-2399.34: (5.5): SX.b failed Write-Write Right-Mover Check
// 2458.1-2458.30: (5.5): SX.b failed Write-Read Right-Mover Check
// 2521.1-2521.34: (5.5): SX.b failed Write-Write Left-Mover Check
// 2581.1-2581.30: (5.5): SX.b failed Write-Read Left-Mover Check
// 2638.1-2638.34: (5.5): SX.b failed Read-Write Right-Mover Check
// 2698.1-2698.34: (5.5): SX.b failed Read-Write Left-Mover Check
// 2757.1-2757.34: (8.5): SX.a failed Write-Write Right-Mover Check
// 2816.1-2816.30: (8.5): SX.a failed Write-Read Right-Mover Check
// 2879.1-2879.34: (8.5): SX.a failed Write-Write Left-Mover Check
// 2939.1-2939.30: (8.5): SX.a failed Write-Read Left-Mover Check
// 2996.1-2996.34: (8.5): SX.a failed Read-Write Right-Mover Check
// 3056.1-3056.34: (8.5): SX.a failed Read-Write Left-Mover Check
// 3127.1-3127.140: (5.5): SX.b is not Write-Write Stable with respect to SX.b (case A.1)
// 3128.1-3128.101: (5.5): SX.b is not Write-Write Stable with respect to SX.b (case A.2)
// 3129.1-3129.158: (5.5): SX.b is not Write-Write Stable with respect to SX.b (case A.3)
// 3225.1-3225.140: (5.5): SX.b is not Write-Write Stable with respect to SX.b (case C)
// 3326.1-3326.144: (5.5): SX.b is not Write-Write Stable with respect to SX.b (case D)
// 3327.1-3327.144: (5.5): SX.b is not Write-Write Stable with respect to SX.b (case R)
// 3398.1-3398.136: (5.5): SX.b is not Read-Write Stable with respect to SX.b (case F)
// 3399.1-3399.136: (5.5): SX.b is not Read-Write Stable with respect to SX.b (case H)
// 3400.1-3400.146: (5.5): SX.b is not Read-Write Stable with respect to SX.b (case I)
// 3470.1-3470.136: (5.5): SX.b is not Write-Read Stable with respect to SX.b (case J)
// 3471.1-3471.136: (5.5): SX.b is not Write-Read Stable with respect to SX.b (case K)
// 3472.1-3472.99: (5.5): SX.b is not Write-Read Stable with respect to SX.b (case L)
// 3544.1-3544.140: (8.5): SX.a is not Write-Write Stable with respect to SX.b (case A.1)
// 3545.1-3545.101: (8.5): SX.a is not Write-Write Stable with respect to SX.b (case A.2)
// 3546.1-3546.158: (8.5): SX.a is not Write-Write Stable with respect to SX.b (case A.3)
// 3642.1-3642.140: (5.5): SX.b is not Write-Write Stable with respect to SX.a (case C)
// 3743.1-3743.144: (5.5): SX.b is not Write-Write Stable with respect to SX.a (case D)
// 3744.1-3744.144: (5.5): SX.b is not Write-Write Stable with respect to SX.a (case R)
// 3815.1-3815.136: (5.5): SX.b is not Read-Write Stable with respect to SX.a (case F)
// 3816.1-3816.136: (5.5): SX.b is not Read-Write Stable with respect to SX.a (case H)
// 3817.1-3817.146: (5.5): SX.b is not Read-Write Stable with respect to SX.a (case I)
// 3887.1-3887.136: (8.5): SX.a is not Write-Read Stable with respect to SX.b (case J)
// 3888.1-3888.136: (8.5): SX.a is not Write-Read Stable with respect to SX.b (case K)
// 3889.1-3889.99: (8.5): SX.a is not Write-Read Stable with respect to SX.b (case L)
// 3961.1-3961.140: (5.5): SX.b is not Write-Write Stable with respect to SX.a (case A.1)
// 3962.1-3962.101: (5.5): SX.b is not Write-Write Stable with respect to SX.a (case A.2)
// 3963.1-3963.158: (5.5): SX.b is not Write-Write Stable with respect to SX.a (case A.3)
// 4059.1-4059.140: (8.5): SX.a is not Write-Write Stable with respect to SX.b (case C)
// 4160.1-4160.144: (8.5): SX.a is not Write-Write Stable with respect to SX.b (case D)
// 4161.1-4161.144: (8.5): SX.a is not Write-Write Stable with respect to SX.b (case R)
// 4232.1-4232.136: (8.5): SX.a is not Read-Write Stable with respect to SX.b (case F)
// 4233.1-4233.136: (8.5): SX.a is not Read-Write Stable with respect to SX.b (case H)
// 4234.1-4234.146: (8.5): SX.a is not Read-Write Stable with respect to SX.b (case I)
// 4304.1-4304.136: (5.5): SX.b is not Write-Read Stable with respect to SX.a (case J)
// 4305.1-4305.136: (5.5): SX.b is not Write-Read Stable with respect to SX.a (case K)
// 4306.1-4306.99: (5.5): SX.b is not Write-Read Stable with respect to SX.a (case L)
// 4378.1-4378.140: (8.5): SX.a is not Write-Write Stable with respect to SX.a (case A.1)
// 4379.1-4379.101: (8.5): SX.a is not Write-Write Stable with respect to SX.a (case A.2)
// 4380.1-4380.158: (8.5): SX.a is not Write-Write Stable with respect to SX.a (case A.3)
// 4476.1-4476.140: (8.5): SX.a is not Write-Write Stable with respect to SX.a (case C)
// 4577.1-4577.144: (8.5): SX.a is not Write-Write Stable with respect to SX.a (case D)
// 4578.1-4578.144: (8.5): SX.a is not Write-Write Stable with respect to SX.a (case R)
// 4649.1-4649.136: (8.5): SX.a is not Read-Write Stable with respect to SX.a (case F)
// 4650.1-4650.136: (8.5): SX.a is not Read-Write Stable with respect to SX.a (case H)
// 4651.1-4651.146: (8.5): SX.a is not Read-Write Stable with respect to SX.a (case I)
// 4721.1-4721.136: (8.5): SX.a is not Write-Read Stable with respect to SX.a (case J)
// 4722.1-4722.136: (8.5): SX.a is not Write-Read Stable with respect to SX.a (case K)
// 4723.1-4723.99: (8.5): SX.a is not Write-Read Stable with respect to SX.a (case L)
// 4755.1-4775.2: (5.5): yields_as clause for SX.b is not valid
// 4780.1-4795.2: (5.5): yields_as clause for SX.b is not reflexive
// 4801.1-4831.2: (5.5): yields_as clause for SX.b is not transitive
// 4850.1-4870.2: (8.5): yields_as clause for SX.a is not valid
// 4875.1-4890.2: (8.5): yields_as clause for SX.a is not reflexive
// 4896.1-4926.2: (8.5): yields_as clause for SX.a is not transitive
// 4946.1-4966.2: (7.32): yields_as clause for SX._lock is not valid
// 4971.1-4986.2: (7.32): yields_as clause for SX._lock is not reflexive
// 4992.1-5022.2: (7.32): yields_as clause for SX._lock is not transitive
