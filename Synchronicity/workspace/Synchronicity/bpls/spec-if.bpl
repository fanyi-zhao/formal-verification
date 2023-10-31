                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/spec-if.anchor:                         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       bool a isRead ? B : E                                                                        
                                                                                                    
       bool b isRead ? B : E                                                                        
                                                                                                    
       bool c isRead ? B : E                                                                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.a == false;                                                                     
        assume this.b == false;                                                                     
        assume this.c == false;                                                                     
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies $result;                                                                           
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.c == $result;                                                                  
      }                                                                                             
      public bool f() {                                                                             
        bool tmp1;                                                                                  
        tmp1 := this.a;                                                                             
        if (tmp1 /* == this.a */) {                                                                 
           return true;                                                                             
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp2;                                                                                  
        bool tmp3;                                                                                  
        bool tmp4;                                                                                  
        tmp4 := this.a;                                                                             
        tmp3 = !(tmp4);                                                                             
        if (tmp3) {                                                                                 
          tmp2 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp2 /* == !(this.a) && this.b */) {                                                    
           return true;                                                                             
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp5;                                                                                  
        bool tmp6;                                                                                  
        tmp6 := this.c;                                                                             
        tmp5 = !(tmp6);                                                                             
        if (tmp5 /* == !(this.c) */) {                                                              
           return false;                                                                            
        } else {                                                                                    
                                                                                                    
        }                                                                                           
         return true;                                                                               
        // return false;                                                                            
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
        ensures spec == 1 ==> this.c == $result;                                                    
      }                                                                                             
      public bool g() {                                                                             
        spec = 0;                                                                                   
        bool tmp7;                                                                                  
        tmp7 := this.a;                                                                             
        if (tmp7 /* == this.a */) {                                                                 
           return true;                                                                             
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp8;                                                                                  
        bool tmp9;                                                                                  
        bool tmp10;                                                                                 
        tmp10 := this.a;                                                                            
        tmp9 = !(tmp10);                                                                            
        if (tmp9) {                                                                                 
          tmp8 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp8 /* == !(this.a) && this.b */) {                                                    
           return true;                                                                             
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        spec = 1;                                                                                   
        bool tmp11;                                                                                 
        bool tmp12;                                                                                 
        tmp12 := this.c;                                                                            
        tmp11 = !(tmp12);                                                                           
        if (tmp11 /* == !(this.c) */) {                                                             
           return false;                                                                            
        } else {                                                                                    
           return true;                                                                             
        }                                                                                           
        // return false;                                                                            
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures (this.a || !(this.a) && this.b ==> $result) || $result == this.c;                   
      }                                                                                             
      public bool gg() {                                                                            
        bool tmp13;                                                                                 
        tmp13 := this.a;                                                                            
        if (tmp13 /* == this.a */) {                                                                
           return true;                                                                             
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp14;                                                                                 
        bool tmp15;                                                                                 
        bool tmp16;                                                                                 
        tmp16 := this.a;                                                                            
        tmp15 = !(tmp16);                                                                           
        if (tmp15) {                                                                                
          tmp14 := this.b;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp14 /* == !(this.a) && this.b */) {                                                   
           return true;                                                                             
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp17;                                                                                 
        bool tmp18;                                                                                 
        tmp18 := this.c;                                                                            
        tmp17 = !(tmp18);                                                                           
        if (tmp17 /* == !(this.c) */) {                                                             
           return false;                                                                            
        } else {                                                                                    
           return true;                                                                             
        }                                                                                           
        // return false;                                                                            
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       bool a isRead ? B : E                                                                        
                                                                                                    
       bool b isRead ? B : E                                                                        
                                                                                                    
       bool c isRead ? B : E                                                                        
                                                                                                    
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
        assume this.a == false;                                                                     
        assume this.b == false;                                                                     
        assume this.c == false;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies $result;                                                                           
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.c == $result;                                                                  
      }                                                                                             
      public bool f() {                                                                             
        bool tmp1;                                                                                  
        tmp1 := this.a;                                                                             
        if (tmp1 /* == this.a */) {                                                                 
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp2;                                                                                  
        bool tmp3;                                                                                  
        bool tmp4;                                                                                  
        tmp4 := this.a;                                                                             
        tmp3 = !(tmp4);                                                                             
        if (tmp3) {                                                                                 
          tmp2 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp2 /* == !(this.a) && this.b */) {                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp5;                                                                                  
        bool tmp6;                                                                                  
        tmp6 := this.c;                                                                             
        tmp5 = !(tmp6);                                                                             
        if (tmp5 /* == !(this.c) */) {                                                              
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
           return true;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
        ensures spec == 1 ==> this.c == $result;                                                    
      }                                                                                             
      public bool g() {                                                                             
        spec = 0;                                                                                   
        bool tmp7;                                                                                  
        tmp7 := this.a;                                                                             
        if (tmp7 /* == this.a */) {                                                                 
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp8;                                                                                  
        bool tmp9;                                                                                  
        bool tmp10;                                                                                 
        tmp10 := this.a;                                                                            
        tmp9 = !(tmp10);                                                                            
        if (tmp9) {                                                                                 
          tmp8 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp8 /* == !(this.a) && this.b */) {                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        spec = 1;                                                                                   
        bool tmp11;                                                                                 
        bool tmp12;                                                                                 
        tmp12 := this.c;                                                                            
        tmp11 = !(tmp12);                                                                           
        if (tmp11 /* == !(this.c) */) {                                                             
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures (this.a || !(this.a) && this.b ==> $result) || $result == this.c;                   
      }                                                                                             
      public bool gg() {                                                                            
        bool tmp13;                                                                                 
        tmp13 := this.a;                                                                            
        if (tmp13 /* == this.a */) {                                                                
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp14;                                                                                 
        bool tmp15;                                                                                 
        bool tmp16;                                                                                 
        tmp16 := this.a;                                                                            
        tmp15 = !(tmp16);                                                                           
        if (tmp15) {                                                                                
          tmp14 := this.b;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp14 /* == !(this.a) && this.b */) {                                                   
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp17;                                                                                 
        bool tmp18;                                                                                 
        tmp18 := this.c;                                                                            
        tmp17 = !(tmp18);                                                                           
        if (tmp17 /* == !(this.c) */) {                                                             
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       bool a isRead ? B : E                                                                        
                                                                                                    
       bool b isRead ? B : E                                                                        
                                                                                                    
       bool c isRead ? B : E                                                                        
                                                                                                    
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
        assume this.a == false;                                                                     
        assume this.b == false;                                                                     
        assume this.c == false;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies $result;                                                                           
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.c == $result;                                                                  
      }                                                                                             
      public bool f() {                                                                             
        bool tmp1;                                                                                  
        tmp1 := this.a;                                                                             
        if (tmp1 /* == this.a */) {                                                                 
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp2;                                                                                  
        bool tmp3;                                                                                  
        bool tmp4;                                                                                  
        tmp4 := this.a;                                                                             
        tmp3 = !(tmp4);                                                                             
        if (tmp3) {                                                                                 
          tmp2 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp2 /* == !(this.a) && this.b */) {                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp5;                                                                                  
        bool tmp6;                                                                                  
        tmp6 := this.c;                                                                             
        tmp5 = !(tmp6);                                                                             
        if (tmp5 /* == !(this.c) */) {                                                              
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
           return true;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
        ensures spec == 1 ==> this.c == $result;                                                    
      }                                                                                             
      public bool g() {                                                                             
        spec = 0;                                                                                   
        bool tmp7;                                                                                  
        tmp7 := this.a;                                                                             
        if (tmp7 /* == this.a */) {                                                                 
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp8;                                                                                  
        bool tmp9;                                                                                  
        bool tmp10;                                                                                 
        tmp10 := this.a;                                                                            
        tmp9 = !(tmp10);                                                                            
        if (tmp9) {                                                                                 
          tmp8 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp8 /* == !(this.a) && this.b */) {                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        spec = 1;                                                                                   
        bool tmp11;                                                                                 
        bool tmp12;                                                                                 
        tmp12 := this.c;                                                                            
        tmp11 = !(tmp12);                                                                           
        if (tmp11 /* == !(this.c) */) {                                                             
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures (this.a || !(this.a) && this.b ==> $result) || $result == this.c;                   
      }                                                                                             
      public bool gg() {                                                                            
        bool tmp13;                                                                                 
        tmp13 := this.a;                                                                            
        if (tmp13 /* == this.a */) {                                                                
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp14;                                                                                 
        bool tmp15;                                                                                 
        bool tmp16;                                                                                 
        tmp16 := this.a;                                                                            
        tmp15 = !(tmp16);                                                                           
        if (tmp15) {                                                                                
          tmp14 := this.b;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp14 /* == !(this.a) && this.b */) {                                                   
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp17;                                                                                 
        bool tmp18;                                                                                 
        tmp18 := this.c;                                                                            
        tmp17 = !(tmp18);                                                                           
        if (tmp17 /* == !(this.c) */) {                                                             
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
       bool a isRead ? B : E                                                                        
                                                                                                    
       bool b isRead ? B : E                                                                        
                                                                                                    
       bool c isRead ? B : E                                                                        
                                                                                                    
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
        assume this.a == false;                                                                     
        assume this.b == false;                                                                     
        assume this.c == false;                                                                     
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies $result;                                                                           
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
      }                                                                                             
        yield;                                                                                      
      {                                                                                             
        ensures this.c == $result;                                                                  
      }                                                                                             
      public bool f() {                                                                             
        bool tmp1;                                                                                  
        tmp1 := this.a;                                                                             
        if (tmp1 /* == this.a */) {                                                                 
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp2;                                                                                  
        bool tmp3;                                                                                  
        bool tmp4;                                                                                  
        tmp4 := this.a;                                                                             
        tmp3 = !(tmp4);                                                                             
        if (tmp3) {                                                                                 
          tmp2 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp2 /* == !(this.a) && this.b */) {                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp5;                                                                                  
        bool tmp6;                                                                                  
        tmp6 := this.c;                                                                             
        tmp5 = !(tmp6);                                                                             
        if (tmp5 /* == !(this.c) */) {                                                              
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
           return true;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.a ==> $result;                                                                 
        ensures !(this.a) && this.b ==> $result;                                                    
        ensures spec == 1 ==> this.c == $result;                                                    
      }                                                                                             
      public bool g() {                                                                             
        spec = 0;                                                                                   
        bool tmp7;                                                                                  
        tmp7 := this.a;                                                                             
        if (tmp7 /* == this.a */) {                                                                 
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp8;                                                                                  
        bool tmp9;                                                                                  
        bool tmp10;                                                                                 
        tmp10 := this.a;                                                                            
        tmp9 = !(tmp10);                                                                            
        if (tmp9) {                                                                                 
          tmp8 := this.b;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp8 /* == !(this.a) && this.b */) {                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        spec = 1;                                                                                   
        bool tmp11;                                                                                 
        bool tmp12;                                                                                 
        tmp12 := this.c;                                                                            
        tmp11 = !(tmp12);                                                                           
        if (tmp11 /* == !(this.c) */) {                                                             
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures (this.a || !(this.a) && this.b ==> $result) || $result == this.c;                   
      }                                                                                             
      public bool gg() {                                                                            
        bool tmp13;                                                                                 
        tmp13 := this.a;                                                                            
        if (tmp13 /* == this.a */) {                                                                
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        bool tmp14;                                                                                 
        bool tmp15;                                                                                 
        bool tmp16;                                                                                 
        tmp16 := this.a;                                                                            
        tmp15 = !(tmp16);                                                                           
        if (tmp15) {                                                                                
          tmp14 := this.b;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        if (tmp14 /* == !(this.a) && this.b */) {                                                   
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        yield;                                                                                      
        bool tmp17;                                                                                 
        bool tmp18;                                                                                 
        tmp18 := this.c;                                                                            
        tmp17 = !(tmp18);                                                                           
        if (tmp17 /* == !(this.c) */) {                                                             
          {                                                                                         
             return false;                                                                          
          }                                                                                         
        } else {                                                                                    
          {                                                                                         
             return true;                                                                           
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
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
                                                                                                    
                                                                                                    
/*** Class Decl A ***/                                                                              
                                                                                                    
type A;                                                                                             
const unique A.null: A;                                                                             
var A._state: [A]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var A.a: [A]bool;                                                                                   
                                                                                                    
function {:inline} ReadEval.A.a(tid: Tid,this : A,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.a(tid: Tid,this : A,newValue: bool,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A.b: [A]bool;                                                                                   
                                                                                                    
function {:inline} ReadEval.A.b(tid: Tid,this : A,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.b(tid: Tid,this : A,newValue: bool,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A.c: [A]bool;                                                                                   
                                                                                                    
function {:inline} ReadEval.A.c(tid: Tid,this : A,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := false;                                                                            
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.c(tid: Tid,this : A,newValue: bool,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A._lock: [A]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.A._lock(tid: Tid,this : A,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(A._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((A._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((A._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((A._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A._lock(tid: Tid,this : A,newValue: Tid,A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(A._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((A._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((A._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((A._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  A.f(tid:Tid, this : A)                                                                   
returns ($result : bool)                                                                            
modifies A._state;                                                                                  
modifies A.a;                                                                                       
modifies A.b;                                                                                       
modifies A.c;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (9.5): Bad tid
requires isShared(A._state[this]);                                                                         // (9.5): this is not global
                                                                                                    
requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                          
                                                                                                    
ensures StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                           
{                                                                                                   
 var A.a3725129: [A]bool;                                                                           
 var tmp13725151: bool;                                                                             
 var A.a3725115: [A]bool;                                                                           
 var tmp53725151: bool;                                                                             
 var path3725143: int;                                                                              
 var _pc3725134_post: Phase;                                                                        
 var A._state3725129: [A]State;                                                                     
 var this3725158: A;                                                                                
 var A.b3725134_post: [A]bool;                                                                      
 var A.b3725129: [A]bool;                                                                           
 var A.a3725143: [A]bool;                                                                           
 var A._lock3725115: [A]Tid;                                                                        
 var A.c3725151: [A]bool;                                                                           
 var tid3725123: Tid;                                                                               
 var A._lock3725158: [A]Tid;                                                                        
 var A.a3725151: [A]bool;                                                                           
 var tmp43725143: bool;                                                                             
 var tmp23725115: bool;                                                                             
 var _pc3725162: Phase;                                                                             
 var tmp43725151: bool;                                                                             
 var tmp5: bool;                                                                                    
 var $result3725099: bool;                                                                          
 var tid3725134_post: Tid;                                                                          
 var A._lock3725143: [A]Tid;                                                                        
 var A._state3725162: [A]State;                                                                     
 var $result3725134: bool;                                                                          
 var tid3725099: Tid;                                                                               
 var tmp53725143: bool;                                                                             
 var this3725129: A;                                                                                
 var A._lock3725151: [A]Tid;                                                                        
 var A.a3725134_post: [A]bool;                                                                      
 var A.b3725134: [A]bool;                                                                           
 var tmp43725158: bool;                                                                             
 var tmp13725123: bool;                                                                             
 var $recorded.state3725134: int;                                                                   
 var tmp43725129: bool;                                                                             
 var tmp1: bool;                                                                                    
 var A._state3725143: [A]State;                                                                     
 var A._lock3725096: [A]Tid;                                                                        
 var $recorded.state3725099: int;                                                                   
 var $recorded.state3725151: int;                                                                   
 var mover3725143: Mover;                                                                           
 var tmp23725134_post: bool;                                                                        
 var A.a3725162: [A]bool;                                                                           
 var $result3725162: bool;                                                                          
 var moverPath3725143: MoverPath;                                                                   
 var _pc3725143: Phase;                                                                             
 var this3725123: A;                                                                                
 var this3725115: A;                                                                                
 var tmp2: bool;                                                                                    
 var $recorded.state3725096: int;                                                                   
 var A.c3725129: [A]bool;                                                                           
 var A.b3725096: [A]bool;                                                                           
 var tid3725115: Tid;                                                                               
 var A.c3725115: [A]bool;                                                                           
 var A._lock3725129: [A]Tid;                                                                        
 var tmp23725162: bool;                                                                             
 var A.c3725123: [A]bool;                                                                           
 var tmp33725129: bool;                                                                             
 var tmp23725129: bool;                                                                             
 var tmp63725151: bool;                                                                             
 var A.b3725123: [A]bool;                                                                           
 var _pc3725115: Phase;                                                                             
 var tid3725096: Tid;                                                                               
 var $recorded.state3725115: int;                                                                   
 var this3725162: A;                                                                                
 var tmp33725143: bool;                                                                             
 var tmp43725123: bool;                                                                             
 var tmp13725134_post: bool;                                                                        
 var A.c3725162: [A]bool;                                                                           
 var A._state3725158: [A]State;                                                                     
 var A.c3725134: [A]bool;                                                                           
 var A.a3725099: [A]bool;                                                                           
 var $recorded.state3725123: int;                                                                   
 var tmp23725143: bool;                                                                             
 var tmp23725134: bool;                                                                             
 var tmp33725134_post: bool;                                                                        
 var tmp13725158: bool;                                                                             
 var this3725096: A;                                                                                
 var A._lock3725099: [A]Tid;                                                                        
 var A._state3725134_post: [A]State;                                                                
 var tmp43725134_post: bool;                                                                        
 var tid3725162: Tid;                                                                               
 var moverPath3725115: MoverPath;                                                                   
 var $result3725158: bool;                                                                          
 var tmp43725162: bool;                                                                             
 var $result3725123: bool;                                                                          
 var tmp33725151: bool;                                                                             
 var tmp23725151: bool;                                                                             
 var A._state3725123: [A]State;                                                                     
 var A._state3725099: [A]State;                                                                     
 var this3725134: A;                                                                                
 var tid3725143: Tid;                                                                               
 var A._lock3725134_post: [A]Tid;                                                                   
 var tmp13725134: bool;                                                                             
 var $result3725129: bool;                                                                          
 var $recorded.state3725162: int;                                                                   
 var A._state3725115: [A]State;                                                                     
 var A.a3725134: [A]bool;                                                                           
 var A.b3725158: [A]bool;                                                                           
 var mover3725096: Mover;                                                                           
 var this3725099: A;                                                                                
 var this3725134_post: A;                                                                           
 var $recorded.state3725129: int;                                                                   
 var tmp63725158: bool;                                                                             
 var tmp53725158: bool;                                                                             
 var tid3725158: Tid;                                                                               
 var _pc3725099: Phase;                                                                             
 var tmp33725115: bool;                                                                             
 var $result3725115: bool;                                                                          
 var A._state3725151: [A]State;                                                                     
 var path3725096: int;                                                                              
 var $recorded.state3725143: int;                                                                   
 var tmp43725115: bool;                                                                             
 var moverPath3725096: MoverPath;                                                                   
 var _pc3725134: Phase;                                                                             
 var tid3725134: Tid;                                                                               
 var A.b3725162: [A]bool;                                                                           
 var A.c3725158: [A]bool;                                                                           
 var $result3725151: bool;                                                                          
 var _pc3725158: Phase;                                                                             
 var path3725115: int;                                                                              
 var A._state3725096: [A]State;                                                                     
 var _pc3725129: Phase;                                                                             
 var $result3725143: bool;                                                                          
 var tmp33725134: bool;                                                                             
 var tmp13725129: bool;                                                                             
 var A.c3725134_post: [A]bool;                                                                      
 var A.c3725099: [A]bool;                                                                           
 var $result3725134_post: bool;                                                                     
 var path3725123: int;                                                                              
 var this3725143: A;                                                                                
 var tmp13725162: bool;                                                                             
 var tmp63725143: bool;                                                                             
 var tmp23725158: bool;                                                                             
 var $recorded.state3725158: int;                                                                   
 var A.a3725096: [A]bool;                                                                           
 var A._lock3725162: [A]Tid;                                                                        
 var tmp3: bool;                                                                                    
 var tmp43725134: bool;                                                                             
 var tmp6: bool;                                                                                    
 var A.a3725123: [A]bool;                                                                           
 var tmp4: bool;                                                                                    
 var this3725151: A;                                                                                
 var $recorded.state3725134_post: int;                                                              
 var moverPath3725123: MoverPath;                                                                   
 var A.b3725115: [A]bool;                                                                           
 var tmp33725158: bool;                                                                             
 var mover3725115: Mover;                                                                           
 var tmp13725096: bool;                                                                             
 var A._state3725134: [A]State;                                                                     
 var A._lock3725123: [A]Tid;                                                                        
 var _pc3725151: Phase;                                                                             
 var tid3725151: Tid;                                                                               
 var tid3725129: Tid;                                                                               
 var A.c3725096: [A]bool;                                                                           
 var mover3725123: Mover;                                                                           
 var A.a3725158: [A]bool;                                                                           
 var tmp53725162: bool;                                                                             
 var A.b3725151: [A]bool;                                                                           
 var tmp13725115: bool;                                                                             
 var _pc3725123: Phase;                                                                             
 var tmp63725162: bool;                                                                             
 var _pc3725096: Phase;                                                                             
 var tmp23725123: bool;                                                                             
 var tmp33725123: bool;                                                                             
 var A.b3725143: [A]bool;                                                                           
 var tmp13725099: bool;                                                                             
 var A.c3725143: [A]bool;                                                                           
 var A._lock3725134: [A]Tid;                                                                        
 var $result3725096: bool;                                                                          
 var tmp33725162: bool;                                                                             
 var tmp13725143: bool;                                                                             
 var A.b3725099: [A]bool;                                                                           
                                                                                                    
 var _pc : Phase;                                                                                   
 _pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 19.9: bool tmp1;                                                                                
                                                                                                    
                                                                                                    
 // 19.9: tmp1 := this.a;                                                                           
                                                                                                    
                                                                                                    
 moverPath3725096 := ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725096 := m#moverPath(moverPath3725096);                                                     
 path3725096 := p#moverPath(moverPath3725096);                                                      
 assume A._state3725096 == A._state && A.a3725096 == A.a && A.b3725096 == A.b && A.c3725096 == A.c && A._lock3725096 == A._lock && tmp13725096 == tmp1 && $result3725096 == $result && this3725096 == this && tid3725096 == tid && _pc3725096 == _pc;
 assume $recorded.state3725096 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (19.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725096);                                                              
 assert _pc != PhaseError;                                                                                 // (19.9): Reduction failure
 tmp1 := A.a[this];                                                                                 
 if (tmp1 /* lowered A.a[this] */) {                                                                
                                                                                                    
  // 20.13:  return true;                                                                           
                                                                                                    
  assume A._state3725099 == A._state && A.a3725099 == A.a && A.b3725099 == A.b && A.c3725099 == A.c && A._lock3725099 == A._lock && tmp13725099 == tmp1 && $result3725099 == $result && this3725099 == this && tid3725099 == tid;
  assume $recorded.state3725099 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 22.9: bool tmp2;                                                                                
                                                                                                    
                                                                                                    
 // 22.9: bool tmp3;                                                                                
                                                                                                    
                                                                                                    
 // 22.9: bool tmp4;                                                                                
                                                                                                    
                                                                                                    
 // 22.9: tmp4 := this.a;                                                                           
                                                                                                    
                                                                                                    
 moverPath3725115 := ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725115 := m#moverPath(moverPath3725115);                                                     
 path3725115 := p#moverPath(moverPath3725115);                                                      
 assume A._state3725115 == A._state && A.a3725115 == A.a && A.b3725115 == A.b && A.c3725115 == A.c && A._lock3725115 == A._lock && tmp43725115 == tmp4 && tmp33725115 == tmp3 && tmp23725115 == tmp2 && tmp13725115 == tmp1 && $result3725115 == $result && this3725115 == this && tid3725115 == tid && _pc3725115 == _pc;
 assume $recorded.state3725115 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (22.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725115);                                                              
 assert _pc != PhaseError;                                                                                 // (22.9): Reduction failure
 tmp4 := A.a[this];                                                                                 
                                                                                                    
 // 22.9: tmp3 = !(tmp4);                                                                           
                                                                                                    
 tmp3 := !(tmp4);                                                                                   
 if (tmp3) {                                                                                        
                                                                                                    
  // 22.24: tmp2 := this.b;                                                                         
                                                                                                    
                                                                                                    
  moverPath3725123 := ReadEval.A.b(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                  
  mover3725123 := m#moverPath(moverPath3725123);                                                    
  path3725123 := p#moverPath(moverPath3725123);                                                     
  assume A._state3725123 == A._state && A.a3725123 == A.a && A.b3725123 == A.b && A.c3725123 == A.c && A._lock3725123 == A._lock && tmp43725123 == tmp4 && tmp33725123 == tmp3 && tmp23725123 == tmp2 && tmp13725123 == tmp1 && $result3725123 == $result && this3725123 == this && tid3725123 == tid && _pc3725123 == _pc;
  assume $recorded.state3725123 == 1;                                                               
  if (_pc == PreCommit) {                                                                           
   assume this != A.null;                                                                           
  } else {                                                                                          
   assert this != A.null;                                                                                  // (22.24): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  _pc := transition(_pc, mover3725123);                                                             
  assert _pc != PhaseError;                                                                                // (22.24): Reduction failure
  tmp2 := A.b[this];                                                                                
 } else {                                                                                           
 }                                                                                                  
 if (tmp2 /* lowered (!(A.a[this])&&A.b[this]) */) {                                                
                                                                                                    
  // 23.13:  return true;                                                                           
                                                                                                    
  assume A._state3725129 == A._state && A.a3725129 == A.a && A.b3725129 == A.b && A.c3725129 == A.c && A._lock3725129 == A._lock && tmp43725129 == tmp4 && tmp33725129 == tmp3 && tmp23725129 == tmp2 && tmp13725129 == tmp1 && $result3725129 == $result && this3725129 == this && tid3725129 == tid;
  assume $recorded.state3725129 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 25.9: yield;                                                                                    
                                                                                                    
 assume A._state3725134 == A._state && A.a3725134 == A.a && A.b3725134 == A.b && A.c3725134 == A.c && A._lock3725134 == A._lock && tmp43725134 == tmp4 && tmp33725134 == tmp3 && tmp23725134 == tmp2 && tmp13725134 == tmp1 && $result3725134 == $result && this3725134 == this && tid3725134 == tid;
 assume $recorded.state3725134 == 1;                                                                
 call Yield(tid);                                                                                   
 _pc := PreCommit;                                                                                  
 assume A._state3725134_post == A._state && A.a3725134_post == A.a && A.b3725134_post == A.b && A.c3725134_post == A.c && A._lock3725134_post == A._lock && tmp43725134_post == tmp4 && tmp33725134_post == tmp3 && tmp23725134_post == tmp2 && tmp13725134_post == tmp1 && $result3725134_post == $result && this3725134_post == this && tid3725134_post == tid;
 assume $recorded.state3725134_post == 1;                                                           
                                                                                                    
 // 26.9: bool tmp5;                                                                                
                                                                                                    
                                                                                                    
 // 26.9: bool tmp6;                                                                                
                                                                                                    
                                                                                                    
 // 26.9: tmp6 := this.c;                                                                           
                                                                                                    
                                                                                                    
 moverPath3725143 := ReadEval.A.c(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725143 := m#moverPath(moverPath3725143);                                                     
 path3725143 := p#moverPath(moverPath3725143);                                                      
 assume A._state3725143 == A._state && A.a3725143 == A.a && A.b3725143 == A.b && A.c3725143 == A.c && A._lock3725143 == A._lock && tmp63725143 == tmp6 && tmp53725143 == tmp5 && tmp43725143 == tmp4 && tmp33725143 == tmp3 && tmp23725143 == tmp2 && tmp13725143 == tmp1 && $result3725143 == $result && this3725143 == this && tid3725143 == tid && _pc3725143 == _pc;
 assume $recorded.state3725143 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (26.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725143);                                                              
 assert _pc != PhaseError;                                                                                 // (26.9): Reduction failure
 tmp6 := A.c[this];                                                                                 
                                                                                                    
 // 26.9: tmp5 = !(tmp6);                                                                           
                                                                                                    
 tmp5 := !(tmp6);                                                                                   
 if (tmp5 /* lowered !(A.c[this]) */) {                                                             
                                                                                                    
  // 27.13:  return false;                                                                          
                                                                                                    
  assume A._state3725151 == A._state && A.a3725151 == A.a && A.b3725151 == A.b && A.c3725151 == A.c && A._lock3725151 == A._lock && tmp63725151 == tmp6 && tmp53725151 == tmp5 && tmp43725151 == tmp4 && tmp33725151 == tmp3 && tmp23725151 == tmp2 && tmp13725151 == tmp1 && $result3725151 == $result && this3725151 == this && tid3725151 == tid;
  assume $recorded.state3725151 == 1;                                                               
  $result := false;                                                                                 
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 29.9:  return true;                                                                             
                                                                                                    
 assume A._state3725158 == A._state && A.a3725158 == A.a && A.b3725158 == A.b && A.c3725158 == A.c && A._lock3725158 == A._lock && tmp63725158 == tmp6 && tmp53725158 == tmp5 && tmp43725158 == tmp4 && tmp33725158 == tmp3 && tmp23725158 == tmp2 && tmp13725158 == tmp1 && $result3725158 == $result && this3725158 == this && tid3725158 == tid;
 assume $recorded.state3725158 == 1;                                                                
 $result := true;                                                                                   
 return;                                                                                            
                                                                                                    
 // 18.21: // return false;                                                                         
                                                                                                    
 assume A._state3725162 == A._state && A.a3725162 == A.a && A.b3725162 == A.b && A.c3725162 == A.c && A._lock3725162 == A._lock && tmp63725162 == tmp6 && tmp53725162 == tmp5 && tmp43725162 == tmp4 && tmp33725162 == tmp3 && tmp23725162 == tmp2 && tmp13725162 == tmp1 && $result3725162 == $result && this3725162 == this && tid3725162 == tid;
 assume $recorded.state3725162 == 1;                                                                
 $result := false;                                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  A.g(tid:Tid, this : A)                                                                   
returns ($result : bool)                                                                            
modifies A._state;                                                                                  
modifies A.a;                                                                                       
modifies A.b;                                                                                       
modifies A.c;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (32.5): Bad tid
requires isShared(A._state[this]);                                                                         // (32.5): this is not global
                                                                                                    
requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                          
                                                                                                    
ensures StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                           
{                                                                                                   
 var moverPath3725202: MoverPath;                                                                   
 var spec3725245: int;                                                                              
 var this3725208: A;                                                                                
 var mover3725194: Mover;                                                                           
 var tmp103725226: bool;                                                                            
 var A.a3725208: [A]bool;                                                                           
 var _pc3725226: Phase;                                                                             
 var $result3725194: bool;                                                                          
 var A.b3725202: [A]bool;                                                                           
 var this3725239: A;                                                                                
 var mover3725202: Mover;                                                                           
 var $recorded.state3725202: int;                                                                   
 var mover3725226: Mover;                                                                           
 var A.c3725245: [A]bool;                                                                           
 var tid3725234: Tid;                                                                               
 var tmp113725245: bool;                                                                            
 var A.c3725226: [A]bool;                                                                           
 var A._lock3725239: [A]Tid;                                                                        
 var $recorded.state3725245: int;                                                                   
 var A._lock3725213: [A]Tid;                                                                        
 var tid3725226: Tid;                                                                               
 var A.c3725194: [A]bool;                                                                           
 var spec3725178: int;                                                                              
 var tid3725239: Tid;                                                                               
 var $result3725178: bool;                                                                          
 var this3725175: A;                                                                                
 var spec3725234: int;                                                                              
 var $result3725208: bool;                                                                          
 var A._state3725226: [A]State;                                                                     
 var tid3725208: Tid;                                                                               
 var A.c3725202: [A]bool;                                                                           
 var A.a3725226: [A]bool;                                                                           
 var tmp103725208: bool;                                                                            
 var A._state3725245: [A]State;                                                                     
 var tmp73725245: bool;                                                                             
 var A.b3725213: [A]bool;                                                                           
 var tmp93725208: bool;                                                                             
 var A._state3725175: [A]State;                                                                     
 var _pc3725208: Phase;                                                                             
 var this3725234: A;                                                                                
 var A._lock3725234: [A]Tid;                                                                        
 var A.c3725175: [A]bool;                                                                           
 var A.c3725208: [A]bool;                                                                           
 var A.b3725239: [A]bool;                                                                           
 var A.b3725194: [A]bool;                                                                           
 var $recorded.state3725178: int;                                                                   
 var spec3725208: int;                                                                              
 var tmp103725202: bool;                                                                            
 var A.b3725175: [A]bool;                                                                           
 var tmp103725239: bool;                                                                            
 var tmp113725226: bool;                                                                            
 var $recorded.state3725239: int;                                                                   
 var tmp103725194: bool;                                                                            
 var A._lock3725245: [A]Tid;                                                                        
 var tmp123725226: bool;                                                                            
 var tmp123725245: bool;                                                                            
 var tid3725194: Tid;                                                                               
 var tmp113725239: bool;                                                                            
 var tmp83725234: bool;                                                                             
 var A.a3725234: [A]bool;                                                                           
 var tmp93725194: bool;                                                                             
 var tmp93725245: bool;                                                                             
 var tmp103725245: bool;                                                                            
 var A.c3725213: [A]bool;                                                                           
 var A._lock3725213_post: [A]Tid;                                                                   
 var A._state3725234: [A]State;                                                                     
 var _pc3725213: Phase;                                                                             
 var _pc3725245: Phase;                                                                             
 var tmp11: bool;                                                                                   
 var $recorded.state3725194: int;                                                                   
 var A.b3725226: [A]bool;                                                                           
 var A.c3725178: [A]bool;                                                                           
 var tmp93725202: bool;                                                                             
 var tmp93725239: bool;                                                                             
 var tmp83725213_post: bool;                                                                        
 var A._lock3725194: [A]Tid;                                                                        
 var A._state3725213: [A]State;                                                                     
 var $recorded.state3725213: int;                                                                   
 var A.a3725175: [A]bool;                                                                           
 var moverPath3725226: MoverPath;                                                                   
 var _pc3725194: Phase;                                                                             
 var spec3725213_post: int;                                                                         
 var tmp103725213_post: bool;                                                                       
 var tid3725245: Tid;                                                                               
 var spec: int;                                                                                     
 var tmp83725208: bool;                                                                             
 var A._lock3725178: [A]Tid;                                                                        
 var path3725202: int;                                                                              
 var _pc3725202: Phase;                                                                             
 var $result3725175: bool;                                                                          
 var A._state3725213_post: [A]State;                                                                
 var A.b3725245: [A]bool;                                                                           
 var A._lock3725208: [A]Tid;                                                                        
 var A.c3725234: [A]bool;                                                                           
 var tmp73725239: bool;                                                                             
 var tmp93725213_post: bool;                                                                        
 var tmp123725234: bool;                                                                            
 var A._state3725202: [A]State;                                                                     
 var tmp73725213_post: bool;                                                                        
 var $result3725239: bool;                                                                          
 var tid3725213: Tid;                                                                               
 var A._state3725194: [A]State;                                                                     
 var tid3725213_post: Tid;                                                                          
 var $recorded.state3725208: int;                                                                   
 var tmp93725234: bool;                                                                             
 var tmp10: bool;                                                                                   
 var tmp9: bool;                                                                                    
 var spec3725175: int;                                                                              
 var tmp12: bool;                                                                                   
 var tmp83725226: bool;                                                                             
 var tmp83725194: bool;                                                                             
 var this3725213_post: A;                                                                           
 var _pc3725213_post: Phase;                                                                        
 var tmp83725239: bool;                                                                             
 var $recorded.state3725226: int;                                                                   
 var tmp83725245: bool;                                                                             
 var moverPath3725175: MoverPath;                                                                   
 var A._lock3725202: [A]Tid;                                                                        
 var spec3725213: int;                                                                              
 var A._lock3725226: [A]Tid;                                                                        
 var tmp7: bool;                                                                                    
 var tmp73725178: bool;                                                                             
 var A.a3725213_post: [A]bool;                                                                      
 var A._state3725239: [A]State;                                                                     
 var A.b3725208: [A]bool;                                                                           
 var _pc3725234: Phase;                                                                             
 var A.a3725239: [A]bool;                                                                           
 var $result3725234: bool;                                                                          
 var tmp123725239: bool;                                                                            
 var A.a3725202: [A]bool;                                                                           
 var A.a3725245: [A]bool;                                                                           
 var $result3725202: bool;                                                                          
 var _pc3725175: Phase;                                                                             
 var tmp73725226: bool;                                                                             
 var tmp93725226: bool;                                                                             
 var this3725213: A;                                                                                
 var spec3725239: int;                                                                              
 var tmp73725234: bool;                                                                             
 var tid3725175: Tid;                                                                               
 var $result3725213: bool;                                                                          
 var A.c3725239: [A]bool;                                                                           
 var tmp73725208: bool;                                                                             
 var spec3725202: int;                                                                              
 var tmp93725213: bool;                                                                             
 var _pc3725239: Phase;                                                                             
 var tid3725178: Tid;                                                                               
 var tmp73725175: bool;                                                                             
 var this3725226: A;                                                                                
 var this3725178: A;                                                                                
 var $result3725226: bool;                                                                          
 var A.c3725213_post: [A]bool;                                                                      
 var tmp103725213: bool;                                                                            
 var tmp113725234: bool;                                                                            
 var A._lock3725175: [A]Tid;                                                                        
 var this3725194: A;                                                                                
 var path3725175: int;                                                                              
 var this3725245: A;                                                                                
 var _pc3725178: Phase;                                                                             
 var A.a3725213: [A]bool;                                                                           
 var path3725194: int;                                                                              
 var tmp83725202: bool;                                                                             
 var tmp73725202: bool;                                                                             
 var $recorded.state3725213_post: int;                                                              
 var moverPath3725194: MoverPath;                                                                   
 var A.a3725178: [A]bool;                                                                           
 var $result3725245: bool;                                                                          
 var A._state3725178: [A]State;                                                                     
 var tid3725202: Tid;                                                                               
 var tmp8: bool;                                                                                    
 var A.a3725194: [A]bool;                                                                           
 var $recorded.state3725234: int;                                                                   
 var tmp103725234: bool;                                                                            
 var A.b3725213_post: [A]bool;                                                                      
 var $result3725213_post: bool;                                                                     
 var A._state3725208: [A]State;                                                                     
 var A.b3725234: [A]bool;                                                                           
 var tmp83725213: bool;                                                                             
 var this3725202: A;                                                                                
 var mover3725175: Mover;                                                                           
 var spec3725194: int;                                                                              
 var spec3725226: int;                                                                              
 var path3725226: int;                                                                              
 var tmp73725194: bool;                                                                             
 var $recorded.state3725175: int;                                                                   
 var tmp73725213: bool;                                                                             
 var A.b3725178: [A]bool;                                                                           
                                                                                                    
 var _pc : Phase;                                                                                   
 _pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 39.9: spec = 0;                                                                                 
                                                                                                    
 spec := 0;                                                                                         
                                                                                                    
 // 40.9: bool tmp7;                                                                                
                                                                                                    
                                                                                                    
 // 40.9: tmp7 := this.a;                                                                           
                                                                                                    
                                                                                                    
 moverPath3725175 := ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725175 := m#moverPath(moverPath3725175);                                                     
 path3725175 := p#moverPath(moverPath3725175);                                                      
 assume A._state3725175 == A._state && A.a3725175 == A.a && A.b3725175 == A.b && A.c3725175 == A.c && A._lock3725175 == A._lock && tmp73725175 == tmp7 && spec3725175 == spec && $result3725175 == $result && this3725175 == this && tid3725175 == tid && _pc3725175 == _pc;
 assume $recorded.state3725175 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (40.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725175);                                                              
 assert _pc != PhaseError;                                                                                 // (40.9): Reduction failure
 tmp7 := A.a[this];                                                                                 
 if (tmp7 /* lowered A.a[this] */) {                                                                
                                                                                                    
  // 41.13:  return true;                                                                           
                                                                                                    
  assume A._state3725178 == A._state && A.a3725178 == A.a && A.b3725178 == A.b && A.c3725178 == A.c && A._lock3725178 == A._lock && tmp73725178 == tmp7 && spec3725178 == spec && $result3725178 == $result && this3725178 == this && tid3725178 == tid;
  assume $recorded.state3725178 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 43.9: bool tmp8;                                                                                
                                                                                                    
                                                                                                    
 // 43.9: bool tmp9;                                                                                
                                                                                                    
                                                                                                    
 // 43.9: bool tmp10;                                                                               
                                                                                                    
                                                                                                    
 // 43.9: tmp10 := this.a;                                                                          
                                                                                                    
                                                                                                    
 moverPath3725194 := ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725194 := m#moverPath(moverPath3725194);                                                     
 path3725194 := p#moverPath(moverPath3725194);                                                      
 assume A._state3725194 == A._state && A.a3725194 == A.a && A.b3725194 == A.b && A.c3725194 == A.c && A._lock3725194 == A._lock && tmp103725194 == tmp10 && tmp93725194 == tmp9 && tmp83725194 == tmp8 && tmp73725194 == tmp7 && spec3725194 == spec && $result3725194 == $result && this3725194 == this && tid3725194 == tid && _pc3725194 == _pc;
 assume $recorded.state3725194 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (43.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725194);                                                              
 assert _pc != PhaseError;                                                                                 // (43.9): Reduction failure
 tmp10 := A.a[this];                                                                                
                                                                                                    
 // 43.9: tmp9 = !(tmp10);                                                                          
                                                                                                    
 tmp9 := !(tmp10);                                                                                  
 if (tmp9) {                                                                                        
                                                                                                    
  // 43.24: tmp8 := this.b;                                                                         
                                                                                                    
                                                                                                    
  moverPath3725202 := ReadEval.A.b(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                  
  mover3725202 := m#moverPath(moverPath3725202);                                                    
  path3725202 := p#moverPath(moverPath3725202);                                                     
  assume A._state3725202 == A._state && A.a3725202 == A.a && A.b3725202 == A.b && A.c3725202 == A.c && A._lock3725202 == A._lock && tmp103725202 == tmp10 && tmp93725202 == tmp9 && tmp83725202 == tmp8 && tmp73725202 == tmp7 && spec3725202 == spec && $result3725202 == $result && this3725202 == this && tid3725202 == tid && _pc3725202 == _pc;
  assume $recorded.state3725202 == 1;                                                               
  if (_pc == PreCommit) {                                                                           
   assume this != A.null;                                                                           
  } else {                                                                                          
   assert this != A.null;                                                                                  // (43.24): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  _pc := transition(_pc, mover3725202);                                                             
  assert _pc != PhaseError;                                                                                // (43.24): Reduction failure
  tmp8 := A.b[this];                                                                                
 } else {                                                                                           
 }                                                                                                  
 if (tmp8 /* lowered (!(A.a[this])&&A.b[this]) */) {                                                
                                                                                                    
  // 44.13:  return true;                                                                           
                                                                                                    
  assume A._state3725208 == A._state && A.a3725208 == A.a && A.b3725208 == A.b && A.c3725208 == A.c && A._lock3725208 == A._lock && tmp103725208 == tmp10 && tmp93725208 == tmp9 && tmp83725208 == tmp8 && tmp73725208 == tmp7 && spec3725208 == spec && $result3725208 == $result && this3725208 == this && tid3725208 == tid;
  assume $recorded.state3725208 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 46.9: yield;                                                                                    
                                                                                                    
 assume A._state3725213 == A._state && A.a3725213 == A.a && A.b3725213 == A.b && A.c3725213 == A.c && A._lock3725213 == A._lock && tmp103725213 == tmp10 && tmp93725213 == tmp9 && tmp83725213 == tmp8 && tmp73725213 == tmp7 && spec3725213 == spec && $result3725213 == $result && this3725213 == this && tid3725213 == tid;
 assume $recorded.state3725213 == 1;                                                                
 call Yield(tid);                                                                                   
 _pc := PreCommit;                                                                                  
 assume A._state3725213_post == A._state && A.a3725213_post == A.a && A.b3725213_post == A.b && A.c3725213_post == A.c && A._lock3725213_post == A._lock && tmp103725213_post == tmp10 && tmp93725213_post == tmp9 && tmp83725213_post == tmp8 && tmp73725213_post == tmp7 && spec3725213_post == spec && $result3725213_post == $result && this3725213_post == this && tid3725213_post == tid;
 assume $recorded.state3725213_post == 1;                                                           
                                                                                                    
 // 47.9: spec = 1;                                                                                 
                                                                                                    
 spec := 1;                                                                                         
                                                                                                    
 // 48.9: bool tmp11;                                                                               
                                                                                                    
                                                                                                    
 // 48.9: bool tmp12;                                                                               
                                                                                                    
                                                                                                    
 // 48.9: tmp12 := this.c;                                                                          
                                                                                                    
                                                                                                    
 moverPath3725226 := ReadEval.A.c(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725226 := m#moverPath(moverPath3725226);                                                     
 path3725226 := p#moverPath(moverPath3725226);                                                      
 assume A._state3725226 == A._state && A.a3725226 == A.a && A.b3725226 == A.b && A.c3725226 == A.c && A._lock3725226 == A._lock && tmp123725226 == tmp12 && tmp113725226 == tmp11 && tmp103725226 == tmp10 && tmp93725226 == tmp9 && tmp83725226 == tmp8 && tmp73725226 == tmp7 && spec3725226 == spec && $result3725226 == $result && this3725226 == this && tid3725226 == tid && _pc3725226 == _pc;
 assume $recorded.state3725226 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (48.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725226);                                                              
 assert _pc != PhaseError;                                                                                 // (48.9): Reduction failure
 tmp12 := A.c[this];                                                                                
                                                                                                    
 // 48.9: tmp11 = !(tmp12);                                                                         
                                                                                                    
 tmp11 := !(tmp12);                                                                                 
 if (tmp11 /* lowered !(A.c[this]) */) {                                                            
                                                                                                    
  // 49.13:  return false;                                                                          
                                                                                                    
  assume A._state3725234 == A._state && A.a3725234 == A.a && A.b3725234 == A.b && A.c3725234 == A.c && A._lock3725234 == A._lock && tmp123725234 == tmp12 && tmp113725234 == tmp11 && tmp103725234 == tmp10 && tmp93725234 == tmp9 && tmp83725234 == tmp8 && tmp73725234 == tmp7 && spec3725234 == spec && $result3725234 == $result && this3725234 == this && tid3725234 == tid;
  assume $recorded.state3725234 == 1;                                                               
  $result := false;                                                                                 
  return;                                                                                           
 } else {                                                                                           
                                                                                                    
  // 51.13:  return true;                                                                           
                                                                                                    
  assume A._state3725239 == A._state && A.a3725239 == A.a && A.b3725239 == A.b && A.c3725239 == A.c && A._lock3725239 == A._lock && tmp123725239 == tmp12 && tmp113725239 == tmp11 && tmp103725239 == tmp10 && tmp93725239 == tmp9 && tmp83725239 == tmp8 && tmp73725239 == tmp7 && spec3725239 == spec && $result3725239 == $result && this3725239 == this && tid3725239 == tid;
  assume $recorded.state3725239 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 }                                                                                                  
                                                                                                    
 // 38.21: // return false;                                                                         
                                                                                                    
 assume A._state3725245 == A._state && A.a3725245 == A.a && A.b3725245 == A.b && A.c3725245 == A.c && A._lock3725245 == A._lock && tmp123725245 == tmp12 && tmp113725245 == tmp11 && tmp103725245 == tmp10 && tmp93725245 == tmp9 && tmp83725245 == tmp8 && tmp73725245 == tmp7 && spec3725245 == spec && $result3725245 == $result && this3725245 == this && tid3725245 == tid;
 assume $recorded.state3725245 == 1;                                                                
 $result := false;                                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  A.gg(tid:Tid, this : A)                                                                  
returns ($result : bool)                                                                            
modifies A._state;                                                                                  
modifies A.a;                                                                                       
modifies A.b;                                                                                       
modifies A.c;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (57.5): Bad tid
requires isShared(A._state[this]);                                                                         // (57.5): this is not global
                                                                                                    
requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                          
                                                                                                    
ensures StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                           
{                                                                                                   
 var $recorded.state3725292: int;                                                                   
 var tmp143725320: bool;                                                                            
 var this3725254: A;                                                                                
 var tid3725287: Tid;                                                                               
 var tmp133725254: bool;                                                                            
 var tmp133725309: bool;                                                                            
 var moverPath3725254: MoverPath;                                                                   
 var $result3725287: bool;                                                                          
 var tmp163725320: bool;                                                                            
 var mover3725254: Mover;                                                                           
 var _pc3725254: Phase;                                                                             
 var A.a3725287: [A]bool;                                                                           
 var A.b3725292_post: [A]bool;                                                                      
 var tmp163725301: bool;                                                                            
 var tid3725292_post: Tid;                                                                          
 var tmp143725309: bool;                                                                            
 var A._lock3725314: [A]Tid;                                                                        
 var tmp153725320: bool;                                                                            
 var this3725314: A;                                                                                
 var A.a3725292: [A]bool;                                                                           
 var A.b3725281: [A]bool;                                                                           
 var _pc3725309: Phase;                                                                             
 var tmp153725309: bool;                                                                            
 var tmp143725287: bool;                                                                            
 var tid3725309: Tid;                                                                               
 var tmp163725309: bool;                                                                            
 var tmp183725309: bool;                                                                            
 var tmp163725292_post: bool;                                                                       
 var tmp163725281: bool;                                                                            
 var tid3725314: Tid;                                                                               
 var A.c3725281: [A]bool;                                                                           
 var mover3725273: Mover;                                                                           
 var A._state3725292_post: [A]State;                                                                
 var $result3725257: bool;                                                                          
 var A.a3725309: [A]bool;                                                                           
 var tmp16: bool;                                                                                   
 var tmp133725320: bool;                                                                            
 var tmp153725292_post: bool;                                                                       
 var tmp153725301: bool;                                                                            
 var A.b3725309: [A]bool;                                                                           
 var tmp143725292: bool;                                                                            
 var tmp153725314: bool;                                                                            
 var tmp183725320: bool;                                                                            
 var tmp173725314: bool;                                                                            
 var $result3725301: bool;                                                                          
 var A.a3725320: [A]bool;                                                                           
 var $recorded.state3725301: int;                                                                   
 var tid3725254: Tid;                                                                               
 var path3725281: int;                                                                              
 var A._lock3725320: [A]Tid;                                                                        
 var this3725292_post: A;                                                                           
 var tmp153725273: bool;                                                                            
 var _pc3725287: Phase;                                                                             
 var A._state3725301: [A]State;                                                                     
 var A.b3725257: [A]bool;                                                                           
 var A.c3725292: [A]bool;                                                                           
 var tmp153725292: bool;                                                                            
 var this3725292: A;                                                                                
 var $recorded.state3725273: int;                                                                   
 var $result3725320: bool;                                                                          
 var path3725301: int;                                                                              
 var _pc3725292: Phase;                                                                             
 var A._state3725320: [A]State;                                                                     
 var tmp143725281: bool;                                                                            
 var tid3725301: Tid;                                                                               
 var A._state3725292: [A]State;                                                                     
 var _pc3725281: Phase;                                                                             
 var tid3725281: Tid;                                                                               
 var A._lock3725273: [A]Tid;                                                                        
 var A._lock3725287: [A]Tid;                                                                        
 var _pc3725292_post: Phase;                                                                        
 var A._state3725254: [A]State;                                                                     
 var A.c3725254: [A]bool;                                                                           
 var A._lock3725254: [A]Tid;                                                                        
 var tmp133725292_post: bool;                                                                       
 var A._state3725273: [A]State;                                                                     
 var this3725257: A;                                                                                
 var A._lock3725281: [A]Tid;                                                                        
 var $result3725254: bool;                                                                          
 var $result3725314: bool;                                                                          
 var A._lock3725257: [A]Tid;                                                                        
 var tid3725257: Tid;                                                                               
 var tmp133725281: bool;                                                                            
 var _pc3725257: Phase;                                                                             
 var A.c3725257: [A]bool;                                                                           
 var A.c3725273: [A]bool;                                                                           
 var tmp163725287: bool;                                                                            
 var $result3725292: bool;                                                                          
 var A._state3725287: [A]State;                                                                     
 var A._lock3725301: [A]Tid;                                                                        
 var A.b3725292: [A]bool;                                                                           
 var A._state3725281: [A]State;                                                                     
 var A.b3725287: [A]bool;                                                                           
 var tmp15: bool;                                                                                   
 var tmp143725301: bool;                                                                            
 var tmp143725273: bool;                                                                            
 var tid3725273: Tid;                                                                               
 var $recorded.state3725320: int;                                                                   
 var A._lock3725309: [A]Tid;                                                                        
 var A._lock3725292_post: [A]Tid;                                                                   
 var $recorded.state3725292_post: int;                                                              
 var this3725287: A;                                                                                
 var this3725309: A;                                                                                
 var tmp153725287: bool;                                                                            
 var tmp163725273: bool;                                                                            
 var $recorded.state3725309: int;                                                                   
 var A.b3725320: [A]bool;                                                                           
 var tmp163725314: bool;                                                                            
 var mover3725281: Mover;                                                                           
 var tmp173725320: bool;                                                                            
 var this3725281: A;                                                                                
 var tmp133725292: bool;                                                                            
 var tmp183725301: bool;                                                                            
 var _pc3725320: Phase;                                                                             
 var tmp173725309: bool;                                                                            
 var this3725301: A;                                                                                
 var _pc3725314: Phase;                                                                             
 var tmp133725273: bool;                                                                            
 var $recorded.state3725314: int;                                                                   
 var A.b3725273: [A]bool;                                                                           
 var A.a3725273: [A]bool;                                                                           
 var tmp163725292: bool;                                                                            
 var A._lock3725292: [A]Tid;                                                                        
 var tmp133725301: bool;                                                                            
 var _pc3725273: Phase;                                                                             
 var A.c3725287: [A]bool;                                                                           
 var A.b3725301: [A]bool;                                                                           
 var A.a3725257: [A]bool;                                                                           
 var A.a3725301: [A]bool;                                                                           
 var A.c3725320: [A]bool;                                                                           
 var A.a3725314: [A]bool;                                                                           
 var $recorded.state3725257: int;                                                                   
 var A._state3725314: [A]State;                                                                     
 var tmp133725314: bool;                                                                            
 var moverPath3725273: MoverPath;                                                                   
 var tmp153725281: bool;                                                                            
 var tmp143725314: bool;                                                                            
 var this3725320: A;                                                                                
 var $result3725292_post: bool;                                                                     
 var tid3725320: Tid;                                                                               
 var A.a3725254: [A]bool;                                                                           
 var this3725273: A;                                                                                
 var $result3725309: bool;                                                                          
 var A.c3725309: [A]bool;                                                                           
 var tmp14: bool;                                                                                   
 var tmp173725301: bool;                                                                            
 var A.a3725292_post: [A]bool;                                                                      
 var $result3725273: bool;                                                                          
 var _pc3725301: Phase;                                                                             
 var A.b3725314: [A]bool;                                                                           
 var moverPath3725301: MoverPath;                                                                   
 var A._state3725257: [A]State;                                                                     
 var $result3725281: bool;                                                                          
 var tmp17: bool;                                                                                   
 var tmp13: bool;                                                                                   
 var tmp183725314: bool;                                                                            
 var path3725254: int;                                                                              
 var $recorded.state3725254: int;                                                                   
 var tmp133725257: bool;                                                                            
 var A.c3725292_post: [A]bool;                                                                      
 var $recorded.state3725281: int;                                                                   
 var mover3725301: Mover;                                                                           
 var path3725273: int;                                                                              
 var A.a3725281: [A]bool;                                                                           
 var $recorded.state3725287: int;                                                                   
 var tmp133725287: bool;                                                                            
 var A.b3725254: [A]bool;                                                                           
 var moverPath3725281: MoverPath;                                                                   
 var A.c3725314: [A]bool;                                                                           
 var tmp143725292_post: bool;                                                                       
 var tid3725292: Tid;                                                                               
 var tmp18: bool;                                                                                   
 var A._state3725309: [A]State;                                                                     
 var A.c3725301: [A]bool;                                                                           
                                                                                                    
 var _pc : Phase;                                                                                   
 _pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 62.9: bool tmp13;                                                                               
                                                                                                    
                                                                                                    
 // 62.9: tmp13 := this.a;                                                                          
                                                                                                    
                                                                                                    
 moverPath3725254 := ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725254 := m#moverPath(moverPath3725254);                                                     
 path3725254 := p#moverPath(moverPath3725254);                                                      
 assume A._state3725254 == A._state && A.a3725254 == A.a && A.b3725254 == A.b && A.c3725254 == A.c && A._lock3725254 == A._lock && tmp133725254 == tmp13 && $result3725254 == $result && this3725254 == this && tid3725254 == tid && _pc3725254 == _pc;
 assume $recorded.state3725254 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (62.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725254);                                                              
 assert _pc != PhaseError;                                                                                 // (62.9): Reduction failure
 tmp13 := A.a[this];                                                                                
 if (tmp13 /* lowered A.a[this] */) {                                                               
                                                                                                    
  // 63.13:  return true;                                                                           
                                                                                                    
  assume A._state3725257 == A._state && A.a3725257 == A.a && A.b3725257 == A.b && A.c3725257 == A.c && A._lock3725257 == A._lock && tmp133725257 == tmp13 && $result3725257 == $result && this3725257 == this && tid3725257 == tid;
  assume $recorded.state3725257 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 65.9: bool tmp14;                                                                               
                                                                                                    
                                                                                                    
 // 65.9: bool tmp15;                                                                               
                                                                                                    
                                                                                                    
 // 65.9: bool tmp16;                                                                               
                                                                                                    
                                                                                                    
 // 65.9: tmp16 := this.a;                                                                          
                                                                                                    
                                                                                                    
 moverPath3725273 := ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725273 := m#moverPath(moverPath3725273);                                                     
 path3725273 := p#moverPath(moverPath3725273);                                                      
 assume A._state3725273 == A._state && A.a3725273 == A.a && A.b3725273 == A.b && A.c3725273 == A.c && A._lock3725273 == A._lock && tmp163725273 == tmp16 && tmp153725273 == tmp15 && tmp143725273 == tmp14 && tmp133725273 == tmp13 && $result3725273 == $result && this3725273 == this && tid3725273 == tid && _pc3725273 == _pc;
 assume $recorded.state3725273 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (65.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725273);                                                              
 assert _pc != PhaseError;                                                                                 // (65.9): Reduction failure
 tmp16 := A.a[this];                                                                                
                                                                                                    
 // 65.9: tmp15 = !(tmp16);                                                                         
                                                                                                    
 tmp15 := !(tmp16);                                                                                 
 if (tmp15) {                                                                                       
                                                                                                    
  // 65.24: tmp14 := this.b;                                                                        
                                                                                                    
                                                                                                    
  moverPath3725281 := ReadEval.A.b(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                  
  mover3725281 := m#moverPath(moverPath3725281);                                                    
  path3725281 := p#moverPath(moverPath3725281);                                                     
  assume A._state3725281 == A._state && A.a3725281 == A.a && A.b3725281 == A.b && A.c3725281 == A.c && A._lock3725281 == A._lock && tmp163725281 == tmp16 && tmp153725281 == tmp15 && tmp143725281 == tmp14 && tmp133725281 == tmp13 && $result3725281 == $result && this3725281 == this && tid3725281 == tid && _pc3725281 == _pc;
  assume $recorded.state3725281 == 1;                                                               
  if (_pc == PreCommit) {                                                                           
   assume this != A.null;                                                                           
  } else {                                                                                          
   assert this != A.null;                                                                                  // (65.24): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  _pc := transition(_pc, mover3725281);                                                             
  assert _pc != PhaseError;                                                                                // (65.24): Reduction failure
  tmp14 := A.b[this];                                                                               
 } else {                                                                                           
 }                                                                                                  
 if (tmp14 /* lowered (!(A.a[this])&&A.b[this]) */) {                                               
                                                                                                    
  // 66.13:  return true;                                                                           
                                                                                                    
  assume A._state3725287 == A._state && A.a3725287 == A.a && A.b3725287 == A.b && A.c3725287 == A.c && A._lock3725287 == A._lock && tmp163725287 == tmp16 && tmp153725287 == tmp15 && tmp143725287 == tmp14 && tmp133725287 == tmp13 && $result3725287 == $result && this3725287 == this && tid3725287 == tid;
  assume $recorded.state3725287 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 68.9: yield;                                                                                    
                                                                                                    
 assume A._state3725292 == A._state && A.a3725292 == A.a && A.b3725292 == A.b && A.c3725292 == A.c && A._lock3725292 == A._lock && tmp163725292 == tmp16 && tmp153725292 == tmp15 && tmp143725292 == tmp14 && tmp133725292 == tmp13 && $result3725292 == $result && this3725292 == this && tid3725292 == tid;
 assume $recorded.state3725292 == 1;                                                                
 call Yield(tid);                                                                                   
 _pc := PreCommit;                                                                                  
 assume A._state3725292_post == A._state && A.a3725292_post == A.a && A.b3725292_post == A.b && A.c3725292_post == A.c && A._lock3725292_post == A._lock && tmp163725292_post == tmp16 && tmp153725292_post == tmp15 && tmp143725292_post == tmp14 && tmp133725292_post == tmp13 && $result3725292_post == $result && this3725292_post == this && tid3725292_post == tid;
 assume $recorded.state3725292_post == 1;                                                           
                                                                                                    
 // 69.9: bool tmp17;                                                                               
                                                                                                    
                                                                                                    
 // 69.9: bool tmp18;                                                                               
                                                                                                    
                                                                                                    
 // 69.9: tmp18 := this.c;                                                                          
                                                                                                    
                                                                                                    
 moverPath3725301 := ReadEval.A.c(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock);                   
 mover3725301 := m#moverPath(moverPath3725301);                                                     
 path3725301 := p#moverPath(moverPath3725301);                                                      
 assume A._state3725301 == A._state && A.a3725301 == A.a && A.b3725301 == A.b && A.c3725301 == A.c && A._lock3725301 == A._lock && tmp183725301 == tmp18 && tmp173725301 == tmp17 && tmp163725301 == tmp16 && tmp153725301 == tmp15 && tmp143725301 == tmp14 && tmp133725301 == tmp13 && $result3725301 == $result && this3725301 == this && tid3725301 == tid && _pc3725301 == _pc;
 assume $recorded.state3725301 == 1;                                                                
 if (_pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (69.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 _pc := transition(_pc, mover3725301);                                                              
 assert _pc != PhaseError;                                                                                 // (69.9): Reduction failure
 tmp18 := A.c[this];                                                                                
                                                                                                    
 // 69.9: tmp17 = !(tmp18);                                                                         
                                                                                                    
 tmp17 := !(tmp18);                                                                                 
 if (tmp17 /* lowered !(A.c[this]) */) {                                                            
                                                                                                    
  // 70.13:  return false;                                                                          
                                                                                                    
  assume A._state3725309 == A._state && A.a3725309 == A.a && A.b3725309 == A.b && A.c3725309 == A.c && A._lock3725309 == A._lock && tmp183725309 == tmp18 && tmp173725309 == tmp17 && tmp163725309 == tmp16 && tmp153725309 == tmp15 && tmp143725309 == tmp14 && tmp133725309 == tmp13 && $result3725309 == $result && this3725309 == this && tid3725309 == tid;
  assume $recorded.state3725309 == 1;                                                               
  $result := false;                                                                                 
  return;                                                                                           
 } else {                                                                                           
                                                                                                    
  // 72.13:  return true;                                                                           
                                                                                                    
  assume A._state3725314 == A._state && A.a3725314 == A.a && A.b3725314 == A.b && A.c3725314 == A.c && A._lock3725314 == A._lock && tmp183725314 == tmp18 && tmp173725314 == tmp17 && tmp163725314 == tmp16 && tmp153725314 == tmp15 && tmp143725314 == tmp14 && tmp133725314 == tmp13 && $result3725314 == $result && this3725314 == this && tid3725314 == tid;
  assume $recorded.state3725314 == 1;                                                               
  $result := true;                                                                                  
  return;                                                                                           
 }                                                                                                  
                                                                                                    
 // 61.22: // return false;                                                                         
                                                                                                    
 assume A._state3725320 == A._state && A.a3725320 == A.a && A.b3725320 == A.b && A.c3725320 == A.c && A._lock3725320 == A._lock && tmp183725320 == tmp18 && tmp173725320 == tmp17 && tmp163725320 == tmp16 && tmp153725320 == tmp15 && tmp143725320 == tmp14 && tmp133725320 == tmp13 && $result3725320 == $result && this3725320 == this && tid3725320 == tid;
 assume $recorded.state3725320 == 1;                                                                
 $result := false;                                                                                  
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(A._state: [A]State,A.a: [A]bool,A.b: [A]bool,A.c: [A]bool,A._lock: [A]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: A  :: _i == A.null <==> isNull(A._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.a(t: Tid, u: Tid, v: bool, w: bool, x: A)                  
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.a[x] := v;                                                                                       
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.a(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): A.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.a(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.a[x] := v;                                                                                       
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.A.a(u: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): A.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.a(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume w == A.a[x];                                                                                
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.a[x] := havocValue;                                                                              
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.a(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): A.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.a(t: Tid, u: Tid, v: bool, w: bool, x: A)                    
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume w == A.a[x];                                                                                
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByU := ReadEval.A.a(u: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): A.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.a(t: Tid, u: Tid, v: bool, w: bool, x: A)                        
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.a(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): A.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.a(t: Tid, u: Tid, v: bool, w: bool, x: A)                         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.a;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume w == A.a[x];                                                                                
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 A.a[x] := havocValue;                                                                              
 _writeByU := WriteEval.A.a(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): A.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                  
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.b[x] := v;                                                                                       
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): A.b failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.b[x] := v;                                                                                       
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.A.b(u: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): A.b failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume w == A.b[x];                                                                                
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.b[x] := havocValue;                                                                              
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): A.b failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                    
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume w == A.b[x];                                                                                
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByU := ReadEval.A.b(u: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): A.b failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                        
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): A.b failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.b(t: Tid, u: Tid, v: bool, w: bool, x: A)                         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.b;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume w == A.b[x];                                                                                
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 A.b[x] := havocValue;                                                                              
 _writeByU := WriteEval.A.b(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): A.b failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.c(t: Tid, u: Tid, v: bool, w: bool, x: A)                  
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.c[x] := v;                                                                                       
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.c(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): A.c failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.c(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.c[x] := v;                                                                                       
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.A.c(u: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): A.c failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.c(t: Tid, u: Tid, v: bool, w: bool, x: A)                   
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume w == A.c[x];                                                                                
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.c[x] := havocValue;                                                                              
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.c(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): A.c failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.c(t: Tid, u: Tid, v: bool, w: bool, x: A)                    
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume w == A.c[x];                                                                                
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByU := ReadEval.A.c(u: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): A.c failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.c(t: Tid, u: Tid, v: bool, w: bool, x: A)                        
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.c(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): A.c failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.c(t: Tid, u: Tid, v: bool, w: bool, x: A)                         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.c;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : bool;                                                                             
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 assume w == A.c[x];                                                                                
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _readByT := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 A.c[x] := havocValue;                                                                              
 _writeByU := WriteEval.A.c(u: Tid,x: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): A.c failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.a.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): A.a is not Write-Write Stable with respect to A.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.a.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.a[x];                                                                                    
 A.a[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.a[x] := tmpV;                                                                                    
 A.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.a.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.a[x];                                                                                    
 A.a[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.a[x] := tmpV;                                                                                    
 A.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.a.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.a.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.a(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.a(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): A.a is not Write-Read Stable with respect to A.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): A.a is not Write-Read Stable with respect to A.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): A.a is not Write-Read Stable with respect to A.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.a.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): A.b is not Write-Write Stable with respect to A.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.a.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.a[x];                                                                                    
 A.a[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.a[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.a.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.a[x];                                                                                    
 A.a[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.a[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.a.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.a.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.b(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.b(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): A.b is not Write-Read Stable with respect to A.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): A.b is not Write-Read Stable with respect to A.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): A.b is not Write-Read Stable with respect to A.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.a.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): A.c is not Write-Write Stable with respect to A.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.a.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.a[x];                                                                                    
 A.a[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.a[x] := tmpV;                                                                                    
 A.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.c (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.a.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.a[x];                                                                                    
 A.a[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.a[x] := tmpV;                                                                                    
 A.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.c (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.c (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.a.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.a(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.c (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.c (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): A.a is not Read-Write Stable with respect to A.c (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.a.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.a;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.c(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.a(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.c(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): A.c is not Write-Read Stable with respect to A.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): A.c is not Write-Read Stable with respect to A.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): A.c is not Write-Read Stable with respect to A.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.b.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): A.a is not Write-Write Stable with respect to A.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.b.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.b.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.b.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.b.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.a(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.a(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): A.a is not Write-Read Stable with respect to A.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): A.a is not Write-Read Stable with respect to A.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): A.a is not Write-Read Stable with respect to A.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): A.b is not Write-Write Stable with respect to A.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.b.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.b(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.b(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): A.b is not Write-Read Stable with respect to A.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): A.b is not Write-Read Stable with respect to A.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): A.b is not Write-Read Stable with respect to A.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.b.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.b (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): A.c is not Write-Write Stable with respect to A.b (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.b (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.b.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.c (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.b.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.b[x];                                                                                    
 A.b[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.b[x] := tmpV;                                                                                    
 A.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.c (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.c (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.b.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.b(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.c (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.c (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): A.b is not Read-Write Stable with respect to A.c (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.b.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.b;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.c(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.b(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.c(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): A.c is not Write-Read Stable with respect to A.b (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): A.c is not Write-Read Stable with respect to A.b (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): A.c is not Write-Read Stable with respect to A.b (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.c.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.c (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): A.a is not Write-Write Stable with respect to A.c (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): A.a is not Write-Write Stable with respect to A.c (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.c.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.c[x];                                                                                    
 A.c[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.c[x] := tmpV;                                                                                    
 A.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.c.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.c[x];                                                                                    
 A.c[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.c[x] := tmpV;                                                                                    
 A.a[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.c.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.a(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.a[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.c.A.a(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.a;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.a(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.a(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): A.a is not Write-Read Stable with respect to A.c (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): A.a is not Write-Read Stable with respect to A.c (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): A.a is not Write-Read Stable with respect to A.c (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.c.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.c (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): A.b is not Write-Write Stable with respect to A.c (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): A.b is not Write-Write Stable with respect to A.c (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.c.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.c[x];                                                                                    
 A.c[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.c[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.b (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.c.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.c[x];                                                                                    
 A.c[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.c[x] := tmpV;                                                                                    
 A.b[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.b (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.b (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.c.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.b(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.b[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.b (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.b (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.b (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.c.A.b(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.b;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.b(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.b(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): A.b is not Write-Read Stable with respect to A.c (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): A.b is not Write-Read Stable with respect to A.c (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): A.b is not Write-Read Stable with respect to A.c (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.c.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.c (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): A.c is not Write-Write Stable with respect to A.c (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.c (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.c.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)           
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.c[x];                                                                                    
 A.c[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.c[x] := tmpV;                                                                                    
 A.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.c (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.c.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)          
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var _pc_mid: Phase;                                                                                
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var A.c_mid: [A]bool;                                                                              
 var y_mid: A;                                                                                      
 var w0_mid: bool;                                                                                  
 var v_mid: bool;                                                                                   
 var A.b_mid: [A]bool;                                                                              
 var w_mid: bool;                                                                                   
 var A.a_mid: [A]bool;                                                                              
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.c[x];                                                                                    
 A.c[x] := v;                                                                                       
 assume A._state_mid == A._state && A.a_mid == A.a && A.b_mid == A.b && A.c_mid == A.c && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.c[x] := tmpV;                                                                                    
 A.c[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                  
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.c (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): A.c is not Write-Write Stable with respect to A.c (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.c.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.c(u: Tid,y: A,w: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[y] := w;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.c(t: Tid,x: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.c (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.c (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): A.c is not Read-Write Stable with respect to A.c (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.c.A.c(t: Tid, u: Tid, v: bool, w: bool, w0: bool, x: A, y: A)         
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.c;                                                                                      
 modifies A.c;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var A.c_pre: [A]bool;                                                                              
 var w_pre: bool;                                                                                   
 var _pc_pre: Phase;                                                                                
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var A.b_pre: [A]bool;                                                                              
 var w0_pre: bool;                                                                                  
 var v_pre: bool;                                                                                   
 var t_pre: Tid;                                                                                    
 var A.a_pre: [A]bool;                                                                              
                                                                                                    
 var A.c_post: [A]bool;                                                                             
 var w_post: bool;                                                                                  
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var A.b_post: [A]bool;                                                                             
 var v_post: bool;                                                                                  
 var A.a_post: [A]bool;                                                                             
 var A._state_post: [A]State;                                                                       
 var _pc_post: Phase;                                                                               
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
 var w0_post: bool;                                                                                 
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.c(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                                
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.c(t: Tid,x: A,v: bool,A._state,A.a,A.b,A.c,A._lock);                      
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.c[x] := v;                                                                                       
 assume A._state_post == A._state && A.a_post == A.a && A.b_post == A.b && A.c_post == A.c && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.c(u: Tid,y: A,A._state,A.a,A.b,A.c,A._lock);                            
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): A.c is not Write-Read Stable with respect to A.c (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): A.c is not Write-Read Stable with respect to A.c (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): A.c is not Write-Read Stable with respect to A.c (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                          
requires ValidTid(tid);                                                                             
modifies A._state;                                                                                  
modifies A.a;                                                                                       
modifies A.b;                                                                                       
modifies A.c;                                                                                       
modifies A._lock;                                                                                   
ensures StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                           
ensures Y(tid , old(A._state), old(A.a), old(A.b), old(A.c), old(A._lock) , A._state, A.a, A.b, A.c, A._lock);
                                                                                                    
// A.a:                                                                                             
                                                                                                    
function {:inline} Y_A.a(tid : Tid, this: A, newValue: bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.a(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock)), _R)) ==> (A.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.a.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.a(u: Tid,this: A,newValue: bool,A._state,A.a,A.b,A.c,A._lock)));
                                                                                                    
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.a(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_A.a.Reflexive(tid : Tid, this: A , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.a(tid, this, A.a[this] , A._state, A.a, A.b, A.c, A._lock);                             
}                                                                                                   
                                                                                                    
procedure Y_A.a.Transitive(tid : Tid, this: A, newValue : bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.a_p: [A]bool, A.b_p: [A]bool, A.c_p: [A]bool, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires StateInvariant(A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                               
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.c_pre: [A]bool;                                                                               
var newValue_pre: bool;                                                                             
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var A.b_pre: [A]bool;                                                                               
var A.a_pre: [A]bool;                                                                               
                                                                                                    
var A.c_post: [A]bool;                                                                              
var $recorded.state_post: int;                                                                      
var A.b_post: [A]bool;                                                                              
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: bool;                                                                            
var A.a_post: [A]bool;                                                                              
var A._state_post: [A]State;                                                                        
var _pc_post: Phase;                                                                                
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.a, A.b, A.c, A._lock , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);     
 assume Y_A.a(tid, this, newValue , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                    
assume A._state_post == A._state_p && A.a_post == A.a_p && A.b_post == A.b_p && A.c_post == A.c_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A.a(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                              
}                                                                                                   
// A.b:                                                                                             
                                                                                                    
function {:inline} Y_A.b(tid : Tid, this: A, newValue: bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.b(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock)), _R)) ==> (A.b[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.b.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.b(u: Tid,this: A,newValue: bool,A._state,A.a,A.b,A.c,A._lock)));
                                                                                                    
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.b(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_A.b.Reflexive(tid : Tid, this: A , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.b(tid, this, A.b[this] , A._state, A.a, A.b, A.c, A._lock);                             
}                                                                                                   
                                                                                                    
procedure Y_A.b.Transitive(tid : Tid, this: A, newValue : bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.a_p: [A]bool, A.b_p: [A]bool, A.c_p: [A]bool, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires StateInvariant(A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                               
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.c_pre: [A]bool;                                                                               
var newValue_pre: bool;                                                                             
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var A.b_pre: [A]bool;                                                                               
var A.a_pre: [A]bool;                                                                               
                                                                                                    
var A.c_post: [A]bool;                                                                              
var $recorded.state_post: int;                                                                      
var A.b_post: [A]bool;                                                                              
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: bool;                                                                            
var A.a_post: [A]bool;                                                                              
var A._state_post: [A]State;                                                                        
var _pc_post: Phase;                                                                                
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.a, A.b, A.c, A._lock , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);     
 assume Y_A.b(tid, this, newValue , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                    
assume A._state_post == A._state_p && A.a_post == A.a_p && A.b_post == A.b_p && A.c_post == A.c_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A.b(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                              
}                                                                                                   
// A.c:                                                                                             
                                                                                                    
function {:inline} Y_A.c(tid : Tid, this: A, newValue: bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.c(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock)), _R)) ==> (A.c[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.c.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.c(u: Tid,this: A,newValue: bool,A._state,A.a,A.b,A.c,A._lock)));
                                                                                                    
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.c(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                              
}                                                                                                   
                                                                                                    
procedure Y_A.c.Reflexive(tid : Tid, this: A , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.c(tid, this, A.c[this] , A._state, A.a, A.b, A.c, A._lock);                             
}                                                                                                   
                                                                                                    
procedure Y_A.c.Transitive(tid : Tid, this: A, newValue : bool , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.a_p: [A]bool, A.b_p: [A]bool, A.c_p: [A]bool, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires StateInvariant(A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                               
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.c_pre: [A]bool;                                                                               
var newValue_pre: bool;                                                                             
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var A.b_pre: [A]bool;                                                                               
var A.a_pre: [A]bool;                                                                               
                                                                                                    
var A.c_post: [A]bool;                                                                              
var $recorded.state_post: int;                                                                      
var A.b_post: [A]bool;                                                                              
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: bool;                                                                            
var A.a_post: [A]bool;                                                                              
var A._state_post: [A]State;                                                                        
var _pc_post: Phase;                                                                                
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.a, A.b, A.c, A._lock , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);     
 assume Y_A.c(tid, this, newValue , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                    
assume A._state_post == A._state_p && A.a_post == A.a_p && A.b_post == A.b_p && A.c_post == A.c_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A.c(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                              
}                                                                                                   
// A._lock:                                                                                         
                                                                                                    
function {:inline} Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock)), _R)) ==> (A._lock[this] == newValue))
 &&(((A._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: Tid , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A._lock(u: Tid,this: A,newValue: Tid,A._state,A.a,A.b,A.c,A._lock)));
 assume leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.a,A.b,A.c,A._lock)), _N);      
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Reflexive(tid : Tid, this: A , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var A.c_yield: [A]bool;                                                                             
var A.a_yield: [A]bool;                                                                             
var tid_yield: Tid;                                                                                 
var _pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var A.b_yield: [A]bool;                                                                             
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.a_yield == A.a && A.b_yield == A.b && A.c_yield == A.c && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, A._lock[this] , A._state, A.a, A.b, A.c, A._lock);                     
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Transitive(tid : Tid, this: A, newValue : Tid , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.a_p: [A]bool, A.b_p: [A]bool, A.c_p: [A]bool, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.a, A.b, A.c, A._lock);                                         
 requires StateInvariant(A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                               
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.c_pre: [A]bool;                                                                               
var _pc_pre: Phase;                                                                                 
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var A.b_pre: [A]bool;                                                                               
var newValue_pre: Tid;                                                                              
var A.a_pre: [A]bool;                                                                               
                                                                                                    
var A.c_post: [A]bool;                                                                              
var $recorded.state_post: int;                                                                      
var A.b_post: [A]bool;                                                                              
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var A.a_post: [A]bool;                                                                              
var newValue_post: Tid;                                                                             
var A._state_post: [A]State;                                                                        
var _pc_post: Phase;                                                                                
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.a_pre == A.a && A.b_pre == A.b && A.c_pre == A.c && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.a, A.b, A.c, A._lock , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);     
 assume Y_A._lock(tid, this, newValue , A._state_p, A.a_p, A.b_p, A.c_p, A._lock_p);                
assume A._state_post == A._state_p && A.a_post == A.a_p && A.b_post == A.b_p && A.c_post == A.c_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A._lock(tid, this, newValue , A._state, A.a, A.b, A.c, A._lock);                          
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , A._state: [A]State, A.a: [A]bool, A.b: [A]bool, A.c: [A]bool, A._lock: [A]Tid , A._state_p: [A]State, A.a_p: [A]bool, A.b_p: [A]bool, A.c_p: [A]bool, A._lock_p: [A]Tid): bool
{                                                                                                   
 (forall this: A :: Y_A.a(tid : Tid, this, A.a_p[this] , A._state, A.a, A.b, A.c, A._lock))         
 && (forall this: A :: Y_A.b(tid : Tid, this, A.b_p[this] , A._state, A.a, A.b, A.c, A._lock))      
 && (forall this: A :: Y_A.c(tid : Tid, this, A.c_p[this] , A._state, A.a, A.b, A.c, A._lock))      
 && (forall this: A :: Y_A._lock(tid : Tid, this, A._lock_p[this] , A._state, A.a, A.b, A.c, A._lock))
 && (forall _i : A :: isShared(A._state[_i]) ==> isShared(A._state_p[_i]))                          
 && (forall _i : A :: isLocal(A._state[_i], tid) <==> isLocal(A._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1074.1-1424.2: (Method:9.5)
// 1084.1-1084.24: (9.5): Bad tid
// 1085.1-1085.35: (9.5): this is not global
// 1270.2-1272.2: (class anchor.sink.VarDeclStmt:19.9)
// 1273.2-1290.20: (class anchor.sink.Read:19.9)
// 1285.1-1285.25: (19.9): Cannot have potential null deference in left-mover part.
// 1289.1-1289.27: (19.9): Reduction failure
// 1292.3-1298.10: (class anchor.sink.Return:20.13)
// 1301.2-1303.2: (class anchor.sink.VarDeclStmt:22.9)
// 1304.2-1306.2: (class anchor.sink.VarDeclStmt:22.9)
// 1307.2-1309.2: (class anchor.sink.VarDeclStmt:22.9)
// 1310.2-1327.20: (class anchor.sink.Read:22.9)
// 1322.1-1322.25: (22.9): Cannot have potential null deference in left-mover part.
// 1326.1-1326.27: (22.9): Reduction failure
// 1328.2-1331.18: (class anchor.sink.Assign:22.9)
// 1333.3-1350.21: (class anchor.sink.Read:22.24)
// 1345.1-1345.26: (22.24): Cannot have potential null deference in left-mover part.
// 1349.1-1349.28: (22.24): Reduction failure
// 1354.3-1360.10: (class anchor.sink.Return:23.13)
// 1363.2-1371.42: (class anchor.sink.Yield:25.9)
// 1372.2-1374.2: (class anchor.sink.VarDeclStmt:26.9)
// 1375.2-1377.2: (class anchor.sink.VarDeclStmt:26.9)
// 1378.2-1395.20: (class anchor.sink.Read:26.9)
// 1390.1-1390.25: (26.9): Cannot have potential null deference in left-mover part.
// 1394.1-1394.27: (26.9): Reduction failure
// 1396.2-1399.18: (class anchor.sink.Assign:26.9)
// 1401.3-1407.10: (class anchor.sink.Return:27.13)
// 1410.2-1416.9: (class anchor.sink.Return:29.9)
// 1417.2-1423.9: (class anchor.sink.Return:18.21)
// 1425.1-1795.2: (Method:32.5)
// 1435.1-1435.24: (32.5): Bad tid
// 1436.1-1436.35: (32.5): this is not global
// 1633.2-1636.12: (class anchor.sink.Assign:39.9)
// 1637.2-1639.2: (class anchor.sink.VarDeclStmt:40.9)
// 1640.2-1657.20: (class anchor.sink.Read:40.9)
// 1652.1-1652.25: (40.9): Cannot have potential null deference in left-mover part.
// 1656.1-1656.27: (40.9): Reduction failure
// 1659.3-1665.10: (class anchor.sink.Return:41.13)
// 1668.2-1670.2: (class anchor.sink.VarDeclStmt:43.9)
// 1671.2-1673.2: (class anchor.sink.VarDeclStmt:43.9)
// 1674.2-1676.2: (class anchor.sink.VarDeclStmt:43.9)
// 1677.2-1694.21: (class anchor.sink.Read:43.9)
// 1689.1-1689.25: (43.9): Cannot have potential null deference in left-mover part.
// 1693.1-1693.27: (43.9): Reduction failure
// 1695.2-1698.19: (class anchor.sink.Assign:43.9)
// 1700.3-1717.21: (class anchor.sink.Read:43.24)
// 1712.1-1712.26: (43.24): Cannot have potential null deference in left-mover part.
// 1716.1-1716.28: (43.24): Reduction failure
// 1721.3-1727.10: (class anchor.sink.Return:44.13)
// 1730.2-1738.42: (class anchor.sink.Yield:46.9)
// 1739.2-1742.12: (class anchor.sink.Assign:47.9)
// 1743.2-1745.2: (class anchor.sink.VarDeclStmt:48.9)
// 1746.2-1748.2: (class anchor.sink.VarDeclStmt:48.9)
// 1749.2-1766.21: (class anchor.sink.Read:48.9)
// 1761.1-1761.25: (48.9): Cannot have potential null deference in left-mover part.
// 1765.1-1765.27: (48.9): Reduction failure
// 1767.2-1770.20: (class anchor.sink.Assign:48.9)
// 1772.3-1778.10: (class anchor.sink.Return:49.13)
// 1780.3-1786.10: (class anchor.sink.Return:51.13)
// 1788.2-1794.9: (class anchor.sink.Return:38.21)
// 1796.1-2146.2: (Method:57.5)
// 1806.1-1806.24: (57.5): Bad tid
// 1807.1-1807.35: (57.5): this is not global
// 1992.2-1994.2: (class anchor.sink.VarDeclStmt:62.9)
// 1995.2-2012.21: (class anchor.sink.Read:62.9)
// 2007.1-2007.25: (62.9): Cannot have potential null deference in left-mover part.
// 2011.1-2011.27: (62.9): Reduction failure
// 2014.3-2020.10: (class anchor.sink.Return:63.13)
// 2023.2-2025.2: (class anchor.sink.VarDeclStmt:65.9)
// 2026.2-2028.2: (class anchor.sink.VarDeclStmt:65.9)
// 2029.2-2031.2: (class anchor.sink.VarDeclStmt:65.9)
// 2032.2-2049.21: (class anchor.sink.Read:65.9)
// 2044.1-2044.25: (65.9): Cannot have potential null deference in left-mover part.
// 2048.1-2048.27: (65.9): Reduction failure
// 2050.2-2053.20: (class anchor.sink.Assign:65.9)
// 2055.3-2072.22: (class anchor.sink.Read:65.24)
// 2067.1-2067.26: (65.24): Cannot have potential null deference in left-mover part.
// 2071.1-2071.28: (65.24): Reduction failure
// 2076.3-2082.10: (class anchor.sink.Return:66.13)
// 2085.2-2093.42: (class anchor.sink.Yield:68.9)
// 2094.2-2096.2: (class anchor.sink.VarDeclStmt:69.9)
// 2097.2-2099.2: (class anchor.sink.VarDeclStmt:69.9)
// 2100.2-2117.21: (class anchor.sink.Read:69.9)
// 2112.1-2112.25: (69.9): Cannot have potential null deference in left-mover part.
// 2116.1-2116.27: (69.9): Reduction failure
// 2118.2-2121.20: (class anchor.sink.Assign:69.9)
// 2123.3-2129.10: (class anchor.sink.Return:70.13)
// 2131.3-2137.10: (class anchor.sink.Return:72.13)
// 2139.2-2145.9: (class anchor.sink.Return:61.22)
// 2209.1-2209.34: (3.5): A.a failed Write-Write Right-Mover Check
// 2255.1-2255.30: (3.5): A.a failed Write-Read Right-Mover Check
// 2305.1-2305.34: (3.5): A.a failed Write-Write Left-Mover Check
// 2352.1-2352.30: (3.5): A.a failed Write-Read Left-Mover Check
// 2396.1-2396.34: (3.5): A.a failed Read-Write Right-Mover Check
// 2443.1-2443.34: (3.5): A.a failed Read-Write Left-Mover Check
// 2489.1-2489.34: (4.5): A.b failed Write-Write Right-Mover Check
// 2535.1-2535.30: (4.5): A.b failed Write-Read Right-Mover Check
// 2585.1-2585.34: (4.5): A.b failed Write-Write Left-Mover Check
// 2632.1-2632.30: (4.5): A.b failed Write-Read Left-Mover Check
// 2676.1-2676.34: (4.5): A.b failed Read-Write Right-Mover Check
// 2723.1-2723.34: (4.5): A.b failed Read-Write Left-Mover Check
// 2769.1-2769.34: (5.5): A.c failed Write-Write Right-Mover Check
// 2815.1-2815.30: (5.5): A.c failed Write-Read Right-Mover Check
// 2865.1-2865.34: (5.5): A.c failed Write-Write Left-Mover Check
// 2912.1-2912.30: (5.5): A.c failed Write-Read Left-Mover Check
// 2956.1-2956.34: (5.5): A.c failed Read-Write Right-Mover Check
// 3003.1-3003.34: (5.5): A.c failed Read-Write Left-Mover Check
// 3076.1-3076.140: (3.5): A.a is not Write-Write Stable with respect to A.a (case A.1)
// 3077.1-3077.101: (3.5): A.a is not Write-Write Stable with respect to A.a (case A.2)
// 3078.1-3078.158: (3.5): A.a is not Write-Write Stable with respect to A.a (case A.3)
// 3177.1-3177.140: (3.5): A.a is not Write-Write Stable with respect to A.a (case C)
// 3281.1-3281.144: (3.5): A.a is not Write-Write Stable with respect to A.a (case D)
// 3282.1-3282.144: (3.5): A.a is not Write-Write Stable with respect to A.a (case R)
// 3355.1-3355.136: (3.5): A.a is not Read-Write Stable with respect to A.a (case F)
// 3356.1-3356.136: (3.5): A.a is not Read-Write Stable with respect to A.a (case H)
// 3357.1-3357.146: (3.5): A.a is not Read-Write Stable with respect to A.a (case I)
// 3429.1-3429.136: (3.5): A.a is not Write-Read Stable with respect to A.a (case J)
// 3430.1-3430.136: (3.5): A.a is not Write-Read Stable with respect to A.a (case K)
// 3431.1-3431.99: (3.5): A.a is not Write-Read Stable with respect to A.a (case L)
// 3505.1-3505.140: (4.5): A.b is not Write-Write Stable with respect to A.a (case A.1)
// 3506.1-3506.101: (4.5): A.b is not Write-Write Stable with respect to A.a (case A.2)
// 3507.1-3507.158: (4.5): A.b is not Write-Write Stable with respect to A.a (case A.3)
// 3606.1-3606.140: (3.5): A.a is not Write-Write Stable with respect to A.b (case C)
// 3710.1-3710.144: (3.5): A.a is not Write-Write Stable with respect to A.b (case D)
// 3711.1-3711.144: (3.5): A.a is not Write-Write Stable with respect to A.b (case R)
// 3784.1-3784.136: (3.5): A.a is not Read-Write Stable with respect to A.b (case F)
// 3785.1-3785.136: (3.5): A.a is not Read-Write Stable with respect to A.b (case H)
// 3786.1-3786.146: (3.5): A.a is not Read-Write Stable with respect to A.b (case I)
// 3858.1-3858.136: (4.5): A.b is not Write-Read Stable with respect to A.a (case J)
// 3859.1-3859.136: (4.5): A.b is not Write-Read Stable with respect to A.a (case K)
// 3860.1-3860.99: (4.5): A.b is not Write-Read Stable with respect to A.a (case L)
// 3934.1-3934.140: (5.5): A.c is not Write-Write Stable with respect to A.a (case A.1)
// 3935.1-3935.101: (5.5): A.c is not Write-Write Stable with respect to A.a (case A.2)
// 3936.1-3936.158: (5.5): A.c is not Write-Write Stable with respect to A.a (case A.3)
// 4035.1-4035.140: (3.5): A.a is not Write-Write Stable with respect to A.c (case C)
// 4139.1-4139.144: (3.5): A.a is not Write-Write Stable with respect to A.c (case D)
// 4140.1-4140.144: (3.5): A.a is not Write-Write Stable with respect to A.c (case R)
// 4213.1-4213.136: (3.5): A.a is not Read-Write Stable with respect to A.c (case F)
// 4214.1-4214.136: (3.5): A.a is not Read-Write Stable with respect to A.c (case H)
// 4215.1-4215.146: (3.5): A.a is not Read-Write Stable with respect to A.c (case I)
// 4287.1-4287.136: (5.5): A.c is not Write-Read Stable with respect to A.a (case J)
// 4288.1-4288.136: (5.5): A.c is not Write-Read Stable with respect to A.a (case K)
// 4289.1-4289.99: (5.5): A.c is not Write-Read Stable with respect to A.a (case L)
// 4363.1-4363.140: (3.5): A.a is not Write-Write Stable with respect to A.b (case A.1)
// 4364.1-4364.101: (3.5): A.a is not Write-Write Stable with respect to A.b (case A.2)
// 4365.1-4365.158: (3.5): A.a is not Write-Write Stable with respect to A.b (case A.3)
// 4464.1-4464.140: (4.5): A.b is not Write-Write Stable with respect to A.a (case C)
// 4568.1-4568.144: (4.5): A.b is not Write-Write Stable with respect to A.a (case D)
// 4569.1-4569.144: (4.5): A.b is not Write-Write Stable with respect to A.a (case R)
// 4642.1-4642.136: (4.5): A.b is not Read-Write Stable with respect to A.a (case F)
// 4643.1-4643.136: (4.5): A.b is not Read-Write Stable with respect to A.a (case H)
// 4644.1-4644.146: (4.5): A.b is not Read-Write Stable with respect to A.a (case I)
// 4716.1-4716.136: (3.5): A.a is not Write-Read Stable with respect to A.b (case J)
// 4717.1-4717.136: (3.5): A.a is not Write-Read Stable with respect to A.b (case K)
// 4718.1-4718.99: (3.5): A.a is not Write-Read Stable with respect to A.b (case L)
// 4792.1-4792.140: (4.5): A.b is not Write-Write Stable with respect to A.b (case A.1)
// 4793.1-4793.101: (4.5): A.b is not Write-Write Stable with respect to A.b (case A.2)
// 4794.1-4794.158: (4.5): A.b is not Write-Write Stable with respect to A.b (case A.3)
// 4893.1-4893.140: (4.5): A.b is not Write-Write Stable with respect to A.b (case C)
// 4997.1-4997.144: (4.5): A.b is not Write-Write Stable with respect to A.b (case D)
// 4998.1-4998.144: (4.5): A.b is not Write-Write Stable with respect to A.b (case R)
// 5071.1-5071.136: (4.5): A.b is not Read-Write Stable with respect to A.b (case F)
// 5072.1-5072.136: (4.5): A.b is not Read-Write Stable with respect to A.b (case H)
// 5073.1-5073.146: (4.5): A.b is not Read-Write Stable with respect to A.b (case I)
// 5145.1-5145.136: (4.5): A.b is not Write-Read Stable with respect to A.b (case J)
// 5146.1-5146.136: (4.5): A.b is not Write-Read Stable with respect to A.b (case K)
// 5147.1-5147.99: (4.5): A.b is not Write-Read Stable with respect to A.b (case L)
// 5221.1-5221.140: (5.5): A.c is not Write-Write Stable with respect to A.b (case A.1)
// 5222.1-5222.101: (5.5): A.c is not Write-Write Stable with respect to A.b (case A.2)
// 5223.1-5223.158: (5.5): A.c is not Write-Write Stable with respect to A.b (case A.3)
// 5322.1-5322.140: (4.5): A.b is not Write-Write Stable with respect to A.c (case C)
// 5426.1-5426.144: (4.5): A.b is not Write-Write Stable with respect to A.c (case D)
// 5427.1-5427.144: (4.5): A.b is not Write-Write Stable with respect to A.c (case R)
// 5500.1-5500.136: (4.5): A.b is not Read-Write Stable with respect to A.c (case F)
// 5501.1-5501.136: (4.5): A.b is not Read-Write Stable with respect to A.c (case H)
// 5502.1-5502.146: (4.5): A.b is not Read-Write Stable with respect to A.c (case I)
// 5574.1-5574.136: (5.5): A.c is not Write-Read Stable with respect to A.b (case J)
// 5575.1-5575.136: (5.5): A.c is not Write-Read Stable with respect to A.b (case K)
// 5576.1-5576.99: (5.5): A.c is not Write-Read Stable with respect to A.b (case L)
// 5650.1-5650.140: (3.5): A.a is not Write-Write Stable with respect to A.c (case A.1)
// 5651.1-5651.101: (3.5): A.a is not Write-Write Stable with respect to A.c (case A.2)
// 5652.1-5652.158: (3.5): A.a is not Write-Write Stable with respect to A.c (case A.3)
// 5751.1-5751.140: (5.5): A.c is not Write-Write Stable with respect to A.a (case C)
// 5855.1-5855.144: (5.5): A.c is not Write-Write Stable with respect to A.a (case D)
// 5856.1-5856.144: (5.5): A.c is not Write-Write Stable with respect to A.a (case R)
// 5929.1-5929.136: (5.5): A.c is not Read-Write Stable with respect to A.a (case F)
// 5930.1-5930.136: (5.5): A.c is not Read-Write Stable with respect to A.a (case H)
// 5931.1-5931.146: (5.5): A.c is not Read-Write Stable with respect to A.a (case I)
// 6003.1-6003.136: (3.5): A.a is not Write-Read Stable with respect to A.c (case J)
// 6004.1-6004.136: (3.5): A.a is not Write-Read Stable with respect to A.c (case K)
// 6005.1-6005.99: (3.5): A.a is not Write-Read Stable with respect to A.c (case L)
// 6079.1-6079.140: (4.5): A.b is not Write-Write Stable with respect to A.c (case A.1)
// 6080.1-6080.101: (4.5): A.b is not Write-Write Stable with respect to A.c (case A.2)
// 6081.1-6081.158: (4.5): A.b is not Write-Write Stable with respect to A.c (case A.3)
// 6180.1-6180.140: (5.5): A.c is not Write-Write Stable with respect to A.b (case C)
// 6284.1-6284.144: (5.5): A.c is not Write-Write Stable with respect to A.b (case D)
// 6285.1-6285.144: (5.5): A.c is not Write-Write Stable with respect to A.b (case R)
// 6358.1-6358.136: (5.5): A.c is not Read-Write Stable with respect to A.b (case F)
// 6359.1-6359.136: (5.5): A.c is not Read-Write Stable with respect to A.b (case H)
// 6360.1-6360.146: (5.5): A.c is not Read-Write Stable with respect to A.b (case I)
// 6432.1-6432.136: (4.5): A.b is not Write-Read Stable with respect to A.c (case J)
// 6433.1-6433.136: (4.5): A.b is not Write-Read Stable with respect to A.c (case K)
// 6434.1-6434.99: (4.5): A.b is not Write-Read Stable with respect to A.c (case L)
// 6508.1-6508.140: (5.5): A.c is not Write-Write Stable with respect to A.c (case A.1)
// 6509.1-6509.101: (5.5): A.c is not Write-Write Stable with respect to A.c (case A.2)
// 6510.1-6510.158: (5.5): A.c is not Write-Write Stable with respect to A.c (case A.3)
// 6609.1-6609.140: (5.5): A.c is not Write-Write Stable with respect to A.c (case C)
// 6713.1-6713.144: (5.5): A.c is not Write-Write Stable with respect to A.c (case D)
// 6714.1-6714.144: (5.5): A.c is not Write-Write Stable with respect to A.c (case R)
// 6787.1-6787.136: (5.5): A.c is not Read-Write Stable with respect to A.c (case F)
// 6788.1-6788.136: (5.5): A.c is not Read-Write Stable with respect to A.c (case H)
// 6789.1-6789.146: (5.5): A.c is not Read-Write Stable with respect to A.c (case I)
// 6861.1-6861.136: (5.5): A.c is not Write-Read Stable with respect to A.c (case J)
// 6862.1-6862.136: (5.5): A.c is not Write-Read Stable with respect to A.c (case K)
// 6863.1-6863.99: (5.5): A.c is not Write-Read Stable with respect to A.c (case L)
// 6890.1-6909.2: (3.21): yields_as clause for A.a is not valid
// 6914.1-6930.2: (3.21): yields_as clause for A.a is not reflexive
// 6936.1-6968.2: (3.21): yields_as clause for A.a is not transitive
// 6981.1-7000.2: (4.21): yields_as clause for A.b is not valid
// 7005.1-7021.2: (4.21): yields_as clause for A.b is not reflexive
// 7027.1-7059.2: (4.21): yields_as clause for A.b is not transitive
// 7072.1-7091.2: (5.21): yields_as clause for A.c is not valid
// 7096.1-7112.2: (5.21): yields_as clause for A.c is not reflexive
// 7118.1-7150.2: (5.21): yields_as clause for A.c is not transitive
// 7164.1-7183.2: (7.32): yields_as clause for A._lock is not valid
// 7188.1-7204.2: (7.32): yields_as clause for A._lock is not reflexive
// 7210.1-7242.2: (7.32): yields_as clause for A._lock is not transitive
