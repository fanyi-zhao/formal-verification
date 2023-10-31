                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/reentrant-lock.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class ReentrantLock {                                                                           
      volatile Tid m isLocal(this, tid)                                                             
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this.m == tid ? R : E                                                                    
         : this.m == Tid.null && newValue == tid                                                    
           ? R                                                                                      
           : this.m == tid && newValue == Tid.null ? L : E !                                        
        yields_as this.m == tid == (newValue == tid);                                               
                                                                                                    
                                                                                                    
       int count isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
      invariant  this.m == Tid.null == (this.count == 0);                                           
      invariant  this.m != Tid.null == this.count > 0;                                              
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Tid.null;                                                                  
        assume this.count == 0;                                                                     
        {                                                                                           
          Tid tmp1;                                                                                 
          tmp1 = Tid.null;                                                                          
          this.m := tmp1;                                                                           
          int tmp2;                                                                                 
          tmp2 = 0;                                                                                 
          this.count := tmp2;                                                                       
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void acq() {                                                                                  
        assume this.m == Tid.null || this.m == tid;                                                 
        this.m := tid;                                                                              
        int tmp3;                                                                                   
        int tmp4;                                                                                   
        tmp4 := this.count;                                                                         
        tmp3 = tmp4 + 1;                                                                            
        this.count := tmp3;                                                                         
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void rel() {                                                                                  
        Tid tmp5;                                                                                   
        tmp5 := this.m;                                                                             
        assert tmp5 == tid;                                                                         
        int tmp6;                                                                                   
        int tmp7;                                                                                   
        tmp7 := this.count;                                                                         
        tmp6 = tmp7 - 1;                                                                            
        this.count := tmp6;                                                                         
        boolean tmp8;                                                                               
        int tmp9;                                                                                   
        tmp9 := this.count;                                                                         
        tmp8 = tmp9 == 0;                                                                           
        if (tmp8 /* == this.count == 0 */) {                                                        
          Tid tmp10;                                                                                
          tmp10 = Tid.null;                                                                         
          this.m := tmp10;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Main {                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        ReentrantLock l;                                                                            
        l = new ReentrantLock();                                                                    
        l.init()                                                                                    
        l.acq()                                                                                     
        l.acq()                                                                                     
        int tmp11;                                                                                  
        tmp11 := l.count;                                                                           
        assert tmp11 == 2;                                                                          
        l.rel()                                                                                     
        yield;                                                                                      
        int tmp12;                                                                                  
        tmp12 := l.count;                                                                           
        assert tmp12 == 1;                                                                          
        l.rel()                                                                                     
        yield;                                                                                      
        int tmp13;                                                                                  
        tmp13 := l.count;                                                                           
        assert tmp13 == 1;                                                                          
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class ReentrantLock {                                                                           
      volatile Tid m isLocal(this, tid)                                                             
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this.m == tid ? R : E                                                                    
         : this.m == Tid.null && newValue == tid                                                    
           ? R                                                                                      
           : this.m == tid && newValue == Tid.null ? L : E !                                        
        yields_as this.m == tid == (newValue == tid);                                               
                                                                                                    
                                                                                                    
       int count isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.m == Tid.null == (this.count == 0);                                           
      invariant  this.m != Tid.null == this.count > 0;                                              
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Tid.null;                                                                  
        assume this.count == 0;                                                                     
        {                                                                                           
          Tid tmp1;                                                                                 
          tmp1 = Tid.null;                                                                          
          this.m := tmp1;                                                                           
          int tmp2;                                                                                 
          tmp2 = 0;                                                                                 
          this.count := tmp2;                                                                       
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void acq() {                                                                                  
        assume this.m == Tid.null || this.m == tid;                                                 
        this.m := tid;                                                                              
        int tmp3;                                                                                   
        int tmp4;                                                                                   
        tmp4 := this.count;                                                                         
        tmp3 = tmp4 + 1;                                                                            
        this.count := tmp3;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void rel() {                                                                                  
        Tid tmp5;                                                                                   
        tmp5 := this.m;                                                                             
        assert tmp5 == tid;                                                                         
        int tmp6;                                                                                   
        int tmp7;                                                                                   
        tmp7 := this.count;                                                                         
        tmp6 = tmp7 - 1;                                                                            
        this.count := tmp6;                                                                         
        boolean tmp8;                                                                               
        int tmp9;                                                                                   
        tmp9 := this.count;                                                                         
        tmp8 = tmp9 == 0;                                                                           
        if (tmp8 /* == this.count == 0 */) {                                                        
          Tid tmp10;                                                                                
          tmp10 = Tid.null;                                                                         
          this.m := tmp10;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        ReentrantLock l;                                                                            
        l = new ReentrantLock();                                                                    
        l.init()                                                                                    
        l.acq()                                                                                     
        l.acq()                                                                                     
        int tmp11;                                                                                  
        tmp11 := l.count;                                                                           
        assert tmp11 == 2;                                                                          
        l.rel()                                                                                     
        yield;                                                                                      
        int tmp12;                                                                                  
        tmp12 := l.count;                                                                           
        assert tmp12 == 1;                                                                          
        l.rel()                                                                                     
        yield;                                                                                      
        int tmp13;                                                                                  
        tmp13 := l.count;                                                                           
        assert tmp13 == 1;                                                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class ReentrantLock {                                                                           
      volatile Tid m isLocal(this, tid)                                                             
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this.m == tid ? R : E                                                                    
         : this.m == Tid.null && newValue == tid                                                    
           ? R                                                                                      
           : this.m == tid && newValue == Tid.null ? L : E !                                        
        yields_as this.m == tid == (newValue == tid);                                               
                                                                                                    
                                                                                                    
       int count isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.m == Tid.null == (this.count == 0);                                           
      invariant  this.m != Tid.null == this.count > 0;                                              
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Tid.null;                                                                  
        assume this.count == 0;                                                                     
        {                                                                                           
          Tid tmp1;                                                                                 
          tmp1 = Tid.null;                                                                          
          this.m := tmp1;                                                                           
          int tmp2;                                                                                 
          tmp2 = 0;                                                                                 
          this.count := tmp2;                                                                       
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void acq() {                                                                                  
        assume this.m == Tid.null || this.m == tid;                                                 
        this.m := tid;                                                                              
        int tmp3;                                                                                   
        int tmp4;                                                                                   
        tmp4 := this.count;                                                                         
        tmp3 = tmp4 + 1;                                                                            
        this.count := tmp3;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void rel() {                                                                                  
        Tid tmp5;                                                                                   
        tmp5 := this.m;                                                                             
        assert tmp5 == tid;                                                                         
        int tmp6;                                                                                   
        int tmp7;                                                                                   
        tmp7 := this.count;                                                                         
        tmp6 = tmp7 - 1;                                                                            
        this.count := tmp6;                                                                         
        boolean tmp8;                                                                               
        int tmp9;                                                                                   
        tmp9 := this.count;                                                                         
        tmp8 = tmp9 == 0;                                                                           
        if (tmp8 /* == this.count == 0 */) {                                                        
          Tid tmp10;                                                                                
          tmp10 = Tid.null;                                                                         
          this.m := tmp10;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        ReentrantLock l;                                                                            
        l = new ReentrantLock();                                                                    
        {                                                                                           
          inlined l.init();                                                                         
          exit$231: {                                                                               
            ReentrantLock this$231;                                                                 
            this$231 = l;                                                                           
            {                                                                                       
              assume this$231.m == Tid.null;                                                        
              assume this$231.count == 0;                                                           
              {                                                                                     
                Tid tmp1$231;                                                                       
                tmp1$231 = Tid.null;                                                                
                this$231.m := tmp1$231;                                                             
                int tmp2$231;                                                                       
                tmp2$231 = 0;                                                                       
                this$231.count := tmp2$231;                                                         
                {                                                                                   
                  break exit$231;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          inlined l.acq();                                                                          
          exit$232: {                                                                               
            ReentrantLock this$232;                                                                 
            this$232 = l;                                                                           
            {                                                                                       
              assume this$232.m == Tid.null || this$232.m == tid;                                   
              this$232.m := tid;                                                                    
              int tmp3$232;                                                                         
              int tmp4$232;                                                                         
              tmp4$232 := this$232.count;                                                           
              tmp3$232 = tmp4$232 + 1;                                                              
              this$232.count := tmp3$232;                                                           
              {                                                                                     
                break exit$232;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          inlined l.acq();                                                                          
          exit$233: {                                                                               
            ReentrantLock this$233;                                                                 
            this$233 = l;                                                                           
            {                                                                                       
              assume this$233.m == Tid.null || this$233.m == tid;                                   
              this$233.m := tid;                                                                    
              int tmp3$233;                                                                         
              int tmp4$233;                                                                         
              tmp4$233 := this$233.count;                                                           
              tmp3$233 = tmp4$233 + 1;                                                              
              this$233.count := tmp3$233;                                                           
              {                                                                                     
                break exit$233;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        int tmp11;                                                                                  
        tmp11 := l.count;                                                                           
        assert tmp11 == 2;                                                                          
        {                                                                                           
          inlined l.rel();                                                                          
          exit$234: {                                                                               
            ReentrantLock this$234;                                                                 
            this$234 = l;                                                                           
            {                                                                                       
              Tid tmp5$234;                                                                         
              tmp5$234 := this$234.m;                                                               
              assert tmp5$234 == tid;                                                               
              int tmp6$234;                                                                         
              int tmp7$234;                                                                         
              tmp7$234 := this$234.count;                                                           
              tmp6$234 = tmp7$234 - 1;                                                              
              this$234.count := tmp6$234;                                                           
              boolean tmp8$234;                                                                     
              int tmp9$234;                                                                         
              tmp9$234 := this$234.count;                                                           
              tmp8$234 = tmp9$234 == 0;                                                             
              if (tmp8$234 /* == this$234.count == 0 */) {                                          
                Tid tmp10$234;                                                                      
                tmp10$234 = Tid.null;                                                               
                this$234.m := tmp10$234;                                                            
              } else {                                                                              
                                                                                                    
              }                                                                                     
              {                                                                                     
                break exit$234;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        yield;                                                                                      
        int tmp12;                                                                                  
        tmp12 := l.count;                                                                           
        assert tmp12 == 1;                                                                          
        {                                                                                           
          inlined l.rel();                                                                          
          exit$235: {                                                                               
            ReentrantLock this$235;                                                                 
            this$235 = l;                                                                           
            {                                                                                       
              Tid tmp5$235;                                                                         
              tmp5$235 := this$235.m;                                                               
              assert tmp5$235 == tid;                                                               
              int tmp6$235;                                                                         
              int tmp7$235;                                                                         
              tmp7$235 := this$235.count;                                                           
              tmp6$235 = tmp7$235 - 1;                                                              
              this$235.count := tmp6$235;                                                           
              boolean tmp8$235;                                                                     
              int tmp9$235;                                                                         
              tmp9$235 := this$235.count;                                                           
              tmp8$235 = tmp9$235 == 0;                                                             
              if (tmp8$235 /* == this$235.count == 0 */) {                                          
                Tid tmp10$235;                                                                      
                tmp10$235 = Tid.null;                                                               
                this$235.m := tmp10$235;                                                            
              } else {                                                                              
                                                                                                    
              }                                                                                     
              {                                                                                     
                break exit$235;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        yield;                                                                                      
        int tmp13;                                                                                  
        tmp13 := l.count;                                                                           
        assert tmp13 == 1;                                                                          
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class ReentrantLock {                                                                           
      volatile Tid m isLocal(this, tid)                                                             
       ? isRead                                                                                     
         ? B                                                                                        
         : newValue == tid || newValue == Tid.null ? B : E                                          
       : isRead                                                                                     
         ? this.m == tid ? R : E                                                                    
         : this.m == Tid.null && newValue == tid                                                    
           ? R                                                                                      
           : this.m == tid && newValue == Tid.null ? L : E !                                        
        yields_as this.m == tid == (newValue == tid);                                               
                                                                                                    
                                                                                                    
       int count isLocal(this, tid)                                                                 
       ? isLocal(this, tid) ? B : E                                                                 
       : holds(this, tid) ? B : E                                                                   
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.m == Tid.null == (this.count == 0);                                           
      invariant  this.m != Tid.null == this.count > 0;                                              
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.m == Tid.null;                                                                  
        assume this.count == 0;                                                                     
        {                                                                                           
          Tid tmp1;                                                                                 
          tmp1 = Tid.null;                                                                          
          this.m := tmp1;                                                                           
          int tmp2;                                                                                 
          tmp2 = 0;                                                                                 
          this.count := tmp2;                                                                       
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void acq() {                                                                                  
        assume this.m == Tid.null || this.m == tid;                                                 
        this.m := tid;                                                                              
        int tmp3;                                                                                   
        int tmp4;                                                                                   
        tmp4 := this.count;                                                                         
        tmp3 = tmp4 + 1;                                                                            
        this.count := tmp3;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void rel() {                                                                                  
        Tid tmp5;                                                                                   
        tmp5 := this.m;                                                                             
        assert tmp5 == tid;                                                                         
        int tmp6;                                                                                   
        int tmp7;                                                                                   
        tmp7 := this.count;                                                                         
        tmp6 = tmp7 - 1;                                                                            
        this.count := tmp6;                                                                         
        boolean tmp8;                                                                               
        int tmp9;                                                                                   
        tmp9 := this.count;                                                                         
        tmp8 = tmp9 == 0;                                                                           
        if (tmp8 /* == this.count == 0 */) {                                                        
          Tid tmp10;                                                                                
          tmp10 = Tid.null;                                                                         
          this.m := tmp10;                                                                          
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        ReentrantLock l;                                                                            
        l = new ReentrantLock();                                                                    
        {                                                                                           
          inlined l.init();                                                                         
          exit$231: {                                                                               
            ReentrantLock this$231;                                                                 
            this$231 = l;                                                                           
            {                                                                                       
              assume this$231.m == Tid.null;                                                        
              assume this$231.count == 0;                                                           
              {                                                                                     
                Tid tmp1$231;                                                                       
                tmp1$231 = Tid.null;                                                                
                this$231.m := tmp1$231;                                                             
                int tmp2$231;                                                                       
                tmp2$231 = 0;                                                                       
                this$231.count := tmp2$231;                                                         
                {                                                                                   
                  break exit$231;                                                                   
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          inlined l.acq();                                                                          
          exit$232: {                                                                               
            ReentrantLock this$232;                                                                 
            this$232 = l;                                                                           
            {                                                                                       
              assume this$232.m == Tid.null || this$232.m == tid;                                   
              this$232.m := tid;                                                                    
              int tmp3$232;                                                                         
              int tmp4$232;                                                                         
              tmp4$232 := this$232.count;                                                           
              tmp3$232 = tmp4$232 + 1;                                                              
              this$232.count := tmp3$232;                                                           
              {                                                                                     
                break exit$232;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          inlined l.acq();                                                                          
          exit$233: {                                                                               
            ReentrantLock this$233;                                                                 
            this$233 = l;                                                                           
            {                                                                                       
              assume this$233.m == Tid.null || this$233.m == tid;                                   
              this$233.m := tid;                                                                    
              int tmp3$233;                                                                         
              int tmp4$233;                                                                         
              tmp4$233 := this$233.count;                                                           
              tmp3$233 = tmp4$233 + 1;                                                              
              this$233.count := tmp3$233;                                                           
              {                                                                                     
                break exit$233;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        int tmp11;                                                                                  
        tmp11 := l.count;                                                                           
        assert tmp11 == 2;                                                                          
        {                                                                                           
          inlined l.rel();                                                                          
          exit$234: {                                                                               
            ReentrantLock this$234;                                                                 
            this$234 = l;                                                                           
            {                                                                                       
              Tid tmp5$234;                                                                         
              tmp5$234 := this$234.m;                                                               
              assert tmp5$234 == tid;                                                               
              int tmp6$234;                                                                         
              int tmp7$234;                                                                         
              tmp7$234 := this$234.count;                                                           
              tmp6$234 = tmp7$234 - 1;                                                              
              this$234.count := tmp6$234;                                                           
              boolean tmp8$234;                                                                     
              int tmp9$234;                                                                         
              tmp9$234 := this$234.count;                                                           
              tmp8$234 = tmp9$234 == 0;                                                             
              if (tmp8$234 /* == this$234.count == 0 */) {                                          
                Tid tmp10$234;                                                                      
                tmp10$234 = Tid.null;                                                               
                this$234.m := tmp10$234;                                                            
              } else {                                                                              
                                                                                                    
              }                                                                                     
              {                                                                                     
                break exit$234;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        yield;                                                                                      
        int tmp12;                                                                                  
        tmp12 := l.count;                                                                           
        assert tmp12 == 1;                                                                          
        {                                                                                           
          inlined l.rel();                                                                          
          exit$235: {                                                                               
            ReentrantLock this$235;                                                                 
            this$235 = l;                                                                           
            {                                                                                       
              Tid tmp5$235;                                                                         
              tmp5$235 := this$235.m;                                                               
              assert tmp5$235 == tid;                                                               
              int tmp6$235;                                                                         
              int tmp7$235;                                                                         
              tmp7$235 := this$235.count;                                                           
              tmp6$235 = tmp7$235 - 1;                                                              
              this$235.count := tmp6$235;                                                           
              boolean tmp8$235;                                                                     
              int tmp9$235;                                                                         
              tmp9$235 := this$235.count;                                                           
              tmp8$235 = tmp9$235 == 0;                                                             
              if (tmp8$235 /* == this$235.count == 0 */) {                                          
                Tid tmp10$235;                                                                      
                tmp10$235 = Tid.null;                                                               
                this$235.m := tmp10$235;                                                            
              } else {                                                                              
                                                                                                    
              }                                                                                     
              {                                                                                     
                break exit$235;                                                                     
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        yield;                                                                                      
        int tmp13;                                                                                  
        tmp13 := l.count;                                                                           
        assert tmp13 == 1;                                                                          
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
                                                                                                    
                                                                                                    
/*** Class Decl ReentrantLock ***/                                                                  
                                                                                                    
type ReentrantLock;                                                                                 
const unique ReentrantLock.null: ReentrantLock;                                                     
var ReentrantLock._state: [ReentrantLock]State;                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var ReentrantLock.m: [ReentrantLock]Tid;                                                            
                                                                                                    
function {:inline} ReadEval.ReentrantLock.m(tid: Tid,this : ReentrantLock,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(ReentrantLock._state[this], tid)) then                                                 
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ReentrantLock.m[this]==tid)) then                                                           
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ReentrantLock.m[this]==Tid.null)&&(newValue==tid))) then                                   
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ReentrantLock.m[this]==tid)&&(newValue==Tid.null))) then                                  
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ReentrantLock.m(tid: Tid,this : ReentrantLock,newValue: Tid,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(ReentrantLock._state[this], tid)) then                                                 
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ReentrantLock.m[this]==tid)) then                                                           
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ReentrantLock.m[this]==Tid.null)&&(newValue==tid))) then                                   
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ReentrantLock.m[this]==tid)&&(newValue==Tid.null))) then                                  
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var ReentrantLock.count: [ReentrantLock]int;                                                        
                                                                                                    
function {:inline} ReadEval.ReentrantLock.count(tid: Tid,this : ReentrantLock,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(ReentrantLock._state[this], tid)) then                                                 
  if (isLocal(ReentrantLock._state[this], tid)) then                                                
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(ReentrantLock._state[this], tid) && ReentrantLock._lock[this] == tid)) then     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ReentrantLock.count(tid: Tid,this : ReentrantLock,newValue: int,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(ReentrantLock._state[this], tid)) then                                                 
  if (isLocal(ReentrantLock._state[this], tid)) then                                                
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if ((isAccessible(ReentrantLock._state[this], tid) && ReentrantLock._lock[this] == tid)) then     
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var ReentrantLock._lock: [ReentrantLock]Tid;                                                        
                                                                                                    
function {:inline} ReadEval.ReentrantLock._lock(tid: Tid,this : ReentrantLock,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(ReentrantLock._state[this], tid)) then                                                 
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ReentrantLock._lock[this]==tid)) then                                                       
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ReentrantLock._lock[this]==Tid.null)&&(newValue==tid))) then                               
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ReentrantLock._lock[this]==tid)&&(newValue==Tid.null))) then                              
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.ReentrantLock._lock(tid: Tid,this : ReentrantLock,newValue: Tid,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(ReentrantLock._state[this], tid)) then                                                 
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((ReentrantLock._lock[this]==tid)) then                                                       
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((ReentrantLock._lock[this]==Tid.null)&&(newValue==tid))) then                               
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((ReentrantLock._lock[this]==tid)&&(newValue==Tid.null))) then                              
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.ReentrantLock.3618241(tid: Tid,this : ReentrantLock,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 ((ReentrantLock.m[this]==Tid.null)==(ReentrantLock.count[this]==0))                                
}                                                                                                   
                                                                                                    
function {:inline} Invariant.ReentrantLock.3618256(tid: Tid,this : ReentrantLock,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
 ((ReentrantLock.m[this]!=Tid.null)==(ReentrantLock.count[this]>0))                                 
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Main ***/                                                                           
                                                                                                    
type Main;                                                                                          
const unique Main.null: Main;                                                                       
var Main._state: [Main]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Main._lock: [Main]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Main._lock(tid: Tid,this : Main,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Main._lock(tid: Tid,this : Main,newValue: Tid,ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (MoverPath) {
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
modifies ReentrantLock._state;                                                                      
modifies ReentrantLock.m;                                                                           
modifies ReentrantLock.count;                                                                       
modifies ReentrantLock._lock;                                                                       
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
                                                                                                    
requires ValidTid(tid);                                                                                    // (38.5): Bad tid
requires isShared(Main._state[this]);                                                                      // (38.5): this is not global
                                                                                                    
requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (38.5): Object invariant may not hold.
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (38.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
ensures  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (38.5): Object invariant may not hold.
ensures  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (38.5): Object invariant may not hold.
{                                                                                                   
 var tid3624451: Tid;                                                                               
 var ReentrantLock.m3624630: [ReentrantLock]Tid;                                                    
 var l3624630: ReentrantLock;                                                                       
 var ReentrantLock.m3624676: [ReentrantLock]Tid;                                                    
 var tid3624561: Tid;                                                                               
 var Main._lock3624676: [Main]Tid;                                                                  
 var this3624408: Main;                                                                             
 var ReentrantLock._state3624547: [ReentrantLock]State;                                             
 var $recorded.state3624618_post: int;                                                              
 var ReentrantLock.count3624618_post: [ReentrantLock]int;                                           
 var tmp113624547: int;                                                                             
 var this$2313624408: ReentrantLock;                                                                
 var this3624547: Main;                                                                             
 var tmp4$2333624513: int;                                                                          
 var ReentrantLock._state3624726: [ReentrantLock]State;                                             
 var moverPath3624701: MoverPath;                                                                   
 var ReentrantLock.m3624714: [ReentrantLock]Tid;                                                    
 var ReentrantLock._lock3624618: [ReentrantLock]Tid;                                                
 var mover3624442: Mover;                                                                           
 var this$231: ReentrantLock;                                                                       
 var tid3624605: Tid;                                                                               
 var $recorded.state3624727: int;                                                                   
 var tmp4$2323624461: int;                                                                          
 var Main._lock3624726: [Main]Tid;                                                                  
 var l3624451: ReentrantLock;                                                                       
 var tmp3$2333624503: int;                                                                          
 var Main._lock3624605: [Main]Tid;                                                                  
 var ReentrantLock.count3624580: [ReentrantLock]int;                                                
 var Main._lock3624624: [Main]Tid;                                                                  
 var tid3624720: Tid;                                                                               
 var $pc3624720: Phase;                                                                             
 var this3624657: Main;                                                                             
 var ReentrantLock._state3624528: [ReentrantLock]State;                                             
 var this$2313624398: ReentrantLock;                                                                
 var ReentrantLock._state3624534: [ReentrantLock]State;                                             
 var moverPath3624720: MoverPath;                                                                   
 var tid3624513: Tid;                                                                               
 var tmp113624534: int;                                                                             
 var this$233: ReentrantLock;                                                                       
 var ReentrantLock.count3624451: [ReentrantLock]int;                                                
 var tmp1$231: Tid;                                                                                 
 var tmp123624667: int;                                                                             
 var this$2343624571: ReentrantLock;                                                                
 var $pc3624503: Phase;                                                                             
 var tmp6$2353624667: int;                                                                          
 var $pc3624547: Phase;                                                                             
 var ReentrantLock._state3624398: [ReentrantLock]State;                                             
 var tid3624701: Tid;                                                                               
 var path3624720: int;                                                                              
 var ReentrantLock.count3624624: [ReentrantLock]int;                                                
 var $pc3624643: Phase;                                                                             
 var $recorded.state3624667: int;                                                                   
 var Main._state3624630: [Main]State;                                                               
 var $pc3624461: Phase;                                                                             
 var $pc3624552: Phase;                                                                             
 var mover3624398: Mover;                                                                           
 var $recorded.state3624657: int;                                                                   
 var ReentrantLock._state3624727: [ReentrantLock]State;                                             
 var $pc3624727: Phase;                                                                             
 var tmp9$234: int;                                                                                 
 var $pc3624657: Phase;                                                                             
 var this3624618: Main;                                                                             
 var ReentrantLock._state3624571: [ReentrantLock]State;                                             
 var Main._lock3624503: [Main]Tid;                                                                  
 var this3624442: Main;                                                                             
 var Main._state3624528: [Main]State;                                                               
 var tmp113624720: int;                                                                             
 var tmp3$232: int;                                                                                 
 var tmp123624714: int;                                                                             
 var this$2343624552: ReentrantLock;                                                                
 var tmp6$2343624571: int;                                                                          
 var mover3624676: Mover;                                                                           
 var ReentrantLock.count3624714_post: [ReentrantLock]int;                                           
 var l3624701: ReentrantLock;                                                                       
 var ReentrantLock.count3624720: [ReentrantLock]int;                                                
 var Main._state3624624: [Main]State;                                                               
 var tmp4$233: int;                                                                                 
 var tid3624676: Tid;                                                                               
 var tmp7$2353624667: int;                                                                          
 var ReentrantLock._state3624720: [ReentrantLock]State;                                             
 var tmp3$2323624451: int;                                                                          
 var moverPath3624461: MoverPath;                                                                   
 var path3624461: int;                                                                              
 var ReentrantLock.count3624701: [ReentrantLock]int;                                                
 var mover3624561: Mover;                                                                           
 var $recorded.state3624571: int;                                                                   
 var $recorded.state3624618: int;                                                                   
 var ReentrantLock.m3624643: [ReentrantLock]Tid;                                                    
 var ReentrantLock.m3624494: [ReentrantLock]Tid;                                                    
 var tid3624494: Tid;                                                                               
 var ReentrantLock._state3624503: [ReentrantLock]State;                                             
 var l3624676: ReentrantLock;                                                                       
 var $recorded.state3624461: int;                                                                   
 var this$2343624561: ReentrantLock;                                                                
 var ReentrantLock.count3624657: [ReentrantLock]int;                                                
 var tid3624648: Tid;                                                                               
 var tid3624571: Tid;                                                                               
 var $recorded.state3624528: int;                                                                   
 var tmp123624648: int;                                                                             
 var this3624605: Main;                                                                             
 var l3624727: ReentrantLock;                                                                       
 var Main._lock3624571: [Main]Tid;                                                                  
 var $pc3624630: Phase;                                                                             
 var tmp5$234: Tid;                                                                                 
 var tmp113624528: int;                                                                             
 var this$2333624494: ReentrantLock;                                                                
 var ReentrantLock._state3624513: [ReentrantLock]State;                                             
 var $recorded.state3624605: int;                                                                   
 var ReentrantLock.count3624648: [ReentrantLock]int;                                                
 var tmp113624571: int;                                                                             
 var this$2353624701: ReentrantLock;                                                                
 var ReentrantLock._lock3624727: [ReentrantLock]Tid;                                                
 var this$2323624461: ReentrantLock;                                                                
 var this3624727: Main;                                                                             
 var ReentrantLock.count3624643: [ReentrantLock]int;                                                
 var Main._state3624534: [Main]State;                                                               
 var ReentrantLock._lock3624571: [ReentrantLock]Tid;                                                
 var moverPath3624605: MoverPath;                                                                   
 var ReentrantLock._lock3624714_post: [ReentrantLock]Tid;                                           
 var ReentrantLock._state3624714_post: [ReentrantLock]State;                                        
 var tmp5$2353624667: Tid;                                                                          
 var moverPath3624503: MoverPath;                                                                   
 var ReentrantLock.m3624571: [ReentrantLock]Tid;                                                    
 var $recorded.state3624552: int;                                                                   
 var ReentrantLock.count3624618: [ReentrantLock]int;                                                
 var Main._lock3624513: [Main]Tid;                                                                  
 var tmp3$2323624461: int;                                                                          
 var $pc3624726: Phase;                                                                             
 var l3624726: ReentrantLock;                                                                       
 var this3624561: Main;                                                                             
 var $recorded.state3624624: int;                                                                   
 var $recorded.state3624701: int;                                                                   
 var l3624624: ReentrantLock;                                                                       
 var ReentrantLock.count3624630: [ReentrantLock]int;                                                
 var ReentrantLock._state3624624: [ReentrantLock]State;                                             
 var mover3624624: Mover;                                                                           
 var moverPath3624442: MoverPath;                                                                   
 var this3624580: Main;                                                                             
 var l3624667: ReentrantLock;                                                                       
 var Main._lock3624667: [Main]Tid;                                                                  
 var ReentrantLock.count3624714: [ReentrantLock]int;                                                
 var tmp5$2353624676: Tid;                                                                          
 var ReentrantLock.m3624561: [ReentrantLock]Tid;                                                    
 var $recorded.state3624726: int;                                                                   
 var ReentrantLock._lock3624528: [ReentrantLock]Tid;                                                
 var path3624561: int;                                                                              
 var this3624528: Main;                                                                             
 var ReentrantLock.count3624534: [ReentrantLock]int;                                                
 var this3624513: Main;                                                                             
 var tmp123624701: int;                                                                             
 var Main._lock3624552: [Main]Tid;                                                                  
 var $recorded.state3624442: int;                                                                   
 var ReentrantLock._lock3624503: [ReentrantLock]Tid;                                                
 var ReentrantLock.m3624513: [ReentrantLock]Tid;                                                    
 var tmp123624643: int;                                                                             
 var ReentrantLock.m3624726: [ReentrantLock]Tid;                                                    
 var tmp5$2353624643: Tid;                                                                          
 var $recorded.state3624580: int;                                                                   
 var tmp9$235: int;                                                                                 
 var this$235: ReentrantLock;                                                                       
 var tmp8$2353624676: bool;                                                                         
 var tmp8$235: bool;                                                                                
 var this3624643: Main;                                                                             
 var l3624605: ReentrantLock;                                                                       
 var $recorded.state3624503: int;                                                                   
 var mover3624408: Mover;                                                                           
 var ReentrantLock.count3624528: [ReentrantLock]int;                                                
 var l3624714_post: ReentrantLock;                                                                  
 var l3624580: ReentrantLock;                                                                       
 var tmp113624580: int;                                                                             
 var Main._lock3624657: [Main]Tid;                                                                  
 var Main._lock3624398: [Main]Tid;                                                                  
 var tid3624727: Tid;                                                                               
 var ReentrantLock.m3624503: [ReentrantLock]Tid;                                                    
 var ReentrantLock.m3624618: [ReentrantLock]Tid;                                                    
 var l: ReentrantLock;                                                                              
 var tmp113624618: int;                                                                             
 var tid3624624: Tid;                                                                               
 var ReentrantLock._lock3624630: [ReentrantLock]Tid;                                                
 var tmp123624714_post: int;                                                                        
 var ReentrantLock.m3624701: [ReentrantLock]Tid;                                                    
 var tmp123624630: int;                                                                             
 var ReentrantLock._state3624451: [ReentrantLock]State;                                             
 var $pc3624398: Phase;                                                                             
 var tmp10$235: Tid;                                                                                
 var tmp5$2343624561: Tid;                                                                          
 var this3624701: Main;                                                                             
 var Main._lock3624494: [Main]Tid;                                                                  
 var mover3624528: Mover;                                                                           
 var tid3624580: Tid;                                                                               
 var tid3624552: Tid;                                                                               
 var Main._lock3624727: [Main]Tid;                                                                  
 var tmp9$2353624676: int;                                                                          
 var l3624618: ReentrantLock;                                                                       
 var this3624534: Main;                                                                             
 var this3624624: Main;                                                                             
 var tmp123624657: int;                                                                             
 var Main._state3624408: [Main]State;                                                               
 var ReentrantLock._state3624701: [ReentrantLock]State;                                             
 var ReentrantLock._lock3624461: [ReentrantLock]Tid;                                                
 var tmp113624667: int;                                                                             
 var $pc3624408: Phase;                                                                             
 var ReentrantLock._lock3624442: [ReentrantLock]Tid;                                                
 var $pc3624714: Phase;                                                                             
 var path3624451: int;                                                                              
 var tmp7$2343624580: int;                                                                          
 var Main._lock3624528: [Main]Tid;                                                                  
 var l3624552: ReentrantLock;                                                                       
 var ReentrantLock._state3624552: [ReentrantLock]State;                                             
 var Main._lock3624618: [Main]Tid;                                                                  
 var tid3624503: Tid;                                                                               
 var ReentrantLock._state3624630: [ReentrantLock]State;                                             
 var tmp5$2343624571: Tid;                                                                          
 var $recorded.state3624720: int;                                                                   
 var moverPath3624561: MoverPath;                                                                   
 var this$2343624580: ReentrantLock;                                                                
 var $recorded.state3624547: int;                                                                   
 var tid3624534: Tid;                                                                               
 var l3624513: ReentrantLock;                                                                       
 var tid3624657: Tid;                                                                               
 var tmp5$2343624547: Tid;                                                                          
 var tmp9$2343624605: int;                                                                          
 var tmp6$2343624561: int;                                                                          
 var Main._state3624398: [Main]State;                                                               
 var this$2333624513: ReentrantLock;                                                                
 var l3624714: ReentrantLock;                                                                       
 var tid3624547: Tid;                                                                               
 var ReentrantLock._state3624442: [ReentrantLock]State;                                             
 var tmp113624726: int;                                                                             
 var path3624676: int;                                                                              
 var $recorded.state3624451: int;                                                                   
 var $pc3624605: Phase;                                                                             
 var l3624561: ReentrantLock;                                                                       
 var tmp2$2313624408: int;                                                                          
 var ReentrantLock.m3624461: [ReentrantLock]Tid;                                                    
 var this3624571: Main;                                                                             
 var tmp4$2333624503: int;                                                                          
 var ReentrantLock.count3624552: [ReentrantLock]int;                                                
 var tmp4$232: int;                                                                                 
 var this3624726: Main;                                                                             
 var tmp7$234: int;                                                                                 
 var Main._lock3624408: [Main]Tid;                                                                  
 var tid3624618_post: Tid;                                                                          
 var tid3624442: Tid;                                                                               
 var ReentrantLock.count3624547: [ReentrantLock]int;                                                
 var mover3624701: Mover;                                                                           
 var tmp8$2343624580: bool;                                                                         
 var Main._state3624451: [Main]State;                                                               
 var path3624580: int;                                                                              
 var path3624547: int;                                                                              
 var this3624552: Main;                                                                             
 var ReentrantLock._state3624714: [ReentrantLock]State;                                             
 var tid3624630: Tid;                                                                               
 var ReentrantLock._lock3624534: [ReentrantLock]Tid;                                                
 var tmp9$2353624701: int;                                                                          
 var this$234: ReentrantLock;                                                                       
 var Main._state3624442: [Main]State;                                                               
 var tmp11: int;                                                                                    
 var $pc3624513: Phase;                                                                             
 var ReentrantLock.count3624494: [ReentrantLock]int;                                                
 var tmp10$2353624701: Tid;                                                                         
 var ReentrantLock._state3624408: [ReentrantLock]State;                                             
 var $pc3624571: Phase;                                                                             
 var tmp123624727: int;                                                                             
 var ReentrantLock.count3624667: [ReentrantLock]int;                                                
 var $recorded.state3624648: int;                                                                   
 var Main._state3624461: [Main]State;                                                               
 var mover3624494: Mover;                                                                           
 var $recorded.state3624534: int;                                                                   
 var tmp123624676: int;                                                                             
 var Main._lock3624714_post: [Main]Tid;                                                             
 var this3624398: Main;                                                                             
 var tmp113624605: int;                                                                             
 var ReentrantLock._lock3624552: [ReentrantLock]Tid;                                                
 var tmp113624657: int;                                                                             
 var this3624451: Main;                                                                             
 var l3624534: ReentrantLock;                                                                       
 var this$2353624667: ReentrantLock;                                                                
 var ReentrantLock._lock3624451: [ReentrantLock]Tid;                                                
 var mover3624451: Mover;                                                                           
 var l3624618_post: ReentrantLock;                                                                  
 var ReentrantLock.m3624648: [ReentrantLock]Tid;                                                    
 var tmp5$2353624701: Tid;                                                                          
 var tmp5$2353624648: Tid;                                                                          
 var ReentrantLock.m3624618_post: [ReentrantLock]Tid;                                               
 var tmp6$2353624657: int;                                                                          
 var tid3624726: Tid;                                                                               
 var l3624461: ReentrantLock;                                                                       
 var l3624494: ReentrantLock;                                                                       
 var mover3624513: Mover;                                                                           
 var ReentrantLock.m3624547: [ReentrantLock]Tid;                                                    
 var ReentrantLock.m3624720: [ReentrantLock]Tid;                                                    
 var ReentrantLock.count3624398: [ReentrantLock]int;                                                
 var moverPath3624547: MoverPath;                                                                   
 var mover3624461: Mover;                                                                           
 var $pc3624528: Phase;                                                                             
 var ReentrantLock._lock3624726: [ReentrantLock]Tid;                                                
 var $pc3624442: Phase;                                                                             
 var tid3624667: Tid;                                                                               
 var Main._state3624676: [Main]State;                                                               
 var moverPath3624571: MoverPath;                                                                   
 var ReentrantLock.m3624528: [ReentrantLock]Tid;                                                    
 var ReentrantLock.m3624605: [ReentrantLock]Tid;                                                    
 var path3624605: int;                                                                              
 var Main._state3624494: [Main]State;                                                               
 var mover3624643: Mover;                                                                           
 var Main._state3624618_post: [Main]State;                                                          
 var ReentrantLock._lock3624513: [ReentrantLock]Tid;                                                
 var $pc3624534: Phase;                                                                             
 var ReentrantLock._state3624657: [ReentrantLock]State;                                             
 var Main._lock3624714: [Main]Tid;                                                                  
 var this$2323624451: ReentrantLock;                                                                
 var path3624398: int;                                                                              
 var Main._lock3624442: [Main]Tid;                                                                  
 var ReentrantLock._lock3624667: [ReentrantLock]Tid;                                                
 var ReentrantLock.m3624451: [ReentrantLock]Tid;                                                    
 var ReentrantLock._state3624561: [ReentrantLock]State;                                             
 var Main._lock3624618_post: [Main]Tid;                                                             
 var tmp113624714: int;                                                                             
 var $pc3624667: Phase;                                                                             
 var tmp1$2313624408: Tid;                                                                          
 var ReentrantLock._lock3624676: [ReentrantLock]Tid;                                                
 var tmp123624624: int;                                                                             
 var this3624714_post: Main;                                                                        
 var moverPath3624643: MoverPath;                                                                   
 var moverPath3624513: MoverPath;                                                                   
 var moverPath3624494: MoverPath;                                                                   
 var Main._state3624513: [Main]State;                                                               
 var path3624657: int;                                                                              
 var tmp113624618_post: int;                                                                        
 var tmp123624720: int;                                                                             
 var Main._state3624547: [Main]State;                                                               
 var tmp6$2353624701: int;                                                                          
 var ReentrantLock._state3624676: [ReentrantLock]State;                                             
 var this$2323624442: ReentrantLock;                                                                
 var moverPath3624580: MoverPath;                                                                   
 var ReentrantLock.count3624726: [ReentrantLock]int;                                                
 var l3624571: ReentrantLock;                                                                       
 var tmp133624726: int;                                                                             
 var tid3624714_post: Tid;                                                                          
 var $pc3624580: Phase;                                                                             
 var $pc3624676: Phase;                                                                             
 var tmp13: int;                                                                                    
 var tmp113624552: int;                                                                             
 var Main._state3624720: [Main]State;                                                               
 var l3624503: ReentrantLock;                                                                       
 var $pc3624714_post: Phase;                                                                        
 var Main._lock3624643: [Main]Tid;                                                                  
 var this3624720: Main;                                                                             
 var ReentrantLock._state3624494: [ReentrantLock]State;                                             
 var ReentrantLock._state3624648: [ReentrantLock]State;                                             
 var moverPath3624408: MoverPath;                                                                   
 var moverPath3624451: MoverPath;                                                                   
 var $pc3624624: Phase;                                                                             
 var tmp113624676: int;                                                                             
 var Main._lock3624547: [Main]Tid;                                                                  
 var Main._state3624726: [Main]State;                                                               
 var tid3624461: Tid;                                                                               
 var tmp113624630: int;                                                                             
 var ReentrantLock.count3624442: [ReentrantLock]int;                                                
 var ReentrantLock.count3624461: [ReentrantLock]int;                                                
 var this$2353624676: ReentrantLock;                                                                
 var $pc3624494: Phase;                                                                             
 var path3624442: int;                                                                              
 var Main._lock3624720: [Main]Tid;                                                                  
 var tmp1$2313624398: Tid;                                                                          
 var path3624408: int;                                                                              
 var this3624676: Main;                                                                             
 var Main._lock3624630: [Main]Tid;                                                                  
 var tmp9$2343624580: int;                                                                          
 var mover3624605: Mover;                                                                           
 var moverPath3624398: MoverPath;                                                                   
 var tid3624528: Tid;                                                                               
 var tmp8$2353624701: bool;                                                                         
 var path3624624: int;                                                                              
 var this3624503: Main;                                                                             
 var $recorded.state3624630: int;                                                                   
 var Main._lock3624561: [Main]Tid;                                                                  
 var Main._state3624503: [Main]State;                                                               
 var l3624408: ReentrantLock;                                                                       
 var $recorded.state3624513: int;                                                                   
 var ReentrantLock.count3624605: [ReentrantLock]int;                                                
 var tid3624714: Tid;                                                                               
 var Main._state3624667: [Main]State;                                                               
 var tmp6$2343624605: int;                                                                          
 var this$2353624648: ReentrantLock;                                                                
 var path3624513: int;                                                                              
 var tmp7$2353624657: int;                                                                          
 var tmp113624561: int;                                                                             
 var tmp113624624: int;                                                                             
 var tmp113624648: int;                                                                             
 var tmp8$234: bool;                                                                                
 var $recorded.state3624408: int;                                                                   
 var Main._lock3624451: [Main]Tid;                                                                  
 var mover3624580: Mover;                                                                           
 var tmp5$2343624605: Tid;                                                                          
 var tmp5$235: Tid;                                                                                 
 var this$2333624503: ReentrantLock;                                                                
 var Main._state3624657: [Main]State;                                                               
 var Main._state3624580: [Main]State;                                                               
 var Main._state3624605: [Main]State;                                                               
 var tmp2$231: int;                                                                                 
 var ReentrantLock._lock3624618_post: [ReentrantLock]Tid;                                           
 var this3624667: Main;                                                                             
 var tmp8$2343624605: bool;                                                                         
 var tmp12: int;                                                                                    
 var ReentrantLock._state3624618: [ReentrantLock]State;                                             
 var ReentrantLock.m3624727: [ReentrantLock]Tid;                                                    
 var moverPath3624624: MoverPath;                                                                   
 var tmp7$2353624701: int;                                                                          
 var ReentrantLock._lock3624643: [ReentrantLock]Tid;                                                
 var this$232: ReentrantLock;                                                                       
 var this$2353624643: ReentrantLock;                                                                
 var l3624442: ReentrantLock;                                                                       
 var ReentrantLock.m3624624: [ReentrantLock]Tid;                                                    
 var ReentrantLock._state3624667: [ReentrantLock]State;                                             
 var tmp133624720: int;                                                                             
 var ReentrantLock.m3624714_post: [ReentrantLock]Tid;                                               
 var tmp6$2343624580: int;                                                                          
 var Main._state3624552: [Main]State;                                                               
 var ReentrantLock._lock3624408: [ReentrantLock]Tid;                                                
 var tmp5$2343624580: Tid;                                                                          
 var ReentrantLock.m3624534: [ReentrantLock]Tid;                                                    
 var tmp5$2343624552: Tid;                                                                          
 var this3624494: Main;                                                                             
 var tmp6$234: int;                                                                                 
 var tmp133624727: int;                                                                             
 var ReentrantLock._lock3624714: [ReentrantLock]Tid;                                                
 var $recorded.state3624643: int;                                                                   
 var ReentrantLock._lock3624494: [ReentrantLock]Tid;                                                
 var tmp7$2353624676: int;                                                                          
 var ReentrantLock.count3624676: [ReentrantLock]int;                                                
 var tmp7$235: int;                                                                                 
 var Main._state3624701: [Main]State;                                                               
 var ReentrantLock.count3624561: [ReentrantLock]int;                                                
 var l3624657: ReentrantLock;                                                                       
 var tid3624398: Tid;                                                                               
 var $recorded.state3624494: int;                                                                   
 var tid3624408: Tid;                                                                               
 var tmp7$2343624571: int;                                                                          
 var tmp6$2353624676: int;                                                                          
 var mover3624503: Mover;                                                                           
 var Main._state3624714_post: [Main]State;                                                          
 var l3624547: ReentrantLock;                                                                       
 var this3624630: Main;                                                                             
 var $pc3624618_post: Phase;                                                                        
 var ReentrantLock._lock3624580: [ReentrantLock]Tid;                                                
 var ReentrantLock.m3624667: [ReentrantLock]Tid;                                                    
 var ReentrantLock._lock3624605: [ReentrantLock]Tid;                                                
 var tid3624643: Tid;                                                                               
 var tmp10$2343624605: Tid;                                                                         
 var ReentrantLock._lock3624720: [ReentrantLock]Tid;                                                
 var Main._lock3624461: [Main]Tid;                                                                  
 var Main._state3624561: [Main]State;                                                               
 var tmp113624714_post: int;                                                                        
 var mover3624667: Mover;                                                                           
 var ReentrantLock.m3624552: [ReentrantLock]Tid;                                                    
 var ReentrantLock._state3624580: [ReentrantLock]State;                                             
 var ReentrantLock._lock3624561: [ReentrantLock]Tid;                                                
 var ReentrantLock.count3624571: [ReentrantLock]int;                                                
 var this$2353624657: ReentrantLock;                                                                
 var mover3624657: Mover;                                                                           
 var Main._lock3624648: [Main]Tid;                                                                  
 var l3624398: ReentrantLock;                                                                       
 var Main._lock3624580: [Main]Tid;                                                                  
 var this3624648: Main;                                                                             
 var path3624571: int;                                                                              
 var path3624528: int;                                                                              
 var ReentrantLock.m3624657: [ReentrantLock]Tid;                                                    
 var this$2343624547: ReentrantLock;                                                                
 var path3624667: int;                                                                              
 var tmp5$2353624657: Tid;                                                                          
 var mover3624571: Mover;                                                                           
 var l3624648: ReentrantLock;                                                                       
 var path3624494: int;                                                                              
 var ReentrantLock._state3624618_post: [ReentrantLock]State;                                        
 var $recorded.state3624714_post: int;                                                              
 var $recorded.state3624714: int;                                                                   
 var Main._state3624714: [Main]State;                                                               
 var ReentrantLock._state3624461: [ReentrantLock]State;                                             
 var $recorded.state3624398: int;                                                                   
 var moverPath3624657: MoverPath;                                                                   
 var l3624643: ReentrantLock;                                                                       
 var moverPath3624667: MoverPath;                                                                   
 var tmp7$2343624605: int;                                                                          
 var moverPath3624528: MoverPath;                                                                   
 var $pc3624451: Phase;                                                                             
 var tmp10$234: Tid;                                                                                
 var this3624714: Main;                                                                             
 var l3624720: ReentrantLock;                                                                       
 var ReentrantLock._lock3624657: [ReentrantLock]Tid;                                                
 var ReentrantLock.m3624398: [ReentrantLock]Tid;                                                    
 var $pc3624618: Phase;                                                                             
 var $pc3624648: Phase;                                                                             
 var this3624618_post: Main;                                                                        
 var path3624643: int;                                                                              
 var tid3624618: Tid;                                                                               
 var ReentrantLock._lock3624648: [ReentrantLock]Tid;                                                
 var tmp3$2333624513: int;                                                                          
 var $recorded.state3624676: int;                                                                   
 var tmp113624643: int;                                                                             
 var tmp3$233: int;                                                                                 
 var ReentrantLock.count3624727: [ReentrantLock]int;                                                
 var path3624701: int;                                                                              
 var Main._state3624648: [Main]State;                                                               
 var $pc3624561: Phase;                                                                             
 var Main._state3624727: [Main]State;                                                               
 var ReentrantLock.count3624503: [ReentrantLock]int;                                                
 var Main._lock3624534: [Main]Tid;                                                                  
 var moverPath3624676: MoverPath;                                                                   
 var ReentrantLock._state3624643: [ReentrantLock]State;                                             
 var tmp4$2323624451: int;                                                                          
 var mover3624547: Mover;                                                                           
 var this$2343624605: ReentrantLock;                                                                
 var ReentrantLock._lock3624547: [ReentrantLock]Tid;                                                
 var l3624528: ReentrantLock;                                                                       
 var ReentrantLock.m3624580: [ReentrantLock]Tid;                                                    
 var tmp113624701: int;                                                                             
 var tmp6$235: int;                                                                                 
 var tmp7$2343624561: int;                                                                          
 var ReentrantLock.m3624442: [ReentrantLock]Tid;                                                    
 var $recorded.state3624561: int;                                                                   
 var Main._state3624618: [Main]State;                                                               
 var ReentrantLock.count3624513: [ReentrantLock]int;                                                
 var $pc3624701: Phase;                                                                             
 var Main._state3624571: [Main]State;                                                               
 var ReentrantLock.m3624408: [ReentrantLock]Tid;                                                    
 var ReentrantLock.count3624408: [ReentrantLock]int;                                                
 var ReentrantLock._lock3624701: [ReentrantLock]Tid;                                                
 var ReentrantLock._state3624605: [ReentrantLock]State;                                             
 var tmp113624727: int;                                                                             
 var Main._state3624643: [Main]State;                                                               
 var tmp123624726: int;                                                                             
 var mover3624720: Mover;                                                                           
 var ReentrantLock._lock3624398: [ReentrantLock]Tid;                                                
 var ReentrantLock._lock3624624: [ReentrantLock]Tid;                                                
 var Main._lock3624701: [Main]Tid;                                                                  
 var path3624503: int;                                                                              
 var this3624461: Main;                                                                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 39.7: ReentrantLock l;                                                                          
                                                                                                    
                                                                                                    
 // 39.7: l = new ReentrantLock();                                                                  
                                                                                                    
 havoc l;                                                                                           
 assume l != ReentrantLock.null && isFresh(ReentrantLock._state[l]);                                
 ReentrantLock._state[l] := LOCAL(tid);                                                             
 assume ReentrantLock.m[l]  == Tid.null;                                                            
 assume ReentrantLock.count[l]  == 0;                                                               
 assume ReentrantLock._lock[l]  == Tid.null;                                                        
 // inlined: l.init()}                                                                              
 exit$231_top:                                                                                      
                                                                                                    
 // 39.7: ReentrantLock this$231;                                                                   
                                                                                                    
                                                                                                    
 // 39.7: this$231 = l;                                                                             
                                                                                                    
 this$231 := l;                                                                                     
                                                                                                    
 // 16.3: assume this$231.m == Tid.null;                                                            
                                                                                                    
 assume (ReentrantLock.m[this$231]==Tid.null);                                                      
                                                                                                    
 // 16.3: assume this$231.count == 0;                                                               
                                                                                                    
 assume (ReentrantLock.count[this$231]==0);                                                         
                                                                                                    
 // 17.5: Tid tmp1$231;                                                                             
                                                                                                    
                                                                                                    
 // 17.5: tmp1$231 = Tid.null;                                                                      
                                                                                                    
 tmp1$231 := Tid.null;                                                                              
                                                                                                    
                                                                                                    
 // 17.5: this$231.m := tmp1$231;                                                                   
                                                                                                    
                                                                                                    
 moverPath3624398 := WriteEval.ReentrantLock.m(tid: Tid,this$231: ReentrantLock,tmp1$231: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624398 := m#moverPath(moverPath3624398);                                                     
 path3624398 := p#moverPath(moverPath3624398);                                                      
 assume ReentrantLock._state3624398 == ReentrantLock._state && ReentrantLock.m3624398 == ReentrantLock.m && ReentrantLock.count3624398 == ReentrantLock.count && ReentrantLock._lock3624398 == ReentrantLock._lock && Main._state3624398 == Main._state && Main._lock3624398 == Main._lock && tmp1$2313624398 == tmp1$231 && this$2313624398 == this$231 && l3624398 == l && this3624398 == this && tid3624398 == tid && $pc3624398 == $pc;
 assume $recorded.state3624398 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$231 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$231 != ReentrantLock.null;                                                                   // (17.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624398);                                                              
 assert $pc != PhaseError;                                                                                 // (17.5): Reduction failure
 ReentrantLock.m[this$231] := tmp1$231;                                                             
                                                                                                    
 // 18.5: int tmp2$231;                                                                             
                                                                                                    
                                                                                                    
 // 18.5: tmp2$231 = 0;                                                                             
                                                                                                    
 tmp2$231 := 0;                                                                                     
                                                                                                    
                                                                                                    
 // 18.5: this$231.count := tmp2$231;                                                               
                                                                                                    
                                                                                                    
 moverPath3624408 := WriteEval.ReentrantLock.count(tid: Tid,this$231: ReentrantLock,tmp2$231: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624408 := m#moverPath(moverPath3624408);                                                     
 path3624408 := p#moverPath(moverPath3624408);                                                      
 assume ReentrantLock._state3624408 == ReentrantLock._state && ReentrantLock.m3624408 == ReentrantLock.m && ReentrantLock.count3624408 == ReentrantLock.count && ReentrantLock._lock3624408 == ReentrantLock._lock && Main._state3624408 == Main._state && Main._lock3624408 == Main._lock && tmp2$2313624408 == tmp2$231 && tmp1$2313624408 == tmp1$231 && this$2313624408 == this$231 && l3624408 == l && this3624408 == this && tid3624408 == tid && $pc3624408 == $pc;
 assume $recorded.state3624408 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$231 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$231 != ReentrantLock.null;                                                                   // (18.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624408);                                                              
 assert $pc != PhaseError;                                                                                 // (18.5): Reduction failure
 ReentrantLock.count[this$231] := tmp2$231;                                                         
                                                                                                    
 // 16.19: break exit$231;                                                                          
                                                                                                    
 goto exit$231_bottom;                                                                              
 exit$231_bottom:                                                                                   
 // inlined: l.acq()}                                                                               
 exit$232_top:                                                                                      
                                                                                                    
 // 40.7: ReentrantLock this$232;                                                                   
                                                                                                    
                                                                                                    
 // 40.7: this$232 = l;                                                                             
                                                                                                    
 this$232 := l;                                                                                     
                                                                                                    
 // 22.5: assume this$232.m == Tid.null || this$232.m == tid;                                       
                                                                                                    
 assume ((ReentrantLock.m[this$232]==Tid.null)||(ReentrantLock.m[this$232]==tid));                  
                                                                                                    
                                                                                                    
 // 23.5: this$232.m := tid;                                                                        
                                                                                                    
                                                                                                    
 moverPath3624442 := WriteEval.ReentrantLock.m(tid: Tid,this$232: ReentrantLock,tid: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624442 := m#moverPath(moverPath3624442);                                                     
 path3624442 := p#moverPath(moverPath3624442);                                                      
 assume ReentrantLock._state3624442 == ReentrantLock._state && ReentrantLock.m3624442 == ReentrantLock.m && ReentrantLock.count3624442 == ReentrantLock.count && ReentrantLock._lock3624442 == ReentrantLock._lock && Main._state3624442 == Main._state && Main._lock3624442 == Main._lock && this$2323624442 == this$232 && l3624442 == l && this3624442 == this && tid3624442 == tid && $pc3624442 == $pc;
 assume $recorded.state3624442 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$232 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$232 != ReentrantLock.null;                                                                   // (23.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624442);                                                              
 assert $pc != PhaseError;                                                                                 // (23.5): Reduction failure
 ReentrantLock.m[this$232] := tid;                                                                  
                                                                                                    
 // 24.5: int tmp3$232;                                                                             
                                                                                                    
                                                                                                    
 // 24.5: int tmp4$232;                                                                             
                                                                                                    
                                                                                                    
 // 24.5: tmp4$232 := this$232.count;                                                               
                                                                                                    
                                                                                                    
 moverPath3624451 := ReadEval.ReentrantLock.count(tid: Tid,this$232: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624451 := m#moverPath(moverPath3624451);                                                     
 path3624451 := p#moverPath(moverPath3624451);                                                      
 assume ReentrantLock._state3624451 == ReentrantLock._state && ReentrantLock.m3624451 == ReentrantLock.m && ReentrantLock.count3624451 == ReentrantLock.count && ReentrantLock._lock3624451 == ReentrantLock._lock && Main._state3624451 == Main._state && Main._lock3624451 == Main._lock && tmp4$2323624451 == tmp4$232 && tmp3$2323624451 == tmp3$232 && this$2323624451 == this$232 && l3624451 == l && this3624451 == this && tid3624451 == tid && $pc3624451 == $pc;
 assume $recorded.state3624451 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$232 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$232 != ReentrantLock.null;                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624451);                                                              
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 tmp4$232 := ReentrantLock.count[this$232];                                                         
                                                                                                    
 // 24.5: tmp3$232 = tmp4$232 + 1;                                                                  
                                                                                                    
 tmp3$232 := (tmp4$232+1);                                                                          
                                                                                                    
                                                                                                    
 // 24.5: this$232.count := tmp3$232;                                                               
                                                                                                    
                                                                                                    
 moverPath3624461 := WriteEval.ReentrantLock.count(tid: Tid,this$232: ReentrantLock,tmp3$232: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624461 := m#moverPath(moverPath3624461);                                                     
 path3624461 := p#moverPath(moverPath3624461);                                                      
 assume ReentrantLock._state3624461 == ReentrantLock._state && ReentrantLock.m3624461 == ReentrantLock.m && ReentrantLock.count3624461 == ReentrantLock.count && ReentrantLock._lock3624461 == ReentrantLock._lock && Main._state3624461 == Main._state && Main._lock3624461 == Main._lock && tmp4$2323624461 == tmp4$232 && tmp3$2323624461 == tmp3$232 && this$2323624461 == this$232 && l3624461 == l && this3624461 == this && tid3624461 == tid && $pc3624461 == $pc;
 assume $recorded.state3624461 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$232 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$232 != ReentrantLock.null;                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624461);                                                              
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 ReentrantLock.count[this$232] := tmp3$232;                                                         
                                                                                                    
 // 21.14: break exit$232;                                                                          
                                                                                                    
 goto exit$232_bottom;                                                                              
 exit$232_bottom:                                                                                   
 // inlined: l.acq()}                                                                               
 exit$233_top:                                                                                      
                                                                                                    
 // 41.7: ReentrantLock this$233;                                                                   
                                                                                                    
                                                                                                    
 // 41.7: this$233 = l;                                                                             
                                                                                                    
 this$233 := l;                                                                                     
                                                                                                    
 // 22.5: assume this$233.m == Tid.null || this$233.m == tid;                                       
                                                                                                    
 assume ((ReentrantLock.m[this$233]==Tid.null)||(ReentrantLock.m[this$233]==tid));                  
                                                                                                    
                                                                                                    
 // 23.5: this$233.m := tid;                                                                        
                                                                                                    
                                                                                                    
 moverPath3624494 := WriteEval.ReentrantLock.m(tid: Tid,this$233: ReentrantLock,tid: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624494 := m#moverPath(moverPath3624494);                                                     
 path3624494 := p#moverPath(moverPath3624494);                                                      
 assume ReentrantLock._state3624494 == ReentrantLock._state && ReentrantLock.m3624494 == ReentrantLock.m && ReentrantLock.count3624494 == ReentrantLock.count && ReentrantLock._lock3624494 == ReentrantLock._lock && Main._state3624494 == Main._state && Main._lock3624494 == Main._lock && this$2333624494 == this$233 && l3624494 == l && this3624494 == this && tid3624494 == tid && $pc3624494 == $pc;
 assume $recorded.state3624494 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$233 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$233 != ReentrantLock.null;                                                                   // (23.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624494);                                                              
 assert $pc != PhaseError;                                                                                 // (23.5): Reduction failure
 ReentrantLock.m[this$233] := tid;                                                                  
                                                                                                    
 // 24.5: int tmp3$233;                                                                             
                                                                                                    
                                                                                                    
 // 24.5: int tmp4$233;                                                                             
                                                                                                    
                                                                                                    
 // 24.5: tmp4$233 := this$233.count;                                                               
                                                                                                    
                                                                                                    
 moverPath3624503 := ReadEval.ReentrantLock.count(tid: Tid,this$233: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624503 := m#moverPath(moverPath3624503);                                                     
 path3624503 := p#moverPath(moverPath3624503);                                                      
 assume ReentrantLock._state3624503 == ReentrantLock._state && ReentrantLock.m3624503 == ReentrantLock.m && ReentrantLock.count3624503 == ReentrantLock.count && ReentrantLock._lock3624503 == ReentrantLock._lock && Main._state3624503 == Main._state && Main._lock3624503 == Main._lock && tmp4$2333624503 == tmp4$233 && tmp3$2333624503 == tmp3$233 && this$2333624503 == this$233 && l3624503 == l && this3624503 == this && tid3624503 == tid && $pc3624503 == $pc;
 assume $recorded.state3624503 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$233 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$233 != ReentrantLock.null;                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624503);                                                              
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 tmp4$233 := ReentrantLock.count[this$233];                                                         
                                                                                                    
 // 24.5: tmp3$233 = tmp4$233 + 1;                                                                  
                                                                                                    
 tmp3$233 := (tmp4$233+1);                                                                          
                                                                                                    
                                                                                                    
 // 24.5: this$233.count := tmp3$233;                                                               
                                                                                                    
                                                                                                    
 moverPath3624513 := WriteEval.ReentrantLock.count(tid: Tid,this$233: ReentrantLock,tmp3$233: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624513 := m#moverPath(moverPath3624513);                                                     
 path3624513 := p#moverPath(moverPath3624513);                                                      
 assume ReentrantLock._state3624513 == ReentrantLock._state && ReentrantLock.m3624513 == ReentrantLock.m && ReentrantLock.count3624513 == ReentrantLock.count && ReentrantLock._lock3624513 == ReentrantLock._lock && Main._state3624513 == Main._state && Main._lock3624513 == Main._lock && tmp4$2333624513 == tmp4$233 && tmp3$2333624513 == tmp3$233 && this$2333624513 == this$233 && l3624513 == l && this3624513 == this && tid3624513 == tid && $pc3624513 == $pc;
 assume $recorded.state3624513 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$233 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$233 != ReentrantLock.null;                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624513);                                                              
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 ReentrantLock.count[this$233] := tmp3$233;                                                         
                                                                                                    
 // 21.14: break exit$233;                                                                          
                                                                                                    
 goto exit$233_bottom;                                                                              
 exit$233_bottom:                                                                                   
                                                                                                    
 // 42.7: int tmp11;                                                                                
                                                                                                    
                                                                                                    
 // 42.7: tmp11 := l.count;                                                                         
                                                                                                    
                                                                                                    
 moverPath3624528 := ReadEval.ReentrantLock.count(tid: Tid,l: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624528 := m#moverPath(moverPath3624528);                                                     
 path3624528 := p#moverPath(moverPath3624528);                                                      
 assume ReentrantLock._state3624528 == ReentrantLock._state && ReentrantLock.m3624528 == ReentrantLock.m && ReentrantLock.count3624528 == ReentrantLock.count && ReentrantLock._lock3624528 == ReentrantLock._lock && Main._state3624528 == Main._state && Main._lock3624528 == Main._lock && tmp113624528 == tmp11 && l3624528 == l && this3624528 == this && tid3624528 == tid && $pc3624528 == $pc;
 assume $recorded.state3624528 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume l != ReentrantLock.null;                                                                   
 } else {                                                                                           
  assert l != ReentrantLock.null;                                                                          // (42.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624528);                                                              
 assert $pc != PhaseError;                                                                                 // (42.7): Reduction failure
 tmp11 := ReentrantLock.count[l];                                                                   
                                                                                                    
 // 42.7: assert tmp11 == 2;                                                                        
                                                                                                    
 assume ReentrantLock._state3624534 == ReentrantLock._state && ReentrantLock.m3624534 == ReentrantLock.m && ReentrantLock.count3624534 == ReentrantLock.count && ReentrantLock._lock3624534 == ReentrantLock._lock && Main._state3624534 == Main._state && Main._lock3624534 == Main._lock && tmp113624534 == tmp11 && l3624534 == l && this3624534 == this && tid3624534 == tid;
 assume $recorded.state3624534 == 1;                                                                
 assert (tmp11==2);                                                                                        // (42.7): This assertion may not hold.
 // inlined: l.rel()}                                                                               
 exit$234_top:                                                                                      
                                                                                                    
 // 43.7: ReentrantLock this$234;                                                                   
                                                                                                    
                                                                                                    
 // 43.7: this$234 = l;                                                                             
                                                                                                    
 this$234 := l;                                                                                     
                                                                                                    
 // 28.5: Tid tmp5$234;                                                                             
                                                                                                    
                                                                                                    
 // 28.5: tmp5$234 := this$234.m;                                                                   
                                                                                                    
                                                                                                    
 moverPath3624547 := ReadEval.ReentrantLock.m(tid: Tid,this$234: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624547 := m#moverPath(moverPath3624547);                                                     
 path3624547 := p#moverPath(moverPath3624547);                                                      
 assume ReentrantLock._state3624547 == ReentrantLock._state && ReentrantLock.m3624547 == ReentrantLock.m && ReentrantLock.count3624547 == ReentrantLock.count && ReentrantLock._lock3624547 == ReentrantLock._lock && Main._state3624547 == Main._state && Main._lock3624547 == Main._lock && tmp5$2343624547 == tmp5$234 && this$2343624547 == this$234 && tmp113624547 == tmp11 && l3624547 == l && this3624547 == this && tid3624547 == tid && $pc3624547 == $pc;
 assume $recorded.state3624547 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$234 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$234 != ReentrantLock.null;                                                                   // (28.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624547);                                                              
 assert $pc != PhaseError;                                                                                 // (28.5): Reduction failure
 tmp5$234 := ReentrantLock.m[this$234];                                                             
                                                                                                    
 // 28.5: assert tmp5$234 == tid;                                                                   
                                                                                                    
 assume ReentrantLock._state3624552 == ReentrantLock._state && ReentrantLock.m3624552 == ReentrantLock.m && ReentrantLock.count3624552 == ReentrantLock.count && ReentrantLock._lock3624552 == ReentrantLock._lock && Main._state3624552 == Main._state && Main._lock3624552 == Main._lock && tmp5$2343624552 == tmp5$234 && this$2343624552 == this$234 && tmp113624552 == tmp11 && l3624552 == l && this3624552 == this && tid3624552 == tid;
 assume $recorded.state3624552 == 1;                                                                
 assert (tmp5$234==tid);                                                                                   // (28.5): This assertion may not hold.
                                                                                                    
 // 29.5: int tmp6$234;                                                                             
                                                                                                    
                                                                                                    
 // 29.5: int tmp7$234;                                                                             
                                                                                                    
                                                                                                    
 // 29.5: tmp7$234 := this$234.count;                                                               
                                                                                                    
                                                                                                    
 moverPath3624561 := ReadEval.ReentrantLock.count(tid: Tid,this$234: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624561 := m#moverPath(moverPath3624561);                                                     
 path3624561 := p#moverPath(moverPath3624561);                                                      
 assume ReentrantLock._state3624561 == ReentrantLock._state && ReentrantLock.m3624561 == ReentrantLock.m && ReentrantLock.count3624561 == ReentrantLock.count && ReentrantLock._lock3624561 == ReentrantLock._lock && Main._state3624561 == Main._state && Main._lock3624561 == Main._lock && tmp7$2343624561 == tmp7$234 && tmp6$2343624561 == tmp6$234 && tmp5$2343624561 == tmp5$234 && this$2343624561 == this$234 && tmp113624561 == tmp11 && l3624561 == l && this3624561 == this && tid3624561 == tid && $pc3624561 == $pc;
 assume $recorded.state3624561 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$234 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$234 != ReentrantLock.null;                                                                   // (29.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624561);                                                              
 assert $pc != PhaseError;                                                                                 // (29.5): Reduction failure
 tmp7$234 := ReentrantLock.count[this$234];                                                         
                                                                                                    
 // 29.5: tmp6$234 = tmp7$234 - 1;                                                                  
                                                                                                    
 tmp6$234 := (tmp7$234-1);                                                                          
                                                                                                    
                                                                                                    
 // 29.5: this$234.count := tmp6$234;                                                               
                                                                                                    
                                                                                                    
 moverPath3624571 := WriteEval.ReentrantLock.count(tid: Tid,this$234: ReentrantLock,tmp6$234: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624571 := m#moverPath(moverPath3624571);                                                     
 path3624571 := p#moverPath(moverPath3624571);                                                      
 assume ReentrantLock._state3624571 == ReentrantLock._state && ReentrantLock.m3624571 == ReentrantLock.m && ReentrantLock.count3624571 == ReentrantLock.count && ReentrantLock._lock3624571 == ReentrantLock._lock && Main._state3624571 == Main._state && Main._lock3624571 == Main._lock && tmp7$2343624571 == tmp7$234 && tmp6$2343624571 == tmp6$234 && tmp5$2343624571 == tmp5$234 && this$2343624571 == this$234 && tmp113624571 == tmp11 && l3624571 == l && this3624571 == this && tid3624571 == tid && $pc3624571 == $pc;
 assume $recorded.state3624571 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$234 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$234 != ReentrantLock.null;                                                                   // (29.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624571);                                                              
 assert $pc != PhaseError;                                                                                 // (29.5): Reduction failure
 ReentrantLock.count[this$234] := tmp6$234;                                                         
                                                                                                    
 // 30.5: boolean tmp8$234;                                                                         
                                                                                                    
                                                                                                    
 // 30.5: int tmp9$234;                                                                             
                                                                                                    
                                                                                                    
 // 30.5: tmp9$234 := this$234.count;                                                               
                                                                                                    
                                                                                                    
 moverPath3624580 := ReadEval.ReentrantLock.count(tid: Tid,this$234: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624580 := m#moverPath(moverPath3624580);                                                     
 path3624580 := p#moverPath(moverPath3624580);                                                      
 assume ReentrantLock._state3624580 == ReentrantLock._state && ReentrantLock.m3624580 == ReentrantLock.m && ReentrantLock.count3624580 == ReentrantLock.count && ReentrantLock._lock3624580 == ReentrantLock._lock && Main._state3624580 == Main._state && Main._lock3624580 == Main._lock && tmp9$2343624580 == tmp9$234 && tmp8$2343624580 == tmp8$234 && tmp7$2343624580 == tmp7$234 && tmp6$2343624580 == tmp6$234 && tmp5$2343624580 == tmp5$234 && this$2343624580 == this$234 && tmp113624580 == tmp11 && l3624580 == l && this3624580 == this && tid3624580 == tid && $pc3624580 == $pc;
 assume $recorded.state3624580 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$234 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$234 != ReentrantLock.null;                                                                   // (30.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624580);                                                              
 assert $pc != PhaseError;                                                                                 // (30.5): Reduction failure
 tmp9$234 := ReentrantLock.count[this$234];                                                         
                                                                                                    
 // 30.5: tmp8$234 = tmp9$234 == 0;                                                                 
                                                                                                    
 tmp8$234 := (tmp9$234==0);                                                                         
 if (tmp8$234 /* lowered (ReentrantLock.count[this$234]==0) */) {                                   
                                                                                                    
  // 31.7: Tid tmp10$234;                                                                           
                                                                                                    
                                                                                                    
  // 31.7: tmp10$234 = Tid.null;                                                                    
                                                                                                    
  tmp10$234 := Tid.null;                                                                            
                                                                                                    
                                                                                                    
  // 31.7: this$234.m := tmp10$234;                                                                 
                                                                                                    
                                                                                                    
  moverPath3624605 := WriteEval.ReentrantLock.m(tid: Tid,this$234: ReentrantLock,tmp10$234: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
  mover3624605 := m#moverPath(moverPath3624605);                                                    
  path3624605 := p#moverPath(moverPath3624605);                                                     
  assume ReentrantLock._state3624605 == ReentrantLock._state && ReentrantLock.m3624605 == ReentrantLock.m && ReentrantLock.count3624605 == ReentrantLock.count && ReentrantLock._lock3624605 == ReentrantLock._lock && Main._state3624605 == Main._state && Main._lock3624605 == Main._lock && tmp10$2343624605 == tmp10$234 && tmp9$2343624605 == tmp9$234 && tmp8$2343624605 == tmp8$234 && tmp7$2343624605 == tmp7$234 && tmp6$2343624605 == tmp6$234 && tmp5$2343624605 == tmp5$234 && this$2343624605 == this$234 && tmp113624605 == tmp11 && l3624605 == l && this3624605 == this && tid3624605 == tid && $pc3624605 == $pc;
  assume $recorded.state3624605 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this$234 != ReentrantLock.null;                                                           
  } else {                                                                                          
   assert this$234 != ReentrantLock.null;                                                                  // (31.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover3624605);                                                             
  assert $pc != PhaseError;                                                                                // (31.7): Reduction failure
  ReentrantLock.m[this$234] := tmp10$234;                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 27.14: break exit$234;                                                                          
                                                                                                    
 goto exit$234_bottom;                                                                              
 exit$234_bottom:                                                                                   
                                                                                                    
 // 44.7: yield;                                                                                    
                                                                                                    
 assume ReentrantLock._state3624618 == ReentrantLock._state && ReentrantLock.m3624618 == ReentrantLock.m && ReentrantLock.count3624618 == ReentrantLock.count && ReentrantLock._lock3624618 == ReentrantLock._lock && Main._state3624618 == Main._state && Main._lock3624618 == Main._lock && tmp113624618 == tmp11 && l3624618 == l && this3624618 == this && tid3624618 == tid;
 assume $recorded.state3624618 == 1;                                                                
 assert  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (44.7): Object invariant may not hold.
 assert  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (44.7): Object invariant may not hold.
 call Yield(tid);                                                                                   
 assume  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (44.7): Object invariant may not hold.
 assume  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (44.7): Object invariant may not hold.
 $pc := PreCommit;                                                                                  
 assume ReentrantLock._state3624618_post == ReentrantLock._state && ReentrantLock.m3624618_post == ReentrantLock.m && ReentrantLock.count3624618_post == ReentrantLock.count && ReentrantLock._lock3624618_post == ReentrantLock._lock && Main._state3624618_post == Main._state && Main._lock3624618_post == Main._lock && tmp113624618_post == tmp11 && l3624618_post == l && this3624618_post == this && tid3624618_post == tid;
 assume $recorded.state3624618_post == 1;                                                           
                                                                                                    
 // 45.7: int tmp12;                                                                                
                                                                                                    
                                                                                                    
 // 45.7: tmp12 := l.count;                                                                         
                                                                                                    
                                                                                                    
 moverPath3624624 := ReadEval.ReentrantLock.count(tid: Tid,l: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624624 := m#moverPath(moverPath3624624);                                                     
 path3624624 := p#moverPath(moverPath3624624);                                                      
 assume ReentrantLock._state3624624 == ReentrantLock._state && ReentrantLock.m3624624 == ReentrantLock.m && ReentrantLock.count3624624 == ReentrantLock.count && ReentrantLock._lock3624624 == ReentrantLock._lock && Main._state3624624 == Main._state && Main._lock3624624 == Main._lock && tmp123624624 == tmp12 && tmp113624624 == tmp11 && l3624624 == l && this3624624 == this && tid3624624 == tid && $pc3624624 == $pc;
 assume $recorded.state3624624 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume l != ReentrantLock.null;                                                                   
 } else {                                                                                           
  assert l != ReentrantLock.null;                                                                          // (45.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624624);                                                              
 assert $pc != PhaseError;                                                                                 // (45.7): Reduction failure
 tmp12 := ReentrantLock.count[l];                                                                   
                                                                                                    
 // 45.7: assert tmp12 == 1;                                                                        
                                                                                                    
 assume ReentrantLock._state3624630 == ReentrantLock._state && ReentrantLock.m3624630 == ReentrantLock.m && ReentrantLock.count3624630 == ReentrantLock.count && ReentrantLock._lock3624630 == ReentrantLock._lock && Main._state3624630 == Main._state && Main._lock3624630 == Main._lock && tmp123624630 == tmp12 && tmp113624630 == tmp11 && l3624630 == l && this3624630 == this && tid3624630 == tid;
 assume $recorded.state3624630 == 1;                                                                
 assert (tmp12==1);                                                                                        // (45.7): This assertion may not hold.
 // inlined: l.rel()}                                                                               
 exit$235_top:                                                                                      
                                                                                                    
 // 46.7: ReentrantLock this$235;                                                                   
                                                                                                    
                                                                                                    
 // 46.7: this$235 = l;                                                                             
                                                                                                    
 this$235 := l;                                                                                     
                                                                                                    
 // 28.5: Tid tmp5$235;                                                                             
                                                                                                    
                                                                                                    
 // 28.5: tmp5$235 := this$235.m;                                                                   
                                                                                                    
                                                                                                    
 moverPath3624643 := ReadEval.ReentrantLock.m(tid: Tid,this$235: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624643 := m#moverPath(moverPath3624643);                                                     
 path3624643 := p#moverPath(moverPath3624643);                                                      
 assume ReentrantLock._state3624643 == ReentrantLock._state && ReentrantLock.m3624643 == ReentrantLock.m && ReentrantLock.count3624643 == ReentrantLock.count && ReentrantLock._lock3624643 == ReentrantLock._lock && Main._state3624643 == Main._state && Main._lock3624643 == Main._lock && tmp5$2353624643 == tmp5$235 && this$2353624643 == this$235 && tmp123624643 == tmp12 && tmp113624643 == tmp11 && l3624643 == l && this3624643 == this && tid3624643 == tid && $pc3624643 == $pc;
 assume $recorded.state3624643 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$235 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$235 != ReentrantLock.null;                                                                   // (28.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624643);                                                              
 assert $pc != PhaseError;                                                                                 // (28.5): Reduction failure
 tmp5$235 := ReentrantLock.m[this$235];                                                             
                                                                                                    
 // 28.5: assert tmp5$235 == tid;                                                                   
                                                                                                    
 assume ReentrantLock._state3624648 == ReentrantLock._state && ReentrantLock.m3624648 == ReentrantLock.m && ReentrantLock.count3624648 == ReentrantLock.count && ReentrantLock._lock3624648 == ReentrantLock._lock && Main._state3624648 == Main._state && Main._lock3624648 == Main._lock && tmp5$2353624648 == tmp5$235 && this$2353624648 == this$235 && tmp123624648 == tmp12 && tmp113624648 == tmp11 && l3624648 == l && this3624648 == this && tid3624648 == tid;
 assume $recorded.state3624648 == 1;                                                                
 assert (tmp5$235==tid);                                                                                   // (28.5): This assertion may not hold.
                                                                                                    
 // 29.5: int tmp6$235;                                                                             
                                                                                                    
                                                                                                    
 // 29.5: int tmp7$235;                                                                             
                                                                                                    
                                                                                                    
 // 29.5: tmp7$235 := this$235.count;                                                               
                                                                                                    
                                                                                                    
 moverPath3624657 := ReadEval.ReentrantLock.count(tid: Tid,this$235: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624657 := m#moverPath(moverPath3624657);                                                     
 path3624657 := p#moverPath(moverPath3624657);                                                      
 assume ReentrantLock._state3624657 == ReentrantLock._state && ReentrantLock.m3624657 == ReentrantLock.m && ReentrantLock.count3624657 == ReentrantLock.count && ReentrantLock._lock3624657 == ReentrantLock._lock && Main._state3624657 == Main._state && Main._lock3624657 == Main._lock && tmp7$2353624657 == tmp7$235 && tmp6$2353624657 == tmp6$235 && tmp5$2353624657 == tmp5$235 && this$2353624657 == this$235 && tmp123624657 == tmp12 && tmp113624657 == tmp11 && l3624657 == l && this3624657 == this && tid3624657 == tid && $pc3624657 == $pc;
 assume $recorded.state3624657 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$235 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$235 != ReentrantLock.null;                                                                   // (29.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624657);                                                              
 assert $pc != PhaseError;                                                                                 // (29.5): Reduction failure
 tmp7$235 := ReentrantLock.count[this$235];                                                         
                                                                                                    
 // 29.5: tmp6$235 = tmp7$235 - 1;                                                                  
                                                                                                    
 tmp6$235 := (tmp7$235-1);                                                                          
                                                                                                    
                                                                                                    
 // 29.5: this$235.count := tmp6$235;                                                               
                                                                                                    
                                                                                                    
 moverPath3624667 := WriteEval.ReentrantLock.count(tid: Tid,this$235: ReentrantLock,tmp6$235: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624667 := m#moverPath(moverPath3624667);                                                     
 path3624667 := p#moverPath(moverPath3624667);                                                      
 assume ReentrantLock._state3624667 == ReentrantLock._state && ReentrantLock.m3624667 == ReentrantLock.m && ReentrantLock.count3624667 == ReentrantLock.count && ReentrantLock._lock3624667 == ReentrantLock._lock && Main._state3624667 == Main._state && Main._lock3624667 == Main._lock && tmp7$2353624667 == tmp7$235 && tmp6$2353624667 == tmp6$235 && tmp5$2353624667 == tmp5$235 && this$2353624667 == this$235 && tmp123624667 == tmp12 && tmp113624667 == tmp11 && l3624667 == l && this3624667 == this && tid3624667 == tid && $pc3624667 == $pc;
 assume $recorded.state3624667 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$235 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$235 != ReentrantLock.null;                                                                   // (29.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover3624667);                                                              
 assert $pc != PhaseError;                                                                                 // (29.5): Reduction failure
 ReentrantLock.count[this$235] := tmp6$235;                                                         
                                                                                                    
 // 30.5: boolean tmp8$235;                                                                         
                                                                                                    
                                                                                                    
 // 30.5: int tmp9$235;                                                                             
                                                                                                    
                                                                                                    
 // 30.5: tmp9$235 := this$235.count;                                                               
                                                                                                    
                                                                                                    
 moverPath3624676 := ReadEval.ReentrantLock.count(tid: Tid,this$235: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624676 := m#moverPath(moverPath3624676);                                                     
 path3624676 := p#moverPath(moverPath3624676);                                                      
 assume ReentrantLock._state3624676 == ReentrantLock._state && ReentrantLock.m3624676 == ReentrantLock.m && ReentrantLock.count3624676 == ReentrantLock.count && ReentrantLock._lock3624676 == ReentrantLock._lock && Main._state3624676 == Main._state && Main._lock3624676 == Main._lock && tmp9$2353624676 == tmp9$235 && tmp8$2353624676 == tmp8$235 && tmp7$2353624676 == tmp7$235 && tmp6$2353624676 == tmp6$235 && tmp5$2353624676 == tmp5$235 && this$2353624676 == this$235 && tmp123624676 == tmp12 && tmp113624676 == tmp11 && l3624676 == l && this3624676 == this && tid3624676 == tid && $pc3624676 == $pc;
 assume $recorded.state3624676 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this$235 != ReentrantLock.null;                                                            
 } else {                                                                                           
  assert this$235 != ReentrantLock.null;                                                                   // (30.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624676);                                                              
 assert $pc != PhaseError;                                                                                 // (30.5): Reduction failure
 tmp9$235 := ReentrantLock.count[this$235];                                                         
                                                                                                    
 // 30.5: tmp8$235 = tmp9$235 == 0;                                                                 
                                                                                                    
 tmp8$235 := (tmp9$235==0);                                                                         
 if (tmp8$235 /* lowered (ReentrantLock.count[this$235]==0) */) {                                   
                                                                                                    
  // 31.7: Tid tmp10$235;                                                                           
                                                                                                    
                                                                                                    
  // 31.7: tmp10$235 = Tid.null;                                                                    
                                                                                                    
  tmp10$235 := Tid.null;                                                                            
                                                                                                    
                                                                                                    
  // 31.7: this$235.m := tmp10$235;                                                                 
                                                                                                    
                                                                                                    
  moverPath3624701 := WriteEval.ReentrantLock.m(tid: Tid,this$235: ReentrantLock,tmp10$235: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
  mover3624701 := m#moverPath(moverPath3624701);                                                    
  path3624701 := p#moverPath(moverPath3624701);                                                     
  assume ReentrantLock._state3624701 == ReentrantLock._state && ReentrantLock.m3624701 == ReentrantLock.m && ReentrantLock.count3624701 == ReentrantLock.count && ReentrantLock._lock3624701 == ReentrantLock._lock && Main._state3624701 == Main._state && Main._lock3624701 == Main._lock && tmp10$2353624701 == tmp10$235 && tmp9$2353624701 == tmp9$235 && tmp8$2353624701 == tmp8$235 && tmp7$2353624701 == tmp7$235 && tmp6$2353624701 == tmp6$235 && tmp5$2353624701 == tmp5$235 && this$2353624701 == this$235 && tmp123624701 == tmp12 && tmp113624701 == tmp11 && l3624701 == l && this3624701 == this && tid3624701 == tid && $pc3624701 == $pc;
  assume $recorded.state3624701 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this$235 != ReentrantLock.null;                                                           
  } else {                                                                                          
   assert this$235 != ReentrantLock.null;                                                                  // (31.7): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  $pc := transition($pc, mover3624701);                                                             
  assert $pc != PhaseError;                                                                                // (31.7): Reduction failure
  ReentrantLock.m[this$235] := tmp10$235;                                                           
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 27.14: break exit$235;                                                                          
                                                                                                    
 goto exit$235_bottom;                                                                              
 exit$235_bottom:                                                                                   
                                                                                                    
 // 47.7: yield;                                                                                    
                                                                                                    
 assume ReentrantLock._state3624714 == ReentrantLock._state && ReentrantLock.m3624714 == ReentrantLock.m && ReentrantLock.count3624714 == ReentrantLock.count && ReentrantLock._lock3624714 == ReentrantLock._lock && Main._state3624714 == Main._state && Main._lock3624714 == Main._lock && tmp123624714 == tmp12 && tmp113624714 == tmp11 && l3624714 == l && this3624714 == this && tid3624714 == tid;
 assume $recorded.state3624714 == 1;                                                                
 assert  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (47.7): Object invariant may not hold.
 assert  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (47.7): Object invariant may not hold.
 call Yield(tid);                                                                                   
 assume  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (47.7): Object invariant may not hold.
 assume  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (47.7): Object invariant may not hold.
 $pc := PreCommit;                                                                                  
 assume ReentrantLock._state3624714_post == ReentrantLock._state && ReentrantLock.m3624714_post == ReentrantLock.m && ReentrantLock.count3624714_post == ReentrantLock.count && ReentrantLock._lock3624714_post == ReentrantLock._lock && Main._state3624714_post == Main._state && Main._lock3624714_post == Main._lock && tmp123624714_post == tmp12 && tmp113624714_post == tmp11 && l3624714_post == l && this3624714_post == this && tid3624714_post == tid;
 assume $recorded.state3624714_post == 1;                                                           
                                                                                                    
 // 48.7: int tmp13;                                                                                
                                                                                                    
                                                                                                    
 // 48.7: tmp13 := l.count;                                                                         
                                                                                                    
                                                                                                    
 moverPath3624720 := ReadEval.ReentrantLock.count(tid: Tid,l: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 mover3624720 := m#moverPath(moverPath3624720);                                                     
 path3624720 := p#moverPath(moverPath3624720);                                                      
 assume ReentrantLock._state3624720 == ReentrantLock._state && ReentrantLock.m3624720 == ReentrantLock.m && ReentrantLock.count3624720 == ReentrantLock.count && ReentrantLock._lock3624720 == ReentrantLock._lock && Main._state3624720 == Main._state && Main._lock3624720 == Main._lock && tmp133624720 == tmp13 && tmp123624720 == tmp12 && tmp113624720 == tmp11 && l3624720 == l && this3624720 == this && tid3624720 == tid && $pc3624720 == $pc;
 assume $recorded.state3624720 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume l != ReentrantLock.null;                                                                   
 } else {                                                                                           
  assert l != ReentrantLock.null;                                                                          // (48.7): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover3624720);                                                              
 assert $pc != PhaseError;                                                                                 // (48.7): Reduction failure
 tmp13 := ReentrantLock.count[l];                                                                   
                                                                                                    
 // 48.7: assert tmp13 == 1;                                                                        
                                                                                                    
 assume ReentrantLock._state3624726 == ReentrantLock._state && ReentrantLock.m3624726 == ReentrantLock.m && ReentrantLock.count3624726 == ReentrantLock.count && ReentrantLock._lock3624726 == ReentrantLock._lock && Main._state3624726 == Main._state && Main._lock3624726 == Main._lock && tmp133624726 == tmp13 && tmp123624726 == tmp12 && tmp113624726 == tmp11 && l3624726 == l && this3624726 == this && tid3624726 == tid;
 assume $recorded.state3624726 == 1;                                                                
 assert (tmp13==1);                                                                                        // (48.7): This assertion may not hold.
                                                                                                    
 // 38.21: // return;                                                                               
                                                                                                    
 assume ReentrantLock._state3624727 == ReentrantLock._state && ReentrantLock.m3624727 == ReentrantLock.m && ReentrantLock.count3624727 == ReentrantLock.count && ReentrantLock._lock3624727 == ReentrantLock._lock && Main._state3624727 == Main._state && Main._lock3624727 == Main._lock && tmp133624727 == tmp13 && tmp123624727 == tmp12 && tmp113624727 == tmp11 && l3624727 == l && this3624727 == this && tid3624727 == tid;
 assume $recorded.state3624727 == 1;                                                                
 assert  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (38.21): Object invariant may not hold.
 assert  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (38.21): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(ReentrantLock._state: [ReentrantLock]State,ReentrantLock.m: [ReentrantLock]Tid,ReentrantLock.count: [ReentrantLock]int,ReentrantLock._lock: [ReentrantLock]Tid,Main._state: [Main]State,Main._lock: [Main]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: ReentrantLock  :: _i == ReentrantLock.null <==> isNull(ReentrantLock._state[_i])) &&  
  (forall _i: Main  :: _i == Main.null <==> isNull(Main._state[_i])) &&                             
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,x: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): ReentrantLock.m failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.ReentrantLock.m(u: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): ReentrantLock.m failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Tid;                                                                              
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ReentrantLock.m[x];                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 ReentrantLock.m[x] := havocValue;                                                                  
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,x: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): ReentrantLock.m failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Tid;                                                                              
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ReentrantLock.m[x];                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.ReentrantLock.m(u: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): ReentrantLock.m failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, x: ReentrantLock)  
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ReentrantLock.m(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,x: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): ReentrantLock.m failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, x: ReentrantLock)   
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Tid;                                                                              
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == ReentrantLock.m[x];                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ReentrantLock.m(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 ReentrantLock.m[x] := havocValue;                                                                  
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,x: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): ReentrantLock.m failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,x: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (11.3): ReentrantLock.count failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.ReentrantLock.count(u: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (11.3): ReentrantLock.count failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ReentrantLock.count[x];                                                                
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 ReentrantLock.count[x] := havocValue;                                                              
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,x: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (11.3): ReentrantLock.count failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == ReentrantLock.count[x];                                                                
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.ReentrantLock.count(u: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (11.3): ReentrantLock.count failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ReentrantLock.count(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,x: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (11.3): ReentrantLock.count failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, x: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[x], u);                                                 
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == ReentrantLock.count[x];                                                                
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.ReentrantLock.count(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 ReentrantLock.count[x] := havocValue;                                                              
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,x: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (11.3): ReentrantLock.count failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ReentrantLock.m.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ReentrantLock.m.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Tid;                                                                                   
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: Tid;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ReentrantLock.m[x];                                                                        
 ReentrantLock.m[x] := v;                                                                           
                                                                                                    
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ReentrantLock.m[x] := tmpV;                                                                        
 ReentrantLock.m[y] := w;                                                                           
 _writeByTPost := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ReentrantLock.m.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.m;                                                                          
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Tid;                                                                                   
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: Tid;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ReentrantLock.m[x];                                                                        
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ReentrantLock.m[x] := tmpV;                                                                        
 ReentrantLock.m[y] := w;                                                                           
 _writeByTPost := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ReentrantLock.m.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ReentrantLock.m(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.m[y] := w;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ReentrantLock.m(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
 assume _writeByU_Mover != _E;  // will block until it can go...                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ReentrantLock.m.ReentrantLock.m(t: Tid, u: Tid, v: Tid, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ReentrantLock.m(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ReentrantLock.m(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ReentrantLock.m.ReentrantLock.count(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ReentrantLock.m.ReentrantLock.count(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: Tid;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ReentrantLock.m[x];                                                                        
 ReentrantLock.m[x] := v;                                                                           
                                                                                                    
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ReentrantLock.m[x] := tmpV;                                                                        
 ReentrantLock.count[y] := w;                                                                       
 _writeByTPost := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ReentrantLock.m.ReentrantLock.count(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.count;                                                                      
                                                                                                    
 {                                                                                                  
 var tmpV : Tid;                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: Tid;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ReentrantLock.m[x];                                                                        
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ReentrantLock.m[x] := tmpV;                                                                        
 ReentrantLock.count[y] := w;                                                                       
 _writeByTPost := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assume _writeByTPost_Mover != _E;  // will block until it can go...                                
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ReentrantLock.m.ReentrantLock.count(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ReentrantLock.m(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.count[y] := w;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ReentrantLock.m(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.count (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.count (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.count (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ReentrantLock.m.ReentrantLock.count(t: Tid, u: Tid, v: Tid, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.m;                                                                          
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var v_pre: Tid;                                                                                    
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var v_post: Tid;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ReentrantLock.count(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ReentrantLock.m(t: Tid,x: ReentrantLock,v: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.m[x] := v;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ReentrantLock.count(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
 assume _writeByT_Mover != _E;  // will block until it can go...                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.m (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.m (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.m (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ReentrantLock.count.ReentrantLock.m(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ReentrantLock.count.ReentrantLock.m(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Tid;                                                                                   
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: int;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ReentrantLock.count[x];                                                                    
 ReentrantLock.count[x] := v;                                                                       
                                                                                                    
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ReentrantLock.count[x] := tmpV;                                                                    
 ReentrantLock.m[y] := w;                                                                           
 _writeByTPost := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ReentrantLock.count.ReentrantLock.m(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var w_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w0_mid: Tid;                                                                                   
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: int;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ReentrantLock.count[x];                                                                    
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ReentrantLock.count[x] := tmpV;                                                                    
 ReentrantLock.m[y] := w;                                                                           
 _writeByTPost := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assume _writeByUPost_Mover != _E;  // will block until it can go...                                
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ReentrantLock.count.ReentrantLock.m(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ReentrantLock.count(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ReentrantLock.m(u: Tid,y: ReentrantLock,w: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.m[y] := w;                                                                           
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ReentrantLock.count(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
 assume _writeByU_Mover != _E;  // will block until it can go...                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.m (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.m (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.m (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ReentrantLock.count.ReentrantLock.m(t: Tid, u: Tid, v: int, w: Tid, w0: Tid, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.m;                                                                          
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var w0_pre: Tid;                                                                                   
 var Main._lock_pre: [Main]Tid;                                                                     
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w_pre: Tid;                                                                                    
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var w_post: Tid;                                                                                   
 var w0_post: Tid;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ReentrantLock.m(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ReentrantLock.m(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.count (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.count (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.count (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.ReentrantLock.count.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.ReentrantLock.count.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: int;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := ReentrantLock.count[x];                                                                    
 ReentrantLock.count[x] := v;                                                                       
                                                                                                    
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 ReentrantLock.count[x] := tmpV;                                                                    
 ReentrantLock.count[y] := w;                                                                       
 _writeByTPost := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.ReentrantLock.count.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock.count_mid: [ReentrantLock]int;                                                   
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Main._lock_mid: [Main]Tid;                                                                     
 var $recorded.state_mid: int;                                                                      
 var y_mid: ReentrantLock;                                                                          
 var Main._state_mid: [Main]State;                                                                  
 var w_mid: int;                                                                                    
 var ReentrantLock._state_mid: [ReentrantLock]State;                                                
 var ReentrantLock.m_mid: [ReentrantLock]Tid;                                                       
 var v_mid: int;                                                                                    
 var ReentrantLock._lock_mid: [ReentrantLock]Tid;                                                   
 var x_mid: ReentrantLock;                                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := ReentrantLock.count[x];                                                                    
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_mid == ReentrantLock._state && ReentrantLock.m_mid == ReentrantLock.m && ReentrantLock.count_mid == ReentrantLock.count && ReentrantLock._lock_mid == ReentrantLock._lock && Main._state_mid == Main._state && Main._lock_mid == Main._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 ReentrantLock.count[x] := tmpV;                                                                    
 ReentrantLock.count[y] := w;                                                                       
 _writeByTPost := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.ReentrantLock.count.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.ReentrantLock.count(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.ReentrantLock.count(u: Tid,y: ReentrantLock,w: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.count[y] := w;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.ReentrantLock.count(t: Tid,x: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.count (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.count (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.count (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.ReentrantLock.count.ReentrantLock.count(t: Tid, u: Tid, v: int, w: int, w0: int, x: ReentrantLock, y: ReentrantLock)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(ReentrantLock._state[x], t);                                                 
 requires isAccessible(ReentrantLock._state[y], u);                                                 
 modifies ReentrantLock.count;                                                                      
 modifies ReentrantLock.count;                                                                      
                                                                                                    
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
 var ReentrantLock._state_pre: [ReentrantLock]State;                                                
 var y_pre: ReentrantLock;                                                                          
 var x_pre: ReentrantLock;                                                                          
 var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                       
 var Main._lock_pre: [Main]Tid;                                                                     
 var w_pre: int;                                                                                    
 var Main._state_pre: [Main]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var ReentrantLock.count_pre: [ReentrantLock]int;                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                  
 var $recorded.state_post: int;                                                                     
 var ReentrantLock.count_post: [ReentrantLock]int;                                                  
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Main._state_post: [Main]State;                                                                 
 var $pc_post: Phase;                                                                               
 var ReentrantLock._state_post: [ReentrantLock]State;                                               
 var y_post: ReentrantLock;                                                                         
 var ReentrantLock.m_post: [ReentrantLock]Tid;                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Main._lock_post: [Main]Tid;                                                                    
 var x_post: ReentrantLock;                                                                         
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.ReentrantLock.count(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.ReentrantLock.count(t: Tid,x: ReentrantLock,v: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 ReentrantLock.count[x] := v;                                                                       
 assume ReentrantLock._state_post == ReentrantLock._state && ReentrantLock.m_post == ReentrantLock.m && ReentrantLock.count_post == ReentrantLock.count && ReentrantLock._lock_post == ReentrantLock._lock && Main._state_post == Main._state && Main._lock_post == Main._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.ReentrantLock.count(u: Tid,y: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.count (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.count (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.count (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
requires ValidTid(tid);                                                                             
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
modifies ReentrantLock._state;                                                                      
modifies ReentrantLock.m;                                                                           
modifies ReentrantLock.count;                                                                       
modifies ReentrantLock._lock;                                                                       
modifies Main._state;                                                                               
modifies Main._lock;                                                                                
ensures StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
ensures Y(tid , old(ReentrantLock._state), old(ReentrantLock.m), old(ReentrantLock.count), old(ReentrantLock._lock), old(Main._state), old(Main._lock) , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
ensures  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// ReentrantLock.m:                                                                                 
                                                                                                    
function {:inline} Y_ReentrantLock.m(tid : Tid, this: ReentrantLock, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(ReentrantLock._state[this], tid) && leq(m#moverPath(ReadEval.ReentrantLock.m(tid: Tid,this: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _R)) ==> (ReentrantLock.m[this] == newValue))
 &&(((ReentrantLock.m[this]==tid)==(newValue==tid)))                                                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ReentrantLock.m(tid : Tid, this: ReentrantLock, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock.m.Subsumes.W(tid : Tid, u : Tid, this: ReentrantLock, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var u_yield: Tid;                                                                                   
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var this_yield: ReentrantLock;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
 assume isAccessible(ReentrantLock._state[this], u);                                                
 assume !isError(m#moverPath(WriteEval.ReentrantLock.m(u: Tid,this: ReentrantLock,newValue: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.ReentrantLock.m(tid: Tid,this: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _N);
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ReentrantLock.m(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock.m.Reflexive(tid : Tid, this: ReentrantLock , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var this_yield: ReentrantLock;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ReentrantLock.m(tid, this, ReentrantLock.m[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock.m.Transitive(tid : Tid, this: ReentrantLock, newValue : Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , ReentrantLock._state_p: [ReentrantLock]State, ReentrantLock.m_p: [ReentrantLock]Tid, ReentrantLock.count_p: [ReentrantLock]int, ReentrantLock._lock_p: [ReentrantLock]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires StateInvariant(ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (4.27): Object invariant may not hold.
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (4.27): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var ReentrantLock._state_pre: [ReentrantLock]State;                                                 
var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                    
var $recorded.state_pre: int;                                                                       
var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                        
var Main._lock_pre: [Main]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: ReentrantLock;                                                                        
var newValue_pre: Tid;                                                                              
var ReentrantLock.count_pre: [ReentrantLock]int;                                                    
                                                                                                    
var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                   
var $recorded.state_post: int;                                                                      
var ReentrantLock.count_post: [ReentrantLock]int;                                                   
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var ReentrantLock._state_post: [ReentrantLock]State;                                                
var tid_post: Tid;                                                                                  
var ReentrantLock.m_post: [ReentrantLock]Tid;                                                       
var this_post: ReentrantLock;                                                                       
var Main._lock_post: [Main]Tid;                                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
 assume Y(tid , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 assume Y_ReentrantLock.m(tid, this, newValue , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
assume ReentrantLock._state_post == ReentrantLock._state_p && ReentrantLock.m_post == ReentrantLock.m_p && ReentrantLock.count_post == ReentrantLock.count_p && ReentrantLock._lock_post == ReentrantLock._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ReentrantLock.m(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
// ReentrantLock.count:                                                                             
                                                                                                    
function {:inline} Y_ReentrantLock.count(tid : Tid, this: ReentrantLock, newValue: int , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(ReentrantLock._state[this], tid) && leq(m#moverPath(ReadEval.ReentrantLock.count(tid: Tid,this: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _R)) ==> (ReentrantLock.count[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ReentrantLock.count(tid : Tid, this: ReentrantLock, newValue: int , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock.count.Subsumes.W(tid : Tid, u : Tid, this: ReentrantLock, newValue: int , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var u_yield: Tid;                                                                                   
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var this_yield: ReentrantLock;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
 assume isAccessible(ReentrantLock._state[this], u);                                                
 assume !isError(m#moverPath(WriteEval.ReentrantLock.count(u: Tid,this: ReentrantLock,newValue: int,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)));
                                                                                                    
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ReentrantLock.count(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock.count.Reflexive(tid : Tid, this: ReentrantLock , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var this_yield: ReentrantLock;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ReentrantLock.count(tid, this, ReentrantLock.count[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock.count.Transitive(tid : Tid, this: ReentrantLock, newValue : int , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , ReentrantLock._state_p: [ReentrantLock]State, ReentrantLock.m_p: [ReentrantLock]Tid, ReentrantLock.count_p: [ReentrantLock]int, ReentrantLock._lock_p: [ReentrantLock]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires StateInvariant(ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (11.22): Object invariant may not hold.
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (11.22): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var ReentrantLock._state_pre: [ReentrantLock]State;                                                 
var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                    
var $recorded.state_pre: int;                                                                       
var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                        
var newValue_pre: int;                                                                              
var Main._lock_pre: [Main]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: ReentrantLock;                                                                        
var ReentrantLock.count_pre: [ReentrantLock]int;                                                    
                                                                                                    
var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                   
var $recorded.state_post: int;                                                                      
var ReentrantLock.count_post: [ReentrantLock]int;                                                   
var newValue_post: int;                                                                             
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var ReentrantLock._state_post: [ReentrantLock]State;                                                
var tid_post: Tid;                                                                                  
var ReentrantLock.m_post: [ReentrantLock]Tid;                                                       
var this_post: ReentrantLock;                                                                       
var Main._lock_post: [Main]Tid;                                                                     
                                                                                                    
assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
 assume Y(tid , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 assume Y_ReentrantLock.count(tid, this, newValue , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
assume ReentrantLock._state_post == ReentrantLock._state_p && ReentrantLock.m_post == ReentrantLock.m_p && ReentrantLock.count_post == ReentrantLock.count_p && ReentrantLock._lock_post == ReentrantLock._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ReentrantLock.count(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
// ReentrantLock._lock:                                                                             
                                                                                                    
function {:inline} Y_ReentrantLock._lock(tid : Tid, this: ReentrantLock, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(ReentrantLock._state[this], tid) && leq(m#moverPath(ReadEval.ReentrantLock._lock(tid: Tid,this: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _R)) ==> (ReentrantLock._lock[this] == newValue))
 &&(((ReentrantLock._lock[this]==tid)==(newValue==tid)))                                            
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_ReentrantLock._lock(tid : Tid, this: ReentrantLock, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock._lock.Subsumes.W(tid : Tid, u : Tid, this: ReentrantLock, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var u_yield: Tid;                                                                                   
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var this_yield: ReentrantLock;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
 assume isAccessible(ReentrantLock._state[this], u);                                                
 assume !isError(m#moverPath(WriteEval.ReentrantLock._lock(u: Tid,this: ReentrantLock,newValue: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.ReentrantLock._lock(tid: Tid,this: ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _N);
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ReentrantLock._lock(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock._lock.Reflexive(tid : Tid, this: ReentrantLock , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var this_yield: ReentrantLock;                                                                      
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_ReentrantLock._lock(tid, this, ReentrantLock._lock[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_ReentrantLock._lock.Transitive(tid : Tid, this: ReentrantLock, newValue : Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , ReentrantLock._state_p: [ReentrantLock]State, ReentrantLock.m_p: [ReentrantLock]Tid, ReentrantLock.count_p: [ReentrantLock]int, ReentrantLock._lock_p: [ReentrantLock]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires StateInvariant(ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (3.1): Object invariant may not hold.
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (3.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var ReentrantLock._state_pre: [ReentrantLock]State;                                                 
var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                    
var $recorded.state_pre: int;                                                                       
var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                        
var Main._lock_pre: [Main]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: ReentrantLock;                                                                        
var newValue_pre: Tid;                                                                              
var ReentrantLock.count_pre: [ReentrantLock]int;                                                    
                                                                                                    
var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                   
var $recorded.state_post: int;                                                                      
var ReentrantLock.count_post: [ReentrantLock]int;                                                   
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var ReentrantLock._state_post: [ReentrantLock]State;                                                
var tid_post: Tid;                                                                                  
var ReentrantLock.m_post: [ReentrantLock]Tid;                                                       
var this_post: ReentrantLock;                                                                       
var Main._lock_post: [Main]Tid;                                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(ReentrantLock._state[this], tid);                                              
 assume Y(tid , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 assume Y_ReentrantLock._lock(tid, this, newValue , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
assume ReentrantLock._state_post == ReentrantLock._state_p && ReentrantLock.m_post == ReentrantLock.m_p && ReentrantLock.count_post == ReentrantLock.count_p && ReentrantLock._lock_post == ReentrantLock._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_ReentrantLock._lock(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
// Main._lock:                                                                                      
                                                                                                    
function {:inline} Y_Main._lock(tid : Tid, this: Main, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 ((isAccessible(Main._state[this], tid) && leq(m#moverPath(ReadEval.Main._lock(tid: Tid,this: Main,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _R)) ==> (Main._lock[this] == newValue))
 &&(((Main._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Main._lock(tid : Tid, this: Main, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Subsumes.W(tid : Tid, u : Tid, this: Main, newValue: Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var this_yield: Main;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var u_yield: Tid;                                                                                   
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
 assume isAccessible(Main._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Main._lock(u: Tid,this: Main,newValue: Tid,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)));
 assume leq(m#moverPath(ReadEval.Main._lock(tid: Tid,this: Main,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock)), _N);
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Main._lock(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Reflexive(tid : Tid, this: Main , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var ReentrantLock._state_yield: [ReentrantLock]State;                                               
var tid_yield: Tid;                                                                                 
var Main._lock_yield: [Main]Tid;                                                                    
var ReentrantLock.m_yield: [ReentrantLock]Tid;                                                      
var $pc_yield: Phase;                                                                               
var this_yield: Main;                                                                               
var ReentrantLock._lock_yield: [ReentrantLock]Tid;                                                  
var ReentrantLock.count_yield: [ReentrantLock]int;                                                  
var Main._state_yield: [Main]State;                                                                 
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
assume ReentrantLock._state_yield == ReentrantLock._state && ReentrantLock.m_yield == ReentrantLock.m && ReentrantLock.count_yield == ReentrantLock.count && ReentrantLock._lock_yield == ReentrantLock._lock && Main._state_yield == Main._state && Main._lock_yield == Main._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Main._lock(tid, this, Main._lock[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
procedure Y_Main._lock.Transitive(tid : Tid, this: Main, newValue : Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , ReentrantLock._state_p: [ReentrantLock]State, ReentrantLock.m_p: [ReentrantLock]Tid, ReentrantLock.count_p: [ReentrantLock]int, ReentrantLock._lock_p: [ReentrantLock]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid)
 requires StateInvariant(ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
 requires StateInvariant(ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618241(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (36.1): Object invariant may not hold.
requires  (forall _this : ReentrantLock ::  { ReentrantLock._state[_this] } isAccessible(ReentrantLock._state[_this], tid) && true ==> Invariant.ReentrantLock.3618256(tid: Tid,_this : ReentrantLock,ReentrantLock._state,ReentrantLock.m,ReentrantLock.count,ReentrantLock._lock,Main._state,Main._lock));       // (36.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var ReentrantLock._state_pre: [ReentrantLock]State;                                                 
var ReentrantLock._lock_pre: [ReentrantLock]Tid;                                                    
var $recorded.state_pre: int;                                                                       
var ReentrantLock.m_pre: [ReentrantLock]Tid;                                                        
var this_pre: Main;                                                                                 
var Main._lock_pre: [Main]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var Main._state_pre: [Main]State;                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var ReentrantLock.count_pre: [ReentrantLock]int;                                                    
                                                                                                    
var ReentrantLock._lock_post: [ReentrantLock]Tid;                                                   
var this_post: Main;                                                                                
var $recorded.state_post: int;                                                                      
var ReentrantLock.count_post: [ReentrantLock]int;                                                   
var Main._state_post: [Main]State;                                                                  
var $pc_post: Phase;                                                                                
var ReentrantLock._state_post: [ReentrantLock]State;                                                
var tid_post: Tid;                                                                                  
var ReentrantLock.m_post: [ReentrantLock]Tid;                                                       
var Main._lock_post: [Main]Tid;                                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume ReentrantLock._state_pre == ReentrantLock._state && ReentrantLock.m_pre == ReentrantLock.m && ReentrantLock.count_pre == ReentrantLock.count && ReentrantLock._lock_pre == ReentrantLock._lock && Main._state_pre == Main._state && Main._lock_pre == Main._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Main._state[this], tid);                                                       
 assume Y(tid , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
 assume Y_Main._lock(tid, this, newValue , ReentrantLock._state_p, ReentrantLock.m_p, ReentrantLock.count_p, ReentrantLock._lock_p, Main._state_p, Main._lock_p);
assume ReentrantLock._state_post == ReentrantLock._state_p && ReentrantLock.m_post == ReentrantLock.m_p && ReentrantLock.count_post == ReentrantLock.count_p && ReentrantLock._lock_post == ReentrantLock._lock_p && Main._state_post == Main._state_p && Main._lock_post == Main._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Main._lock(tid, this, newValue , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , ReentrantLock._state: [ReentrantLock]State, ReentrantLock.m: [ReentrantLock]Tid, ReentrantLock.count: [ReentrantLock]int, ReentrantLock._lock: [ReentrantLock]Tid, Main._state: [Main]State, Main._lock: [Main]Tid , ReentrantLock._state_p: [ReentrantLock]State, ReentrantLock.m_p: [ReentrantLock]Tid, ReentrantLock.count_p: [ReentrantLock]int, ReentrantLock._lock_p: [ReentrantLock]Tid, Main._state_p: [Main]State, Main._lock_p: [Main]Tid): bool
{                                                                                                   
 (forall this: ReentrantLock :: Y_ReentrantLock.m(tid : Tid, this, ReentrantLock.m_p[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock))
 && (forall this: ReentrantLock :: Y_ReentrantLock.count(tid : Tid, this, ReentrantLock.count_p[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock))
 && (forall this: ReentrantLock :: Y_ReentrantLock._lock(tid : Tid, this, ReentrantLock._lock_p[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock))
 && (forall this: Main :: Y_Main._lock(tid : Tid, this, Main._lock_p[this] , ReentrantLock._state, ReentrantLock.m, ReentrantLock.count, ReentrantLock._lock, Main._state, Main._lock))
 && (forall _i : ReentrantLock :: isShared(ReentrantLock._state[_i]) ==> isShared(ReentrantLock._state_p[_i]))
 && (forall _i : ReentrantLock :: isLocal(ReentrantLock._state[_i], tid) <==> isLocal(ReentrantLock._state_p[_i], tid))
 && (forall _i : Main :: isShared(Main._state[_i]) ==> isShared(Main._state_p[_i]))                 
 && (forall _i : Main :: isLocal(Main._state[_i], tid) <==> isLocal(Main._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1223.1-2437.2: (Method:38.5)
// 1233.1-1233.24: (38.5): Bad tid
// 1234.1-1234.38: (38.5): this is not global
// 1237.1-1237.301: (38.5): Object invariant may not hold.
// 1238.1-1238.301: (38.5): Object invariant may not hold.
// 1241.1-1241.300: (38.5): Object invariant may not hold.
// 1242.1-1242.300: (38.5): Object invariant may not hold.
// 1788.2-1790.2: (class anchor.sink.VarDeclStmt:39.7)
// 1791.2-1799.45: (class anchor.sink.Alloc:39.7)
// 1802.2-1804.2: (class anchor.sink.VarDeclStmt:39.7)
// 1805.2-1808.16: (class anchor.sink.Assign:39.7)
// 1809.2-1812.47: (class anchor.sink.Assume:16.3)
// 1813.2-1816.44: (class anchor.sink.Assume:16.3)
// 1817.2-1819.2: (class anchor.sink.VarDeclStmt:17.5)
// 1820.2-1823.23: (class anchor.sink.Assign:17.5)
// 1825.2-1841.40: (class anchor.sink.Write:17.5)
// 1837.1-1837.41: (17.5): Cannot have potential null deference in left-mover part.
// 1840.1-1840.27: (17.5): Reduction failure
// 1842.2-1844.2: (class anchor.sink.VarDeclStmt:18.5)
// 1845.2-1848.16: (class anchor.sink.Assign:18.5)
// 1850.2-1866.44: (class anchor.sink.Write:18.5)
// 1862.1-1862.41: (18.5): Cannot have potential null deference in left-mover part.
// 1865.1-1865.27: (18.5): Reduction failure
// 1867.2-1870.23: (class anchor.sink.Break:16.19)
// 1874.2-1876.2: (class anchor.sink.VarDeclStmt:40.7)
// 1877.2-1880.16: (class anchor.sink.Assign:40.7)
// 1881.2-1884.83: (class anchor.sink.Assume:22.5)
// 1886.2-1902.35: (class anchor.sink.Write:23.5)
// 1898.1-1898.41: (23.5): Cannot have potential null deference in left-mover part.
// 1901.1-1901.27: (23.5): Reduction failure
// 1903.2-1905.2: (class anchor.sink.VarDeclStmt:24.5)
// 1906.2-1908.2: (class anchor.sink.VarDeclStmt:24.5)
// 1909.2-1926.44: (class anchor.sink.Read:24.5)
// 1921.1-1921.41: (24.5): Cannot have potential null deference in left-mover part.
// 1925.1-1925.27: (24.5): Reduction failure
// 1927.2-1930.27: (class anchor.sink.Assign:24.5)
// 1932.2-1948.44: (class anchor.sink.Write:24.5)
// 1944.1-1944.41: (24.5): Cannot have potential null deference in left-mover part.
// 1947.1-1947.27: (24.5): Reduction failure
// 1949.2-1952.23: (class anchor.sink.Break:21.14)
// 1956.2-1958.2: (class anchor.sink.VarDeclStmt:41.7)
// 1959.2-1962.16: (class anchor.sink.Assign:41.7)
// 1963.2-1966.83: (class anchor.sink.Assume:22.5)
// 1968.2-1984.35: (class anchor.sink.Write:23.5)
// 1980.1-1980.41: (23.5): Cannot have potential null deference in left-mover part.
// 1983.1-1983.27: (23.5): Reduction failure
// 1985.2-1987.2: (class anchor.sink.VarDeclStmt:24.5)
// 1988.2-1990.2: (class anchor.sink.VarDeclStmt:24.5)
// 1991.2-2008.44: (class anchor.sink.Read:24.5)
// 2003.1-2003.41: (24.5): Cannot have potential null deference in left-mover part.
// 2007.1-2007.27: (24.5): Reduction failure
// 2009.2-2012.27: (class anchor.sink.Assign:24.5)
// 2014.2-2030.44: (class anchor.sink.Write:24.5)
// 2026.1-2026.41: (24.5): Cannot have potential null deference in left-mover part.
// 2029.1-2029.27: (24.5): Reduction failure
// 2031.2-2034.23: (class anchor.sink.Break:21.14)
// 2036.2-2038.2: (class anchor.sink.VarDeclStmt:42.7)
// 2039.2-2056.34: (class anchor.sink.Read:42.7)
// 2051.1-2051.34: (42.7): Cannot have potential null deference in left-mover part.
// 2055.1-2055.27: (42.7): Reduction failure
// 2057.2-2062.20: (class anchor.sink.Assert:42.7)
// 2062.1-2062.20: (42.7): This assertion may not hold.
// 2065.2-2067.2: (class anchor.sink.VarDeclStmt:43.7)
// 2068.2-2071.16: (class anchor.sink.Assign:43.7)
// 2072.2-2074.2: (class anchor.sink.VarDeclStmt:28.5)
// 2075.2-2092.40: (class anchor.sink.Read:28.5)
// 2087.1-2087.41: (28.5): Cannot have potential null deference in left-mover part.
// 2091.1-2091.27: (28.5): Reduction failure
// 2093.2-2098.25: (class anchor.sink.Assert:28.5)
// 2098.1-2098.25: (28.5): This assertion may not hold.
// 2099.2-2101.2: (class anchor.sink.VarDeclStmt:29.5)
// 2102.2-2104.2: (class anchor.sink.VarDeclStmt:29.5)
// 2105.2-2122.44: (class anchor.sink.Read:29.5)
// 2117.1-2117.41: (29.5): Cannot have potential null deference in left-mover part.
// 2121.1-2121.27: (29.5): Reduction failure
// 2123.2-2126.27: (class anchor.sink.Assign:29.5)
// 2128.2-2144.44: (class anchor.sink.Write:29.5)
// 2140.1-2140.41: (29.5): Cannot have potential null deference in left-mover part.
// 2143.1-2143.27: (29.5): Reduction failure
// 2145.2-2147.2: (class anchor.sink.VarDeclStmt:30.5)
// 2148.2-2150.2: (class anchor.sink.VarDeclStmt:30.5)
// 2151.2-2168.44: (class anchor.sink.Read:30.5)
// 2163.1-2163.41: (30.5): Cannot have potential null deference in left-mover part.
// 2167.1-2167.27: (30.5): Reduction failure
// 2169.2-2172.28: (class anchor.sink.Assign:30.5)
// 2174.3-2176.3: (class anchor.sink.VarDeclStmt:31.7)
// 2177.3-2180.25: (class anchor.sink.Assign:31.7)
// 2182.3-2198.42: (class anchor.sink.Write:31.7)
// 2194.1-2194.42: (31.7): Cannot have potential null deference in left-mover part.
// 2197.1-2197.28: (31.7): Reduction failure
// 2201.2-2204.23: (class anchor.sink.Break:27.14)
// 2206.2-2218.42: (class anchor.sink.Yield:44.7)
// 2211.1-2211.300: (44.7): Object invariant may not hold.
// 2212.1-2212.300: (44.7): Object invariant may not hold.
// 2214.1-2214.300: (44.7): Object invariant may not hold.
// 2215.1-2215.300: (44.7): Object invariant may not hold.
// 2219.2-2221.2: (class anchor.sink.VarDeclStmt:45.7)
// 2222.2-2239.34: (class anchor.sink.Read:45.7)
// 2234.1-2234.34: (45.7): Cannot have potential null deference in left-mover part.
// 2238.1-2238.27: (45.7): Reduction failure
// 2240.2-2245.20: (class anchor.sink.Assert:45.7)
// 2245.1-2245.20: (45.7): This assertion may not hold.
// 2248.2-2250.2: (class anchor.sink.VarDeclStmt:46.7)
// 2251.2-2254.16: (class anchor.sink.Assign:46.7)
// 2255.2-2257.2: (class anchor.sink.VarDeclStmt:28.5)
// 2258.2-2275.40: (class anchor.sink.Read:28.5)
// 2270.1-2270.41: (28.5): Cannot have potential null deference in left-mover part.
// 2274.1-2274.27: (28.5): Reduction failure
// 2276.2-2281.25: (class anchor.sink.Assert:28.5)
// 2281.1-2281.25: (28.5): This assertion may not hold.
// 2282.2-2284.2: (class anchor.sink.VarDeclStmt:29.5)
// 2285.2-2287.2: (class anchor.sink.VarDeclStmt:29.5)
// 2288.2-2305.44: (class anchor.sink.Read:29.5)
// 2300.1-2300.41: (29.5): Cannot have potential null deference in left-mover part.
// 2304.1-2304.27: (29.5): Reduction failure
// 2306.2-2309.27: (class anchor.sink.Assign:29.5)
// 2311.2-2327.44: (class anchor.sink.Write:29.5)
// 2323.1-2323.41: (29.5): Cannot have potential null deference in left-mover part.
// 2326.1-2326.27: (29.5): Reduction failure
// 2328.2-2330.2: (class anchor.sink.VarDeclStmt:30.5)
// 2331.2-2333.2: (class anchor.sink.VarDeclStmt:30.5)
// 2334.2-2351.44: (class anchor.sink.Read:30.5)
// 2346.1-2346.41: (30.5): Cannot have potential null deference in left-mover part.
// 2350.1-2350.27: (30.5): Reduction failure
// 2352.2-2355.28: (class anchor.sink.Assign:30.5)
// 2357.3-2359.3: (class anchor.sink.VarDeclStmt:31.7)
// 2360.3-2363.25: (class anchor.sink.Assign:31.7)
// 2365.3-2381.42: (class anchor.sink.Write:31.7)
// 2377.1-2377.42: (31.7): Cannot have potential null deference in left-mover part.
// 2380.1-2380.28: (31.7): Reduction failure
// 2384.2-2387.23: (class anchor.sink.Break:27.14)
// 2389.2-2401.42: (class anchor.sink.Yield:47.7)
// 2394.1-2394.300: (47.7): Object invariant may not hold.
// 2395.1-2395.300: (47.7): Object invariant may not hold.
// 2397.1-2397.300: (47.7): Object invariant may not hold.
// 2398.1-2398.300: (47.7): Object invariant may not hold.
// 2402.2-2404.2: (class anchor.sink.VarDeclStmt:48.7)
// 2405.2-2422.34: (class anchor.sink.Read:48.7)
// 2417.1-2417.34: (48.7): Cannot have potential null deference in left-mover part.
// 2421.1-2421.27: (48.7): Reduction failure
// 2423.2-2428.20: (class anchor.sink.Assert:48.7)
// 2428.1-2428.20: (48.7): This assertion may not hold.
// 2429.2-2436.9: (class anchor.sink.Return:38.21)
// 2434.1-2434.300: (38.21): Object invariant may not hold.
// 2435.1-2435.300: (38.21): Object invariant may not hold.
// 2518.1-2518.34: (4.3): ReentrantLock.m failed Write-Write Right-Mover Check
// 2581.1-2581.30: (4.3): ReentrantLock.m failed Write-Read Right-Mover Check
// 2648.1-2648.34: (4.3): ReentrantLock.m failed Write-Write Left-Mover Check
// 2712.1-2712.30: (4.3): ReentrantLock.m failed Write-Read Left-Mover Check
// 2773.1-2773.34: (4.3): ReentrantLock.m failed Read-Write Right-Mover Check
// 2837.1-2837.34: (4.3): ReentrantLock.m failed Read-Write Left-Mover Check
// 2900.1-2900.34: (11.3): ReentrantLock.count failed Write-Write Right-Mover Check
// 2963.1-2963.30: (11.3): ReentrantLock.count failed Write-Read Right-Mover Check
// 3030.1-3030.34: (11.3): ReentrantLock.count failed Write-Write Left-Mover Check
// 3094.1-3094.30: (11.3): ReentrantLock.count failed Write-Read Left-Mover Check
// 3155.1-3155.34: (11.3): ReentrantLock.count failed Read-Write Right-Mover Check
// 3219.1-3219.34: (11.3): ReentrantLock.count failed Read-Write Left-Mover Check
// 3294.1-3294.140: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case A.1)
// 3295.1-3295.101: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case A.2)
// 3296.1-3296.158: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case A.3)
// 3398.1-3398.140: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case C)
// 3505.1-3505.144: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case D)
// 3506.1-3506.144: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.m (case R)
// 3581.1-3581.136: (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.m (case F)
// 3582.1-3582.136: (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.m (case H)
// 3583.1-3583.146: (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.m (case I)
// 3657.1-3657.136: (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.m (case J)
// 3658.1-3658.136: (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.m (case K)
// 3659.1-3659.99: (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.m (case L)
// 3735.1-3735.140: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case A.1)
// 3736.1-3736.101: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case A.2)
// 3737.1-3737.158: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case A.3)
// 3839.1-3839.140: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case C)
// 3946.1-3946.144: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case D)
// 3947.1-3947.144: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case R)
// 4022.1-4022.136: (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.count (case F)
// 4023.1-4023.136: (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.count (case H)
// 4024.1-4024.146: (4.3): ReentrantLock.m is not Read-Write Stable with respect to ReentrantLock.count (case I)
// 4098.1-4098.136: (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.m (case J)
// 4099.1-4099.136: (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.m (case K)
// 4100.1-4100.99: (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.m (case L)
// 4176.1-4176.140: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case A.1)
// 4177.1-4177.101: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case A.2)
// 4178.1-4178.158: (4.3): ReentrantLock.m is not Write-Write Stable with respect to ReentrantLock.count (case A.3)
// 4280.1-4280.140: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case C)
// 4387.1-4387.144: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case D)
// 4388.1-4388.144: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.m (case R)
// 4463.1-4463.136: (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.m (case F)
// 4464.1-4464.136: (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.m (case H)
// 4465.1-4465.146: (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.m (case I)
// 4539.1-4539.136: (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.count (case J)
// 4540.1-4540.136: (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.count (case K)
// 4541.1-4541.99: (4.3): ReentrantLock.m is not Write-Read Stable with respect to ReentrantLock.count (case L)
// 4617.1-4617.140: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case A.1)
// 4618.1-4618.101: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case A.2)
// 4619.1-4619.158: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case A.3)
// 4721.1-4721.140: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case C)
// 4828.1-4828.144: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case D)
// 4829.1-4829.144: (11.3): ReentrantLock.count is not Write-Write Stable with respect to ReentrantLock.count (case R)
// 4904.1-4904.136: (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.count (case F)
// 4905.1-4905.136: (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.count (case H)
// 4906.1-4906.146: (11.3): ReentrantLock.count is not Read-Write Stable with respect to ReentrantLock.count (case I)
// 4980.1-4980.136: (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.count (case J)
// 4981.1-4981.136: (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.count (case K)
// 4982.1-4982.99: (11.3): ReentrantLock.count is not Write-Read Stable with respect to ReentrantLock.count (case L)
// 4989.1-4989.301: (<undefined position>): Object invariant may not hold.
// 4990.1-4990.301: (<undefined position>): Object invariant may not hold.
// 4999.1-4999.300: (<undefined position>): Object invariant may not hold.
// 5000.1-5000.300: (<undefined position>): Object invariant may not hold.
// 5021.1-5043.2: (9.34): yields_as clause for ReentrantLock.m is not valid
// 5048.1-5065.2: (9.34): yields_as clause for ReentrantLock.m is not reflexive
// 5071.1-5071.301: (4.27): Object invariant may not hold.
// 5072.1-5072.301: (4.27): Object invariant may not hold.
// 5073.1-5107.2: (9.34): yields_as clause for ReentrantLock.m is not transitive
// 5126.1-5148.2: (11.3): yields_as clause for ReentrantLock.count is not valid
// 5153.1-5170.2: (11.3): yields_as clause for ReentrantLock.count is not reflexive
// 5176.1-5176.301: (11.22): Object invariant may not hold.
// 5177.1-5177.301: (11.22): Object invariant may not hold.
// 5178.1-5212.2: (11.3): yields_as clause for ReentrantLock.count is not transitive
// 5232.1-5254.2: (7.32): yields_as clause for ReentrantLock._lock is not valid
// 5259.1-5276.2: (7.32): yields_as clause for ReentrantLock._lock is not reflexive
// 5282.1-5282.301: (3.1): Object invariant may not hold.
// 5283.1-5283.301: (3.1): Object invariant may not hold.
// 5284.1-5318.2: (7.32): yields_as clause for ReentrantLock._lock is not transitive
// 5338.1-5360.2: (7.32): yields_as clause for Main._lock is not valid
// 5365.1-5382.2: (7.32): yields_as clause for Main._lock is not reflexive
// 5388.1-5388.301: (36.1): Object invariant may not hold.
// 5389.1-5389.301: (36.1): Object invariant may not hold.
// 5390.1-5424.2: (7.32): yields_as clause for Main._lock is not transitive
