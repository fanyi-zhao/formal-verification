                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/decreases2.anchor:                      
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
       ? isLocal(this, tid) ? B : E                                                                 
       : isRead ? B : E                                                                             
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
      invariant  this.locks.length > 0;                                                             
      invariant  forall int i ::0 <= i && i < this.locks.length ==> this.locks[i] != Lock.null;     
      invariant  forall int i,int j ::0 <= i && i < this.locks.length && 0 <= j && j < this.locks.length && this.locks[i] == this.locks[j] ==> i == j;
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize() {                                                                        
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp1;                                                                           
            int tmp2;                                                                               
            [HashSet.LOCK{this}] tmp3;                                                              
            tmp3 := this.locks;                                                                     
            tmp2 = tmp3.length;                                                                     
            tmp1 = i < tmp2;                                                                        
            if (!tmp1) break; else {                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp5;                                                            
              tmp5 := this.locks;                                                                   
              Lock tmp4;                                                                            
              tmp4 := tmp5[i];                                                                      
              acquire(tmp4);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
            {                                                                                       
            boolean tmp6;                                                                           
            int tmp7;                                                                               
            [HashSet.LOCK{this}] tmp8;                                                              
            tmp8 := this.locks;                                                                     
            tmp7 = tmp8.length;                                                                     
            tmp6 = i < tmp7;                                                                        
            if (!tmp6) break; else {                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp10;                                                           
              tmp10 := this.locks;                                                                  
              Lock tmp9;                                                                            
              tmp9 := tmp10[i];                                                                     
              release(tmp9);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize2() {                                                                       
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp11;                                                                          
            int tmp12;                                                                              
            [HashSet.LOCK{this}] tmp13;                                                             
            tmp13 := this.locks;                                                                    
            tmp12 = tmp13.length;                                                                   
            tmp11 = i < tmp12;                                                                      
            if (!tmp11) break; else {                                                               
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp15;                                                           
              tmp15 := this.locks;                                                                  
              Lock tmp14;                                                                           
              tmp14 := tmp15[i];                                                                    
              acquire(tmp14);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
                                                                                                    
            decreases this.locks.length - i;                                                        
           {                                                                                        
            boolean tmp16;                                                                          
            int tmp17;                                                                              
            [HashSet.LOCK{this}] tmp18;                                                             
            tmp18 := this.locks;                                                                    
            tmp17 = tmp18.length;                                                                   
            tmp16 = i < tmp17;                                                                      
            if (!tmp16) break; else {                                                               
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp20;                                                           
              tmp20 := this.locks;                                                                  
              Lock tmp19;                                                                           
              tmp19 := tmp20[i];                                                                    
              release(tmp19);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
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
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
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
                                                                                                    
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
      invariant  this.locks.length > 0;                                                             
      invariant  forall int i ::0 <= i && i < this.locks.length ==> this.locks[i] != Lock.null;     
      invariant  forall int i,int j ::0 <= i && i < this.locks.length && 0 <= j && j < this.locks.length && this.locks[i] == this.locks[j] ==> i == j;
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize() {                                                                        
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp1;                                                                           
            int tmp2;                                                                               
            [HashSet.LOCK{this}] tmp3;                                                              
            tmp3 := this.locks;                                                                     
            tmp2 = tmp3.length;                                                                     
            tmp1 = i < tmp2;                                                                        
            if (!tmp1) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp5;                                                            
              tmp5 := this.locks;                                                                   
              Lock tmp4;                                                                            
              tmp4 := tmp5[i];                                                                      
              acquire(tmp4);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
            {                                                                                       
            boolean tmp6;                                                                           
            int tmp7;                                                                               
            [HashSet.LOCK{this}] tmp8;                                                              
            tmp8 := this.locks;                                                                     
            tmp7 = tmp8.length;                                                                     
            tmp6 = i < tmp7;                                                                        
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp10;                                                           
              tmp10 := this.locks;                                                                  
              Lock tmp9;                                                                            
              tmp9 := tmp10[i];                                                                     
              release(tmp9);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize2() {                                                                       
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp11;                                                                          
            int tmp12;                                                                              
            [HashSet.LOCK{this}] tmp13;                                                             
            tmp13 := this.locks;                                                                    
            tmp12 = tmp13.length;                                                                   
            tmp11 = i < tmp12;                                                                      
            if (!tmp11) {                                                                           
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp15;                                                           
              tmp15 := this.locks;                                                                  
              Lock tmp14;                                                                           
              tmp14 := tmp15[i];                                                                    
              acquire(tmp14);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
                                                                                                    
            decreases this.locks.length - i;                                                        
           {                                                                                        
            boolean tmp16;                                                                          
            int tmp17;                                                                              
            [HashSet.LOCK{this}] tmp18;                                                             
            tmp18 := this.locks;                                                                    
            tmp17 = tmp18.length;                                                                   
            tmp16 = i < tmp17;                                                                      
            if (!tmp16) {                                                                           
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp20;                                                           
              tmp20 := this.locks;                                                                  
              Lock tmp19;                                                                           
              tmp19 := tmp20[i];                                                                    
              release(tmp19);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
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
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
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
                                                                                                    
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
      invariant  this.locks.length > 0;                                                             
      invariant  forall int i ::0 <= i && i < this.locks.length ==> this.locks[i] != Lock.null;     
      invariant  forall int i,int j ::0 <= i && i < this.locks.length && 0 <= j && j < this.locks.length && this.locks[i] == this.locks[j] ==> i == j;
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize() {                                                                        
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp1;                                                                           
            int tmp2;                                                                               
            [HashSet.LOCK{this}] tmp3;                                                              
            tmp3 := this.locks;                                                                     
            tmp2 = tmp3.length;                                                                     
            tmp1 = i < tmp2;                                                                        
            if (!tmp1) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp5;                                                            
              tmp5 := this.locks;                                                                   
              Lock tmp4;                                                                            
              tmp4 := tmp5[i];                                                                      
              acquire(tmp4);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
            {                                                                                       
            boolean tmp6;                                                                           
            int tmp7;                                                                               
            [HashSet.LOCK{this}] tmp8;                                                              
            tmp8 := this.locks;                                                                     
            tmp7 = tmp8.length;                                                                     
            tmp6 = i < tmp7;                                                                        
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp10;                                                           
              tmp10 := this.locks;                                                                  
              Lock tmp9;                                                                            
              tmp9 := tmp10[i];                                                                     
              release(tmp9);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize2() {                                                                       
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp11;                                                                          
            int tmp12;                                                                              
            [HashSet.LOCK{this}] tmp13;                                                             
            tmp13 := this.locks;                                                                    
            tmp12 = tmp13.length;                                                                   
            tmp11 = i < tmp12;                                                                      
            if (!tmp11) {                                                                           
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp15;                                                           
              tmp15 := this.locks;                                                                  
              Lock tmp14;                                                                           
              tmp14 := tmp15[i];                                                                    
              acquire(tmp14);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
                                                                                                    
            decreases this.locks.length - i;                                                        
           {                                                                                        
            boolean tmp16;                                                                          
            int tmp17;                                                                              
            [HashSet.LOCK{this}] tmp18;                                                             
            tmp18 := this.locks;                                                                    
            tmp17 = tmp18.length;                                                                   
            tmp16 = i < tmp17;                                                                      
            if (!tmp16) {                                                                           
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp20;                                                           
              tmp20 := this.locks;                                                                  
              Lock tmp19;                                                                           
              tmp19 := tmp20[i];                                                                    
              release(tmp19);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Lock {                                                                                    
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
                                                                                                    
    }                                                                                               
    class HashSet {                                                                                 
      array LOCK = Lock[isLocal(athis, tid)                                                         
       ? B                                                                                          
       : isRead ? B : E]                                                                            
                                                                                                    
       [HashSet.LOCK{this}] locks isLocal(this, tid)                                                
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
                                                                                                    
                                                                                                    
      invariant  this.locks != [HashSet.LOCK{this}].null;                                           
      invariant  this.locks.length > 0;                                                             
      invariant  forall int i ::0 <= i && i < this.locks.length ==> this.locks[i] != Lock.null;     
      invariant  forall int i,int j ::0 <= i && i < this.locks.length && 0 <= j && j < this.locks.length && this.locks[i] == this.locks[j] ==> i == j;
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.locks == [HashSet.LOCK{this}].null;                                             
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize() {                                                                        
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp1;                                                                           
            int tmp2;                                                                               
            [HashSet.LOCK{this}] tmp3;                                                              
            tmp3 := this.locks;                                                                     
            tmp2 = tmp3.length;                                                                     
            tmp1 = i < tmp2;                                                                        
            if (!tmp1) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp5;                                                            
              tmp5 := this.locks;                                                                   
              Lock tmp4;                                                                            
              tmp4 := tmp5[i];                                                                      
              acquire(tmp4);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
            {                                                                                       
            boolean tmp6;                                                                           
            int tmp7;                                                                               
            [HashSet.LOCK{this}] tmp8;                                                              
            tmp8 := this.locks;                                                                     
            tmp7 = tmp8.length;                                                                     
            tmp6 = i < tmp7;                                                                        
            if (!tmp6) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp10;                                                           
              tmp10 := this.locks;                                                                  
              Lock tmp9;                                                                            
              tmp9 := tmp10[i];                                                                     
              release(tmp9);                                                                        
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void resize2() {                                                                       
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid);                 
            {                                                                                       
            boolean tmp11;                                                                          
            int tmp12;                                                                              
            [HashSet.LOCK{this}] tmp13;                                                             
            tmp13 := this.locks;                                                                    
            tmp12 = tmp13.length;                                                                   
            tmp11 = i < tmp12;                                                                      
            if (!tmp11) {                                                                           
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp15;                                                           
              tmp15 := this.locks;                                                                  
              Lock tmp14;                                                                           
              tmp14 := tmp15[i];                                                                    
              acquire(tmp14);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        commit;                                                                                     
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)                                                                              
            invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid); 
                                                                                                    
            decreases this.locks.length - i;                                                        
           {                                                                                        
            boolean tmp16;                                                                          
            int tmp17;                                                                              
            [HashSet.LOCK{this}] tmp18;                                                             
            tmp18 := this.locks;                                                                    
            tmp17 = tmp18.length;                                                                   
            tmp16 = i < tmp17;                                                                      
            if (!tmp16) {                                                                           
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              [HashSet.LOCK{this}] tmp20;                                                           
              tmp20 := this.locks;                                                                  
              Lock tmp19;                                                                           
              tmp19 := tmp20[i];                                                                    
              release(tmp19);                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl Lock ***/                                                                           
                                                                                                    
type Lock;                                                                                          
const unique Lock.null: Lock;                                                                       
var Lock._state: [Lock]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Lock._lock: [Lock]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Lock._lock(tid: Tid,this : Lock,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Lock._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Lock._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Lock._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Lock._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Lock._lock(tid: Tid,this : Lock,newValue: Tid,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Lock._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Lock._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Lock._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Lock._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl HashSet ***/                                                                        
                                                                                                    
type HashSet;                                                                                       
const unique HashSet.null: HashSet;                                                                 
var HashSet._state: [HashSet]State;                                                                 
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var HashSet.locks: [HashSet]Array.HashSet.LOCK;                                                     
                                                                                                    
function {:inline} ReadEval.HashSet.locks(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.HashSet.LOCK.null;                                                          
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isLocal(HashSet._state[this], tid)) then                                                      
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
                                                                                                    
function {:inline} WriteEval.HashSet.locks(tid: Tid,this : HashSet,newValue: Array.HashSet.LOCK,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isLocal(HashSet._state[this], tid)) then                                                      
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
                                                                                                    
var HashSet._lock: [HashSet]Tid;                                                                    
                                                                                                    
function {:inline} ReadEval.HashSet._lock(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((HashSet._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((HashSet._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((HashSet._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.HashSet._lock(tid: Tid,this : HashSet,newValue: Tid,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(HashSet._state[this], tid)) then                                                       
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((HashSet._lock[this]==tid)) then                                                             
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((HashSet._lock[this]==Tid.null)&&(newValue==tid))) then                                     
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((HashSet._lock[this]==tid)&&(newValue==Tid.null))) then                                    
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.HashSet.1197032(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
 (HashSet.locks[this]!=Array.HashSet.LOCK.null)                                                     
}                                                                                                   
                                                                                                    
function {:inline} Invariant.HashSet.1197040(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
 (Array.HashSet.LOCK._length[HashSet.locks[this]]>0)                                                
}                                                                                                   
                                                                                                    
function {:inline} Invariant.HashSet.1197068(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
 (forall i: int ::  ((((0<=i)&&(i<Array.HashSet.LOCK._length[HashSet.locks[this]]))==>(Array.HashSet.LOCK._elems[HashSet.locks[this]][i]!=Lock.null))))
}                                                                                                   
                                                                                                    
function {:inline} Invariant.HashSet.1197120(tid: Tid,this : HashSet,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
 (forall i: int,j: int ::  (((((((0<=i)&&(i<Array.HashSet.LOCK._length[HashSet.locks[this]]))&&(0<=j))&&(j<Array.HashSet.LOCK._length[HashSet.locks[this]]))&&(Array.HashSet.LOCK._elems[HashSet.locks[this]][i]==Array.HashSet.LOCK._elems[HashSet.locks[this]][j]))==>(i==j))))
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  HashSet.resize(tid:Tid, this : HashSet)                                                  
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet.locks;                                                                             
modifies HashSet._lock;                                                                             
modifies Array.HashSet.LOCK._state;                                                                 
modifies Array.HashSet.LOCK._elems;                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (19.5): Bad tid
requires isShared(HashSet._state[this]);                                                                   // (19.5): this is not global
                                                                                                    
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.5): Object invariant may not hold.
{                                                                                                   
 var this1203333: HashSet;                                                                          
 var tmp101203312: Array.HashSet.LOCK;                                                              
 var tmp8: Array.HashSet.LOCK;                                                                      
 var path1203229: int;                                                                              
 var Lock._state1203331_bottom: [Lock]State;                                                        
 var HashSet._lock1203291: [HashSet]Tid;                                                            
 var HashSet.locks1203331: [HashSet]Array.HashSet.LOCK;                                             
 var this1203312: HashSet;                                                                          
 var mover1203319: Mover;                                                                           
 var Array.HashSet.LOCK._state1203331: [Array.HashSet.LOCK]State;                                   
 var Array.HashSet.LOCK._elems1203333: [Array.HashSet.LOCK]([int]Lock);                             
 var path1203250: int;                                                                              
 var $pc1203257: Phase;                                                                             
 var this1203269: HashSet;                                                                          
 var HashSet._lock1203271: [HashSet]Tid;                                                            
 var Array.HashSet.LOCK._elems1203269_bottom: [Array.HashSet.LOCK]([int]Lock);                      
 var Array.HashSet.LOCK._length1203269_bottom: [Array.HashSet.LOCK]int;                             
 var HashSet.locks1203312: [HashSet]Array.HashSet.LOCK;                                             
 var Array.HashSet.LOCK._elems1203257: [Array.HashSet.LOCK]([int]Lock);                             
 var HashSet._lock1203257: [HashSet]Tid;                                                            
 var $pc1203271: Phase;                                                                             
 var phase1203331: Phase;                                                                           
 var Array.HashSet.LOCK._length1203269: [Array.HashSet.LOCK]int;                                    
 var tid1203291: Tid;                                                                               
 var HashSet._state1203331: [HashSet]State;                                                         
 var Lock._lock1203271: [Lock]Tid;                                                                  
 var HashSet._lock1203331_bottom: [HashSet]Tid;                                                     
 var $pc1203229: Phase;                                                                             
 var HashSet._lock1203333: [HashSet]Tid;                                                            
 var phase1203269: Phase;                                                                           
 var HashSet.locks1203291: [HashSet]Array.HashSet.LOCK;                                             
 var this1203269_bottom: HashSet;                                                                   
 var i1203331: int;                                                                                 
 var $recorded.state1203229: int;                                                                   
 var Array.HashSet.LOCK._state1203229: [Array.HashSet.LOCK]State;                                   
 var Array.HashSet.LOCK._elems1203229: [Array.HashSet.LOCK]([int]Lock);                             
 var HashSet.locks1203269_bottom: [HashSet]Array.HashSet.LOCK;                                      
 var HashSet._lock1203312: [HashSet]Tid;                                                            
 var tmp61203291: bool;                                                                             
 var $pc1203331_bottom: Phase;                                                                      
 var this1203257: HashSet;                                                                          
 var this1203229: HashSet;                                                                          
 var Array.HashSet.LOCK._length1203229: [Array.HashSet.LOCK]int;                                    
 var Array.HashSet.LOCK._state1203319: [Array.HashSet.LOCK]State;                                   
 var HashSet._lock1203269_bottom: [HashSet]Tid;                                                     
 var $recorded.state1203331_bottom: int;                                                            
 var tmp11203229: bool;                                                                             
 var $pc1203269: Phase;                                                                             
 var tmp1: bool;                                                                                    
 var tmp71203319: int;                                                                              
 var HashSet._state1203271: [HashSet]State;                                                         
 var path1203312: int;                                                                              
 var Lock._lock1203319: [Lock]Tid;                                                                  
 var tmp31203250: Array.HashSet.LOCK;                                                               
 var HashSet._lock1203250: [HashSet]Tid;                                                            
 var HashSet.locks1203319: [HashSet]Array.HashSet.LOCK;                                             
 var Array.HashSet.LOCK._elems1203250: [Array.HashSet.LOCK]([int]Lock);                             
 var $recorded.state1203319: int;                                                                   
 var Lock._state1203257: [Lock]State;                                                               
 var $recorded.state1203257: int;                                                                   
 var i1203269_bottom: int;                                                                          
 var $recorded.state1203333: int;                                                                   
 var $recorded.state1203312: int;                                                                   
 var this1203331_bottom: HashSet;                                                                   
 var HashSet.locks1203331_bottom: [HashSet]Array.HashSet.LOCK;                                      
 var tid1203250: Tid;                                                                               
 var Array.HashSet.LOCK._elems1203312: [Array.HashSet.LOCK]([int]Lock);                             
 var tmp81203291: Array.HashSet.LOCK;                                                               
 var tmp91203319: Lock;                                                                             
 var Lock._state1203229: [Lock]State;                                                               
 var Array.HashSet.LOCK._elems1203271: [Array.HashSet.LOCK]([int]Lock);                             
 var i: int;                                                                                        
 var this1203319: HashSet;                                                                          
 var tmp81203319: Array.HashSet.LOCK;                                                               
 var i1203269: int;                                                                                 
 var Lock._lock1203331_bottom: [Lock]Tid;                                                           
 var Array.HashSet.LOCK._length1203333: [Array.HashSet.LOCK]int;                                    
 var $recorded.state1203269_bottom: int;                                                            
 var Lock._state1203333: [Lock]State;                                                               
 var tmp61203312: bool;                                                                             
 var tmp11203257: bool;                                                                             
 var i1203291: int;                                                                                 
 var HashSet.locks1203271: [HashSet]Array.HashSet.LOCK;                                             
 var HashSet._state1203331_bottom: [HashSet]State;                                                  
 var Lock._state1203269: [Lock]State;                                                               
 var HashSet._state1203269: [HashSet]State;                                                         
 var moverPath1203229: MoverPath;                                                                   
 var Array.HashSet.LOCK._elems1203269: [Array.HashSet.LOCK]([int]Lock);                             
 var tid1203271: Tid;                                                                               
 var tmp21203257: int;                                                                              
 var Array.HashSet.LOCK._state1203312: [Array.HashSet.LOCK]State;                                   
 var tid1203319: Tid;                                                                               
 var i1203331_bottom: int;                                                                          
 var HashSet.locks1203333: [HashSet]Array.HashSet.LOCK;                                             
 var HashSet.locks1203257: [HashSet]Array.HashSet.LOCK;                                             
 var Lock._state1203319: [Lock]State;                                                               
 var tmp81203312: Array.HashSet.LOCK;                                                               
 var Array.HashSet.LOCK._state1203331_bottom: [Array.HashSet.LOCK]State;                            
 var $pc1203291: Phase;                                                                             
 var Array.HashSet.LOCK._elems1203291: [Array.HashSet.LOCK]([int]Lock);                             
 var Array.HashSet.LOCK._state1203291: [Array.HashSet.LOCK]State;                                   
 var HashSet._lock1203229: [HashSet]Tid;                                                            
 var tmp71203312: int;                                                                              
 var $recorded.state1203269: int;                                                                   
 var Array.HashSet.LOCK._state1203269_bottom: [Array.HashSet.LOCK]State;                            
 var tmp31203229: Array.HashSet.LOCK;                                                               
 var $recorded.state1203331: int;                                                                   
 var tid1203331_bottom: Tid;                                                                        
 var $pc1203269_bottom: Phase;                                                                      
 var Lock._lock1203257: [Lock]Tid;                                                                  
 var Lock._state1203269_bottom: [Lock]State;                                                        
 var moverPath1203257: MoverPath;                                                                   
 var tid1203269_bottom: Tid;                                                                        
 var $pc1203319: Phase;                                                                             
 var HashSet._lock1203269: [HashSet]Tid;                                                            
 var Lock._state1203312: [Lock]State;                                                               
 var tmp21203250: int;                                                                              
 var HashSet._state1203257: [HashSet]State;                                                         
 var mover1203257: Mover;                                                                           
 var Lock._lock1203291: [Lock]Tid;                                                                  
 var $recorded.state1203291: int;                                                                   
 var tid1203257: Tid;                                                                               
 var $pc1203250: Phase;                                                                             
 var mover1203312: Mover;                                                                           
 var $pc1203331: Phase;                                                                             
 var Array.HashSet.LOCK._elems1203331_bottom: [Array.HashSet.LOCK]([int]Lock);                      
 var tmp9: Lock;                                                                                    
 var HashSet.locks1203229: [HashSet]Array.HashSet.LOCK;                                             
 var Array.HashSet.LOCK._state1203269: [Array.HashSet.LOCK]State;                                   
 var Lock._state1203331: [Lock]State;                                                               
 var tmp11203250: bool;                                                                             
 var i1203257: int;                                                                                 
 var Array.HashSet.LOCK._length1203291: [Array.HashSet.LOCK]int;                                    
 var tmp4: Lock;                                                                                    
 var tid1203269: Tid;                                                                               
 var moverPath1203312: MoverPath;                                                                   
 var i1203229: int;                                                                                 
 var path1203291: int;                                                                              
 var tmp5: Array.HashSet.LOCK;                                                                      
 var HashSet._state1203229: [HashSet]State;                                                         
 var tmp51203250: Array.HashSet.LOCK;                                                               
 var Array.HashSet.LOCK._elems1203319: [Array.HashSet.LOCK]([int]Lock);                             
 var path1203257: int;                                                                              
 var tmp71203291: int;                                                                              
 var this1203271: HashSet;                                                                          
 var moverPath1203291: MoverPath;                                                                   
 var HashSet._state1203250: [HashSet]State;                                                         
 var Lock._lock1203269: [Lock]Tid;                                                                  
 var Array.HashSet.LOCK._state1203250: [Array.HashSet.LOCK]State;                                   
 var Array.HashSet.LOCK._length1203331: [Array.HashSet.LOCK]int;                                    
 var tmp10: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length1203271: [Array.HashSet.LOCK]int;                                    
 var HashSet._state1203312: [HashSet]State;                                                         
 var Lock._state1203271: [Lock]State;                                                               
 var Array.HashSet.LOCK._length1203257: [Array.HashSet.LOCK]int;                                    
 var this1203250: HashSet;                                                                          
 var tmp7: int;                                                                                     
 var Lock._state1203291: [Lock]State;                                                               
 var $recorded.state1203250: int;                                                                   
 var tmp6: bool;                                                                                    
 var HashSet.locks1203269: [HashSet]Array.HashSet.LOCK;                                             
 var HashSet._state1203319: [HashSet]State;                                                         
 var Array.HashSet.LOCK._length1203312: [Array.HashSet.LOCK]int;                                    
 var Array.HashSet.LOCK._elems1203331: [Array.HashSet.LOCK]([int]Lock);                             
 var HashSet._state1203333: [HashSet]State;                                                         
 var i1203312: int;                                                                                 
 var HashSet._lock1203331: [HashSet]Tid;                                                            
 var HashSet.locks1203250: [HashSet]Array.HashSet.LOCK;                                             
 var Lock._lock1203331: [Lock]Tid;                                                                  
 var Lock._lock1203312: [Lock]Tid;                                                                  
 var tid1203331: Tid;                                                                               
 var tid1203333: Tid;                                                                               
 var path1203319: int;                                                                              
 var tid1203312: Tid;                                                                               
 var this1203291: HashSet;                                                                          
 var i1203250: int;                                                                                 
 var mover1203250: Mover;                                                                           
 var tmp3: Array.HashSet.LOCK;                                                                      
 var Array.HashSet.LOCK._state1203333: [Array.HashSet.LOCK]State;                                   
 var Lock._lock1203333: [Lock]Tid;                                                                  
 var Array.HashSet.LOCK._length1203319: [Array.HashSet.LOCK]int;                                    
 var HashSet._state1203269_bottom: [HashSet]State;                                                  
 var moverPath1203250: MoverPath;                                                                   
 var tmp31203257: Array.HashSet.LOCK;                                                               
 var Array.HashSet.LOCK._length1203250: [Array.HashSet.LOCK]int;                                    
 var $pc1203333: Phase;                                                                             
 var mover1203229: Mover;                                                                           
 var tmp2: int;                                                                                     
 var Array.HashSet.LOCK._length1203331_bottom: [Array.HashSet.LOCK]int;                             
 var Lock._state1203250: [Lock]State;                                                               
 var Lock._lock1203269_bottom: [Lock]Tid;                                                           
 var this1203331: HashSet;                                                                          
 var Array.HashSet.LOCK._state1203257: [Array.HashSet.LOCK]State;                                   
 var mover1203291: Mover;                                                                           
 var $recorded.state1203271: int;                                                                   
 var HashSet._lock1203319: [HashSet]Tid;                                                            
 var Lock._lock1203229: [Lock]Tid;                                                                  
 var tmp41203257: Lock;                                                                             
 var tid1203229: Tid;                                                                               
 var moverPath1203319: MoverPath;                                                                   
 var tmp61203319: bool;                                                                             
 var Lock._lock1203250: [Lock]Tid;                                                                  
 var $pc1203312: Phase;                                                                             
 var i1203319: int;                                                                                 
 var tmp21203229: int;                                                                              
 var tmp51203257: Array.HashSet.LOCK;                                                               
 var Array.HashSet.LOCK._state1203271: [Array.HashSet.LOCK]State;                                   
 var HashSet._state1203291: [HashSet]State;                                                         
 var tmp101203319: Array.HashSet.LOCK;                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 20.13: int i;                                                                                   
                                                                                                    
                                                                                                    
 // 20.13: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
 assume Lock._state1203269 == Lock._state && Lock._lock1203269 == Lock._lock && HashSet._state1203269 == HashSet._state && HashSet.locks1203269 == HashSet.locks && HashSet._lock1203269 == HashSet._lock && Array.HashSet.LOCK._state1203269 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203269 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203269 == Array.HashSet.LOCK._length && i1203269 == i && this1203269 == this && tid1203269 == tid;
 assume $recorded.state1203269 == 1;                                                                
                                                                                                    
 // 20.26: while (true)                                                                             
                                                                                                    
 phase1203269 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (19.5): Bad tid
  invariant isShared(HashSet._state[this]);                                                                // (19.5): this is not global
                                                                                                    
  invariant StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (20.26): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (20.26): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (20.26): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (20.26): Object invariant may not hold.
  invariant (forall j: int ::  ((((0<=j)&&(j<i))==>(isAccessible(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]], tid) && Lock._lock[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]] == tid))));
  invariant (forall _this : HashSet :: Invariant.Y_HashSet.locks(tid : Tid, _this, HashSet.locks[_this] ,Lock._state1203269,Lock._lock1203269,HashSet._state1203269,HashSet.locks1203269,HashSet._lock1203269,Array.HashSet.LOCK._state1203269,Array.HashSet.LOCK._elems1203269,Array.HashSet.LOCK._length1203269));       // (20.26): Loop does not preserve yields_as annotation for field locks
  invariant (forall _athis : Array.HashSet.LOCK, _index : int :: Invariant.Y_Array.HashSet.LOCK(tid : Tid, _athis, _index, Array.HashSet.LOCK._elems[_athis][_index] ,Lock._state1203269,Lock._lock1203269,HashSet._state1203269,HashSet.locks1203269,HashSet._lock1203269,Array.HashSet.LOCK._state1203269,Array.HashSet.LOCK._elems1203269,Array.HashSet.LOCK._length1203269));       // (20.26): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
  invariant phase1203269 == $pc;                                                                           // (20.26): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (20.26): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 20.26: boolean tmp1;                                                                           
                                                                                                    
                                                                                                    
  // 20.28: int tmp2;                                                                               
                                                                                                    
                                                                                                    
  // 20.28: [HashSet.LOCK{this}] tmp3;                                                              
                                                                                                    
                                                                                                    
  // 20.28: tmp3 := this.locks;                                                                     
                                                                                                    
                                                                                                    
  moverPath1203229 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203229 := m#moverPath(moverPath1203229);                                                    
  path1203229 := p#moverPath(moverPath1203229);                                                     
  assume Lock._state1203229 == Lock._state && Lock._lock1203229 == Lock._lock && HashSet._state1203229 == HashSet._state && HashSet.locks1203229 == HashSet.locks && HashSet._lock1203229 == HashSet._lock && Array.HashSet.LOCK._state1203229 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203229 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203229 == Array.HashSet.LOCK._length && tmp31203229 == tmp3 && tmp21203229 == tmp2 && tmp11203229 == tmp1 && i1203229 == i && this1203229 == this && tid1203229 == tid && $pc1203229 == $pc;
  assume $recorded.state1203229 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (20.28): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203229);                                                             
  assert $pc != PhaseError;                                                                                // (20.28): Reduction failure
  tmp3 := HashSet.locks[this];                                                                      
                                                                                                    
  // 20.28: tmp2 = tmp3.length;                                                                     
                                                                                                    
  tmp2 := Array.HashSet.LOCK._length[tmp3];                                                         
                                                                                                    
  // 20.26: tmp1 = i < tmp2;                                                                        
                                                                                                    
  tmp1 := (i<tmp2);                                                                                 
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 20.26: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 23.10: [HashSet.LOCK{this}] tmp5;                                                              
                                                                                                    
                                                                                                    
  // 23.10: tmp5 := this.locks;                                                                     
                                                                                                    
                                                                                                    
  moverPath1203250 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203250 := m#moverPath(moverPath1203250);                                                    
  path1203250 := p#moverPath(moverPath1203250);                                                     
  assume Lock._state1203250 == Lock._state && Lock._lock1203250 == Lock._lock && HashSet._state1203250 == HashSet._state && HashSet.locks1203250 == HashSet.locks && HashSet._lock1203250 == HashSet._lock && Array.HashSet.LOCK._state1203250 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203250 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203250 == Array.HashSet.LOCK._length && tmp51203250 == tmp5 && tmp31203250 == tmp3 && tmp21203250 == tmp2 && tmp11203250 == tmp1 && i1203250 == i && this1203250 == this && tid1203250 == tid && $pc1203250 == $pc;
  assume $recorded.state1203250 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (23.10): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203250);                                                             
  assert $pc != PhaseError;                                                                                // (23.10): Reduction failure
  tmp5 := HashSet.locks[this];                                                                      
                                                                                                    
  // 23.10: Lock tmp4;                                                                              
                                                                                                    
                                                                                                    
  // 23.10: tmp4 := tmp5[i];                                                                        
                                                                                                    
                                                                                                    
  moverPath1203257 := ReadEval.Array.HashSet.LOCK(tid: Tid,this: HashSet,tmp5: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203257 := m#moverPath(moverPath1203257);                                                    
  path1203257 := p#moverPath(moverPath1203257);                                                     
  assume Lock._state1203257 == Lock._state && Lock._lock1203257 == Lock._lock && HashSet._state1203257 == HashSet._state && HashSet.locks1203257 == HashSet.locks && HashSet._lock1203257 == HashSet._lock && Array.HashSet.LOCK._state1203257 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203257 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203257 == Array.HashSet.LOCK._length && tmp41203257 == tmp4 && tmp51203257 == tmp5 && tmp31203257 == tmp3 && tmp21203257 == tmp2 && tmp11203257 == tmp1 && i1203257 == i && this1203257 == this && tid1203257 == tid && $pc1203257 == $pc;
  assume $recorded.state1203257 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume tmp5 != Array.HashSet.LOCK.null;                                                          
  } else {                                                                                          
   assert tmp5 != Array.HashSet.LOCK.null;                                                                 // (23.10): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i;                                                                                   
  } else {                                                                                          
   assert 0 <= i;                                                                                          // (23.10): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i < Array.HashSet.LOCK._length[tmp5];                                                     
  } else {                                                                                          
   assert i < Array.HashSet.LOCK._length[tmp5];                                                            // (23.10): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203257);                                                             
  assert $pc != PhaseError;                                                                                // (23.10): Reduction failure
  tmp4 := Array.HashSet.LOCK._elems[tmp5][i];                                                       
  if ($pc == PreCommit) {                                                                           
   assume tmp4 != Lock.null;                                                                        
  } else {                                                                                          
   assert tmp4 != Lock.null;                                                                               // (23.10): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Lock._lock[tmp4] == Tid.null;                                                              
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (23.10): Reduction failure
  Lock._lock[tmp4] := tid;                                                                          
                                                                                                    
  // 20.47: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assume Lock._state1203269_bottom == Lock._state && Lock._lock1203269_bottom == Lock._lock && HashSet._state1203269_bottom == HashSet._state && HashSet.locks1203269_bottom == HashSet.locks && HashSet._lock1203269_bottom == HashSet._lock && Array.HashSet.LOCK._state1203269_bottom == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203269_bottom == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203269_bottom == Array.HashSet.LOCK._length && i1203269_bottom == i && this1203269_bottom == this && tid1203269_bottom == tid;
  assume $recorded.state1203269_bottom == 1;                                                        
  assert phase1203269 == $pc;                                                                              // (20.26): Phase must be invariant at loop head
 }                                                                                                  
 assume Lock._state1203271 == Lock._state && Lock._lock1203271 == Lock._lock && HashSet._state1203271 == HashSet._state && HashSet.locks1203271 == HashSet.locks && HashSet._lock1203271 == HashSet._lock && Array.HashSet.LOCK._state1203271 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203271 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203271 == Array.HashSet.LOCK._length && this1203271 == this && tid1203271 == tid;
 assume $recorded.state1203271 == 1;                                                                
 assert $$pc == PreCommit;                                                                                 // (26.1): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
                                                                                                    
 // 28.12: int i;                                                                                   
                                                                                                    
                                                                                                    
 // 28.12: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
 assume Lock._state1203331 == Lock._state && Lock._lock1203331 == Lock._lock && HashSet._state1203331 == HashSet._state && HashSet.locks1203331 == HashSet.locks && HashSet._lock1203331 == HashSet._lock && Array.HashSet.LOCK._state1203331 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203331 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203331 == Array.HashSet.LOCK._length && i1203331 == i && this1203331 == this && tid1203331 == tid;
 assume $recorded.state1203331 == 1;                                                                
                                                                                                    
 // 28.25: while (true)                                                                             
                                                                                                    
 phase1203331 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (19.5): Bad tid
  invariant isShared(HashSet._state[this]);                                                                // (19.5): this is not global
                                                                                                    
  invariant StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (28.25): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (28.25): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (28.25): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (28.25): Object invariant may not hold.
  invariant (forall j: int ::  ((((i<=j)&&(j<Array.HashSet.LOCK._length[HashSet.locks[this]]))==>(isAccessible(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]], tid) && Lock._lock[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]] == tid))));
  invariant (forall _this : HashSet :: Invariant.Y_HashSet.locks(tid : Tid, _this, HashSet.locks[_this] ,Lock._state1203331,Lock._lock1203331,HashSet._state1203331,HashSet.locks1203331,HashSet._lock1203331,Array.HashSet.LOCK._state1203331,Array.HashSet.LOCK._elems1203331,Array.HashSet.LOCK._length1203331));       // (28.25): Loop does not preserve yields_as annotation for field locks
  invariant (forall _athis : Array.HashSet.LOCK, _index : int :: Invariant.Y_Array.HashSet.LOCK(tid : Tid, _athis, _index, Array.HashSet.LOCK._elems[_athis][_index] ,Lock._state1203331,Lock._lock1203331,HashSet._state1203331,HashSet.locks1203331,HashSet._lock1203331,Array.HashSet.LOCK._state1203331,Array.HashSet.LOCK._elems1203331,Array.HashSet.LOCK._length1203331));       // (28.25): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
  invariant phase1203331 == $pc;                                                                           // (28.25): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (28.25): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 28.25: boolean tmp6;                                                                           
                                                                                                    
                                                                                                    
  // 28.27: int tmp7;                                                                               
                                                                                                    
                                                                                                    
  // 28.27: [HashSet.LOCK{this}] tmp8;                                                              
                                                                                                    
                                                                                                    
  // 28.27: tmp8 := this.locks;                                                                     
                                                                                                    
                                                                                                    
  moverPath1203291 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203291 := m#moverPath(moverPath1203291);                                                    
  path1203291 := p#moverPath(moverPath1203291);                                                     
  assume Lock._state1203291 == Lock._state && Lock._lock1203291 == Lock._lock && HashSet._state1203291 == HashSet._state && HashSet.locks1203291 == HashSet.locks && HashSet._lock1203291 == HashSet._lock && Array.HashSet.LOCK._state1203291 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203291 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203291 == Array.HashSet.LOCK._length && tmp81203291 == tmp8 && tmp71203291 == tmp7 && tmp61203291 == tmp6 && i1203291 == i && this1203291 == this && tid1203291 == tid && $pc1203291 == $pc;
  assume $recorded.state1203291 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (28.27): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203291);                                                             
  assert $pc != PhaseError;                                                                                // (28.27): Reduction failure
  tmp8 := HashSet.locks[this];                                                                      
                                                                                                    
  // 28.27: tmp7 = tmp8.length;                                                                     
                                                                                                    
  tmp7 := Array.HashSet.LOCK._length[tmp8];                                                         
                                                                                                    
  // 28.25: tmp6 = i < tmp7;                                                                        
                                                                                                    
  tmp6 := (i<tmp7);                                                                                 
  if (!(tmp6)) {                                                                                    
                                                                                                    
   // 28.25: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 31.9: [HashSet.LOCK{this}] tmp10;                                                              
                                                                                                    
                                                                                                    
  // 31.9: tmp10 := this.locks;                                                                     
                                                                                                    
                                                                                                    
  moverPath1203312 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203312 := m#moverPath(moverPath1203312);                                                    
  path1203312 := p#moverPath(moverPath1203312);                                                     
  assume Lock._state1203312 == Lock._state && Lock._lock1203312 == Lock._lock && HashSet._state1203312 == HashSet._state && HashSet.locks1203312 == HashSet.locks && HashSet._lock1203312 == HashSet._lock && Array.HashSet.LOCK._state1203312 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203312 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203312 == Array.HashSet.LOCK._length && tmp101203312 == tmp10 && tmp81203312 == tmp8 && tmp71203312 == tmp7 && tmp61203312 == tmp6 && i1203312 == i && this1203312 == this && tid1203312 == tid && $pc1203312 == $pc;
  assume $recorded.state1203312 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (31.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203312);                                                             
  assert $pc != PhaseError;                                                                                // (31.9): Reduction failure
  tmp10 := HashSet.locks[this];                                                                     
                                                                                                    
  // 31.9: Lock tmp9;                                                                               
                                                                                                    
                                                                                                    
  // 31.9: tmp9 := tmp10[i];                                                                        
                                                                                                    
                                                                                                    
  moverPath1203319 := ReadEval.Array.HashSet.LOCK(tid: Tid,this: HashSet,tmp10: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203319 := m#moverPath(moverPath1203319);                                                    
  path1203319 := p#moverPath(moverPath1203319);                                                     
  assume Lock._state1203319 == Lock._state && Lock._lock1203319 == Lock._lock && HashSet._state1203319 == HashSet._state && HashSet.locks1203319 == HashSet.locks && HashSet._lock1203319 == HashSet._lock && Array.HashSet.LOCK._state1203319 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203319 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203319 == Array.HashSet.LOCK._length && tmp91203319 == tmp9 && tmp101203319 == tmp10 && tmp81203319 == tmp8 && tmp71203319 == tmp7 && tmp61203319 == tmp6 && i1203319 == i && this1203319 == this && tid1203319 == tid && $pc1203319 == $pc;
  assume $recorded.state1203319 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume tmp10 != Array.HashSet.LOCK.null;                                                         
  } else {                                                                                          
   assert tmp10 != Array.HashSet.LOCK.null;                                                                // (31.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i;                                                                                   
  } else {                                                                                          
   assert 0 <= i;                                                                                          // (31.9): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i < Array.HashSet.LOCK._length[tmp10];                                                    
  } else {                                                                                          
   assert i < Array.HashSet.LOCK._length[tmp10];                                                           // (31.9): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203319);                                                             
  assert $pc != PhaseError;                                                                                // (31.9): Reduction failure
  tmp9 := Array.HashSet.LOCK._elems[tmp10][i];                                                      
  if ($pc == PreCommit) {                                                                           
   assume tmp9 != Lock.null;                                                                        
  } else {                                                                                          
   assert tmp9 != Lock.null;                                                                               // (31.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Lock._lock[tmp9] == tid;                                                                          // (31.9): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (31.9): Reduction failure
  Lock._lock[tmp9] := Tid.null;                                                                     
                                                                                                    
  // 28.46: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assume Lock._state1203331_bottom == Lock._state && Lock._lock1203331_bottom == Lock._lock && HashSet._state1203331_bottom == HashSet._state && HashSet.locks1203331_bottom == HashSet.locks && HashSet._lock1203331_bottom == HashSet._lock && Array.HashSet.LOCK._state1203331_bottom == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203331_bottom == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203331_bottom == Array.HashSet.LOCK._length && i1203331_bottom == i && this1203331_bottom == this && tid1203331_bottom == tid;
  assume $recorded.state1203331_bottom == 1;                                                        
  assert phase1203331 == $pc;                                                                              // (28.25): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 19.26: // return;                                                                               
                                                                                                    
 assume Lock._state1203333 == Lock._state && Lock._lock1203333 == Lock._lock && HashSet._state1203333 == HashSet._state && HashSet.locks1203333 == HashSet.locks && HashSet._lock1203333 == HashSet._lock && Array.HashSet.LOCK._state1203333 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203333 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203333 == Array.HashSet.LOCK._length && this1203333 == this && tid1203333 == tid;
 assume $recorded.state1203333 == 1;                                                                
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.26): Object invariant may not hold.
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.26): Object invariant may not hold.
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.26): Object invariant may not hold.
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (19.26): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  HashSet.resize2(tid:Tid, this : HashSet)                                                 
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet.locks;                                                                             
modifies HashSet._lock;                                                                             
modifies Array.HashSet.LOCK._state;                                                                 
modifies Array.HashSet.LOCK._elems;                                                                 
                                                                                                    
requires ValidTid(tid);                                                                                    // (37.5): Bad tid
requires isShared(HashSet._state[this]);                                                                   // (37.5): this is not global
                                                                                                    
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.5): Object invariant may not hold.
{                                                                                                   
 var tmp201203446: Array.HashSet.LOCK;                                                              
 var tmp20: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length1203396_bottom: [Array.HashSet.LOCK]int;                             
 var Array.HashSet.LOCK._state1203439: [Array.HashSet.LOCK]State;                                   
 var this1203460: HashSet;                                                                          
 var mover1203377: Mover;                                                                           
 var Array.HashSet.LOCK._state1203460: [Array.HashSet.LOCK]State;                                   
 var this1203356: HashSet;                                                                          
 var HashSet._lock1203377: [HashSet]Tid;                                                            
 var tmp17: int;                                                                                    
 var Array.HashSet.LOCK._length1203458: [Array.HashSet.LOCK]int;                                    
 var Array.HashSet.LOCK._state1203384: [Array.HashSet.LOCK]State;                                   
 var $pc1203439: Phase;                                                                             
 var path1203377: int;                                                                              
 var moverPath1203384: MoverPath;                                                                   
 var Lock._lock1203458_bottom: [Lock]Tid;                                                           
 var Array.HashSet.LOCK._length1203458_bottom: [Array.HashSet.LOCK]int;                             
 var Array.HashSet.LOCK._elems1203384: [Array.HashSet.LOCK]([int]Lock);                             
 var $recorded.state1203384: int;                                                                   
 var Lock._lock1203398: [Lock]Tid;                                                                  
 var this1203384: HashSet;                                                                          
 var tmp111203356: bool;                                                                            
 var this1203396: HashSet;                                                                          
 var Lock._state1203460: [Lock]State;                                                               
 var path1203446: int;                                                                              
 var tmp171203418: int;                                                                             
 var tid1203396: Tid;                                                                               
 var tmp161203439: bool;                                                                            
 var HashSet._state1203377: [HashSet]State;                                                         
 var tmp181203446: Array.HashSet.LOCK;                                                              
 var Lock._state1203439: [Lock]State;                                                               
 var tmp171203439: int;                                                                             
 var Lock._state1203377: [Lock]State;                                                               
 var this1203398: HashSet;                                                                          
 var Lock._state1203384: [Lock]State;                                                               
 var HashSet.locks1203439: [HashSet]Array.HashSet.LOCK;                                             
 var Lock._lock1203418: [Lock]Tid;                                                                  
 var Array.HashSet.LOCK._state1203398: [Array.HashSet.LOCK]State;                                   
 var Lock._state1203446: [Lock]State;                                                               
 var HashSet._lock1203460: [HashSet]Tid;                                                            
 var tmp16: bool;                                                                                   
 var Lock._lock1203458: [Lock]Tid;                                                                  
 var $decr$init$1203458$0: int;                                                                     
 var i1203396_bottom: int;                                                                          
 var this1203439: HashSet;                                                                          
 var Array.HashSet.LOCK._length1203398: [Array.HashSet.LOCK]int;                                    
 var tid1203356: Tid;                                                                               
 var i1203396: int;                                                                                 
 var tid1203458_bottom: Tid;                                                                        
 var HashSet._state1203356: [HashSet]State;                                                         
 var tmp141203384: Lock;                                                                            
 var $pc1203458: Phase;                                                                             
 var Array.HashSet.LOCK._elems1203458: [Array.HashSet.LOCK]([int]Lock);                             
 var Lock._lock1203396_bottom: [Lock]Tid;                                                           
 var Array.HashSet.LOCK._state1203396: [Array.HashSet.LOCK]State;                                   
 var tmp18: Array.HashSet.LOCK;                                                                     
 var HashSet._state1203398: [HashSet]State;                                                         
 var $recorded.state1203398: int;                                                                   
 var $pc1203396: Phase;                                                                             
 var Array.HashSet.LOCK._elems1203377: [Array.HashSet.LOCK]([int]Lock);                             
 var HashSet.locks1203460: [HashSet]Array.HashSet.LOCK;                                             
 var moverPath1203439: MoverPath;                                                                   
 var HashSet.locks1203458: [HashSet]Array.HashSet.LOCK;                                             
 var Lock._state1203398: [Lock]State;                                                               
 var tmp13: Array.HashSet.LOCK;                                                                     
 var HashSet._state1203439: [HashSet]State;                                                         
 var HashSet._lock1203418: [HashSet]Tid;                                                            
 var Lock._state1203458: [Lock]State;                                                               
 var tid1203460: Tid;                                                                               
 var i1203384: int;                                                                                 
 var tmp161203418: bool;                                                                            
 var i: int;                                                                                        
 var tmp15: Array.HashSet.LOCK;                                                                     
 var tid1203418: Tid;                                                                               
 var path1203356: int;                                                                              
 var Array.HashSet.LOCK._elems1203458_bottom: [Array.HashSet.LOCK]([int]Lock);                      
 var HashSet._lock1203458_bottom: [HashSet]Tid;                                                     
 var tid1203458: Tid;                                                                               
 var path1203384: int;                                                                              
 var mover1203384: Mover;                                                                           
 var tmp11: bool;                                                                                   
 var HashSet._lock1203384: [HashSet]Tid;                                                            
 var i1203458_bottom: int;                                                                          
 var $recorded.state1203458_bottom: int;                                                            
 var tmp181203439: Array.HashSet.LOCK;                                                              
 var Lock._lock1203446: [Lock]Tid;                                                                  
 var tid1203446: Tid;                                                                               
 var $pc1203396_bottom: Phase;                                                                      
 var HashSet._lock1203396: [HashSet]Tid;                                                            
 var Array.HashSet.LOCK._elems1203460: [Array.HashSet.LOCK]([int]Lock);                             
 var this1203377: HashSet;                                                                          
 var HashSet._lock1203458: [HashSet]Tid;                                                            
 var tmp201203439: Array.HashSet.LOCK;                                                              
 var $recorded.state1203396_bottom: int;                                                            
 var HashSet.locks1203446: [HashSet]Array.HashSet.LOCK;                                             
 var tmp131203356: Array.HashSet.LOCK;                                                              
 var tmp19: Lock;                                                                                   
 var $recorded.state1203458: int;                                                                   
 var Array.HashSet.LOCK._elems1203398: [Array.HashSet.LOCK]([int]Lock);                             
 var Lock._lock1203439: [Lock]Tid;                                                                  
 var i1203418: int;                                                                                 
 var Array.HashSet.LOCK._length1203446: [Array.HashSet.LOCK]int;                                    
 var Array.HashSet.LOCK._elems1203356: [Array.HashSet.LOCK]([int]Lock);                             
 var HashSet.locks1203356: [HashSet]Array.HashSet.LOCK;                                             
 var moverPath1203356: MoverPath;                                                                   
 var tmp131203384: Array.HashSet.LOCK;                                                              
 var tmp121203384: int;                                                                             
 var Array.HashSet.LOCK._length1203460: [Array.HashSet.LOCK]int;                                    
 var HashSet._state1203396: [HashSet]State;                                                         
 var HashSet._state1203458_bottom: [HashSet]State;                                                  
 var this1203458_bottom: HashSet;                                                                   
 var tmp14: Lock;                                                                                   
 var Lock._state1203418: [Lock]State;                                                               
 var tmp121203377: int;                                                                             
 var HashSet._state1203446: [HashSet]State;                                                         
 var path1203439: int;                                                                              
 var phase1203458: Phase;                                                                           
 var tmp131203377: Array.HashSet.LOCK;                                                              
 var moverPath1203377: MoverPath;                                                                   
 var mover1203418: Mover;                                                                           
 var Array.HashSet.LOCK._state1203377: [Array.HashSet.LOCK]State;                                   
 var Array.HashSet.LOCK._state1203458_bottom: [Array.HashSet.LOCK]State;                            
 var Array.HashSet.LOCK._elems1203446: [Array.HashSet.LOCK]([int]Lock);                             
 var moverPath1203446: MoverPath;                                                                   
 var this1203418: HashSet;                                                                          
 var tid1203377: Tid;                                                                               
 var HashSet.locks1203398: [HashSet]Array.HashSet.LOCK;                                             
 var Lock._lock1203384: [Lock]Tid;                                                                  
 var mover1203446: Mover;                                                                           
 var $pc1203458_bottom: Phase;                                                                      
 var tmp171203446: int;                                                                             
 var HashSet._state1203458: [HashSet]State;                                                         
 var $recorded.state1203460: int;                                                                   
 var tmp151203384: Array.HashSet.LOCK;                                                              
 var HashSet._lock1203356: [HashSet]Tid;                                                            
 var mover1203356: Mover;                                                                           
 var HashSet.locks1203396_bottom: [HashSet]Array.HashSet.LOCK;                                      
 var phase1203396: Phase;                                                                           
 var HashSet.locks1203396: [HashSet]Array.HashSet.LOCK;                                             
 var HashSet._state1203418: [HashSet]State;                                                         
 var tmp121203356: int;                                                                             
 var Lock._state1203356: [Lock]State;                                                               
 var $recorded.state1203396: int;                                                                   
 var Array.HashSet.LOCK._state1203418: [Array.HashSet.LOCK]State;                                   
 var Array.HashSet.LOCK._length1203418: [Array.HashSet.LOCK]int;                                    
 var tmp151203377: Array.HashSet.LOCK;                                                              
 var i1203439: int;                                                                                 
 var this1203396_bottom: HashSet;                                                                   
 var i1203377: int;                                                                                 
 var tmp111203384: bool;                                                                            
 var tmp181203418: Array.HashSet.LOCK;                                                              
 var tmp191203446: Lock;                                                                            
 var HashSet._lock1203446: [HashSet]Tid;                                                            
 var Array.HashSet.LOCK._state1203396_bottom: [Array.HashSet.LOCK]State;                            
 var $pc1203446: Phase;                                                                             
 var Lock._state1203396: [Lock]State;                                                               
 var $pc1203460: Phase;                                                                             
 var tmp161203446: bool;                                                                            
 var this1203458: HashSet;                                                                          
 var $recorded.state1203377: int;                                                                   
 var tid1203396_bottom: Tid;                                                                        
 var $recorded.state1203418: int;                                                                   
 var $recorded.state1203356: int;                                                                   
 var Lock._lock1203460: [Lock]Tid;                                                                  
 var tmp12: int;                                                                                    
 var $pc1203418: Phase;                                                                             
 var HashSet.locks1203418: [HashSet]Array.HashSet.LOCK;                                             
 var i1203446: int;                                                                                 
 var $recorded.state1203446: int;                                                                   
 var Lock._lock1203356: [Lock]Tid;                                                                  
 var HashSet.locks1203458_bottom: [HashSet]Array.HashSet.LOCK;                                      
 var i1203356: int;                                                                                 
 var tmp111203377: bool;                                                                            
 var $pc1203377: Phase;                                                                             
 var moverPath1203418: MoverPath;                                                                   
 var $decr$loop$1203458$0: int;                                                                     
 var tid1203439: Tid;                                                                               
 var HashSet.locks1203377: [HashSet]Array.HashSet.LOCK;                                             
 var Array.HashSet.LOCK._length1203396: [Array.HashSet.LOCK]int;                                    
 var $pc1203398: Phase;                                                                             
 var Array.HashSet.LOCK._length1203384: [Array.HashSet.LOCK]int;                                    
 var Array.HashSet.LOCK._elems1203396_bottom: [Array.HashSet.LOCK]([int]Lock);                      
 var $pc1203356: Phase;                                                                             
 var mover1203439: Mover;                                                                           
 var Array.HashSet.LOCK._state1203356: [Array.HashSet.LOCK]State;                                   
 var $pc1203384: Phase;                                                                             
 var HashSet._lock1203396_bottom: [HashSet]Tid;                                                     
 var HashSet._state1203384: [HashSet]State;                                                         
 var Array.HashSet.LOCK._length1203377: [Array.HashSet.LOCK]int;                                    
 var Lock._state1203458_bottom: [Lock]State;                                                        
 var HashSet._state1203396_bottom: [HashSet]State;                                                  
 var HashSet.locks1203384: [HashSet]Array.HashSet.LOCK;                                             
 var Lock._lock1203377: [Lock]Tid;                                                                  
 var Lock._state1203396_bottom: [Lock]State;                                                        
 var HashSet._state1203460: [HashSet]State;                                                         
 var Lock._lock1203396: [Lock]Tid;                                                                  
 var Array.HashSet.LOCK._elems1203439: [Array.HashSet.LOCK]([int]Lock);                             
 var path1203418: int;                                                                              
 var Array.HashSet.LOCK._state1203458: [Array.HashSet.LOCK]State;                                   
 var Array.HashSet.LOCK._elems1203418: [Array.HashSet.LOCK]([int]Lock);                             
 var tid1203384: Tid;                                                                               
 var Array.HashSet.LOCK._length1203439: [Array.HashSet.LOCK]int;                                    
 var HashSet._lock1203439: [HashSet]Tid;                                                            
 var this1203446: HashSet;                                                                          
 var $recorded.state1203439: int;                                                                   
 var Array.HashSet.LOCK._state1203446: [Array.HashSet.LOCK]State;                                   
 var tid1203398: Tid;                                                                               
 var HashSet._lock1203398: [HashSet]Tid;                                                            
 var i1203458: int;                                                                                 
 var Array.HashSet.LOCK._length1203356: [Array.HashSet.LOCK]int;                                    
 var Array.HashSet.LOCK._elems1203396: [Array.HashSet.LOCK]([int]Lock);                             
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 38.13: int i;                                                                                   
                                                                                                    
                                                                                                    
 // 38.13: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
 assume Lock._state1203396 == Lock._state && Lock._lock1203396 == Lock._lock && HashSet._state1203396 == HashSet._state && HashSet.locks1203396 == HashSet.locks && HashSet._lock1203396 == HashSet._lock && Array.HashSet.LOCK._state1203396 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203396 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203396 == Array.HashSet.LOCK._length && i1203396 == i && this1203396 == this && tid1203396 == tid;
 assume $recorded.state1203396 == 1;                                                                
                                                                                                    
 // 38.26: while (true)                                                                             
                                                                                                    
 phase1203396 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (37.5): Bad tid
  invariant isShared(HashSet._state[this]);                                                                // (37.5): this is not global
                                                                                                    
  invariant StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (38.26): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (38.26): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (38.26): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (38.26): Object invariant may not hold.
  invariant (forall j: int ::  ((((0<=j)&&(j<i))==>(isAccessible(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]], tid) && Lock._lock[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]] == tid))));
  invariant (forall _this : HashSet :: Invariant.Y_HashSet.locks(tid : Tid, _this, HashSet.locks[_this] ,Lock._state1203396,Lock._lock1203396,HashSet._state1203396,HashSet.locks1203396,HashSet._lock1203396,Array.HashSet.LOCK._state1203396,Array.HashSet.LOCK._elems1203396,Array.HashSet.LOCK._length1203396));       // (38.26): Loop does not preserve yields_as annotation for field locks
  invariant (forall _athis : Array.HashSet.LOCK, _index : int :: Invariant.Y_Array.HashSet.LOCK(tid : Tid, _athis, _index, Array.HashSet.LOCK._elems[_athis][_index] ,Lock._state1203396,Lock._lock1203396,HashSet._state1203396,HashSet.locks1203396,HashSet._lock1203396,Array.HashSet.LOCK._state1203396,Array.HashSet.LOCK._elems1203396,Array.HashSet.LOCK._length1203396));       // (38.26): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
  invariant phase1203396 == $pc;                                                                           // (38.26): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (38.26): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 38.26: boolean tmp11;                                                                          
                                                                                                    
                                                                                                    
  // 38.28: int tmp12;                                                                              
                                                                                                    
                                                                                                    
  // 38.28: [HashSet.LOCK{this}] tmp13;                                                             
                                                                                                    
                                                                                                    
  // 38.28: tmp13 := this.locks;                                                                    
                                                                                                    
                                                                                                    
  moverPath1203356 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203356 := m#moverPath(moverPath1203356);                                                    
  path1203356 := p#moverPath(moverPath1203356);                                                     
  assume Lock._state1203356 == Lock._state && Lock._lock1203356 == Lock._lock && HashSet._state1203356 == HashSet._state && HashSet.locks1203356 == HashSet.locks && HashSet._lock1203356 == HashSet._lock && Array.HashSet.LOCK._state1203356 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203356 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203356 == Array.HashSet.LOCK._length && tmp131203356 == tmp13 && tmp121203356 == tmp12 && tmp111203356 == tmp11 && i1203356 == i && this1203356 == this && tid1203356 == tid && $pc1203356 == $pc;
  assume $recorded.state1203356 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (38.28): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203356);                                                             
  assert $pc != PhaseError;                                                                                // (38.28): Reduction failure
  tmp13 := HashSet.locks[this];                                                                     
                                                                                                    
  // 38.28: tmp12 = tmp13.length;                                                                   
                                                                                                    
  tmp12 := Array.HashSet.LOCK._length[tmp13];                                                       
                                                                                                    
  // 38.26: tmp11 = i < tmp12;                                                                      
                                                                                                    
  tmp11 := (i<tmp12);                                                                               
  if (!(tmp11)) {                                                                                   
                                                                                                    
   // 38.26: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 41.10: [HashSet.LOCK{this}] tmp15;                                                             
                                                                                                    
                                                                                                    
  // 41.10: tmp15 := this.locks;                                                                    
                                                                                                    
                                                                                                    
  moverPath1203377 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203377 := m#moverPath(moverPath1203377);                                                    
  path1203377 := p#moverPath(moverPath1203377);                                                     
  assume Lock._state1203377 == Lock._state && Lock._lock1203377 == Lock._lock && HashSet._state1203377 == HashSet._state && HashSet.locks1203377 == HashSet.locks && HashSet._lock1203377 == HashSet._lock && Array.HashSet.LOCK._state1203377 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203377 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203377 == Array.HashSet.LOCK._length && tmp151203377 == tmp15 && tmp131203377 == tmp13 && tmp121203377 == tmp12 && tmp111203377 == tmp11 && i1203377 == i && this1203377 == this && tid1203377 == tid && $pc1203377 == $pc;
  assume $recorded.state1203377 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (41.10): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203377);                                                             
  assert $pc != PhaseError;                                                                                // (41.10): Reduction failure
  tmp15 := HashSet.locks[this];                                                                     
                                                                                                    
  // 41.10: Lock tmp14;                                                                             
                                                                                                    
                                                                                                    
  // 41.10: tmp14 := tmp15[i];                                                                      
                                                                                                    
                                                                                                    
  moverPath1203384 := ReadEval.Array.HashSet.LOCK(tid: Tid,this: HashSet,tmp15: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203384 := m#moverPath(moverPath1203384);                                                    
  path1203384 := p#moverPath(moverPath1203384);                                                     
  assume Lock._state1203384 == Lock._state && Lock._lock1203384 == Lock._lock && HashSet._state1203384 == HashSet._state && HashSet.locks1203384 == HashSet.locks && HashSet._lock1203384 == HashSet._lock && Array.HashSet.LOCK._state1203384 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203384 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203384 == Array.HashSet.LOCK._length && tmp141203384 == tmp14 && tmp151203384 == tmp15 && tmp131203384 == tmp13 && tmp121203384 == tmp12 && tmp111203384 == tmp11 && i1203384 == i && this1203384 == this && tid1203384 == tid && $pc1203384 == $pc;
  assume $recorded.state1203384 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume tmp15 != Array.HashSet.LOCK.null;                                                         
  } else {                                                                                          
   assert tmp15 != Array.HashSet.LOCK.null;                                                                // (41.10): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i;                                                                                   
  } else {                                                                                          
   assert 0 <= i;                                                                                          // (41.10): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i < Array.HashSet.LOCK._length[tmp15];                                                    
  } else {                                                                                          
   assert i < Array.HashSet.LOCK._length[tmp15];                                                           // (41.10): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203384);                                                             
  assert $pc != PhaseError;                                                                                // (41.10): Reduction failure
  tmp14 := Array.HashSet.LOCK._elems[tmp15][i];                                                     
  if ($pc == PreCommit) {                                                                           
   assume tmp14 != Lock.null;                                                                       
  } else {                                                                                          
   assert tmp14 != Lock.null;                                                                              // (41.10): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assume Lock._lock[tmp14] == Tid.null;                                                             
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (41.10): Reduction failure
  Lock._lock[tmp14] := tid;                                                                         
                                                                                                    
  // 38.47: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assume Lock._state1203396_bottom == Lock._state && Lock._lock1203396_bottom == Lock._lock && HashSet._state1203396_bottom == HashSet._state && HashSet.locks1203396_bottom == HashSet.locks && HashSet._lock1203396_bottom == HashSet._lock && Array.HashSet.LOCK._state1203396_bottom == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203396_bottom == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203396_bottom == Array.HashSet.LOCK._length && i1203396_bottom == i && this1203396_bottom == this && tid1203396_bottom == tid;
  assume $recorded.state1203396_bottom == 1;                                                        
  assert phase1203396 == $pc;                                                                              // (38.26): Phase must be invariant at loop head
 }                                                                                                  
 assume Lock._state1203398 == Lock._state && Lock._lock1203398 == Lock._lock && HashSet._state1203398 == HashSet._state && HashSet.locks1203398 == HashSet.locks && HashSet._lock1203398 == HashSet._lock && Array.HashSet.LOCK._state1203398 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203398 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203398 == Array.HashSet.LOCK._length && this1203398 == this && tid1203398 == tid;
 assume $recorded.state1203398 == 1;                                                                
 assert $$pc == PreCommit;                                                                                 // (44.7): Can only commit when in pre-commit phase.
 $pc := PostCommit;                                                                                 
                                                                                                    
 // 46.12: int i;                                                                                   
                                                                                                    
                                                                                                    
 // 46.12: i = 0;                                                                                   
                                                                                                    
 i := 0;                                                                                            
 assume Lock._state1203458 == Lock._state && Lock._lock1203458 == Lock._lock && HashSet._state1203458 == HashSet._state && HashSet.locks1203458 == HashSet.locks && HashSet._lock1203458 == HashSet._lock && Array.HashSet.LOCK._state1203458 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203458 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203458 == Array.HashSet.LOCK._length && i1203458 == i && this1203458 == this && tid1203458 == tid;
 assume $recorded.state1203458 == 1;                                                                
                                                                                                    
 // 46.25: while (true)                                                                             
                                                                                                    
 phase1203458 := $pc;                                                                               
 $decr$init$1203458$0 := (Array.HashSet.LOCK._length[HashSet.locks[this]]-i);                       
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (37.5): Bad tid
  invariant isShared(HashSet._state[this]);                                                                // (37.5): this is not global
                                                                                                    
  invariant StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (46.25): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (46.25): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (46.25): Object invariant may not hold.
  invariant  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (46.25): Object invariant may not hold.
  invariant (forall j: int ::  ((((i<=j)&&(j<Array.HashSet.LOCK._length[HashSet.locks[this]]))==>(isAccessible(Lock._state[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]], tid) && Lock._lock[Array.HashSet.LOCK._elems[HashSet.locks[this]][j]] == tid))));
  invariant (forall _this : HashSet :: Invariant.Y_HashSet.locks(tid : Tid, _this, HashSet.locks[_this] ,Lock._state1203458,Lock._lock1203458,HashSet._state1203458,HashSet.locks1203458,HashSet._lock1203458,Array.HashSet.LOCK._state1203458,Array.HashSet.LOCK._elems1203458,Array.HashSet.LOCK._length1203458));       // (46.25): Loop does not preserve yields_as annotation for field locks
  invariant (forall _athis : Array.HashSet.LOCK, _index : int :: Invariant.Y_Array.HashSet.LOCK(tid : Tid, _athis, _index, Array.HashSet.LOCK._elems[_athis][_index] ,Lock._state1203458,Lock._lock1203458,HashSet._state1203458,HashSet.locks1203458,HashSet._lock1203458,Array.HashSet.LOCK._state1203458,Array.HashSet.LOCK._elems1203458,Array.HashSet.LOCK._length1203458));       // (46.25): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
  invariant ((Array.HashSet.LOCK._length[HashSet.locks[this]]-i) <= $decr$init$1203458$0 && ((Array.HashSet.LOCK._length[HashSet.locks[this]]-i) == $decr$init$1203458$0 ==> true));
  invariant phase1203458 == $pc;                                                                           // (46.25): Phase must be invariant at loop head
 {                                                                                                  
  $decr$loop$1203458$0 := (Array.HashSet.LOCK._length[HashSet.locks[this]]-i);                      
                                                                                                    
  // 46.25: boolean tmp16;                                                                          
                                                                                                    
                                                                                                    
  // 46.27: int tmp17;                                                                              
                                                                                                    
                                                                                                    
  // 46.27: [HashSet.LOCK{this}] tmp18;                                                             
                                                                                                    
                                                                                                    
  // 46.27: tmp18 := this.locks;                                                                    
                                                                                                    
                                                                                                    
  moverPath1203418 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203418 := m#moverPath(moverPath1203418);                                                    
  path1203418 := p#moverPath(moverPath1203418);                                                     
  assume Lock._state1203418 == Lock._state && Lock._lock1203418 == Lock._lock && HashSet._state1203418 == HashSet._state && HashSet.locks1203418 == HashSet.locks && HashSet._lock1203418 == HashSet._lock && Array.HashSet.LOCK._state1203418 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203418 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203418 == Array.HashSet.LOCK._length && tmp181203418 == tmp18 && tmp171203418 == tmp17 && tmp161203418 == tmp16 && i1203418 == i && this1203418 == this && tid1203418 == tid && $pc1203418 == $pc;
  assume $recorded.state1203418 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (46.27): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203418);                                                             
  assert $pc != PhaseError;                                                                                // (46.27): Reduction failure
  tmp18 := HashSet.locks[this];                                                                     
                                                                                                    
  // 46.27: tmp17 = tmp18.length;                                                                   
                                                                                                    
  tmp17 := Array.HashSet.LOCK._length[tmp18];                                                       
                                                                                                    
  // 46.25: tmp16 = i < tmp17;                                                                      
                                                                                                    
  tmp16 := (i<tmp17);                                                                               
  if (!(tmp16)) {                                                                                   
                                                                                                    
   // 46.25: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 50.9: [HashSet.LOCK{this}] tmp20;                                                              
                                                                                                    
                                                                                                    
  // 50.9: tmp20 := this.locks;                                                                     
                                                                                                    
                                                                                                    
  moverPath1203439 := ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203439 := m#moverPath(moverPath1203439);                                                    
  path1203439 := p#moverPath(moverPath1203439);                                                     
  assume Lock._state1203439 == Lock._state && Lock._lock1203439 == Lock._lock && HashSet._state1203439 == HashSet._state && HashSet.locks1203439 == HashSet.locks && HashSet._lock1203439 == HashSet._lock && Array.HashSet.LOCK._state1203439 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203439 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203439 == Array.HashSet.LOCK._length && tmp201203439 == tmp20 && tmp181203439 == tmp18 && tmp171203439 == tmp17 && tmp161203439 == tmp16 && i1203439 == i && this1203439 == this && tid1203439 == tid && $pc1203439 == $pc;
  assume $recorded.state1203439 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != HashSet.null;                                                                     
  } else {                                                                                          
   assert this != HashSet.null;                                                                            // (50.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203439);                                                             
  assert $pc != PhaseError;                                                                                // (50.9): Reduction failure
  tmp20 := HashSet.locks[this];                                                                     
                                                                                                    
  // 50.9: Lock tmp19;                                                                              
                                                                                                    
                                                                                                    
  // 50.9: tmp19 := tmp20[i];                                                                       
                                                                                                    
                                                                                                    
  moverPath1203446 := ReadEval.Array.HashSet.LOCK(tid: Tid,this: HashSet,tmp20: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
  mover1203446 := m#moverPath(moverPath1203446);                                                    
  path1203446 := p#moverPath(moverPath1203446);                                                     
  assume Lock._state1203446 == Lock._state && Lock._lock1203446 == Lock._lock && HashSet._state1203446 == HashSet._state && HashSet.locks1203446 == HashSet.locks && HashSet._lock1203446 == HashSet._lock && Array.HashSet.LOCK._state1203446 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203446 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203446 == Array.HashSet.LOCK._length && tmp191203446 == tmp19 && tmp201203446 == tmp20 && tmp181203446 == tmp18 && tmp171203446 == tmp17 && tmp161203446 == tmp16 && i1203446 == i && this1203446 == this && tid1203446 == tid && $pc1203446 == $pc;
  assume $recorded.state1203446 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume tmp20 != Array.HashSet.LOCK.null;                                                         
  } else {                                                                                          
   assert tmp20 != Array.HashSet.LOCK.null;                                                                // (50.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume 0 <= i;                                                                                   
  } else {                                                                                          
   assert 0 <= i;                                                                                          // (50.9): index < 0.
  }                                                                                                 
  if ($pc == PreCommit) {                                                                           
   assume i < Array.HashSet.LOCK._length[tmp20];                                                    
  } else {                                                                                          
   assert i < Array.HashSet.LOCK._length[tmp20];                                                           // (50.9): index is >= length.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover1203446);                                                             
  assert $pc != PhaseError;                                                                                // (50.9): Reduction failure
  tmp19 := Array.HashSet.LOCK._elems[tmp20][i];                                                     
  if ($pc == PreCommit) {                                                                           
   assume tmp19 != Lock.null;                                                                       
  } else {                                                                                          
   assert tmp19 != Lock.null;                                                                              // (50.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
  assert Lock._lock[tmp19] == tid;                                                                         // (50.9): lock not held
  $pc := transition($pc, _L);                                                                       
  assert $pc != PhaseError;                                                                                // (50.9): Reduction failure
  Lock._lock[tmp19] := Tid.null;                                                                    
                                                                                                    
  // 46.46: i = i + 1;                                                                              
                                                                                                    
  i := (i+1);                                                                                       
  assert ((Array.HashSet.LOCK._length[HashSet.locks[this]]-i) <= $decr$loop$1203458$0 && ((Array.HashSet.LOCK._length[HashSet.locks[this]]-i) == $decr$loop$1203458$0 ==> false));       // (46.25): loop may not terminate
  assert 0 <= $decr$loop$1203458$0  || (Array.HashSet.LOCK._length[HashSet.locks[this]]-i) == $decr$loop$1203458$0;       // (46.25): decreasing expression not properly bounded by 0
  assume Lock._state1203458_bottom == Lock._state && Lock._lock1203458_bottom == Lock._lock && HashSet._state1203458_bottom == HashSet._state && HashSet.locks1203458_bottom == HashSet.locks && HashSet._lock1203458_bottom == HashSet._lock && Array.HashSet.LOCK._state1203458_bottom == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203458_bottom == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203458_bottom == Array.HashSet.LOCK._length && i1203458_bottom == i && this1203458_bottom == this && tid1203458_bottom == tid;
  assume $recorded.state1203458_bottom == 1;                                                        
  assert phase1203458 == $pc;                                                                              // (46.25): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 37.27: // return;                                                                               
                                                                                                    
 assume Lock._state1203460 == Lock._state && Lock._lock1203460 == Lock._lock && HashSet._state1203460 == HashSet._state && HashSet.locks1203460 == HashSet.locks && HashSet._lock1203460 == HashSet._lock && Array.HashSet.LOCK._state1203460 == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems1203460 == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length1203460 == Array.HashSet.LOCK._length && this1203460 == this && tid1203460 == tid;
 assume $recorded.state1203460 == 1;                                                                
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.27): Object invariant may not hold.
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.27): Object invariant may not hold.
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.27): Object invariant may not hold.
 assert  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (37.27): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.HashSet.LOCK ***/                                                                  
                                                                                                    
type Array.HashSet.LOCK;                                                                            
const unique Array.HashSet.LOCK.null: Array.HashSet.LOCK;                                           
var Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State;                                           
                                                                                                    
const Array.HashSet.LOCK._this : [Array.HashSet.LOCK]HashSet;                                       
const Array.HashSet.LOCK._length : [Array.HashSet.LOCK]int;                                         
var Array.HashSet.LOCK._elems  : [Array.HashSet.LOCK]([int]Lock);                                   
                                                                                                    
axiom (forall $this : Array.HashSet.LOCK :: Array.HashSet.LOCK._length[$this] >= 0);                
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.HashSet.LOCK: Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.HashSet.LOCK(tid: Tid,this : HashSet,athis : Array.HashSet.LOCK,index : int,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if (isLocal(Array.HashSet.LOCK._state[athis], tid)) then                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.HashSet.LOCK: Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.HashSet.LOCK(tid: Tid,this : HashSet,athis : Array.HashSet.LOCK,index : int,newValue: Lock,Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Array.HashSet.LOCK._state[athis], tid)) then                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_B, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Lock._state: [Lock]State,Lock._lock: [Lock]Tid,HashSet._state: [HashSet]State,HashSet.locks: [HashSet]Array.HashSet.LOCK,HashSet._lock: [HashSet]Tid,Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State,Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock),Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Lock  :: _i == Lock.null <==> isNull(Lock._state[_i])) &&                             
  (forall _i: HashSet  :: _i == HashSet.null <==> isNull(HashSet._state[_i])) &&                    
  (forall _i: Array.HashSet.LOCK  :: _i == Array.HashSet.LOCK.null <==> isNull(Array.HashSet.LOCK._state[_i])) &&
  (forall _t: Tid, _i: Array.HashSet.LOCK  :: ValidTid(_t) && isAccessible(Array.HashSet.LOCK._state[_i], _t) ==> isAccessible(HashSet._state[Array.HashSet.LOCK._this[_i]], _t)) &&
  (forall _i: HashSet ::  (isShared(HashSet._state[_i]) ==> isSharedAssignable(Array.HashSet.LOCK._state[HashSet.locks[_i]]))) &&
  (forall _i: HashSet ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(HashSet._state[_i],_t) ==> isLocalAssignable(Array.HashSet.LOCK._state[HashSet.locks[_i]], _t)))) &&
  (forall _i: HashSet :: { HashSet.locks[_i] } Array.HashSet.LOCK._this[HashSet.locks[_i]] == _i) &&
  (forall _i: Array.HashSet.LOCK, _index: int ::  (isShared(Array.HashSet.LOCK._state[_i]) && 0 <= _index && _index < Array.HashSet.LOCK._length[_i]) ==> isSharedAssignable(Lock._state[Array.HashSet.LOCK._elems[_i][_index]])) &&
  (forall _i: Array.HashSet.LOCK, _index: int ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Array.HashSet.LOCK._state[_i],_t) && 0 <= _index && _index < Array.HashSet.LOCK._length[_i]) ==> isLocalAssignable(Lock._state[Array.HashSet.LOCK._elems[_i][_index]], _t))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.5): HashSet.locks failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.HashSet.locks(u: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (7.5): HashSet.locks failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.HashSet.LOCK;                                                               
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == HashSet.locks[x];                                                                      
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 HashSet.locks[x] := havocValue;                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (7.5): HashSet.locks failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.HashSet.LOCK;                                                               
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == HashSet.locks[x];                                                                      
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.HashSet.locks(u: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (7.5): HashSet.locks failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): HashSet.locks failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, x: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[x], u);                                                       
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.HashSet.LOCK;                                                               
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == HashSet.locks[x];                                                                      
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 HashSet.locks[x] := havocValue;                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,x: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (7.5): HashSet.locks failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (6.5): Array Array.HashSet.LOCK failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Lock;                                                                             
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.HashSet.LOCK._elems[x][i];                                                       
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := havocValue;                                                     
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Lock;                                                                             
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.HashSet.LOCK._elems[x][i];                                                       
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.5): Array Array.HashSet.LOCK failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], u);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Lock;                                                                             
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.HashSet.LOCK._elems[x][i];                                                       
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.HashSet.LOCK._elems[x][i] := havocValue;                                                     
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Array Array.HashSet.LOCK failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var x_mid: HashSet;                                                                                
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var x_mid: HashSet;                                                                                
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[y] := w;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.locks.HashSet.locks(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x: HashSet, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies HashSet.locks;                                                                            
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var x_pre: HashSet;                                                                                
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var x_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var w_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var y_owner_mid: HashSet;                                                                          
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w_mid: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Array.HashSet.LOCK;                                                                     
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var u_mid: Tid;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var x_mid: HashSet;                                                                                
 var y_owner_mid: HashSet;                                                                          
 var v_mid: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w_mid: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := HashSet.locks[x];                                                                          
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 HashSet.locks[x] := tmpV;                                                                          
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.HashSet.locks(t: Tid,x: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (7.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.HashSet.locks.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Array.HashSet.LOCK, w: Lock, w0: Lock, x: HashSet, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(HashSet._state[x], t);                                                       
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies HashSet.locks;                                                                            
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var x_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var v_pre: Array.HashSet.LOCK;                                                                     
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
                                                                                                    
 var x_post: HashSet;                                                                               
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var v_post: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.HashSet.locks(t: Tid,x: HashSet,v: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[x] := v;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var w_mid: Array.HashSet.LOCK;                                                                     
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var w0_mid: Array.HashSet.LOCK;                                                                    
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var y_mid: HashSet;                                                                                
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 HashSet.locks[y] := w;                                                                             
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.HashSet.locks(u: Tid,y: HashSet,w: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 HashSet.locks[y] := w;                                                                             
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.HashSet.LOCK._elems.HashSet.locks(t: Tid, u: Tid, v: Lock, w: Array.HashSet.LOCK, w0: Array.HashSet.LOCK, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y: HashSet)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(HashSet._state[y], u);                                                       
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies HashSet.locks;                                                                            
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var y_pre: HashSet;                                                                                
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var w0_pre: Array.HashSet.LOCK;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var w_pre: Array.HashSet.LOCK;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w0_post: Array.HashSet.LOCK;                                                                   
 var y_post: HashSet;                                                                               
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var $pc_post: Phase;                                                                               
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var w_post: Array.HashSet.LOCK;                                                                    
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.HashSet.locks(u: Tid,y: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (7.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (7.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var y_owner_mid: HashSet;                                                                          
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
 var w_mid: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
                                                                                                    
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Lock;                                                                                   
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var x_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._state_mid: [HashSet]State;                                                            
 var t_mid: Tid;                                                                                    
 var w0_mid: Lock;                                                                                  
 var HashSet.locks_mid: [HashSet]Array.HashSet.LOCK;                                                
 var y_mid: Array.HashSet.LOCK;                                                                     
 var HashSet._lock_mid: [HashSet]Tid;                                                               
 var v_mid: Lock;                                                                                   
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.HashSet.LOCK._elems_mid: [Array.HashSet.LOCK]([int]Lock);                                
 var $recorded.state_mid: int;                                                                      
 var Lock._state_mid: [Lock]State;                                                                  
 var y_owner_mid: HashSet;                                                                          
 var Array.HashSet.LOCK._length_mid: [Array.HashSet.LOCK]int;                                       
 var Lock._lock_mid: [Lock]Tid;                                                                     
 var Array.HashSet.LOCK._state_mid: [Array.HashSet.LOCK]State;                                      
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var x_owner_mid: HashSet;                                                                          
 var w_mid: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.HashSet.LOCK._elems[x][i];                                                           
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_mid == Lock._state && Lock._lock_mid == Lock._lock && HashSet._state_mid == HashSet._state && HashSet.locks_mid == HashSet.locks && HashSet._lock_mid == HashSet._lock && Array.HashSet.LOCK._state_mid == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_mid == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_mid == Array.HashSet.LOCK._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.HashSet.LOCK._elems[x][i] := tmpV;                                                           
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 _writeByTPost := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,w: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[y][j] := w;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.HashSet.LOCK._elems.Array.HashSet.LOCK._elems(t: Tid, u: Tid, v: Lock, w: Lock, w0: Lock, x_owner: HashSet, x: Array.HashSet.LOCK, i: int, y_owner: HashSet, y: Array.HashSet.LOCK, j: int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.HashSet.LOCK._state[x], t);                                            
 requires Array.HashSet.LOCK._this[x] == x_owner;                                                   
 requires isAccessible(Array.HashSet.LOCK._state[y], u);                                            
 requires Array.HashSet.LOCK._this[y] == y_owner;                                                   
 modifies Array.HashSet.LOCK._elems;                                                                
 modifies Array.HashSet.LOCK._elems;                                                                
                                                                                                    
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
 var HashSet._lock_pre: [HashSet]Tid;                                                               
 var j_pre: int;                                                                                    
 var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                       
 var y_pre: Array.HashSet.LOCK;                                                                     
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var HashSet._state_pre: [HashSet]State;                                                            
 var i_pre: int;                                                                                    
 var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                
 var Lock._lock_pre: [Lock]Tid;                                                                     
 var $pc_pre: Phase;                                                                                
 var x_owner_pre: HashSet;                                                                          
 var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                
 var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                      
 var w0_pre: Lock;                                                                                  
 var y_owner_pre: HashSet;                                                                          
 var Lock._state_pre: [Lock]State;                                                                  
 var x_pre: Array.HashSet.LOCK;                                                                     
 var t_pre: Tid;                                                                                    
 var w_pre: Lock;                                                                                   
 var v_pre: Lock;                                                                                   
                                                                                                    
 var w_post: Lock;                                                                                  
 var Lock._lock_post: [Lock]Tid;                                                                    
 var Lock._state_post: [Lock]State;                                                                 
 var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                               
 var y_post: Array.HashSet.LOCK;                                                                    
 var HashSet._state_post: [HashSet]State;                                                           
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                               
 var w0_post: Lock;                                                                                 
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                     
 var v_post: Lock;                                                                                  
 var x_owner_post: HashSet;                                                                         
 var x_post: Array.HashSet.LOCK;                                                                    
 var HashSet._lock_post: [HashSet]Tid;                                                              
 var y_owner_post: HashSet;                                                                         
 var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.HashSet.LOCK(t: Tid,x_owner: HashSet,x: Array.HashSet.LOCK,i: int,v: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.HashSet.LOCK._elems[x][i] := v;                                                              
 assume Lock._state_post == Lock._state && Lock._lock_post == Lock._lock && HashSet._state_post == HashSet._state && HashSet.locks_post == HashSet.locks && HashSet._lock_post == HashSet._lock && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.HashSet.LOCK(u: Tid,y_owner: HashSet,y: Array.HashSet.LOCK,j: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
requires ValidTid(tid);                                                                             
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
modifies Lock._state;                                                                               
modifies Lock._lock;                                                                                
modifies HashSet._state;                                                                            
modifies HashSet.locks;                                                                             
modifies HashSet._lock;                                                                             
modifies Array.HashSet.LOCK._state;                                                                 
modifies Array.HashSet.LOCK._elems;                                                                 
ensures StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
ensures Y(tid , old(Lock._state), old(Lock._lock), old(HashSet._state), old(HashSet.locks), old(HashSet._lock), old(Array.HashSet.LOCK._state), old(Array.HashSet.LOCK._elems), old(Array.HashSet.LOCK._length) , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
ensures  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Lock._lock:                                                                                      
                                                                                                    
function {:inline} Y_Lock._lock(tid : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(Lock._state[this], tid) && leq(m#moverPath(ReadEval.Lock._lock(tid: Tid,this: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (Lock._lock[this] == newValue))
 &&(((Lock._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Lock._lock(tid : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Subsumes.W(tid : Tid, u : Tid, this: Lock, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var this_yield: Lock;                                                                               
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
 assume isAccessible(Lock._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Lock._lock(u: Tid,this: Lock,newValue: Tid,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
 assume leq(m#moverPath(ReadEval.Lock._lock(tid: Tid,this: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _N);
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Lock._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Reflexive(tid : Tid, this: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var tid_yield: Tid;                                                                                 
var this_yield: Lock;                                                                               
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Lock._lock(tid, this, Lock._lock[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Lock._lock.Transitive(tid : Tid, this: Lock, newValue : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (2.1): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (2.1): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (2.1): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (2.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var this_pre: Lock;                                                                                 
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var newValue_pre: Tid;                                                                              
                                                                                                    
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var this_post: Lock;                                                                                
var newValue_post: Tid;                                                                             
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Lock._state[this], tid);                                                       
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_Lock._lock(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Lock._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// HashSet.locks:                                                                                   
                                                                                                    
function {:inline} Y_HashSet.locks(tid : Tid, this: HashSet, newValue: Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(HashSet._state[this], tid) && leq(m#moverPath(ReadEval.HashSet.locks(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (HashSet.locks[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_HashSet.locks(tid : Tid, this: HashSet, newValue: Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_HashSet.locks.Subsumes.W(tid : Tid, u : Tid, this: HashSet, newValue: Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var Lock._state_yield: [Lock]State;                                                                 
var newValue_yield: Array.HashSet.LOCK;                                                             
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume isAccessible(HashSet._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.HashSet.locks(u: Tid,this: HashSet,newValue: Array.HashSet.LOCK,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
                                                                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet.locks(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet.locks.Reflexive(tid : Tid, this: HashSet , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet.locks(tid, this, HashSet.locks[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet.locks.Transitive(tid : Tid, this: HashSet, newValue : Array.HashSet.LOCK , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (7.29): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (7.29): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (7.29): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (7.29): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var newValue_pre: Array.HashSet.LOCK;                                                               
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var newValue_post: Array.HashSet.LOCK;                                                              
var HashSet._lock_post: [HashSet]Tid;                                                               
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_HashSet.locks(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_HashSet.locks(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// HashSet._lock:                                                                                   
                                                                                                    
function {:inline} Y_HashSet._lock(tid : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 ((isAccessible(HashSet._state[this], tid) && leq(m#moverPath(ReadEval.HashSet._lock(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (HashSet._lock[this] == newValue))
 &&(((HashSet._lock[this]==tid)==(newValue==tid)))                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_HashSet._lock(tid : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Subsumes.W(tid : Tid, u : Tid, this: HashSet, newValue: Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var newValue_yield: Tid;                                                                            
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var u_yield: Tid;                                                                                   
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume isAccessible(HashSet._state[this], u);                                                      
 assume !isError(m#moverPath(WriteEval.HashSet._lock(u: Tid,this: HashSet,newValue: Tid,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
 assume leq(m#moverPath(ReadEval.HashSet._lock(tid: Tid,this: HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _N);
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Reflexive(tid : Tid, this: HashSet , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_HashSet._lock(tid, this, HashSet._lock[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_HashSet._lock.Transitive(tid : Tid, this: HashSet, newValue : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (4.1): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (4.1): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (4.1): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (4.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var newValue_pre: Tid;                                                                              
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var newValue_post: Tid;                                                                             
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(HashSet._state[this], tid);                                                    
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_HashSet._lock(tid, this, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_HashSet._lock(tid, this, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
// Array.HashSet.LOCK:                                                                              
                                                                                                    
function {:inline} Y_Array.HashSet.LOCK(tid : Tid, athis: Array.HashSet.LOCK, index: int, newValue: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
(var this := Array.HashSet.LOCK._this[athis];                                                       
 ((isAccessible(Array.HashSet.LOCK._state[athis], tid) && leq(m#moverPath(ReadEval.Array.HashSet.LOCK(tid: Tid,Array.HashSet.LOCK._this[athis]: HashSet,athis: Array.HashSet.LOCK,index: int,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)), _R)) ==> (Array.HashSet.LOCK._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.HashSet.LOCK(tid : Tid, athis: Array.HashSet.LOCK, index: int, newValue: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int): bool
{                                                                                                   
(var this := Array.HashSet.LOCK._this[athis];                                                       
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.HashSet.LOCK.Subsumes.W(tid : Tid, u : Tid, this: HashSet, athis: Array.HashSet.LOCK, index: int, newValue: Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.HashSet.LOCK._this[athis];                                                  
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var athis_yield: Array.HashSet.LOCK;                                                                
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var index_yield: int;                                                                               
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.HashSet.LOCK._state[athis], u);                                          
 assume !isError(m#moverPath(WriteEval.Array.HashSet.LOCK(u: Tid,Array.HashSet.LOCK._this[athis]: HashSet,athis: Array.HashSet.LOCK,index: int,newValue: Lock,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length)));
                                                                                                    
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.HashSet.LOCK(tid, athis, index, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.HashSet.LOCK.Reflexive(tid : Tid, this: HashSet, athis: Array.HashSet.LOCK, index: int , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.HashSet.LOCK._this[athis];                                                  
{                                                                                                   
var Lock._lock_yield: [Lock]Tid;                                                                    
var HashSet.locks_yield: [HashSet]Array.HashSet.LOCK;                                               
var Array.HashSet.LOCK._state_yield: [Array.HashSet.LOCK]State;                                     
var Array.HashSet.LOCK._length_yield: [Array.HashSet.LOCK]int;                                      
var this_yield: HashSet;                                                                            
var tid_yield: Tid;                                                                                 
var HashSet._lock_yield: [HashSet]Tid;                                                              
var $pc_yield: Phase;                                                                               
var athis_yield: Array.HashSet.LOCK;                                                                
var HashSet._state_yield: [HashSet]State;                                                           
var Lock._state_yield: [Lock]State;                                                                 
var index_yield: int;                                                                               
var Array.HashSet.LOCK._elems_yield: [Array.HashSet.LOCK]([int]Lock);                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.HashSet.LOCK._state[athis], tid);                                        
assume Lock._state_yield == Lock._state && Lock._lock_yield == Lock._lock && HashSet._state_yield == HashSet._state && HashSet.locks_yield == HashSet.locks && HashSet._lock_yield == HashSet._lock && Array.HashSet.LOCK._state_yield == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_yield == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_yield == Array.HashSet.LOCK._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.HashSet.LOCK(tid, athis, index, Array.HashSet.LOCK._elems[athis][index] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.HashSet.LOCK.Transitive(tid : Tid, this: HashSet, athis: Array.HashSet.LOCK, index: int, newValue : Lock , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int)
 requires StateInvariant(Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
 requires StateInvariant(Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197032(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (6.32): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197040(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (6.32): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197068(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (6.32): Object invariant may not hold.
requires  (forall _this : HashSet ::  { HashSet._state[_this] } isAccessible(HashSet._state[_this], tid) && true ==> Invariant.HashSet.1197120(tid: Tid,_this : HashSet,Lock._state,Lock._lock,HashSet._state,HashSet.locks,HashSet._lock,Array.HashSet.LOCK._state,Array.HashSet.LOCK._elems,Array.HashSet.LOCK._length));       // (6.32): Object invariant may not hold.
                                                                                                    
 requires this == Array.HashSet.LOCK._this[athis];                                                  
 requires ValidTid(tid);                                                                            
{                                                                                                   
var HashSet._lock_pre: [HashSet]Tid;                                                                
var Array.HashSet.LOCK._length_pre: [Array.HashSet.LOCK]int;                                        
var athis_pre: Array.HashSet.LOCK;                                                                  
var $recorded.state_pre: int;                                                                       
var HashSet._state_pre: [HashSet]State;                                                             
var index_pre: int;                                                                                 
var Array.HashSet.LOCK._elems_pre: [Array.HashSet.LOCK]([int]Lock);                                 
var Lock._lock_pre: [Lock]Tid;                                                                      
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var HashSet.locks_pre: [HashSet]Array.HashSet.LOCK;                                                 
var Array.HashSet.LOCK._state_pre: [Array.HashSet.LOCK]State;                                       
var Lock._state_pre: [Lock]State;                                                                   
var this_pre: HashSet;                                                                              
                                                                                                    
var this_post: HashSet;                                                                             
var Lock._lock_post: [Lock]Tid;                                                                     
var Lock._state_post: [Lock]State;                                                                  
var Array.HashSet.LOCK._elems_post: [Array.HashSet.LOCK]([int]Lock);                                
var HashSet._state_post: [HashSet]State;                                                            
var $recorded.state_post: int;                                                                      
var HashSet.locks_post: [HashSet]Array.HashSet.LOCK;                                                
var $pc_post: Phase;                                                                                
var Array.HashSet.LOCK._state_post: [Array.HashSet.LOCK]State;                                      
var tid_post: Tid;                                                                                  
var HashSet._lock_post: [HashSet]Tid;                                                               
var index_post: int;                                                                                
var athis_post: Array.HashSet.LOCK;                                                                 
var Array.HashSet.LOCK._length_post: [Array.HashSet.LOCK]int;                                       
                                                                                                    
assume Lock._state_pre == Lock._state && Lock._lock_pre == Lock._lock && HashSet._state_pre == HashSet._state && HashSet.locks_pre == HashSet.locks && HashSet._lock_pre == HashSet._lock && Array.HashSet.LOCK._state_pre == Array.HashSet.LOCK._state && Array.HashSet.LOCK._elems_pre == Array.HashSet.LOCK._elems && Array.HashSet.LOCK._length_pre == Array.HashSet.LOCK._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Lock._state_post == Lock._state_p && Lock._lock_post == Lock._lock_p && HashSet._state_post == HashSet._state_p && HashSet.locks_post == HashSet.locks_p && HashSet._lock_post == HashSet._lock_p && Array.HashSet.LOCK._state_post == Array.HashSet.LOCK._state_p && Array.HashSet.LOCK._elems_post == Array.HashSet.LOCK._elems_p && Array.HashSet.LOCK._length_post == Array.HashSet.LOCK._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.HashSet.LOCK._state[athis], tid);                                        
 assume Y(tid , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assume Y_Array.HashSet.LOCK(tid, athis, index, newValue , Lock._state_p, Lock._lock_p, HashSet._state_p, HashSet.locks_p, HashSet._lock_p, Array.HashSet.LOCK._state_p, Array.HashSet.LOCK._elems_p, Array.HashSet.LOCK._length_p);
 assert Y_Array.HashSet.LOCK(tid, athis, index, newValue , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Lock._state: [Lock]State, Lock._lock: [Lock]Tid, HashSet._state: [HashSet]State, HashSet.locks: [HashSet]Array.HashSet.LOCK, HashSet._lock: [HashSet]Tid, Array.HashSet.LOCK._state: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length: [Array.HashSet.LOCK]int , Lock._state_p: [Lock]State, Lock._lock_p: [Lock]Tid, HashSet._state_p: [HashSet]State, HashSet.locks_p: [HashSet]Array.HashSet.LOCK, HashSet._lock_p: [HashSet]Tid, Array.HashSet.LOCK._state_p: [Array.HashSet.LOCK]State, Array.HashSet.LOCK._elems_p: [Array.HashSet.LOCK]([int]Lock), Array.HashSet.LOCK._length_p: [Array.HashSet.LOCK]int): bool
{                                                                                                   
 (forall this: Lock :: Y_Lock._lock(tid : Tid, this, Lock._lock_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall this: HashSet :: Y_HashSet.locks(tid : Tid, this, HashSet.locks_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall this: HashSet :: Y_HashSet._lock(tid : Tid, this, HashSet._lock_p[this] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall athis: Array.HashSet.LOCK, index: int :: Y_Array.HashSet.LOCK(tid : Tid, athis, index, Array.HashSet.LOCK._elems_p[athis][index] , Lock._state, Lock._lock, HashSet._state, HashSet.locks, HashSet._lock, Array.HashSet.LOCK._state, Array.HashSet.LOCK._elems, Array.HashSet.LOCK._length))
 && (forall _i : Lock :: isShared(Lock._state[_i]) ==> isShared(Lock._state_p[_i]))                 
 && (forall _i : Lock :: isLocal(Lock._state[_i], tid) <==> isLocal(Lock._state_p[_i], tid))        
 && (forall _i : HashSet :: isShared(HashSet._state[_i]) ==> isShared(HashSet._state_p[_i]))        
 && (forall _i : HashSet :: isLocal(HashSet._state[_i], tid) <==> isLocal(HashSet._state_p[_i], tid))
 && (forall _i : Array.HashSet.LOCK :: isShared(Array.HashSet.LOCK._state[_i]) ==> isShared(Array.HashSet.LOCK._state_p[_i]))
 && (forall _i : Array.HashSet.LOCK :: Array.HashSet.LOCK._length[_i] == Array.HashSet.LOCK._length_p[_i])
 && (forall _i : Array.HashSet.LOCK :: isLocal(Array.HashSet.LOCK._state[_i], tid) <==> isLocal(Array.HashSet.LOCK._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1103.1-1637.2: (Method:19.5)
// 1114.1-1114.24: (19.5): Bad tid
// 1115.1-1115.41: (19.5): this is not global
// 1118.1-1118.316: (19.5): Object invariant may not hold.
// 1119.1-1119.316: (19.5): Object invariant may not hold.
// 1120.1-1120.316: (19.5): Object invariant may not hold.
// 1121.1-1121.316: (19.5): Object invariant may not hold.
// 1124.1-1124.315: (19.5): Object invariant may not hold.
// 1125.1-1125.315: (19.5): Object invariant may not hold.
// 1126.1-1126.315: (19.5): Object invariant may not hold.
// 1127.1-1127.315: (19.5): Object invariant may not hold.
// 1343.2-1345.2: (class anchor.sink.VarDeclStmt:20.13)
// 1346.2-1349.9: (class anchor.sink.Assign:20.13)
// 1352.2-1356.14: (class anchor.sink.While:20.26)
// 1358.1-1358.27: (19.5): Bad tid
// 1359.1-1359.44: (19.5): this is not global
// 1362.1-1362.319: (20.26): Object invariant may not hold.
// 1363.1-1363.319: (20.26): Object invariant may not hold.
// 1364.1-1364.319: (20.26): Object invariant may not hold.
// 1365.1-1365.319: (20.26): Object invariant may not hold.
// 1365.319-1366.211: (20.26): invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid) may not hold
// 1367.1-1367.309: (20.26): Loop does not preserve yields_as annotation for field locks
// 1368.1-1368.370: (20.26): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
// 1369.1-1369.33: (20.26): Phase must be invariant at loop head
// 1370.1-1370.30: (20.26): Potentially infinite loop cannot be in post-commit phase.
// 1372.3-1374.3: (class anchor.sink.VarDeclStmt:20.26)
// 1375.3-1377.3: (class anchor.sink.VarDeclStmt:20.28)
// 1378.3-1380.3: (class anchor.sink.VarDeclStmt:20.28)
// 1381.3-1398.31: (class anchor.sink.Read:20.28)
// 1393.1-1393.32: (20.28): Cannot have potential null deference in left-mover part.
// 1397.1-1397.28: (20.28): Reduction failure
// 1399.3-1402.44: (class anchor.sink.Assign:20.28)
// 1403.3-1406.20: (class anchor.sink.Assign:20.26)
// 1408.4-1411.10: (class anchor.sink.Break:20.26)
// 1414.3-1416.3: (class anchor.sink.VarDeclStmt:23.10)
// 1417.3-1434.31: (class anchor.sink.Read:23.10)
// 1429.1-1429.32: (23.10): Cannot have potential null deference in left-mover part.
// 1433.1-1433.28: (23.10): Reduction failure
// 1435.3-1437.3: (class anchor.sink.VarDeclStmt:23.10)
// 1438.3-1465.46: (class anchor.sink.ARead:23.10)
// 1450.1-1450.43: (23.10): Cannot have potential null deference in left-mover part.
// 1455.1-1455.18: (23.10): index < 0.
// 1460.1-1460.48: (23.10): index is >= length.
// 1464.1-1464.28: (23.10): Reduction failure
// 1469.1-1469.29: (23.10): Cannot have potential null deference in left-mover part.
// 1473.1-1473.28: (23.10): Reduction failure
// 1475.3-1478.14: (class anchor.sink.Assign:20.47)
// 1481.1-1481.30: (20.26): Phase must be invariant at loop head
// 1485.1-1485.27: (26.1): Can only commit when in pre-commit phase.
// 1487.2-1489.2: (class anchor.sink.VarDeclStmt:28.12)
// 1490.2-1493.9: (class anchor.sink.Assign:28.12)
// 1496.2-1500.14: (class anchor.sink.While:28.25)
// 1502.1-1502.27: (19.5): Bad tid
// 1503.1-1503.44: (19.5): this is not global
// 1506.1-1506.319: (28.25): Object invariant may not hold.
// 1507.1-1507.319: (28.25): Object invariant may not hold.
// 1508.1-1508.319: (28.25): Object invariant may not hold.
// 1509.1-1509.319: (28.25): Object invariant may not hold.
// 1509.319-1510.257: (28.25): invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid) may not hold
// 1511.1-1511.309: (28.25): Loop does not preserve yields_as annotation for field locks
// 1512.1-1512.370: (28.25): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
// 1513.1-1513.33: (28.25): Phase must be invariant at loop head
// 1514.1-1514.30: (28.25): Potentially infinite loop cannot be in post-commit phase.
// 1516.3-1518.3: (class anchor.sink.VarDeclStmt:28.25)
// 1519.3-1521.3: (class anchor.sink.VarDeclStmt:28.27)
// 1522.3-1524.3: (class anchor.sink.VarDeclStmt:28.27)
// 1525.3-1542.31: (class anchor.sink.Read:28.27)
// 1537.1-1537.32: (28.27): Cannot have potential null deference in left-mover part.
// 1541.1-1541.28: (28.27): Reduction failure
// 1543.3-1546.44: (class anchor.sink.Assign:28.27)
// 1547.3-1550.20: (class anchor.sink.Assign:28.25)
// 1552.4-1555.10: (class anchor.sink.Break:28.25)
// 1558.3-1560.3: (class anchor.sink.VarDeclStmt:31.9)
// 1561.3-1578.32: (class anchor.sink.Read:31.9)
// 1573.1-1573.32: (31.9): Cannot have potential null deference in left-mover part.
// 1577.1-1577.28: (31.9): Reduction failure
// 1579.3-1581.3: (class anchor.sink.VarDeclStmt:31.9)
// 1582.3-1609.47: (class anchor.sink.ARead:31.9)
// 1594.1-1594.44: (31.9): Cannot have potential null deference in left-mover part.
// 1599.1-1599.18: (31.9): index < 0.
// 1604.1-1604.49: (31.9): index is >= length.
// 1608.1-1608.28: (31.9): Reduction failure
// 1613.1-1613.29: (31.9): Cannot have potential null deference in left-mover part.
// 1615.1-1615.34: (31.9): lock not held
// 1617.1-1617.28: (31.9): Reduction failure
// 1619.3-1622.14: (class anchor.sink.Assign:28.46)
// 1625.1-1625.30: (28.25): Phase must be invariant at loop head
// 1627.2-1636.9: (class anchor.sink.Return:19.26)
// 1632.1-1632.315: (19.26): Object invariant may not hold.
// 1633.1-1633.315: (19.26): Object invariant may not hold.
// 1634.1-1634.315: (19.26): Object invariant may not hold.
// 1635.1-1635.315: (19.26): Object invariant may not hold.
// 1638.1-2178.2: (Method:37.5)
// 1649.1-1649.24: (37.5): Bad tid
// 1650.1-1650.41: (37.5): this is not global
// 1653.1-1653.316: (37.5): Object invariant may not hold.
// 1654.1-1654.316: (37.5): Object invariant may not hold.
// 1655.1-1655.316: (37.5): Object invariant may not hold.
// 1656.1-1656.316: (37.5): Object invariant may not hold.
// 1659.1-1659.315: (37.5): Object invariant may not hold.
// 1660.1-1660.315: (37.5): Object invariant may not hold.
// 1661.1-1661.315: (37.5): Object invariant may not hold.
// 1662.1-1662.315: (37.5): Object invariant may not hold.
// 1880.2-1882.2: (class anchor.sink.VarDeclStmt:38.13)
// 1883.2-1886.9: (class anchor.sink.Assign:38.13)
// 1889.2-1893.14: (class anchor.sink.While:38.26)
// 1895.1-1895.27: (37.5): Bad tid
// 1896.1-1896.44: (37.5): this is not global
// 1899.1-1899.319: (38.26): Object invariant may not hold.
// 1900.1-1900.319: (38.26): Object invariant may not hold.
// 1901.1-1901.319: (38.26): Object invariant may not hold.
// 1902.1-1902.319: (38.26): Object invariant may not hold.
// 1902.319-1903.211: (38.26): invariant forall int j ::0 <= j && j < i ==> holds(this.locks[j], tid) may not hold
// 1904.1-1904.309: (38.26): Loop does not preserve yields_as annotation for field locks
// 1905.1-1905.370: (38.26): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
// 1906.1-1906.33: (38.26): Phase must be invariant at loop head
// 1907.1-1907.30: (38.26): Potentially infinite loop cannot be in post-commit phase.
// 1909.3-1911.3: (class anchor.sink.VarDeclStmt:38.26)
// 1912.3-1914.3: (class anchor.sink.VarDeclStmt:38.28)
// 1915.3-1917.3: (class anchor.sink.VarDeclStmt:38.28)
// 1918.3-1935.32: (class anchor.sink.Read:38.28)
// 1930.1-1930.32: (38.28): Cannot have potential null deference in left-mover part.
// 1934.1-1934.28: (38.28): Reduction failure
// 1936.3-1939.46: (class anchor.sink.Assign:38.28)
// 1940.3-1943.22: (class anchor.sink.Assign:38.26)
// 1945.4-1948.10: (class anchor.sink.Break:38.26)
// 1951.3-1953.3: (class anchor.sink.VarDeclStmt:41.10)
// 1954.3-1971.32: (class anchor.sink.Read:41.10)
// 1966.1-1966.32: (41.10): Cannot have potential null deference in left-mover part.
// 1970.1-1970.28: (41.10): Reduction failure
// 1972.3-1974.3: (class anchor.sink.VarDeclStmt:41.10)
// 1975.3-2002.48: (class anchor.sink.ARead:41.10)
// 1987.1-1987.44: (41.10): Cannot have potential null deference in left-mover part.
// 1992.1-1992.18: (41.10): index < 0.
// 1997.1-1997.49: (41.10): index is >= length.
// 2001.1-2001.28: (41.10): Reduction failure
// 2006.1-2006.30: (41.10): Cannot have potential null deference in left-mover part.
// 2010.1-2010.28: (41.10): Reduction failure
// 2012.3-2015.14: (class anchor.sink.Assign:38.47)
// 2018.1-2018.30: (38.26): Phase must be invariant at loop head
// 2022.1-2022.27: (44.7): Can only commit when in pre-commit phase.
// 2024.2-2026.2: (class anchor.sink.VarDeclStmt:46.12)
// 2027.2-2030.9: (class anchor.sink.Assign:46.12)
// 2033.2-2038.14: (class anchor.sink.While:46.25)
// 2040.1-2040.27: (37.5): Bad tid
// 2041.1-2041.44: (37.5): this is not global
// 2044.1-2044.319: (46.25): Object invariant may not hold.
// 2045.1-2045.319: (46.25): Object invariant may not hold.
// 2046.1-2046.319: (46.25): Object invariant may not hold.
// 2047.1-2047.319: (46.25): Object invariant may not hold.
// 2047.319-2048.257: (46.25): invariant forall int j ::i <= j && j < this.locks.length ==> holds(this.locks[j], tid) may not hold
// 2049.1-2049.309: (46.25): Loop does not preserve yields_as annotation for field locks
// 2050.1-2050.370: (46.25): Loop does not preserve yields_as annotation for field ArrayDecl(LOCK,ClassType(Lock),index,Spec(Cond(IsLocal(VarAccess(athis),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),false,List()))
// 2050.370-2051.181: (46.25): decreasing expressions may actually increase
// 2052.1-2052.33: (46.25): Phase must be invariant at loop head
// 2055.3-2057.3: (class anchor.sink.VarDeclStmt:46.25)
// 2058.3-2060.3: (class anchor.sink.VarDeclStmt:46.27)
// 2061.3-2063.3: (class anchor.sink.VarDeclStmt:46.27)
// 2064.3-2081.32: (class anchor.sink.Read:46.27)
// 2076.1-2076.32: (46.27): Cannot have potential null deference in left-mover part.
// 2080.1-2080.28: (46.27): Reduction failure
// 2082.3-2085.46: (class anchor.sink.Assign:46.27)
// 2086.3-2089.22: (class anchor.sink.Assign:46.25)
// 2091.4-2094.10: (class anchor.sink.Break:46.25)
// 2097.3-2099.3: (class anchor.sink.VarDeclStmt:50.9)
// 2100.3-2117.32: (class anchor.sink.Read:50.9)
// 2112.1-2112.32: (50.9): Cannot have potential null deference in left-mover part.
// 2116.1-2116.28: (50.9): Reduction failure
// 2118.3-2120.3: (class anchor.sink.VarDeclStmt:50.9)
// 2121.3-2148.48: (class anchor.sink.ARead:50.9)
// 2133.1-2133.44: (50.9): Cannot have potential null deference in left-mover part.
// 2138.1-2138.18: (50.9): index < 0.
// 2143.1-2143.49: (50.9): index is >= length.
// 2147.1-2147.28: (50.9): Reduction failure
// 2152.1-2152.30: (50.9): Cannot have potential null deference in left-mover part.
// 2154.1-2154.35: (50.9): lock not held
// 2156.1-2156.28: (50.9): Reduction failure
// 2158.3-2161.14: (class anchor.sink.Assign:46.46)
// 2162.1-2162.179: (46.25): loop may not terminate
// 2163.1-2163.116: (46.25): decreasing expression not properly bounded by 0
// 2166.1-2166.30: (46.25): Phase must be invariant at loop head
// 2168.2-2177.9: (class anchor.sink.Return:37.27)
// 2173.1-2173.315: (37.27): Object invariant may not hold.
// 2174.1-2174.315: (37.27): Object invariant may not hold.
// 2175.1-2175.315: (37.27): Object invariant may not hold.
// 2176.1-2176.315: (37.27): Object invariant may not hold.
// 2317.1-2317.34: (7.5): HashSet.locks failed Write-Write Right-Mover Check
// 2384.1-2384.30: (7.5): HashSet.locks failed Write-Read Right-Mover Check
// 2455.1-2455.34: (7.5): HashSet.locks failed Write-Write Left-Mover Check
// 2523.1-2523.30: (7.5): HashSet.locks failed Write-Read Left-Mover Check
// 2588.1-2588.34: (7.5): HashSet.locks failed Read-Write Right-Mover Check
// 2656.1-2656.34: (7.5): HashSet.locks failed Read-Write Left-Mover Check
// 2729.1-2729.34: (6.5): Array Array.HashSet.LOCK failed Write-Write Right-Mover Check
// 2802.1-2802.30: (6.5): Array Array.HashSet.LOCK failed Write-Read Right-Mover Check
// 2879.1-2879.34: (6.5): Array Array.HashSet.LOCK failed Write-Write Left-Mover Check
// 2953.1-2953.30: (6.5): Array Array.HashSet.LOCK failed Write-Read Left-Mover Check
// 3024.1-3024.34: (6.5): Array Array.HashSet.LOCK failed Read-Write Right-Mover Check
// 3098.1-3098.34: (6.5): Array Array.HashSet.LOCK failed Read-Write Left-Mover Check
// 3177.1-3177.140: (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.1)
// 3178.1-3178.101: (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.2)
// 3179.1-3179.158: (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case A.3)
// 3287.1-3287.140: (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case C)
// 3400.1-3400.144: (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case D)
// 3401.1-3401.144: (7.5): HashSet.locks is not Write-Write Stable with respect to HashSet.locks (case R)
// 3480.1-3480.136: (7.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case F)
// 3481.1-3481.136: (7.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case H)
// 3482.1-3482.146: (7.5): HashSet.locks is not Read-Write Stable with respect to HashSet.locks (case I)
// 3560.1-3560.136: (7.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case J)
// 3561.1-3561.136: (7.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case K)
// 3562.1-3562.99: (7.5): HashSet.locks is not Write-Read Stable with respect to HashSet.locks (case L)
// 3647.1-3647.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.1)
// 3648.1-3648.101: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.2)
// 3649.1-3649.156: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case A.3)
// 3764.1-3764.140: (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
// 3884.1-3884.144: (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
// 3885.1-3885.144: (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
// 3969.1-3969.136: (7.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
// 3970.1-3970.136: (7.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
// 3971.1-3971.144: (7.5): HashSet.locks is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
// 4054.1-4054.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case J)
// 4055.1-4055.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case K)
// 4056.1-4056.99: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to HashSet.locks (case L)
// 4141.1-4141.140: (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
// 4142.1-4142.101: (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
// 4143.1-4143.156: (7.5): HashSet.locks is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
// 4258.1-4258.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case C)
// 4378.1-4378.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case D)
// 4379.1-4379.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to HashSet.locks (case R)
// 4463.1-4463.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case F)
// 4464.1-4464.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case H)
// 4465.1-4465.144: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to HashSet.locks (case I)
// 4548.1-4548.136: (7.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
// 4549.1-4549.136: (7.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
// 4550.1-4550.99: (7.5): HashSet.locks is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
// 4640.1-4640.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.1)
// 4641.1-4641.101: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.2)
// 4642.1-4642.156: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case A.3)
// 4764.1-4764.140: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case C)
// 4891.1-4891.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case D)
// 4892.1-4892.144: (6.5): Array Array.HashSet.LOCK is not Write-Write Stable with respect to Array Array.HashSet.LOCK (case R)
// 4981.1-4981.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case F)
// 4982.1-4982.136: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case H)
// 4983.1-4983.144: (6.5): Array Array.HashSet.LOCK is not Read-Write Stable with respect to Array Array.HashSet.LOCK (case I)
// 5071.1-5071.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case J)
// 5072.1-5072.136: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case K)
// 5073.1-5073.99: (6.5): Array Array.HashSet.LOCK is not Write-Read Stable with respect to Array Array.HashSet.LOCK (case L)
// 5080.1-5080.316: (<undefined position>): Object invariant may not hold.
// 5081.1-5081.316: (<undefined position>): Object invariant may not hold.
// 5082.1-5082.316: (<undefined position>): Object invariant may not hold.
// 5083.1-5083.316: (<undefined position>): Object invariant may not hold.
// 5093.1-5093.315: (<undefined position>): Object invariant may not hold.
// 5094.1-5094.315: (<undefined position>): Object invariant may not hold.
// 5095.1-5095.315: (<undefined position>): Object invariant may not hold.
// 5096.1-5096.315: (<undefined position>): Object invariant may not hold.
// 5117.1-5141.2: (7.32): yields_as clause for Lock._lock is not valid
// 5146.1-5165.2: (7.32): yields_as clause for Lock._lock is not reflexive
// 5171.1-5171.316: (2.1): Object invariant may not hold.
// 5172.1-5172.316: (2.1): Object invariant may not hold.
// 5173.1-5173.316: (2.1): Object invariant may not hold.
// 5174.1-5174.316: (2.1): Object invariant may not hold.
// 5175.1-5213.2: (7.32): yields_as clause for Lock._lock is not transitive
// 5232.1-5256.2: (7.5): yields_as clause for HashSet.locks is not valid
// 5261.1-5280.2: (7.5): yields_as clause for HashSet.locks is not reflexive
// 5286.1-5286.316: (7.29): Object invariant may not hold.
// 5287.1-5287.316: (7.29): Object invariant may not hold.
// 5288.1-5288.316: (7.29): Object invariant may not hold.
// 5289.1-5289.316: (7.29): Object invariant may not hold.
// 5290.1-5328.2: (7.5): yields_as clause for HashSet.locks is not transitive
// 5348.1-5372.2: (7.32): yields_as clause for HashSet._lock is not valid
// 5377.1-5396.2: (7.32): yields_as clause for HashSet._lock is not reflexive
// 5402.1-5402.316: (4.1): Object invariant may not hold.
// 5403.1-5403.316: (4.1): Object invariant may not hold.
// 5404.1-5404.316: (4.1): Object invariant may not hold.
// 5405.1-5405.316: (4.1): Object invariant may not hold.
// 5406.1-5444.2: (7.32): yields_as clause for HashSet._lock is not transitive
// 5462.1-5490.2: (6.5): yields_as clause for Array.HashSet.LOCK is not valid
// 5491.1-5516.2: (6.5): yields_as clause for Array.HashSet.LOCK is not reflexive
// 5521.1-5521.316: (6.32): Object invariant may not hold.
// 5522.1-5522.316: (6.32): Object invariant may not hold.
// 5523.1-5523.316: (6.32): Object invariant may not hold.
// 5524.1-5524.316: (6.32): Object invariant may not hold.
// 5525.1-5567.2: (6.5): yields_as clause for Array.HashSet.LOCK is not transitive
