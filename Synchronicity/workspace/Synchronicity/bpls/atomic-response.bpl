                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/atomic-response.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicIncAndDec {                                                                         
      volatile int n N                                                                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.n == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) + 1;                                                          
      }                                                                                             
      public void inc() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            x := this.n;                                                                            
            yield;                                                                                  
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            tmp2 = this.n@x :~ tmp3;                                                                
            if (tmp2) {                                                                             
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) - 1;                                                          
      }                                                                                             
      public void dec() {                                                                           
        while (true)   {                                                                            
          boolean tmp4;                                                                             
          tmp4 = true;                                                                              
          if (!tmp4) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            x := this.n;                                                                            
            yield;                                                                                  
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 = x - 1;                                                                           
            tmp5 = this.n@x :~ tmp6;                                                                
            if (tmp5) {                                                                             
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicIncAndDec {                                                                         
      hasCASOperation volatile int n N                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid n_nextThread isLocal(this, tid)                                             
       ? B                                                                                          
       : this.n_nextThread == tid ? N : E                                                           
        yields_as this.n_nextThread == tid ==> newValue == tid;                                     
                                                                                                    
                                                                                                    
      updatesViaCAS int n_nextValue isLocal(this, tid)                                              
       ? B                                                                                          
       : this.n_nextThread == tid ? N : E                                                           
        yields_as this.n_nextThread == tid ==> newValue == this.n_nextValue;                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.n == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) + 1;                                                          
      }                                                                                             
      public void inc() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.n_nextThread  as B;                                                      
              int _C_v;                                                                             
              _C_v := this.n_nextValue  as B;                                                       
              int _currentValue;                                                                    
              _currentValue := this.n  as B;                                                        
              Mover _R_t;                                                                           
              _R_t = readPermission(this.n);                                                        
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            yield;                                                                                  
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp339987;                                                                   
              ctmp339987 = *;                                                                       
              if (ctmp339987) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp339987 = *;                                                                     
                if (ctmp339987) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp3);                                               
                  assume this.n == x;                                                               
                  assume !goesWrong(_m);                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  this.n_nextThread := tmpTid as B;                                                 
                  this.n_nextValue := tmpValue as B;                                                
                  noop(TraceOn);                                                                    
                  this.n := tmp3;                                                                   
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  int _currentValue;                                                                
                  _currentValue := this.n  as B;                                                    
                  this.n := x as B;                                                                 
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp3);                                               
                  this.n := _currentValue as B;                                                     
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.n := tmp3;                                                                   
                  tmp2 = false;                                                                     
                }                                                                                   
              }                                                                                     
            }                                                                                       
            if (tmp2) {                                                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) - 1;                                                          
      }                                                                                             
      public void dec() {                                                                           
        while (true)   {                                                                            
          boolean tmp4;                                                                             
          tmp4 = true;                                                                              
          if (!tmp4) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.n_nextThread  as B;                                                      
              int _C_v;                                                                             
              _C_v := this.n_nextValue  as B;                                                       
              int _currentValue;                                                                    
              _currentValue := this.n  as B;                                                        
              Mover _R_t;                                                                           
              _R_t = readPermission(this.n);                                                        
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            yield;                                                                                  
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 = x - 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp340051;                                                                   
              ctmp340051 = *;                                                                       
              if (ctmp340051) {                                                                     
                noop(TraceOn);                                                                      
                tmp5 = false;                                                                       
              } else {                                                                              
                ctmp340051 = *;                                                                     
                if (ctmp340051) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp6);                                               
                  assume this.n == x;                                                               
                  assume !goesWrong(_m);                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  this.n_nextThread := tmpTid as B;                                                 
                  this.n_nextValue := tmpValue as B;                                                
                  noop(TraceOn);                                                                    
                  this.n := tmp6;                                                                   
                  tmp5 = true;                                                                      
                } else {                                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  int _currentValue;                                                                
                  _currentValue := this.n  as B;                                                    
                  this.n := x as B;                                                                 
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp6);                                               
                  this.n := _currentValue as B;                                                     
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.n := tmp6;                                                                   
                  tmp5 = false;                                                                     
                }                                                                                   
              }                                                                                     
            }                                                                                       
            if (tmp5) {                                                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicIncAndDec {                                                                         
      hasCASOperation volatile int n N                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid n_nextThread isLocal(this, tid)                                             
       ? B                                                                                          
       : this.n_nextThread == tid ? N : E                                                           
        yields_as this.n_nextThread == tid ==> newValue == tid;                                     
                                                                                                    
                                                                                                    
      updatesViaCAS int n_nextValue isLocal(this, tid)                                              
       ? B                                                                                          
       : this.n_nextThread == tid ? N : E                                                           
        yields_as this.n_nextThread == tid ==> newValue == this.n_nextValue;                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.n == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) + 1;                                                          
      }                                                                                             
      public void inc() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.n_nextThread  as B;                                                      
              int _C_v;                                                                             
              _C_v := this.n_nextValue  as B;                                                       
              int _currentValue;                                                                    
              _currentValue := this.n  as B;                                                        
              Mover _R_t;                                                                           
              _R_t = readPermission(this.n);                                                        
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            yield;                                                                                  
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp339987;                                                                   
              ctmp339987 = *;                                                                       
              if (ctmp339987) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp339987 = *;                                                                     
                if (ctmp339987) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp3);                                               
                  assume this.n == x;                                                               
                  assume !goesWrong(_m);                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  this.n_nextThread := tmpTid as B;                                                 
                  this.n_nextValue := tmpValue as B;                                                
                  noop(TraceOn);                                                                    
                  this.n := tmp3;                                                                   
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  int _currentValue;                                                                
                  _currentValue := this.n  as B;                                                    
                  this.n := x as B;                                                                 
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp3);                                               
                  this.n := _currentValue as B;                                                     
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.n := tmp3;                                                                   
                  tmp2 = false;                                                                     
                }                                                                                   
              }                                                                                     
            }                                                                                       
            if (tmp2) {                                                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) - 1;                                                          
      }                                                                                             
      public void dec() {                                                                           
        while (true)   {                                                                            
          boolean tmp4;                                                                             
          tmp4 = true;                                                                              
          if (!tmp4) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.n_nextThread  as B;                                                      
              int _C_v;                                                                             
              _C_v := this.n_nextValue  as B;                                                       
              int _currentValue;                                                                    
              _currentValue := this.n  as B;                                                        
              Mover _R_t;                                                                           
              _R_t = readPermission(this.n);                                                        
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            yield;                                                                                  
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 = x - 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp340051;                                                                   
              ctmp340051 = *;                                                                       
              if (ctmp340051) {                                                                     
                noop(TraceOn);                                                                      
                tmp5 = false;                                                                       
              } else {                                                                              
                ctmp340051 = *;                                                                     
                if (ctmp340051) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp6);                                               
                  assume this.n == x;                                                               
                  assume !goesWrong(_m);                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  this.n_nextThread := tmpTid as B;                                                 
                  this.n_nextValue := tmpValue as B;                                                
                  noop(TraceOn);                                                                    
                  this.n := tmp6;                                                                   
                  tmp5 = true;                                                                      
                } else {                                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  int _currentValue;                                                                
                  _currentValue := this.n  as B;                                                    
                  this.n := x as B;                                                                 
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp6);                                               
                  this.n := _currentValue as B;                                                     
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.n := tmp6;                                                                   
                  tmp5 = false;                                                                     
                }                                                                                   
              }                                                                                     
            }                                                                                       
            if (tmp5) {                                                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicIncAndDec {                                                                         
      hasCASOperation volatile int n N                                                              
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid n_nextThread isLocal(this, tid)                                             
       ? B                                                                                          
       : this.n_nextThread == tid ? N : E                                                           
        yields_as this.n_nextThread == tid ==> newValue == tid;                                     
                                                                                                    
                                                                                                    
      updatesViaCAS int n_nextValue isLocal(this, tid)                                              
       ? B                                                                                          
       : this.n_nextThread == tid ? N : E                                                           
        yields_as this.n_nextThread == tid ==> newValue == this.n_nextValue;                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.n == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) + 1;                                                          
      }                                                                                             
      public void inc() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.n_nextThread  as B;                                                      
              int _C_v;                                                                             
              _C_v := this.n_nextValue  as B;                                                       
              int _currentValue;                                                                    
              _currentValue := this.n  as B;                                                        
              Mover _R_t;                                                                           
              _R_t = readPermission(this.n);                                                        
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            yield;                                                                                  
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp339987;                                                                   
              ctmp339987 = *;                                                                       
              if (ctmp339987) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp339987 = *;                                                                     
                if (ctmp339987) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp3);                                               
                  assume this.n == x;                                                               
                  assume !goesWrong(_m);                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  this.n_nextThread := tmpTid as B;                                                 
                  this.n_nextValue := tmpValue as B;                                                
                  noop(TraceOn);                                                                    
                  this.n := tmp3;                                                                   
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  int _currentValue;                                                                
                  _currentValue := this.n  as B;                                                    
                  this.n := x as B;                                                                 
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp3);                                               
                  this.n := _currentValue as B;                                                     
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.n := tmp3;                                                                   
                  tmp2 = false;                                                                     
                }                                                                                   
              }                                                                                     
            }                                                                                       
            if (tmp2) {                                                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        modifies this;                                                                              
        ensures this.n == old(this.n) - 1;                                                          
      }                                                                                             
      public void dec() {                                                                           
        while (true)   {                                                                            
          boolean tmp4;                                                                             
          tmp4 = true;                                                                              
          if (!tmp4) {                                                                              
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.n_nextThread  as B;                                                      
              int _C_v;                                                                             
              _C_v := this.n_nextValue  as B;                                                       
              int _currentValue;                                                                    
              _currentValue := this.n  as B;                                                        
              Mover _R_t;                                                                           
              _R_t = readPermission(this.n);                                                        
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            yield;                                                                                  
            boolean tmp5;                                                                           
            int tmp6;                                                                               
            tmp6 = x - 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp340051;                                                                   
              ctmp340051 = *;                                                                       
              if (ctmp340051) {                                                                     
                noop(TraceOn);                                                                      
                tmp5 = false;                                                                       
              } else {                                                                              
                ctmp340051 = *;                                                                     
                if (ctmp340051) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp6);                                               
                  assume this.n == x;                                                               
                  assume !goesWrong(_m);                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  this.n_nextThread := tmpTid as B;                                                 
                  this.n_nextValue := tmpValue as B;                                                
                  noop(TraceOn);                                                                    
                  this.n := tmp6;                                                                   
                  tmp5 = true;                                                                      
                } else {                                                                            
                  assume this.n_nextThread == tid;                                                  
                  assume this.n_nextValue == x;                                                     
                  int _currentValue;                                                                
                  _currentValue := this.n  as B;                                                    
                  this.n := x as B;                                                                 
                  Mover _m;                                                                         
                  _m = writePermission(this.n, tmp6);                                               
                  this.n := _currentValue as B;                                                     
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.n := tmp6;                                                                   
                  tmp5 = false;                                                                     
                }                                                                                   
              }                                                                                     
            }                                                                                       
            if (tmp5) {                                                                             
              {                                                                                     
                break;                                                                              
              }                                                                                     
            } else {                                                                                
                                                                                                    
            }                                                                                       
            yield;                                                                                  
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
                                                                                                    
                                                                                                    
/*** Class Decl AtomicIncAndDec ***/                                                                
                                                                                                    
type AtomicIncAndDec;                                                                               
const unique AtomicIncAndDec.null: AtomicIncAndDec;                                                 
var AtomicIncAndDec._state: [AtomicIncAndDec]State;                                                 
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicIncAndDec.n: [AtomicIncAndDec]int;                                                        
                                                                                                    
function {:inline} ReadEval.AtomicIncAndDec.n(tid: Tid,this : AtomicIncAndDec,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicIncAndDec.n(tid: Tid,this : AtomicIncAndDec,newValue: int,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicIncAndDec._lock: [AtomicIncAndDec]Tid;                                                    
                                                                                                    
function {:inline} ReadEval.AtomicIncAndDec._lock(tid: Tid,this : AtomicIncAndDec,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(AtomicIncAndDec._state[this], tid)) then                                               
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((AtomicIncAndDec._lock[this]==tid)) then                                                     
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((AtomicIncAndDec._lock[this]==Tid.null)&&(newValue==tid))) then                             
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((AtomicIncAndDec._lock[this]==tid)&&(newValue==Tid.null))) then                            
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicIncAndDec._lock(tid: Tid,this : AtomicIncAndDec,newValue: Tid,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(AtomicIncAndDec._state[this], tid)) then                                               
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((AtomicIncAndDec._lock[this]==tid)) then                                                     
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((AtomicIncAndDec._lock[this]==Tid.null)&&(newValue==tid))) then                             
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((AtomicIncAndDec._lock[this]==tid)&&(newValue==Tid.null))) then                            
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid;                                             
                                                                                                    
function {:inline} ReadEval.AtomicIncAndDec.n_nextThread(tid: Tid,this : AtomicIncAndDec,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(AtomicIncAndDec._state[this], tid)) then                                               
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicIncAndDec.n_nextThread[this]==tid)) then                                               
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicIncAndDec.n_nextThread(tid: Tid,this : AtomicIncAndDec,newValue: Tid,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(AtomicIncAndDec._state[this], tid)) then                                               
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicIncAndDec.n_nextThread[this]==tid)) then                                               
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int;                                              
                                                                                                    
function {:inline} ReadEval.AtomicIncAndDec.n_nextValue(tid: Tid,this : AtomicIncAndDec,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(AtomicIncAndDec._state[this], tid)) then                                               
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicIncAndDec.n_nextThread[this]==tid)) then                                               
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicIncAndDec.n_nextValue(tid: Tid,this : AtomicIncAndDec,newValue: int,AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(AtomicIncAndDec._state[this], tid)) then                                               
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicIncAndDec.n_nextThread[this]==tid)) then                                               
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  AtomicIncAndDec.inc(tid:Tid, this : AtomicIncAndDec)                                     
modifies AtomicIncAndDec._state;                                                                    
modifies AtomicIncAndDec.n;                                                                         
modifies AtomicIncAndDec._lock;                                                                     
modifies AtomicIncAndDec.n_nextThread;                                                              
modifies AtomicIncAndDec.n_nextValue;                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(AtomicIncAndDec._state[this]);                                                           // (7.5): this is not global
                                                                                                    
requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
                                                                                                    
ensures StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
{                                                                                                   
 var tmp1357032: bool;                                                                              
 var tmp1356913: bool;                                                                              
 var _C_t356858: Tid;                                                                               
 var this356987: AtomicIncAndDec;                                                                   
 var mover356913: Mover;                                                                            
 var ctmp339987357017: bool;                                                                        
 var tmp2357020: bool;                                                                              
 var $recorded.state356994: int;                                                                    
 var _currentValue: int;                                                                            
 var this357057: AtomicIncAndDec;                                                                   
 var tid357058: Tid;                                                                                
 var AtomicIncAndDec._state356994: [AtomicIncAndDec]State;                                          
 var x357054_post: int;                                                                             
 var $recorded.state357054: int;                                                                    
 var tid356990: Tid;                                                                                
 var AtomicIncAndDec.n357020: [AtomicIncAndDec]int;                                                 
 var path356987: int;                                                                               
 var _casable356913: bool;                                                                          
 var $recorded.state357057: int;                                                                    
 var AtomicIncAndDec.n356987: [AtomicIncAndDec]int;                                                 
 var _C_t: Tid;                                                                                     
 var AtomicIncAndDec.n_nextValue357054_post: [AtomicIncAndDec]int;                                  
 var $recorded.state356917_post: int;                                                               
 var tmp1356917_post: bool;                                                                         
 var AtomicIncAndDec.n356864: [AtomicIncAndDec]int;                                                 
 var x357017: int;                                                                                  
 var AtomicIncAndDec.n_nextThread356913: [AtomicIncAndDec]Tid;                                      
 var tmpValue356990: int;                                                                           
 var tmpValue356987: int;                                                                           
 var AtomicIncAndDec.n_nextThread356917_post: [AtomicIncAndDec]Tid;                                 
 var AtomicIncAndDec._state357020: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n356858: [AtomicIncAndDec]int;                                                 
 var tmpTid356990: Tid;                                                                             
 var tmp3357054_post: int;                                                                          
 var x356858: int;                                                                                  
 var this356913: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec._lock356913: [AtomicIncAndDec]Tid;                                             
 var $recorded.state357020: int;                                                                    
 var AtomicIncAndDec.n_nextThread356990: [AtomicIncAndDec]Tid;                                      
 var _casable: bool;                                                                                
 var _m356990: Mover;                                                                               
 var tmp1356858: bool;                                                                              
 var _m357039: Mover;                                                                               
 var ctmp339987357032: bool;                                                                        
 var x: int;                                                                                        
 var this357020: AtomicIncAndDec;                                                                   
 var this356917_post: AtomicIncAndDec;                                                              
 var _currentValue357020: int;                                                                      
 var AtomicIncAndDec.n_nextThread357058: [AtomicIncAndDec]Tid;                                      
 var moverPath356858: MoverPath;                                                                    
 var x357032: int;                                                                                  
 var AtomicIncAndDec.n_nextValue357020: [AtomicIncAndDec]int;                                       
 var this356864: AtomicIncAndDec;                                                                   
 var tid357057_bottom: Tid;                                                                         
 var $recorded.state357039: int;                                                                    
 var AtomicIncAndDec.n_nextThread356987: [AtomicIncAndDec]Tid;                                      
 var $recorded.state356870: int;                                                                    
 var tid357054_post: Tid;                                                                           
 var AtomicIncAndDec.n_nextThread357032: [AtomicIncAndDec]Tid;                                      
 var mover356908: Mover;                                                                            
 var AtomicIncAndDec._lock357017: [AtomicIncAndDec]Tid;                                             
 var this356994: AtomicIncAndDec;                                                                   
 var $pc357057_bottom: Phase;                                                                       
 var tmp1: bool;                                                                                    
 var tmp2356994: bool;                                                                              
 var _currentValue356913: int;                                                                      
 var tmp3356987: int;                                                                               
 var tid356917_post: Tid;                                                                           
 var tmpTid356994: Tid;                                                                             
 var tmpValue: int;                                                                                 
 var ctmp339987356990: bool;                                                                        
 var moverPath356994: MoverPath;                                                                    
 var tid357017: Tid;                                                                                
 var $recorded.state356908: int;                                                                    
 var tmp2357054_post: bool;                                                                         
 var this357039: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec._state357057_bottom: [AtomicIncAndDec]State;                                   
 var path357032: int;                                                                               
 var AtomicIncAndDec.n356908: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec.n_nextValue356858: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._lock357058: [AtomicIncAndDec]Tid;                                             
 var path356870: int;                                                                               
 var tid356917: Tid;                                                                                
 var $recorded.state357054_post: int;                                                               
 var tmp1356908: bool;                                                                              
 var AtomicIncAndDec.n_nextValue357057_bottom: [AtomicIncAndDec]int;                                
 var AtomicIncAndDec._state357039: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec._lock357054: [AtomicIncAndDec]Tid;                                             
 var tmp1356994: bool;                                                                              
 var ctmp339987357020: bool;                                                                        
 var tmp2: bool;                                                                                    
 var moverPath356908: MoverPath;                                                                    
 var tmp3356994: int;                                                                               
 var $recorded.state356917: int;                                                                    
 var AtomicIncAndDec.n_nextThread356858: [AtomicIncAndDec]Tid;                                      
 var _C_t356864: Tid;                                                                               
 var tid357020: Tid;                                                                                
 var tmp1356917: bool;                                                                              
 var AtomicIncAndDec._lock357057_bottom: [AtomicIncAndDec]Tid;                                      
 var x356917: int;                                                                                  
 var _m356994: Mover;                                                                               
 var tmpTid356987: Tid;                                                                             
 var _C_v356870: int;                                                                               
 var mover357039: Mover;                                                                            
 var AtomicIncAndDec.n_nextValue356917: [AtomicIncAndDec]int;                                       
 var tmp3356990: int;                                                                               
 var x356870: int;                                                                                  
 var AtomicIncAndDec._state357057: [AtomicIncAndDec]State;                                          
 var _casable356908: bool;                                                                          
 var mover356864: Mover;                                                                            
 var _m357032: Mover;                                                                               
 var moverPath357039: MoverPath;                                                                    
 var tid357039: Tid;                                                                                
 var AtomicIncAndDec._state356858: [AtomicIncAndDec]State;                                          
 var _C_t356913: Tid;                                                                               
 var _C_v: int;                                                                                     
 var tmp2357032: bool;                                                                              
 var AtomicIncAndDec._lock356994: [AtomicIncAndDec]Tid;                                             
 var this356990: AtomicIncAndDec;                                                                   
 var _currentValue357017: int;                                                                      
 var AtomicIncAndDec._state357017: [AtomicIncAndDec]State;                                          
 var $recorded.state356990: int;                                                                    
 var AtomicIncAndDec.n_nextValue357017: [AtomicIncAndDec]int;                                       
 var tmp3357039: int;                                                                               
 var path356913: int;                                                                               
 var AtomicIncAndDec.n356870: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec.n_nextThread357054: [AtomicIncAndDec]Tid;                                      
 var mover357020: Mover;                                                                            
 var x357020: int;                                                                                  
 var tid357032: Tid;                                                                                
 var AtomicIncAndDec._lock356990: [AtomicIncAndDec]Tid;                                             
 var $recorded.state356864: int;                                                                    
 var tmp2357017: bool;                                                                              
 var path357020: int;                                                                               
 var $pc357020: Phase;                                                                              
 var $pc356917: Phase;                                                                              
 var this356870: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec.n356990: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec._state357032: [AtomicIncAndDec]State;                                          
 var $recorded.state356858: int;                                                                    
 var AtomicIncAndDec._lock357032: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec._state356990: [AtomicIncAndDec]State;                                          
 var tmp1357054_post: bool;                                                                         
 var x356990: int;                                                                                  
 var AtomicIncAndDec.n_nextValue356908: [AtomicIncAndDec]int;                                       
 var tid356864: Tid;                                                                                
 var path357039: int;                                                                               
 var mover356994: Mover;                                                                            
 var this357054: AtomicIncAndDec;                                                                   
 var _R_t356908: Mover;                                                                             
 var $pc356908: Phase;                                                                              
 var AtomicIncAndDec.n356917: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec.n_nextThread356908: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec.n356994: [AtomicIncAndDec]int;                                                 
 var path356994: int;                                                                               
 var AtomicIncAndDec.n_nextValue356870: [AtomicIncAndDec]int;                                       
 var moverPath357017: MoverPath;                                                                    
 var tmp2356990: bool;                                                                              
 var tmp1357020: bool;                                                                              
 var AtomicIncAndDec._lock356917_post: [AtomicIncAndDec]Tid;                                        
 var tid356987: Tid;                                                                                
 var ctmp339987356994: bool;                                                                        
 var $pc357058: Phase;                                                                              
 var x356987: int;                                                                                  
 var $pc357039: Phase;                                                                              
 var AtomicIncAndDec.n_nextThread357057_bottom: [AtomicIncAndDec]Tid;                               
 var x356994: int;                                                                                  
 var AtomicIncAndDec._lock356858: [AtomicIncAndDec]Tid;                                             
 var x356917_post: int;                                                                             
 var tid356870: Tid;                                                                                
 var AtomicIncAndDec.n_nextValue357039: [AtomicIncAndDec]int;                                       
 var $recorded.state357032: int;                                                                    
 var moverPath356864: MoverPath;                                                                    
 var tmp1357039: bool;                                                                              
 var $pc356987: Phase;                                                                              
 var AtomicIncAndDec._lock356987: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n356917_post: [AtomicIncAndDec]int;                                            
 var $pc356990: Phase;                                                                              
 var AtomicIncAndDec.n357054_post: [AtomicIncAndDec]int;                                            
 var ctmp339987357039: bool;                                                                        
 var path356864: int;                                                                               
 var tmp1357054: bool;                                                                              
 var AtomicIncAndDec.n357057: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec._lock357039: [AtomicIncAndDec]Tid;                                             
 var moverPath357020: MoverPath;                                                                    
 var this356908: AtomicIncAndDec;                                                                   
 var _C_t356908: Tid;                                                                               
 var $recorded.state356913: int;                                                                    
 var $recorded.state357057_bottom: int;                                                             
 var AtomicIncAndDec.n_nextThread357020: [AtomicIncAndDec]Tid;                                      
 var _R_t: Mover;                                                                                   
 var ctmp339987356987: bool;                                                                        
 var this356917: AtomicIncAndDec;                                                                   
 var moverPath356913: MoverPath;                                                                    
 var _currentValue357032: int;                                                                      
 var path356990: int;                                                                               
 var this357017: AtomicIncAndDec;                                                                   
 var $pc357032: Phase;                                                                              
 var AtomicIncAndDec._lock357020: [AtomicIncAndDec]Tid;                                             
 var moverPath356990: MoverPath;                                                                    
 var _C_v356864: int;                                                                               
 var _m: Mover;                                                                                     
 var AtomicIncAndDec._state356870: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread357017: [AtomicIncAndDec]Tid;                                      
 var mover356870: Mover;                                                                            
 var x357039: int;                                                                                  
 var AtomicIncAndDec._lock357054_post: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n_nextThread356870: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec.n_nextValue357058: [AtomicIncAndDec]int;                                       
 var x357054: int;                                                                                  
 var AtomicIncAndDec.n_nextValue357032: [AtomicIncAndDec]int;                                       
 var _m356987: Mover;                                                                               
 var AtomicIncAndDec._lock356864: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n356913: [AtomicIncAndDec]int;                                                 
 var path357017: int;                                                                               
 var AtomicIncAndDec.n_nextThread357039: [AtomicIncAndDec]Tid;                                      
 var phase357057: Phase;                                                                            
 var path356908: int;                                                                               
 var tmp2357054: bool;                                                                              
 var tmp3357020: int;                                                                               
 var _R_t356913: Mover;                                                                             
 var this357054_post: AtomicIncAndDec;                                                              
 var AtomicIncAndDec.n_nextValue356917_post: [AtomicIncAndDec]int;                                  
 var AtomicIncAndDec.n_nextValue357054: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._state356917_post: [AtomicIncAndDec]State;                                     
 var AtomicIncAndDec.n_nextValue356987: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._state357054_post: [AtomicIncAndDec]State;                                     
 var _currentValue356870: int;                                                                      
 var tmp3357017: int;                                                                               
 var x356864: int;                                                                                  
 var $pc356864: Phase;                                                                              
 var moverPath356870: MoverPath;                                                                    
 var AtomicIncAndDec._lock356870: [AtomicIncAndDec]Tid;                                             
 var tmp1356870: bool;                                                                              
 var AtomicIncAndDec.n357057_bottom: [AtomicIncAndDec]int;                                          
 var tmp1356990: bool;                                                                              
 var tmp1357017: bool;                                                                              
 var $pc357054_post: Phase;                                                                         
 var $pc356994: Phase;                                                                              
 var mover356990: Mover;                                                                            
 var AtomicIncAndDec.n357054: [AtomicIncAndDec]int;                                                 
 var tmpTid: Tid;                                                                                   
 var mover357032: Mover;                                                                            
 var tmp3357032: int;                                                                               
 var AtomicIncAndDec.n_nextValue356990: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec.n_nextValue357057: [AtomicIncAndDec]int;                                       
 var tmp1356864: bool;                                                                              
 var tmp2356987: bool;                                                                              
 var $pc356917_post: Phase;                                                                         
 var AtomicIncAndDec._state356913: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec._state357054: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec._state356917: [AtomicIncAndDec]State;                                          
 var x356913: int;                                                                                  
 var AtomicIncAndDec._state356864: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec._lock356908: [AtomicIncAndDec]Tid;                                             
 var tid357057: Tid;                                                                                
 var tmp3: int;                                                                                     
 var x356908: int;                                                                                  
 var mover356987: Mover;                                                                            
 var ctmp339987: bool;                                                                              
 var AtomicIncAndDec.n_nextThread356994: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec._state356908: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread357054_post: [AtomicIncAndDec]Tid;                                 
 var $pc357057: Phase;                                                                              
 var _C_v356913: int;                                                                               
 var this357057_bottom: AtomicIncAndDec;                                                            
 var tmpValue356994: int;                                                                           
 var tid357054: Tid;                                                                                
 var $pc356913: Phase;                                                                              
 var moverPath356987: MoverPath;                                                                    
 var AtomicIncAndDec._lock357057: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n_nextValue356913: [AtomicIncAndDec]int;                                       
 var this356858: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec.n_nextValue356994: [AtomicIncAndDec]int;                                       
 var _currentValue356908: int;                                                                      
 var AtomicIncAndDec._state357058: [AtomicIncAndDec]State;                                          
 var this357058: AtomicIncAndDec;                                                                   
 var $recorded.state357058: int;                                                                    
 var _C_v356908: int;                                                                               
 var tmp1356987: bool;                                                                              
 var AtomicIncAndDec.n357017: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec.n357032: [AtomicIncAndDec]int;                                                 
 var this357032: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec._state356987: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread356917: [AtomicIncAndDec]Tid;                                      
 var tid356994: Tid;                                                                                
 var AtomicIncAndDec.n357058: [AtomicIncAndDec]int;                                                 
 var _C_t356870: Tid;                                                                               
 var _currentValue357039: int;                                                                      
 var AtomicIncAndDec.n_nextValue356864: [AtomicIncAndDec]int;                                       
 var $pc356870: Phase;                                                                              
 var AtomicIncAndDec._lock356917: [AtomicIncAndDec]Tid;                                             
 var tid356908: Tid;                                                                                
 var tid356858: Tid;                                                                                
 var $recorded.state356987: int;                                                                    
 var $recorded.state357017: int;                                                                    
 var path356858: int;                                                                               
 var mover356858: Mover;                                                                            
 var $pc356858: Phase;                                                                              
 var AtomicIncAndDec.n_nextThread356864: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec.n357039: [AtomicIncAndDec]int;                                                 
 var moverPath357032: MoverPath;                                                                    
 var tmp2357039: bool;                                                                              
 var tid356913: Tid;                                                                                
 var AtomicIncAndDec.n_nextThread357057: [AtomicIncAndDec]Tid;                                      
 var tmp3357054: int;                                                                               
 var mover357017: Mover;                                                                            
 var $pc357017: Phase;                                                                              
 var $pc357054: Phase;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume AtomicIncAndDec._state357057 == AtomicIncAndDec._state && AtomicIncAndDec.n357057 == AtomicIncAndDec.n && AtomicIncAndDec._lock357057 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357057 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357057 == AtomicIncAndDec.n_nextValue && this357057 == this && tid357057 == tid;
 assume $recorded.state357057 == 1;                                                                 
                                                                                                    
 // 10.9: while (true)   {                                                                          
                                                                                                    
 phase357057 := $pc;                                                                                
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (7.5): Bad tid
  invariant isShared(AtomicIncAndDec._state[this]);                                                        // (7.5): this is not global
                                                                                                    
  invariant StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
  invariant (forall _this : AtomicIncAndDec :: Invariant.Y_AtomicIncAndDec.n(tid : Tid, _this, AtomicIncAndDec.n[_this] ,AtomicIncAndDec._state357057,AtomicIncAndDec.n357057,AtomicIncAndDec._lock357057,AtomicIncAndDec.n_nextThread357057,AtomicIncAndDec.n_nextValue357057));       // (10.9): Loop does not preserve yields_as annotation for field n
  invariant phase357057 == $pc;                                                                            // (10.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (10.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 10.16: boolean tmp1;                                                                           
                                                                                                    
                                                                                                    
  // 10.16: tmp1 = true;                                                                            
                                                                                                    
  tmp1 := true;                                                                                     
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 10.9: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 11.13: int x;                                                                                  
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 11.13: Tid _C_t;                                                                               
                                                                                                    
                                                                                                    
  // 11.13: _C_t := this.n_nextThread  as B;                                                        
                                                                                                    
                                                                                                    
  moverPath356858 := ReadEval.AtomicIncAndDec.n_nextThread(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
  mover356858 := m#moverPath(moverPath356858);                                                      
  path356858 := p#moverPath(moverPath356858);                                                       
  assume AtomicIncAndDec._state356858 == AtomicIncAndDec._state && AtomicIncAndDec.n356858 == AtomicIncAndDec.n && AtomicIncAndDec._lock356858 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356858 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356858 == AtomicIncAndDec.n_nextValue && _C_t356858 == _C_t && x356858 == x && tmp1356858 == tmp1 && this356858 == this && tid356858 == tid && $pc356858 == $pc;
  assume $recorded.state356858 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicIncAndDec.null;                                                             
  } else {                                                                                          
   assert this != AtomicIncAndDec.null;                                                                    // (11.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (11.13): Reduction failure
  _C_t := AtomicIncAndDec.n_nextThread[this];                                                       
                                                                                                    
  // 11.13: int _C_v;                                                                               
                                                                                                    
                                                                                                    
  // 11.13: _C_v := this.n_nextValue  as B;                                                         
                                                                                                    
                                                                                                    
  moverPath356864 := ReadEval.AtomicIncAndDec.n_nextValue(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
  mover356864 := m#moverPath(moverPath356864);                                                      
  path356864 := p#moverPath(moverPath356864);                                                       
  assume AtomicIncAndDec._state356864 == AtomicIncAndDec._state && AtomicIncAndDec.n356864 == AtomicIncAndDec.n && AtomicIncAndDec._lock356864 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356864 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356864 == AtomicIncAndDec.n_nextValue && _C_v356864 == _C_v && _C_t356864 == _C_t && x356864 == x && tmp1356864 == tmp1 && this356864 == this && tid356864 == tid && $pc356864 == $pc;
  assume $recorded.state356864 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicIncAndDec.null;                                                             
  } else {                                                                                          
   assert this != AtomicIncAndDec.null;                                                                    // (11.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (11.13): Reduction failure
  _C_v := AtomicIncAndDec.n_nextValue[this];                                                        
                                                                                                    
  // 11.13: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
  // 11.13: _currentValue := this.n  as B;                                                          
                                                                                                    
                                                                                                    
  moverPath356870 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
  mover356870 := m#moverPath(moverPath356870);                                                      
  path356870 := p#moverPath(moverPath356870);                                                       
  assume AtomicIncAndDec._state356870 == AtomicIncAndDec._state && AtomicIncAndDec.n356870 == AtomicIncAndDec.n && AtomicIncAndDec._lock356870 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356870 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356870 == AtomicIncAndDec.n_nextValue && _currentValue356870 == _currentValue && _C_v356870 == _C_v && _C_t356870 == _C_t && x356870 == x && tmp1356870 == tmp1 && this356870 == this && tid356870 == tid && $pc356870 == $pc;
  assume $recorded.state356870 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicIncAndDec.null;                                                             
  } else {                                                                                          
   assert this != AtomicIncAndDec.null;                                                                    // (11.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (11.13): Reduction failure
  _currentValue := AtomicIncAndDec.n[this];                                                         
                                                                                                    
  // 11.13: Mover _R_t;                                                                             
                                                                                                    
                                                                                                    
  // 11.13: _R_t = readPermission(this.n);                                                          
                                                                                                    
  _R_t := m#moverPath(ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue));
                                                                                                    
  // 11.13: boolean _casable;                                                                       
                                                                                                    
                                                                                                    
  // 11.13: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
                                                                                                    
  _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                          
  if (_casable) {                                                                                   
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 11.13: x := this.n  as R;                                                                     
                                                                                                    
                                                                                                    
   moverPath356908 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
   mover356908 := m#moverPath(moverPath356908);                                                     
   path356908 := p#moverPath(moverPath356908);                                                      
   assume AtomicIncAndDec._state356908 == AtomicIncAndDec._state && AtomicIncAndDec.n356908 == AtomicIncAndDec.n && AtomicIncAndDec._lock356908 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356908 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356908 == AtomicIncAndDec.n_nextValue && _casable356908 == _casable && _R_t356908 == _R_t && _currentValue356908 == _currentValue && _C_v356908 == _C_v && _C_t356908 == _C_t && x356908 == x && tmp1356908 == tmp1 && this356908 == this && tid356908 == tid && $pc356908 == $pc;
   assume $recorded.state356908 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != AtomicIncAndDec.null;                                                            
   } else {                                                                                         
    assert this != AtomicIncAndDec.null;                                                                   // (11.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _R);                                                                      
   assert $pc != PhaseError;                                                                               // (11.13): Reduction failure
   x := AtomicIncAndDec.n[this];                                                                    
  } else {                                                                                          
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 11.13: x := this.n;                                                                           
                                                                                                    
                                                                                                    
   moverPath356913 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
   mover356913 := m#moverPath(moverPath356913);                                                     
   path356913 := p#moverPath(moverPath356913);                                                      
   assume AtomicIncAndDec._state356913 == AtomicIncAndDec._state && AtomicIncAndDec.n356913 == AtomicIncAndDec.n && AtomicIncAndDec._lock356913 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356913 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356913 == AtomicIncAndDec.n_nextValue && _casable356913 == _casable && _R_t356913 == _R_t && _currentValue356913 == _currentValue && _C_v356913 == _C_v && _C_t356913 == _C_t && x356913 == x && tmp1356913 == tmp1 && this356913 == this && tid356913 == tid && $pc356913 == $pc;
   assume $recorded.state356913 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != AtomicIncAndDec.null;                                                            
   } else {                                                                                         
    assert this != AtomicIncAndDec.null;                                                                   // (11.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover356913);                                                             
   assert $pc != PhaseError;                                                                               // (11.13): Reduction failure
   x := AtomicIncAndDec.n[this];                                                                    
  }                                                                                                 
                                                                                                    
  // 12.13: yield;                                                                                  
                                                                                                    
  assume AtomicIncAndDec._state356917 == AtomicIncAndDec._state && AtomicIncAndDec.n356917 == AtomicIncAndDec.n && AtomicIncAndDec._lock356917 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356917 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356917 == AtomicIncAndDec.n_nextValue && x356917 == x && tmp1356917 == tmp1 && this356917 == this && tid356917 == tid;
  assume $recorded.state356917 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume AtomicIncAndDec._state356917_post == AtomicIncAndDec._state && AtomicIncAndDec.n356917_post == AtomicIncAndDec.n && AtomicIncAndDec._lock356917_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356917_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356917_post == AtomicIncAndDec.n_nextValue && x356917_post == x && tmp1356917_post == tmp1 && this356917_post == this && tid356917_post == tid;
  assume $recorded.state356917_post == 1;                                                           
                                                                                                    
  // 13.13: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 13.13: int tmp3;                                                                               
                                                                                                    
                                                                                                    
  // 13.13: tmp3 = x + 1;                                                                           
                                                                                                    
  tmp3 := (x+1);                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 13.13: boolean ctmp339987;                                                                     
                                                                                                    
                                                                                                    
  // 13.13: ctmp339987 = *;                                                                         
                                                                                                    
  havoc ctmp339987;                                                                                 
  if (ctmp339987) {                                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 13.13: tmp2 = false;                                                                          
                                                                                                    
   tmp2 := false;                                                                                   
  } else {                                                                                          
                                                                                                    
   // 13.13: ctmp339987 = *;                                                                        
                                                                                                    
   havoc ctmp339987;                                                                                
   if (ctmp339987) {                                                                                
                                                                                                    
    // 13.13: Tid tmpTid;                                                                           
                                                                                                    
                                                                                                    
    // 13.13: int tmpValue;                                                                         
                                                                                                    
                                                                                                    
    // 13.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 13.13: _m = writePermission(this.n, tmp3);                                                   
                                                                                                    
    _m := m#moverPath(WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp3: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue));
                                                                                                    
    // 13.13: assume this.n == x;                                                                   
                                                                                                    
    assume (AtomicIncAndDec.n[this]==x);                                                            
                                                                                                    
    // 13.13: assume !goesWrong(_m);                                                                
                                                                                                    
    assume !(transition($pc, _m) == PhaseError);                                                    
                                                                                                    
    // 13.13: assume this.n_nextThread == tid;                                                      
                                                                                                    
    assume (AtomicIncAndDec.n_nextThread[this]==tid);                                               
                                                                                                    
    // 13.13: assume this.n_nextValue == x;                                                         
                                                                                                    
    assume (AtomicIncAndDec.n_nextValue[this]==x);                                                  
                                                                                                    
                                                                                                    
    // 13.13: this.n_nextThread := tmpTid as B;                                                     
                                                                                                    
                                                                                                    
    moverPath356987 := WriteEval.AtomicIncAndDec.n_nextThread(tid: Tid,this: AtomicIncAndDec,tmpTid: Tid,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover356987 := m#moverPath(moverPath356987);                                                    
    path356987 := p#moverPath(moverPath356987);                                                     
    assume AtomicIncAndDec._state356987 == AtomicIncAndDec._state && AtomicIncAndDec.n356987 == AtomicIncAndDec.n && AtomicIncAndDec._lock356987 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356987 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356987 == AtomicIncAndDec.n_nextValue && _m356987 == _m && tmpValue356987 == tmpValue && tmpTid356987 == tmpTid && ctmp339987356987 == ctmp339987 && tmp3356987 == tmp3 && tmp2356987 == tmp2 && x356987 == x && tmp1356987 == tmp1 && this356987 == this && tid356987 == tid && $pc356987 == $pc;
    assume $recorded.state356987 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicIncAndDec.n_nextThread[this] := tmpTid;                                                   
                                                                                                    
                                                                                                    
    // 13.13: this.n_nextValue := tmpValue as B;                                                    
                                                                                                    
                                                                                                    
    moverPath356990 := WriteEval.AtomicIncAndDec.n_nextValue(tid: Tid,this: AtomicIncAndDec,tmpValue: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover356990 := m#moverPath(moverPath356990);                                                    
    path356990 := p#moverPath(moverPath356990);                                                     
    assume AtomicIncAndDec._state356990 == AtomicIncAndDec._state && AtomicIncAndDec.n356990 == AtomicIncAndDec.n && AtomicIncAndDec._lock356990 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356990 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356990 == AtomicIncAndDec.n_nextValue && _m356990 == _m && tmpValue356990 == tmpValue && tmpTid356990 == tmpTid && ctmp339987356990 == ctmp339987 && tmp3356990 == tmp3 && tmp2356990 == tmp2 && x356990 == x && tmp1356990 == tmp1 && this356990 == this && tid356990 == tid && $pc356990 == $pc;
    assume $recorded.state356990 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicIncAndDec.n_nextValue[this] := tmpValue;                                                  
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 13.13: this.n := tmp3;                                                                       
                                                                                                    
                                                                                                    
    moverPath356994 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp3: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover356994 := m#moverPath(moverPath356994);                                                    
    path356994 := p#moverPath(moverPath356994);                                                     
    assume AtomicIncAndDec._state356994 == AtomicIncAndDec._state && AtomicIncAndDec.n356994 == AtomicIncAndDec.n && AtomicIncAndDec._lock356994 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread356994 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue356994 == AtomicIncAndDec.n_nextValue && _m356994 == _m && tmpValue356994 == tmpValue && tmpTid356994 == tmpTid && ctmp339987356994 == ctmp339987 && tmp3356994 == tmp3 && tmp2356994 == tmp2 && x356994 == x && tmp1356994 == tmp1 && this356994 == this && tid356994 == tid && $pc356994 == $pc;
    assume $recorded.state356994 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover356994);                                                            
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicIncAndDec.n[this] := tmp3;                                                                
                                                                                                    
    // 13.13: tmp2 = true;                                                                          
                                                                                                    
    tmp2 := true;                                                                                   
   } else {                                                                                         
                                                                                                    
    // 13.13: assume this.n_nextThread == tid;                                                      
                                                                                                    
    assume (AtomicIncAndDec.n_nextThread[this]==tid);                                               
                                                                                                    
    // 13.13: assume this.n_nextValue == x;                                                         
                                                                                                    
    assume (AtomicIncAndDec.n_nextValue[this]==x);                                                  
                                                                                                    
    // 13.13: int _currentValue;                                                                    
                                                                                                    
                                                                                                    
    // 13.13: _currentValue := this.n  as B;                                                        
                                                                                                    
                                                                                                    
    moverPath357017 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357017 := m#moverPath(moverPath357017);                                                    
    path357017 := p#moverPath(moverPath357017);                                                     
    assume AtomicIncAndDec._state357017 == AtomicIncAndDec._state && AtomicIncAndDec.n357017 == AtomicIncAndDec.n && AtomicIncAndDec._lock357017 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357017 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357017 == AtomicIncAndDec.n_nextValue && _currentValue357017 == _currentValue && ctmp339987357017 == ctmp339987 && tmp3357017 == tmp3 && tmp2357017 == tmp2 && x357017 == x && tmp1357017 == tmp1 && this357017 == this && tid357017 == tid && $pc357017 == $pc;
    assume $recorded.state357017 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
                                                                                                    
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    _currentValue := AtomicIncAndDec.n[this];                                                       
                                                                                                    
                                                                                                    
    // 13.13: this.n := x as B;                                                                     
                                                                                                    
                                                                                                    
    moverPath357020 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,x: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357020 := m#moverPath(moverPath357020);                                                    
    path357020 := p#moverPath(moverPath357020);                                                     
    assume AtomicIncAndDec._state357020 == AtomicIncAndDec._state && AtomicIncAndDec.n357020 == AtomicIncAndDec.n && AtomicIncAndDec._lock357020 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357020 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357020 == AtomicIncAndDec.n_nextValue && _currentValue357020 == _currentValue && ctmp339987357020 == ctmp339987 && tmp3357020 == tmp3 && tmp2357020 == tmp2 && x357020 == x && tmp1357020 == tmp1 && this357020 == this && tid357020 == tid && $pc357020 == $pc;
    assume $recorded.state357020 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicIncAndDec.n[this] := x;                                                                   
                                                                                                    
    // 13.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 13.13: _m = writePermission(this.n, tmp3);                                                   
                                                                                                    
    _m := m#moverPath(WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp3: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue));
                                                                                                    
                                                                                                    
    // 13.13: this.n := _currentValue as B;                                                         
                                                                                                    
                                                                                                    
    moverPath357032 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,_currentValue: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357032 := m#moverPath(moverPath357032);                                                    
    path357032 := p#moverPath(moverPath357032);                                                     
    assume AtomicIncAndDec._state357032 == AtomicIncAndDec._state && AtomicIncAndDec.n357032 == AtomicIncAndDec.n && AtomicIncAndDec._lock357032 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357032 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357032 == AtomicIncAndDec.n_nextValue && _m357032 == _m && _currentValue357032 == _currentValue && ctmp339987357032 == ctmp339987 && tmp3357032 == tmp3 && tmp2357032 == tmp2 && x357032 == x && tmp1357032 == tmp1 && this357032 == this && tid357032 == tid && $pc357032 == $pc;
    assume $recorded.state357032 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicIncAndDec.n[this] := _currentValue;                                                       
                                                                                                    
    // 13.13: assume goesWrong(_m);                                                                 
                                                                                                    
    assume transition($pc, _m) == PhaseError;                                                       
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 13.13: this.n := tmp3;                                                                       
                                                                                                    
                                                                                                    
    moverPath357039 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp3: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357039 := m#moverPath(moverPath357039);                                                    
    path357039 := p#moverPath(moverPath357039);                                                     
    assume AtomicIncAndDec._state357039 == AtomicIncAndDec._state && AtomicIncAndDec.n357039 == AtomicIncAndDec.n && AtomicIncAndDec._lock357039 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357039 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357039 == AtomicIncAndDec.n_nextValue && _m357039 == _m && _currentValue357039 == _currentValue && ctmp339987357039 == ctmp339987 && tmp3357039 == tmp3 && tmp2357039 == tmp2 && x357039 == x && tmp1357039 == tmp1 && this357039 == this && tid357039 == tid && $pc357039 == $pc;
    assume $recorded.state357039 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover357039);                                                            
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicIncAndDec.n[this] := tmp3;                                                                
                                                                                                    
    // 13.13: tmp2 = false;                                                                         
                                                                                                    
    tmp2 := false;                                                                                  
   }                                                                                                
  }                                                                                                 
  if (tmp2) {                                                                                       
                                                                                                    
   // 14.17: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 16.13: yield;                                                                                  
                                                                                                    
  assume AtomicIncAndDec._state357054 == AtomicIncAndDec._state && AtomicIncAndDec.n357054 == AtomicIncAndDec.n && AtomicIncAndDec._lock357054 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357054 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357054 == AtomicIncAndDec.n_nextValue && tmp3357054 == tmp3 && tmp2357054 == tmp2 && x357054 == x && tmp1357054 == tmp1 && this357054 == this && tid357054 == tid;
  assume $recorded.state357054 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume AtomicIncAndDec._state357054_post == AtomicIncAndDec._state && AtomicIncAndDec.n357054_post == AtomicIncAndDec.n && AtomicIncAndDec._lock357054_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357054_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357054_post == AtomicIncAndDec.n_nextValue && tmp3357054_post == tmp3 && tmp2357054_post == tmp2 && x357054_post == x && tmp1357054_post == tmp1 && this357054_post == this && tid357054_post == tid;
  assume $recorded.state357054_post == 1;                                                           
  assume AtomicIncAndDec._state357057_bottom == AtomicIncAndDec._state && AtomicIncAndDec.n357057_bottom == AtomicIncAndDec.n && AtomicIncAndDec._lock357057_bottom == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357057_bottom == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357057_bottom == AtomicIncAndDec.n_nextValue && this357057_bottom == this && tid357057_bottom == tid;
  assume $recorded.state357057_bottom == 1;                                                         
  assert phase357057 == $pc;                                                                               // (10.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 9.23: // return;                                                                                
                                                                                                    
 assume AtomicIncAndDec._state357058 == AtomicIncAndDec._state && AtomicIncAndDec.n357058 == AtomicIncAndDec.n && AtomicIncAndDec._lock357058 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357058 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357058 == AtomicIncAndDec.n_nextValue && this357058 == this && tid357058 == tid;
 assume $recorded.state357058 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  AtomicIncAndDec.dec(tid:Tid, this : AtomicIncAndDec)                                     
modifies AtomicIncAndDec._state;                                                                    
modifies AtomicIncAndDec.n;                                                                         
modifies AtomicIncAndDec._lock;                                                                     
modifies AtomicIncAndDec.n_nextThread;                                                              
modifies AtomicIncAndDec.n_nextValue;                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (20.5): Bad tid
requires isShared(AtomicIncAndDec._state[this]);                                                           // (20.5): this is not global
                                                                                                    
requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
                                                                                                    
ensures StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
{                                                                                                   
 var this357241: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec.n_nextValue357132: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._state357282: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread357218: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec._state357263: [AtomicIncAndDec]State;                                          
 var tid357214: Tid;                                                                                
 var this357244: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec._state357211: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n357094: [AtomicIncAndDec]int;                                                 
 var _currentValue: int;                                                                            
 var ctmp340051357244: bool;                                                                        
 var moverPath357263: MoverPath;                                                                    
 var $pc357141_post: Phase;                                                                         
 var x357141: int;                                                                                  
 var AtomicIncAndDec.n357211: [AtomicIncAndDec]int;                                                 
 var tmpTid357211: Tid;                                                                             
 var $recorded.state357141_post: int;                                                               
 var AtomicIncAndDec.n_nextThread357256: [AtomicIncAndDec]Tid;                                      
 var x357094: int;                                                                                  
 var AtomicIncAndDec._lock357244: [AtomicIncAndDec]Tid;                                             
 var path357241: int;                                                                               
 var tmp4357082: bool;                                                                              
 var AtomicIncAndDec.n_nextValue357256: [AtomicIncAndDec]int;                                       
 var _C_t: Tid;                                                                                     
 var tmp4357141: bool;                                                                              
 var this357278: AtomicIncAndDec;                                                                   
 var moverPath357088: MoverPath;                                                                    
 var AtomicIncAndDec._state357281: [AtomicIncAndDec]State;                                          
 var tmp4357263: bool;                                                                              
 var AtomicIncAndDec.n_nextValue357244: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._lock357263: [AtomicIncAndDec]Tid;                                             
 var moverPath357241: MoverPath;                                                                    
 var AtomicIncAndDec._state357278_post: [AtomicIncAndDec]State;                                     
 var _currentValue357132: int;                                                                      
 var x357137: int;                                                                                  
 var AtomicIncAndDec._lock357281_bottom: [AtomicIncAndDec]Tid;                                      
 var _R_t357137: Mover;                                                                             
 var AtomicIncAndDec._lock357278: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n_nextValue357141_post: [AtomicIncAndDec]int;                                  
 var tmp4357244: bool;                                                                              
 var AtomicIncAndDec._lock357137: [AtomicIncAndDec]Tid;                                             
 var x357088: int;                                                                                  
 var tmp4357088: bool;                                                                              
 var path357244: int;                                                                               
 var $recorded.state357094: int;                                                                    
 var mover357263: Mover;                                                                            
 var AtomicIncAndDec.n_nextValue357278_post: [AtomicIncAndDec]int;                                  
 var tmp5: bool;                                                                                    
 var _casable: bool;                                                                                
 var AtomicIncAndDec.n_nextValue357088: [AtomicIncAndDec]int;                                       
 var this357282: AtomicIncAndDec;                                                                   
 var tmp6357278_post: int;                                                                          
 var AtomicIncAndDec.n357278: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec._state357241: [AtomicIncAndDec]State;                                          
 var x: int;                                                                                        
 var tmp5357244: bool;                                                                              
 var $recorded.state357241: int;                                                                    
 var tmp5357214: bool;                                                                              
 var tid357141_post: Tid;                                                                           
 var x357256: int;                                                                                  
 var $recorded.state357132: int;                                                                    
 var $recorded.state357211: int;                                                                    
 var tmp4357278_post: bool;                                                                         
 var AtomicIncAndDec.n_nextValue357281_bottom: [AtomicIncAndDec]int;                                
 var tmp5357241: bool;                                                                              
 var AtomicIncAndDec.n_nextThread357088: [AtomicIncAndDec]Tid;                                      
 var x357211: int;                                                                                  
 var $pc357082: Phase;                                                                              
 var tmp4357094: bool;                                                                              
 var $pc357218: Phase;                                                                              
 var $pc357278_post: Phase;                                                                         
 var AtomicIncAndDec.n_nextValue357281: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._state357244: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread357082: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec.n357141_post: [AtomicIncAndDec]int;                                            
 var AtomicIncAndDec._lock357282: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n357214: [AtomicIncAndDec]int;                                                 
 var $recorded.state357244: int;                                                                    
 var tmpValue: int;                                                                                 
 var AtomicIncAndDec._lock357141_post: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n_nextValue357263: [AtomicIncAndDec]int;                                       
 var tmp6357263: int;                                                                               
 var tid357132: Tid;                                                                                
 var mover357218: Mover;                                                                            
 var this357094: AtomicIncAndDec;                                                                   
 var tmp6357214: int;                                                                               
 var AtomicIncAndDec.n_nextThread357281: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec.n_nextThread357214: [AtomicIncAndDec]Tid;                                      
 var _casable357132: bool;                                                                          
 var x357244: int;                                                                                  
 var AtomicIncAndDec._lock357256: [AtomicIncAndDec]Tid;                                             
 var $pc357137: Phase;                                                                              
 var tid357094: Tid;                                                                                
 var this357137: AtomicIncAndDec;                                                                   
 var _currentValue357137: int;                                                                      
 var mover357137: Mover;                                                                            
 var ctmp340051357256: bool;                                                                        
 var _C_v357094: int;                                                                               
 var $pc357141: Phase;                                                                              
 var AtomicIncAndDec._lock357281: [AtomicIncAndDec]Tid;                                             
 var this357256: AtomicIncAndDec;                                                                   
 var this357263: AtomicIncAndDec;                                                                   
 var moverPath357218: MoverPath;                                                                    
 var x357278_post: int;                                                                             
 var tid357244: Tid;                                                                                
 var x357218: int;                                                                                  
 var $pc357211: Phase;                                                                              
 var _C_v: int;                                                                                     
 var tmp4357214: bool;                                                                              
 var tmp5357263: bool;                                                                              
 var $pc357281_bottom: Phase;                                                                       
 var mover357244: Mover;                                                                            
 var $recorded.state357281: int;                                                                    
 var $pc357244: Phase;                                                                              
 var mover357211: Mover;                                                                            
 var moverPath357082: MoverPath;                                                                    
 var tmp5357278_post: bool;                                                                         
 var AtomicIncAndDec.n_nextValue357211: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._lock357214: [AtomicIncAndDec]Tid;                                             
 var _currentValue357256: int;                                                                      
 var this357218: AtomicIncAndDec;                                                                   
 var tmp6357256: int;                                                                               
 var AtomicIncAndDec.n357282: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec._lock357094: [AtomicIncAndDec]Tid;                                             
 var this357281_bottom: AtomicIncAndDec;                                                            
 var $pc357241: Phase;                                                                              
 var $pc357256: Phase;                                                                              
 var AtomicIncAndDec.n_nextValue357141: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec.n357241: [AtomicIncAndDec]int;                                                 
 var $recorded.state357141: int;                                                                    
 var moverPath357132: MoverPath;                                                                    
 var $pc357214: Phase;                                                                              
 var tmp5357278: bool;                                                                              
 var moverPath357137: MoverPath;                                                                    
 var tmpTid357214: Tid;                                                                             
 var _C_v357088: int;                                                                               
 var mover357214: Mover;                                                                            
 var $pc357088: Phase;                                                                              
 var _C_v357132: int;                                                                               
 var tmp5357256: bool;                                                                              
 var path357137: int;                                                                               
 var AtomicIncAndDec.n357137: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec.n_nextThread357132: [AtomicIncAndDec]Tid;                                      
 var ctmp340051357263: bool;                                                                        
 var tid357141: Tid;                                                                                
 var AtomicIncAndDec.n357141: [AtomicIncAndDec]int;                                                 
 var AtomicIncAndDec._state357141: [AtomicIncAndDec]State;                                          
 var tmp4357132: bool;                                                                              
 var AtomicIncAndDec.n_nextValue357241: [AtomicIncAndDec]int;                                       
 var AtomicIncAndDec._state357214: [AtomicIncAndDec]State;                                          
 var _currentValue357263: int;                                                                      
 var AtomicIncAndDec.n_nextThread357278: [AtomicIncAndDec]Tid;                                      
 var this357214: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec.n_nextValue357137: [AtomicIncAndDec]int;                                       
 var tmp4357211: bool;                                                                              
 var tid357278_post: Tid;                                                                           
 var AtomicIncAndDec.n357278_post: [AtomicIncAndDec]int;                                            
 var this357088: AtomicIncAndDec;                                                                   
 var tid357137: Tid;                                                                                
 var moverPath357256: MoverPath;                                                                    
 var AtomicIncAndDec.n_nextThread357211: [AtomicIncAndDec]Tid;                                      
 var ctmp340051: bool;                                                                              
 var AtomicIncAndDec.n_nextValue357282: [AtomicIncAndDec]int;                                       
 var tid357241: Tid;                                                                                
 var AtomicIncAndDec._state357281_bottom: [AtomicIncAndDec]State;                                   
 var AtomicIncAndDec._state357094: [AtomicIncAndDec]State;                                          
 var $recorded.state357137: int;                                                                    
 var $pc357282: Phase;                                                                              
 var tmp6357244: int;                                                                               
 var _m357211: Mover;                                                                               
 var $recorded.state357278: int;                                                                    
 var AtomicIncAndDec._state357082: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread357141: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec._lock357132: [AtomicIncAndDec]Tid;                                             
 var x357278: int;                                                                                  
 var this357132: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec._lock357088: [AtomicIncAndDec]Tid;                                             
 var $recorded.state357218: int;                                                                    
 var $recorded.state357088: int;                                                                    
 var AtomicIncAndDec._lock357218: [AtomicIncAndDec]Tid;                                             
 var _currentValue357244: int;                                                                      
 var tmpValue357218: int;                                                                           
 var ctmp340051357211: bool;                                                                        
 var this357278_post: AtomicIncAndDec;                                                              
 var tid357278: Tid;                                                                                
 var AtomicIncAndDec._lock357141: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec._state357141_post: [AtomicIncAndDec]State;                                     
 var AtomicIncAndDec.n357088: [AtomicIncAndDec]int;                                                 
 var ctmp340051357218: bool;                                                                        
 var path357211: int;                                                                               
 var $recorded.state357214: int;                                                                    
 var AtomicIncAndDec._state357218: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n_nextThread357282: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec.n357256: [AtomicIncAndDec]int;                                                 
 var $pc357278: Phase;                                                                              
 var tid357256: Tid;                                                                                
 var _R_t357132: Mover;                                                                             
 var tmp6357241: int;                                                                               
 var this357141: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec._lock357278_post: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n357132: [AtomicIncAndDec]int;                                                 
 var path357088: int;                                                                               
 var _R_t: Mover;                                                                                   
 var tid357088: Tid;                                                                                
 var AtomicIncAndDec.n_nextValue357094: [AtomicIncAndDec]int;                                       
 var mover357082: Mover;                                                                            
 var path357218: int;                                                                               
 var AtomicIncAndDec.n357244: [AtomicIncAndDec]int;                                                 
 var $pc357281: Phase;                                                                              
 var x357263: int;                                                                                  
 var AtomicIncAndDec._lock357211: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec._state357137: [AtomicIncAndDec]State;                                          
 var _m: Mover;                                                                                     
 var $pc357263: Phase;                                                                              
 var _m357218: Mover;                                                                               
 var AtomicIncAndDec.n_nextValue357218: [AtomicIncAndDec]int;                                       
 var tmp4357278: bool;                                                                              
 var moverPath357094: MoverPath;                                                                    
 var _C_v357137: int;                                                                               
 var $recorded.state357263: int;                                                                    
 var AtomicIncAndDec._state357278: [AtomicIncAndDec]State;                                          
 var AtomicIncAndDec.n357218: [AtomicIncAndDec]int;                                                 
 var _casable357137: bool;                                                                          
 var AtomicIncAndDec.n357082: [AtomicIncAndDec]int;                                                 
 var ctmp340051357241: bool;                                                                        
 var tid357282: Tid;                                                                                
 var AtomicIncAndDec.n_nextValue357214: [AtomicIncAndDec]int;                                       
 var x357214: int;                                                                                  
 var $pc357094: Phase;                                                                              
 var tmp4357241: bool;                                                                              
 var mover357241: Mover;                                                                            
 var _currentValue357241: int;                                                                      
 var x357132: int;                                                                                  
 var _m357263: Mover;                                                                               
 var tmp6357211: int;                                                                               
 var phase357281: Phase;                                                                            
 var moverPath357214: MoverPath;                                                                    
 var mover357088: Mover;                                                                            
 var path357263: int;                                                                               
 var tmp4357137: bool;                                                                              
 var _C_t357137: Tid;                                                                               
 var AtomicIncAndDec.n_nextThread357241: [AtomicIncAndDec]Tid;                                      
 var AtomicIncAndDec._state357132: [AtomicIncAndDec]State;                                          
 var x357082: int;                                                                                  
 var tmp4357256: bool;                                                                              
 var this357141_post: AtomicIncAndDec;                                                              
 var tid357281: Tid;                                                                                
 var AtomicIncAndDec.n_nextThread357137: [AtomicIncAndDec]Tid;                                      
 var tmp4357141_post: bool;                                                                         
 var AtomicIncAndDec._state357088: [AtomicIncAndDec]State;                                          
 var x357241: int;                                                                                  
 var this357211: AtomicIncAndDec;                                                                   
 var tmpValue357211: int;                                                                           
 var path357214: int;                                                                               
 var _currentValue357094: int;                                                                      
 var $recorded.state357082: int;                                                                    
 var AtomicIncAndDec.n_nextValue357278: [AtomicIncAndDec]int;                                       
 var tmpTid: Tid;                                                                                   
 var this357281: AtomicIncAndDec;                                                                   
 var x357141_post: int;                                                                             
 var tmp4: bool;                                                                                    
 var tid357218: Tid;                                                                                
 var AtomicIncAndDec.n357281: [AtomicIncAndDec]int;                                                 
 var tmpValue357214: int;                                                                           
 var tmp5357211: bool;                                                                              
 var AtomicIncAndDec.n_nextThread357278_post: [AtomicIncAndDec]Tid;                                 
 var mover357256: Mover;                                                                            
 var moverPath357211: MoverPath;                                                                    
 var tmp6357218: int;                                                                               
 var AtomicIncAndDec.n_nextThread357141_post: [AtomicIncAndDec]Tid;                                 
 var AtomicIncAndDec._lock357241: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n_nextThread357094: [AtomicIncAndDec]Tid;                                      
 var this357082: AtomicIncAndDec;                                                                   
 var AtomicIncAndDec.n_nextThread357244: [AtomicIncAndDec]Tid;                                      
 var ctmp340051357214: bool;                                                                        
 var _C_t357088: Tid;                                                                               
 var tid357082: Tid;                                                                                
 var AtomicIncAndDec._lock357082: [AtomicIncAndDec]Tid;                                             
 var AtomicIncAndDec.n357263: [AtomicIncAndDec]int;                                                 
 var tid357263: Tid;                                                                                
 var AtomicIncAndDec.n_nextThread357281_bottom: [AtomicIncAndDec]Tid;                               
 var $recorded.state357281_bottom: int;                                                             
 var tid357211: Tid;                                                                                
 var tmpTid357218: Tid;                                                                             
 var path357082: int;                                                                               
 var _m357256: Mover;                                                                               
 var AtomicIncAndDec.n_nextValue357082: [AtomicIncAndDec]int;                                       
 var $recorded.state357278_post: int;                                                               
 var path357132: int;                                                                               
 var path357094: int;                                                                               
 var _m357214: Mover;                                                                               
 var _C_t357094: Tid;                                                                               
 var _C_t357132: Tid;                                                                               
 var _C_t357082: Tid;                                                                               
 var tid357281_bottom: Tid;                                                                         
 var path357256: int;                                                                               
 var mover357094: Mover;                                                                            
 var AtomicIncAndDec._state357256: [AtomicIncAndDec]State;                                          
 var tmp5357218: bool;                                                                              
 var mover357132: Mover;                                                                            
 var $pc357132: Phase;                                                                              
 var AtomicIncAndDec.n357281_bottom: [AtomicIncAndDec]int;                                          
 var tmp6: int;                                                                                     
 var $recorded.state357256: int;                                                                    
 var tmp4357218: bool;                                                                              
 var tmp6357278: int;                                                                               
 var AtomicIncAndDec.n_nextThread357263: [AtomicIncAndDec]Tid;                                      
 var moverPath357244: MoverPath;                                                                    
 var $recorded.state357282: int;                                                                    
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume AtomicIncAndDec._state357281 == AtomicIncAndDec._state && AtomicIncAndDec.n357281 == AtomicIncAndDec.n && AtomicIncAndDec._lock357281 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357281 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357281 == AtomicIncAndDec.n_nextValue && this357281 == this && tid357281 == tid;
 assume $recorded.state357281 == 1;                                                                 
                                                                                                    
 // 23.9: while (true)   {                                                                          
                                                                                                    
 phase357281 := $pc;                                                                                
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (20.5): Bad tid
  invariant isShared(AtomicIncAndDec._state[this]);                                                        // (20.5): this is not global
                                                                                                    
  invariant StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
  invariant (forall _this : AtomicIncAndDec :: Invariant.Y_AtomicIncAndDec.n(tid : Tid, _this, AtomicIncAndDec.n[_this] ,AtomicIncAndDec._state357281,AtomicIncAndDec.n357281,AtomicIncAndDec._lock357281,AtomicIncAndDec.n_nextThread357281,AtomicIncAndDec.n_nextValue357281));       // (23.9): Loop does not preserve yields_as annotation for field n
  invariant phase357281 == $pc;                                                                            // (23.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (23.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 23.16: boolean tmp4;                                                                           
                                                                                                    
                                                                                                    
  // 23.16: tmp4 = true;                                                                            
                                                                                                    
  tmp4 := true;                                                                                     
  if (!(tmp4)) {                                                                                    
                                                                                                    
   // 23.9: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 24.13: int x;                                                                                  
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 24.13: Tid _C_t;                                                                               
                                                                                                    
                                                                                                    
  // 24.13: _C_t := this.n_nextThread  as B;                                                        
                                                                                                    
                                                                                                    
  moverPath357082 := ReadEval.AtomicIncAndDec.n_nextThread(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
  mover357082 := m#moverPath(moverPath357082);                                                      
  path357082 := p#moverPath(moverPath357082);                                                       
  assume AtomicIncAndDec._state357082 == AtomicIncAndDec._state && AtomicIncAndDec.n357082 == AtomicIncAndDec.n && AtomicIncAndDec._lock357082 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357082 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357082 == AtomicIncAndDec.n_nextValue && _C_t357082 == _C_t && x357082 == x && tmp4357082 == tmp4 && this357082 == this && tid357082 == tid && $pc357082 == $pc;
  assume $recorded.state357082 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicIncAndDec.null;                                                             
  } else {                                                                                          
   assert this != AtomicIncAndDec.null;                                                                    // (24.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (24.13): Reduction failure
  _C_t := AtomicIncAndDec.n_nextThread[this];                                                       
                                                                                                    
  // 24.13: int _C_v;                                                                               
                                                                                                    
                                                                                                    
  // 24.13: _C_v := this.n_nextValue  as B;                                                         
                                                                                                    
                                                                                                    
  moverPath357088 := ReadEval.AtomicIncAndDec.n_nextValue(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
  mover357088 := m#moverPath(moverPath357088);                                                      
  path357088 := p#moverPath(moverPath357088);                                                       
  assume AtomicIncAndDec._state357088 == AtomicIncAndDec._state && AtomicIncAndDec.n357088 == AtomicIncAndDec.n && AtomicIncAndDec._lock357088 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357088 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357088 == AtomicIncAndDec.n_nextValue && _C_v357088 == _C_v && _C_t357088 == _C_t && x357088 == x && tmp4357088 == tmp4 && this357088 == this && tid357088 == tid && $pc357088 == $pc;
  assume $recorded.state357088 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicIncAndDec.null;                                                             
  } else {                                                                                          
   assert this != AtomicIncAndDec.null;                                                                    // (24.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (24.13): Reduction failure
  _C_v := AtomicIncAndDec.n_nextValue[this];                                                        
                                                                                                    
  // 24.13: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
  // 24.13: _currentValue := this.n  as B;                                                          
                                                                                                    
                                                                                                    
  moverPath357094 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
  mover357094 := m#moverPath(moverPath357094);                                                      
  path357094 := p#moverPath(moverPath357094);                                                       
  assume AtomicIncAndDec._state357094 == AtomicIncAndDec._state && AtomicIncAndDec.n357094 == AtomicIncAndDec.n && AtomicIncAndDec._lock357094 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357094 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357094 == AtomicIncAndDec.n_nextValue && _currentValue357094 == _currentValue && _C_v357094 == _C_v && _C_t357094 == _C_t && x357094 == x && tmp4357094 == tmp4 && this357094 == this && tid357094 == tid && $pc357094 == $pc;
  assume $recorded.state357094 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicIncAndDec.null;                                                             
  } else {                                                                                          
   assert this != AtomicIncAndDec.null;                                                                    // (24.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (24.13): Reduction failure
  _currentValue := AtomicIncAndDec.n[this];                                                         
                                                                                                    
  // 24.13: Mover _R_t;                                                                             
                                                                                                    
                                                                                                    
  // 24.13: _R_t = readPermission(this.n);                                                          
                                                                                                    
  _R_t := m#moverPath(ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue));
                                                                                                    
  // 24.13: boolean _casable;                                                                       
                                                                                                    
                                                                                                    
  // 24.13: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
                                                                                                    
  _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                          
  if (_casable) {                                                                                   
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 24.13: x := this.n  as R;                                                                     
                                                                                                    
                                                                                                    
   moverPath357132 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
   mover357132 := m#moverPath(moverPath357132);                                                     
   path357132 := p#moverPath(moverPath357132);                                                      
   assume AtomicIncAndDec._state357132 == AtomicIncAndDec._state && AtomicIncAndDec.n357132 == AtomicIncAndDec.n && AtomicIncAndDec._lock357132 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357132 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357132 == AtomicIncAndDec.n_nextValue && _casable357132 == _casable && _R_t357132 == _R_t && _currentValue357132 == _currentValue && _C_v357132 == _C_v && _C_t357132 == _C_t && x357132 == x && tmp4357132 == tmp4 && this357132 == this && tid357132 == tid && $pc357132 == $pc;
   assume $recorded.state357132 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != AtomicIncAndDec.null;                                                            
   } else {                                                                                         
    assert this != AtomicIncAndDec.null;                                                                   // (24.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _R);                                                                      
   assert $pc != PhaseError;                                                                               // (24.13): Reduction failure
   x := AtomicIncAndDec.n[this];                                                                    
  } else {                                                                                          
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 24.13: x := this.n;                                                                           
                                                                                                    
                                                                                                    
   moverPath357137 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
   mover357137 := m#moverPath(moverPath357137);                                                     
   path357137 := p#moverPath(moverPath357137);                                                      
   assume AtomicIncAndDec._state357137 == AtomicIncAndDec._state && AtomicIncAndDec.n357137 == AtomicIncAndDec.n && AtomicIncAndDec._lock357137 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357137 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357137 == AtomicIncAndDec.n_nextValue && _casable357137 == _casable && _R_t357137 == _R_t && _currentValue357137 == _currentValue && _C_v357137 == _C_v && _C_t357137 == _C_t && x357137 == x && tmp4357137 == tmp4 && this357137 == this && tid357137 == tid && $pc357137 == $pc;
   assume $recorded.state357137 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != AtomicIncAndDec.null;                                                            
   } else {                                                                                         
    assert this != AtomicIncAndDec.null;                                                                   // (24.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover357137);                                                             
   assert $pc != PhaseError;                                                                               // (24.13): Reduction failure
   x := AtomicIncAndDec.n[this];                                                                    
  }                                                                                                 
                                                                                                    
  // 25.13: yield;                                                                                  
                                                                                                    
  assume AtomicIncAndDec._state357141 == AtomicIncAndDec._state && AtomicIncAndDec.n357141 == AtomicIncAndDec.n && AtomicIncAndDec._lock357141 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357141 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357141 == AtomicIncAndDec.n_nextValue && x357141 == x && tmp4357141 == tmp4 && this357141 == this && tid357141 == tid;
  assume $recorded.state357141 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume AtomicIncAndDec._state357141_post == AtomicIncAndDec._state && AtomicIncAndDec.n357141_post == AtomicIncAndDec.n && AtomicIncAndDec._lock357141_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357141_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357141_post == AtomicIncAndDec.n_nextValue && x357141_post == x && tmp4357141_post == tmp4 && this357141_post == this && tid357141_post == tid;
  assume $recorded.state357141_post == 1;                                                           
                                                                                                    
  // 26.13: boolean tmp5;                                                                           
                                                                                                    
                                                                                                    
  // 26.13: int tmp6;                                                                               
                                                                                                    
                                                                                                    
  // 26.13: tmp6 = x - 1;                                                                           
                                                                                                    
  tmp6 := (x-1);                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 26.13: boolean ctmp340051;                                                                     
                                                                                                    
                                                                                                    
  // 26.13: ctmp340051 = *;                                                                         
                                                                                                    
  havoc ctmp340051;                                                                                 
  if (ctmp340051) {                                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 26.13: tmp5 = false;                                                                          
                                                                                                    
   tmp5 := false;                                                                                   
  } else {                                                                                          
                                                                                                    
   // 26.13: ctmp340051 = *;                                                                        
                                                                                                    
   havoc ctmp340051;                                                                                
   if (ctmp340051) {                                                                                
                                                                                                    
    // 26.13: Tid tmpTid;                                                                           
                                                                                                    
                                                                                                    
    // 26.13: int tmpValue;                                                                         
                                                                                                    
                                                                                                    
    // 26.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 26.13: _m = writePermission(this.n, tmp6);                                                   
                                                                                                    
    _m := m#moverPath(WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp6: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue));
                                                                                                    
    // 26.13: assume this.n == x;                                                                   
                                                                                                    
    assume (AtomicIncAndDec.n[this]==x);                                                            
                                                                                                    
    // 26.13: assume !goesWrong(_m);                                                                
                                                                                                    
    assume !(transition($pc, _m) == PhaseError);                                                    
                                                                                                    
    // 26.13: assume this.n_nextThread == tid;                                                      
                                                                                                    
    assume (AtomicIncAndDec.n_nextThread[this]==tid);                                               
                                                                                                    
    // 26.13: assume this.n_nextValue == x;                                                         
                                                                                                    
    assume (AtomicIncAndDec.n_nextValue[this]==x);                                                  
                                                                                                    
                                                                                                    
    // 26.13: this.n_nextThread := tmpTid as B;                                                     
                                                                                                    
                                                                                                    
    moverPath357211 := WriteEval.AtomicIncAndDec.n_nextThread(tid: Tid,this: AtomicIncAndDec,tmpTid: Tid,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357211 := m#moverPath(moverPath357211);                                                    
    path357211 := p#moverPath(moverPath357211);                                                     
    assume AtomicIncAndDec._state357211 == AtomicIncAndDec._state && AtomicIncAndDec.n357211 == AtomicIncAndDec.n && AtomicIncAndDec._lock357211 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357211 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357211 == AtomicIncAndDec.n_nextValue && _m357211 == _m && tmpValue357211 == tmpValue && tmpTid357211 == tmpTid && ctmp340051357211 == ctmp340051 && tmp6357211 == tmp6 && tmp5357211 == tmp5 && x357211 == x && tmp4357211 == tmp4 && this357211 == this && tid357211 == tid && $pc357211 == $pc;
    assume $recorded.state357211 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    AtomicIncAndDec.n_nextThread[this] := tmpTid;                                                   
                                                                                                    
                                                                                                    
    // 26.13: this.n_nextValue := tmpValue as B;                                                    
                                                                                                    
                                                                                                    
    moverPath357214 := WriteEval.AtomicIncAndDec.n_nextValue(tid: Tid,this: AtomicIncAndDec,tmpValue: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357214 := m#moverPath(moverPath357214);                                                    
    path357214 := p#moverPath(moverPath357214);                                                     
    assume AtomicIncAndDec._state357214 == AtomicIncAndDec._state && AtomicIncAndDec.n357214 == AtomicIncAndDec.n && AtomicIncAndDec._lock357214 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357214 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357214 == AtomicIncAndDec.n_nextValue && _m357214 == _m && tmpValue357214 == tmpValue && tmpTid357214 == tmpTid && ctmp340051357214 == ctmp340051 && tmp6357214 == tmp6 && tmp5357214 == tmp5 && x357214 == x && tmp4357214 == tmp4 && this357214 == this && tid357214 == tid && $pc357214 == $pc;
    assume $recorded.state357214 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    AtomicIncAndDec.n_nextValue[this] := tmpValue;                                                  
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 26.13: this.n := tmp6;                                                                       
                                                                                                    
                                                                                                    
    moverPath357218 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp6: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357218 := m#moverPath(moverPath357218);                                                    
    path357218 := p#moverPath(moverPath357218);                                                     
    assume AtomicIncAndDec._state357218 == AtomicIncAndDec._state && AtomicIncAndDec.n357218 == AtomicIncAndDec.n && AtomicIncAndDec._lock357218 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357218 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357218 == AtomicIncAndDec.n_nextValue && _m357218 == _m && tmpValue357218 == tmpValue && tmpTid357218 == tmpTid && ctmp340051357218 == ctmp340051 && tmp6357218 == tmp6 && tmp5357218 == tmp5 && x357218 == x && tmp4357218 == tmp4 && this357218 == this && tid357218 == tid && $pc357218 == $pc;
    assume $recorded.state357218 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover357218);                                                            
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    AtomicIncAndDec.n[this] := tmp6;                                                                
                                                                                                    
    // 26.13: tmp5 = true;                                                                          
                                                                                                    
    tmp5 := true;                                                                                   
   } else {                                                                                         
                                                                                                    
    // 26.13: assume this.n_nextThread == tid;                                                      
                                                                                                    
    assume (AtomicIncAndDec.n_nextThread[this]==tid);                                               
                                                                                                    
    // 26.13: assume this.n_nextValue == x;                                                         
                                                                                                    
    assume (AtomicIncAndDec.n_nextValue[this]==x);                                                  
                                                                                                    
    // 26.13: int _currentValue;                                                                    
                                                                                                    
                                                                                                    
    // 26.13: _currentValue := this.n  as B;                                                        
                                                                                                    
                                                                                                    
    moverPath357241 := ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357241 := m#moverPath(moverPath357241);                                                    
    path357241 := p#moverPath(moverPath357241);                                                     
    assume AtomicIncAndDec._state357241 == AtomicIncAndDec._state && AtomicIncAndDec.n357241 == AtomicIncAndDec.n && AtomicIncAndDec._lock357241 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357241 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357241 == AtomicIncAndDec.n_nextValue && _currentValue357241 == _currentValue && ctmp340051357241 == ctmp340051 && tmp6357241 == tmp6 && tmp5357241 == tmp5 && x357241 == x && tmp4357241 == tmp4 && this357241 == this && tid357241 == tid && $pc357241 == $pc;
    assume $recorded.state357241 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
                                                                                                    
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    _currentValue := AtomicIncAndDec.n[this];                                                       
                                                                                                    
                                                                                                    
    // 26.13: this.n := x as B;                                                                     
                                                                                                    
                                                                                                    
    moverPath357244 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,x: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357244 := m#moverPath(moverPath357244);                                                    
    path357244 := p#moverPath(moverPath357244);                                                     
    assume AtomicIncAndDec._state357244 == AtomicIncAndDec._state && AtomicIncAndDec.n357244 == AtomicIncAndDec.n && AtomicIncAndDec._lock357244 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357244 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357244 == AtomicIncAndDec.n_nextValue && _currentValue357244 == _currentValue && ctmp340051357244 == ctmp340051 && tmp6357244 == tmp6 && tmp5357244 == tmp5 && x357244 == x && tmp4357244 == tmp4 && this357244 == this && tid357244 == tid && $pc357244 == $pc;
    assume $recorded.state357244 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    AtomicIncAndDec.n[this] := x;                                                                   
                                                                                                    
    // 26.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 26.13: _m = writePermission(this.n, tmp6);                                                   
                                                                                                    
    _m := m#moverPath(WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp6: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue));
                                                                                                    
                                                                                                    
    // 26.13: this.n := _currentValue as B;                                                         
                                                                                                    
                                                                                                    
    moverPath357256 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,_currentValue: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357256 := m#moverPath(moverPath357256);                                                    
    path357256 := p#moverPath(moverPath357256);                                                     
    assume AtomicIncAndDec._state357256 == AtomicIncAndDec._state && AtomicIncAndDec.n357256 == AtomicIncAndDec.n && AtomicIncAndDec._lock357256 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357256 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357256 == AtomicIncAndDec.n_nextValue && _m357256 == _m && _currentValue357256 == _currentValue && ctmp340051357256 == ctmp340051 && tmp6357256 == tmp6 && tmp5357256 == tmp5 && x357256 == x && tmp4357256 == tmp4 && this357256 == this && tid357256 == tid && $pc357256 == $pc;
    assume $recorded.state357256 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    AtomicIncAndDec.n[this] := _currentValue;                                                       
                                                                                                    
    // 26.13: assume goesWrong(_m);                                                                 
                                                                                                    
    assume transition($pc, _m) == PhaseError;                                                       
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 26.13: this.n := tmp6;                                                                       
                                                                                                    
                                                                                                    
    moverPath357263 := WriteEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,tmp6: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
    mover357263 := m#moverPath(moverPath357263);                                                    
    path357263 := p#moverPath(moverPath357263);                                                     
    assume AtomicIncAndDec._state357263 == AtomicIncAndDec._state && AtomicIncAndDec.n357263 == AtomicIncAndDec.n && AtomicIncAndDec._lock357263 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357263 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357263 == AtomicIncAndDec.n_nextValue && _m357263 == _m && _currentValue357263 == _currentValue && ctmp340051357263 == ctmp340051 && tmp6357263 == tmp6 && tmp5357263 == tmp5 && x357263 == x && tmp4357263 == tmp4 && this357263 == this && tid357263 == tid && $pc357263 == $pc;
    assume $recorded.state357263 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicIncAndDec.null;                                                           
    } else {                                                                                        
     assert this != AtomicIncAndDec.null;                                                                  // (26.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover357263);                                                            
    assert $pc != PhaseError;                                                                              // (26.13): Reduction failure
    AtomicIncAndDec.n[this] := tmp6;                                                                
                                                                                                    
    // 26.13: tmp5 = false;                                                                         
                                                                                                    
    tmp5 := false;                                                                                  
   }                                                                                                
  }                                                                                                 
  if (tmp5) {                                                                                       
                                                                                                    
   // 27.17: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 29.13: yield;                                                                                  
                                                                                                    
  assume AtomicIncAndDec._state357278 == AtomicIncAndDec._state && AtomicIncAndDec.n357278 == AtomicIncAndDec.n && AtomicIncAndDec._lock357278 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357278 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357278 == AtomicIncAndDec.n_nextValue && tmp6357278 == tmp6 && tmp5357278 == tmp5 && x357278 == x && tmp4357278 == tmp4 && this357278 == this && tid357278 == tid;
  assume $recorded.state357278 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume AtomicIncAndDec._state357278_post == AtomicIncAndDec._state && AtomicIncAndDec.n357278_post == AtomicIncAndDec.n && AtomicIncAndDec._lock357278_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357278_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357278_post == AtomicIncAndDec.n_nextValue && tmp6357278_post == tmp6 && tmp5357278_post == tmp5 && x357278_post == x && tmp4357278_post == tmp4 && this357278_post == this && tid357278_post == tid;
  assume $recorded.state357278_post == 1;                                                           
  assume AtomicIncAndDec._state357281_bottom == AtomicIncAndDec._state && AtomicIncAndDec.n357281_bottom == AtomicIncAndDec.n && AtomicIncAndDec._lock357281_bottom == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357281_bottom == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357281_bottom == AtomicIncAndDec.n_nextValue && this357281_bottom == this && tid357281_bottom == tid;
  assume $recorded.state357281_bottom == 1;                                                         
  assert phase357281 == $pc;                                                                               // (23.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 22.23: // return;                                                                               
                                                                                                    
 assume AtomicIncAndDec._state357282 == AtomicIncAndDec._state && AtomicIncAndDec.n357282 == AtomicIncAndDec.n && AtomicIncAndDec._lock357282 == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread357282 == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue357282 == AtomicIncAndDec.n_nextValue && this357282 == this && tid357282 == tid;
 assume $recorded.state357282 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(AtomicIncAndDec._state: [AtomicIncAndDec]State,AtomicIncAndDec.n: [AtomicIncAndDec]int,AtomicIncAndDec._lock: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid,AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int) returns (bool) {
  true &&                                                                                           
  (forall _i: AtomicIncAndDec  :: _i == AtomicIncAndDec.null <==> isNull(AtomicIncAndDec._state[_i])) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, x: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[x], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 AtomicIncAndDec.n[x] := v;                                                                         
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,x: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): AtomicIncAndDec.n failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, x: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[x], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 AtomicIncAndDec.n[x] := v;                                                                         
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.AtomicIncAndDec.n(u: Tid,x: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.5): AtomicIncAndDec.n failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, x: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[x], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == AtomicIncAndDec.n[x];                                                                  
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 AtomicIncAndDec.n[x] := havocValue;                                                                
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,x: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.5): AtomicIncAndDec.n failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, x: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[x], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == AtomicIncAndDec.n[x];                                                                  
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.AtomicIncAndDec.n(u: Tid,x: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.5): AtomicIncAndDec.n failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, x: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[x], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,x: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): AtomicIncAndDec.n failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, x: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[x], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == AtomicIncAndDec.n[x];                                                                  
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 AtomicIncAndDec.n[x] := havocValue;                                                                
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,x: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.5): AtomicIncAndDec.n failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
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
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w0_pre: int;                                                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: AtomicIncAndDec;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 AtomicIncAndDec.n[x] := v;                                                                         
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
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
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w0_pre: int;                                                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var AtomicIncAndDec.n_nextValue_mid: [AtomicIncAndDec]int;                                         
 var AtomicIncAndDec._lock_mid: [AtomicIncAndDec]Tid;                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var x_mid: AtomicIncAndDec;                                                                        
 var y_mid: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_mid: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n_mid: [AtomicIncAndDec]int;                                                   
 var v_mid: int;                                                                                    
 var AtomicIncAndDec._state_mid: [AtomicIncAndDec]State;                                            
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: AtomicIncAndDec;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := AtomicIncAndDec.n[x];                                                                      
 AtomicIncAndDec.n[x] := v;                                                                         
                                                                                                    
 assume AtomicIncAndDec._state_mid == AtomicIncAndDec._state && AtomicIncAndDec.n_mid == AtomicIncAndDec.n && AtomicIncAndDec._lock_mid == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_mid == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_mid == AtomicIncAndDec.n_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 AtomicIncAndDec.n[x] := tmpV;                                                                      
 AtomicIncAndDec.n[y] := w;                                                                         
 _writeByTPost := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
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
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w0_pre: int;                                                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var AtomicIncAndDec.n_nextValue_mid: [AtomicIncAndDec]int;                                         
 var AtomicIncAndDec._lock_mid: [AtomicIncAndDec]Tid;                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var x_mid: AtomicIncAndDec;                                                                        
 var y_mid: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_mid: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n_mid: [AtomicIncAndDec]int;                                                   
 var v_mid: int;                                                                                    
 var AtomicIncAndDec._state_mid: [AtomicIncAndDec]State;                                            
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: AtomicIncAndDec;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := AtomicIncAndDec.n[x];                                                                      
 AtomicIncAndDec.n[x] := v;                                                                         
 assume AtomicIncAndDec._state_mid == AtomicIncAndDec._state && AtomicIncAndDec.n_mid == AtomicIncAndDec.n && AtomicIncAndDec._lock_mid == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_mid == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_mid == AtomicIncAndDec.n_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 AtomicIncAndDec.n[x] := tmpV;                                                                      
 AtomicIncAndDec.n[y] := w;                                                                         
 _writeByTPost := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
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
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w0_pre: int;                                                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: AtomicIncAndDec;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 AtomicIncAndDec.n[y] := w;                                                                         
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Read-Write Stable with respect to AtomicIncAndDec.n (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Read-Write Stable with respect to AtomicIncAndDec.n (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Read-Write Stable with respect to AtomicIncAndDec.n (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
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
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var w0_pre: int;                                                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var y_post: AtomicIncAndDec;                                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 AtomicIncAndDec.n[x] := v;                                                                         
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Read Stable with respect to AtomicIncAndDec.n (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Read Stable with respect to AtomicIncAndDec.n (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.5): AtomicIncAndDec.n is not Write-Read Stable with respect to AtomicIncAndDec.n (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v: int, w1: int, w2: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var tmpW: int;                                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByUAfterU : MoverPath;                                                                   
 var _writeByUAfterU_Mover : Mover;                                                                 
 var _writeByUAfterU_Path : int;                                                                    
 var _writeByUAfterTAndU : MoverPath;                                                               
 var _writeByUAfterTAndU_Mover : Mover;                                                             
 var _writeByUAfterTAndU_Path : int;                                                                
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var w2_pre: int;                                                                                   
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var w1_pre: int;                                                                                   
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var AtomicIncAndDec.n_nextValue_mid: [AtomicIncAndDec]int;                                         
 var AtomicIncAndDec._lock_mid: [AtomicIncAndDec]Tid;                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var x_mid: AtomicIncAndDec;                                                                        
 var y_mid: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_mid: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n_mid: [AtomicIncAndDec]int;                                                   
 var v_mid: int;                                                                                    
 var w2_mid: int;                                                                                   
 var AtomicIncAndDec._state_mid: [AtomicIncAndDec]State;                                            
 var w1_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w2_post: int;                                                                                  
 var w1_post: int;                                                                                  
 var $recorded.state_post: int;                                                                     
 var y_post: AtomicIncAndDec;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var v_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w1: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := AtomicIncAndDec.n[y];                                                                      
 AtomicIncAndDec.n[y] := w1;                                                                        
                                                                                                    
 assume AtomicIncAndDec._state_mid == AtomicIncAndDec._state && AtomicIncAndDec.n_mid == AtomicIncAndDec.n && AtomicIncAndDec._lock_mid == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_mid == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_mid == AtomicIncAndDec.n_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w2: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 AtomicIncAndDec.n[y] := tmpW;                                                                      
                                                                                                    
 AtomicIncAndDec.n[x] := v;                                                                         
 AtomicIncAndDec.n[y] := w1;                                                                        
                                                                                                    
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w2: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.AtomicIncAndDec.n.AtomicIncAndDec.n(t: Tid, u: Tid, v1: int, v2: int, w: int, x: AtomicIncAndDec, y: AtomicIncAndDec)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicIncAndDec._state[x], t);                                               
 requires isAccessible(AtomicIncAndDec._state[y], u);                                               
 modifies AtomicIncAndDec.n;                                                                        
 modifies AtomicIncAndDec.n;                                                                        
                                                                                                    
 {                                                                                                  
 var tmpV: int;                                                                                     
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTAfterT : MoverPath;                                                                   
 var _writeByTAfterT_Mover : Mover;                                                                 
 var _writeByTAfterT_Path : int;                                                                    
 var _writeByTAfterUAndT : MoverPath;                                                               
 var _writeByTAfterUAndT_Mover : Mover;                                                             
 var _writeByTAfterUAndT_Path : int;                                                                
 var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                         
 var v1_pre: int;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                   
 var y_pre: AtomicIncAndDec;                                                                        
 var w_pre: int;                                                                                    
 var x_pre: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                        
 var $pc_pre: Phase;                                                                                
 var v2_pre: int;                                                                                   
 var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                               
 var t_pre: Tid;                                                                                    
 var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                            
                                                                                                    
 var t_mid: Tid;                                                                                    
 var AtomicIncAndDec.n_nextValue_mid: [AtomicIncAndDec]int;                                         
 var AtomicIncAndDec._lock_mid: [AtomicIncAndDec]Tid;                                               
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v1_mid: int;                                                                                   
 var x_mid: AtomicIncAndDec;                                                                        
 var y_mid: AtomicIncAndDec;                                                                        
 var AtomicIncAndDec.n_nextThread_mid: [AtomicIncAndDec]Tid;                                        
 var AtomicIncAndDec.n_mid: [AtomicIncAndDec]int;                                                   
 var v2_mid: int;                                                                                   
 var AtomicIncAndDec._state_mid: [AtomicIncAndDec]State;                                            
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v1_post: int;                                                                                  
 var y_post: AtomicIncAndDec;                                                                       
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                        
 var x_post: AtomicIncAndDec;                                                                       
 var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                       
 var w_post: int;                                                                                   
 var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                           
 var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                  
 var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                              
 var v2_post: int;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicIncAndDec.n(u: Tid,y: AtomicIncAndDec,w: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := AtomicIncAndDec.n[x];                                                                      
 AtomicIncAndDec.n[x] := v1;                                                                        
 _writeByTAfterT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v2: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 AtomicIncAndDec.n[x] := tmpV;                                                                      
                                                                                                    
 AtomicIncAndDec.n[y] := w;                                                                         
 assume AtomicIncAndDec._state_mid == AtomicIncAndDec._state && AtomicIncAndDec.n_mid == AtomicIncAndDec.n && AtomicIncAndDec._lock_mid == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_mid == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_mid == AtomicIncAndDec.n_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v1: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 AtomicIncAndDec.n[x] := v1;                                                                        
 _writeByTAfterUAndT := WriteEval.AtomicIncAndDec.n(t: Tid,x: AtomicIncAndDec,v2: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume AtomicIncAndDec._state_post == AtomicIncAndDec._state && AtomicIncAndDec.n_post == AtomicIncAndDec.n && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
requires ValidTid(tid);                                                                             
modifies AtomicIncAndDec._state;                                                                    
modifies AtomicIncAndDec.n;                                                                         
modifies AtomicIncAndDec._lock;                                                                     
modifies AtomicIncAndDec.n_nextThread;                                                              
modifies AtomicIncAndDec.n_nextValue;                                                               
ensures StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
ensures Y(tid , old(AtomicIncAndDec._state), old(AtomicIncAndDec.n), old(AtomicIncAndDec._lock), old(AtomicIncAndDec.n_nextThread), old(AtomicIncAndDec.n_nextValue) , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
                                                                                                    
// AtomicIncAndDec.n:                                                                               
                                                                                                    
function {:inline} Y_AtomicIncAndDec.n(tid : Tid, this: AtomicIncAndDec, newValue: int , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 ((isAccessible(AtomicIncAndDec._state[this], tid) && leq(m#moverPath(ReadEval.AtomicIncAndDec.n(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)), _R)) ==> (AtomicIncAndDec.n[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicIncAndDec.n(tid : Tid, this: AtomicIncAndDec, newValue: int , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_AtomicIncAndDec.n.Subsumes.W(tid : Tid, u : Tid, this: AtomicIncAndDec, newValue: int , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var AtomicIncAndDec.n_yield: [AtomicIncAndDec]int;                                                  
var AtomicIncAndDec._state_yield: [AtomicIncAndDec]State;                                           
var tid_yield: Tid;                                                                                 
var this_yield: AtomicIncAndDec;                                                                    
var AtomicIncAndDec.n_nextThread_yield: [AtomicIncAndDec]Tid;                                       
var AtomicIncAndDec._lock_yield: [AtomicIncAndDec]Tid;                                              
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var AtomicIncAndDec.n_nextValue_yield: [AtomicIncAndDec]int;                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicIncAndDec._state[this], tid);                                            
 assume isAccessible(AtomicIncAndDec._state[this], u);                                              
 assume !isError(m#moverPath(WriteEval.AtomicIncAndDec.n(u: Tid,this: AtomicIncAndDec,newValue: int,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)));
                                                                                                    
assume AtomicIncAndDec._state_yield == AtomicIncAndDec._state && AtomicIncAndDec.n_yield == AtomicIncAndDec.n && AtomicIncAndDec._lock_yield == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_yield == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_yield == AtomicIncAndDec.n_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicIncAndDec.n(tid, this, newValue , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicIncAndDec.n.Reflexive(tid : Tid, this: AtomicIncAndDec , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicIncAndDec.n_yield: [AtomicIncAndDec]int;                                                  
var AtomicIncAndDec._state_yield: [AtomicIncAndDec]State;                                           
var tid_yield: Tid;                                                                                 
var this_yield: AtomicIncAndDec;                                                                    
var AtomicIncAndDec.n_nextThread_yield: [AtomicIncAndDec]Tid;                                       
var AtomicIncAndDec._lock_yield: [AtomicIncAndDec]Tid;                                              
var $pc_yield: Phase;                                                                               
var AtomicIncAndDec.n_nextValue_yield: [AtomicIncAndDec]int;                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicIncAndDec._state[this], tid);                                            
assume AtomicIncAndDec._state_yield == AtomicIncAndDec._state && AtomicIncAndDec.n_yield == AtomicIncAndDec.n && AtomicIncAndDec._lock_yield == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_yield == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_yield == AtomicIncAndDec.n_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicIncAndDec.n(tid, this, AtomicIncAndDec.n[this] , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicIncAndDec.n.Transitive(tid : Tid, this: AtomicIncAndDec, newValue : int , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int , AtomicIncAndDec._state_p: [AtomicIncAndDec]State, AtomicIncAndDec.n_p: [AtomicIncAndDec]int, AtomicIncAndDec._lock_p: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread_p: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue_p: [AtomicIncAndDec]int)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires StateInvariant(AtomicIncAndDec._state_p, AtomicIncAndDec.n_p, AtomicIncAndDec._lock_p, AtomicIncAndDec.n_nextThread_p, AtomicIncAndDec.n_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                          
var $recorded.state_pre: int;                                                                       
var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                    
var newValue_pre: int;                                                                              
var tid_pre: Tid;                                                                                   
var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                         
var $pc_pre: Phase;                                                                                 
var this_pre: AtomicIncAndDec;                                                                      
var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                                
var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                             
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                         
var tid_post: Tid;                                                                                  
var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                        
var this_post: AtomicIncAndDec;                                                                     
var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                            
var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                   
var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                               
                                                                                                    
assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(AtomicIncAndDec._state[this], tid);                                            
 assume Y(tid , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue , AtomicIncAndDec._state_p, AtomicIncAndDec.n_p, AtomicIncAndDec._lock_p, AtomicIncAndDec.n_nextThread_p, AtomicIncAndDec.n_nextValue_p);
 assume Y_AtomicIncAndDec.n(tid, this, newValue , AtomicIncAndDec._state_p, AtomicIncAndDec.n_p, AtomicIncAndDec._lock_p, AtomicIncAndDec.n_nextThread_p, AtomicIncAndDec.n_nextValue_p);
assume AtomicIncAndDec._state_post == AtomicIncAndDec._state_p && AtomicIncAndDec.n_post == AtomicIncAndDec.n_p && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock_p && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread_p && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_AtomicIncAndDec.n(tid, this, newValue , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
}                                                                                                   
// AtomicIncAndDec._lock:                                                                           
                                                                                                    
function {:inline} Y_AtomicIncAndDec._lock(tid : Tid, this: AtomicIncAndDec, newValue: Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 ((isAccessible(AtomicIncAndDec._state[this], tid) && leq(m#moverPath(ReadEval.AtomicIncAndDec._lock(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)), _R)) ==> (AtomicIncAndDec._lock[this] == newValue))
 &&(((AtomicIncAndDec._lock[this]==tid)==(newValue==tid)))                                          
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicIncAndDec._lock(tid : Tid, this: AtomicIncAndDec, newValue: Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_AtomicIncAndDec._lock.Subsumes.W(tid : Tid, u : Tid, this: AtomicIncAndDec, newValue: Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var AtomicIncAndDec.n_yield: [AtomicIncAndDec]int;                                                  
var AtomicIncAndDec._state_yield: [AtomicIncAndDec]State;                                           
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var this_yield: AtomicIncAndDec;                                                                    
var AtomicIncAndDec.n_nextThread_yield: [AtomicIncAndDec]Tid;                                       
var AtomicIncAndDec._lock_yield: [AtomicIncAndDec]Tid;                                              
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var AtomicIncAndDec.n_nextValue_yield: [AtomicIncAndDec]int;                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicIncAndDec._state[this], tid);                                            
 assume isAccessible(AtomicIncAndDec._state[this], u);                                              
 assume !isError(m#moverPath(WriteEval.AtomicIncAndDec._lock(u: Tid,this: AtomicIncAndDec,newValue: Tid,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)));
 assume leq(m#moverPath(ReadEval.AtomicIncAndDec._lock(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)), _N);
assume AtomicIncAndDec._state_yield == AtomicIncAndDec._state && AtomicIncAndDec.n_yield == AtomicIncAndDec.n && AtomicIncAndDec._lock_yield == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_yield == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_yield == AtomicIncAndDec.n_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicIncAndDec._lock(tid, this, newValue , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicIncAndDec._lock.Reflexive(tid : Tid, this: AtomicIncAndDec , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicIncAndDec.n_yield: [AtomicIncAndDec]int;                                                  
var AtomicIncAndDec._state_yield: [AtomicIncAndDec]State;                                           
var tid_yield: Tid;                                                                                 
var this_yield: AtomicIncAndDec;                                                                    
var AtomicIncAndDec.n_nextThread_yield: [AtomicIncAndDec]Tid;                                       
var AtomicIncAndDec._lock_yield: [AtomicIncAndDec]Tid;                                              
var $pc_yield: Phase;                                                                               
var AtomicIncAndDec.n_nextValue_yield: [AtomicIncAndDec]int;                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicIncAndDec._state[this], tid);                                            
assume AtomicIncAndDec._state_yield == AtomicIncAndDec._state && AtomicIncAndDec.n_yield == AtomicIncAndDec.n && AtomicIncAndDec._lock_yield == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_yield == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_yield == AtomicIncAndDec.n_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicIncAndDec._lock(tid, this, AtomicIncAndDec._lock[this] , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicIncAndDec._lock.Transitive(tid : Tid, this: AtomicIncAndDec, newValue : Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int , AtomicIncAndDec._state_p: [AtomicIncAndDec]State, AtomicIncAndDec.n_p: [AtomicIncAndDec]int, AtomicIncAndDec._lock_p: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread_p: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue_p: [AtomicIncAndDec]int)
 requires StateInvariant(AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
 requires StateInvariant(AtomicIncAndDec._state_p, AtomicIncAndDec.n_p, AtomicIncAndDec._lock_p, AtomicIncAndDec.n_nextThread_p, AtomicIncAndDec.n_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicIncAndDec.n_nextValue_pre: [AtomicIncAndDec]int;                                          
var $recorded.state_pre: int;                                                                       
var AtomicIncAndDec.n_pre: [AtomicIncAndDec]int;                                                    
var tid_pre: Tid;                                                                                   
var AtomicIncAndDec.n_nextThread_pre: [AtomicIncAndDec]Tid;                                         
var $pc_pre: Phase;                                                                                 
var this_pre: AtomicIncAndDec;                                                                      
var AtomicIncAndDec._lock_pre: [AtomicIncAndDec]Tid;                                                
var newValue_pre: Tid;                                                                              
var AtomicIncAndDec._state_pre: [AtomicIncAndDec]State;                                             
                                                                                                    
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var AtomicIncAndDec.n_nextValue_post: [AtomicIncAndDec]int;                                         
var tid_post: Tid;                                                                                  
var AtomicIncAndDec.n_nextThread_post: [AtomicIncAndDec]Tid;                                        
var newValue_post: Tid;                                                                             
var this_post: AtomicIncAndDec;                                                                     
var AtomicIncAndDec._state_post: [AtomicIncAndDec]State;                                            
var AtomicIncAndDec.n_post: [AtomicIncAndDec]int;                                                   
var AtomicIncAndDec._lock_post: [AtomicIncAndDec]Tid;                                               
                                                                                                    
assume AtomicIncAndDec._state_pre == AtomicIncAndDec._state && AtomicIncAndDec.n_pre == AtomicIncAndDec.n && AtomicIncAndDec._lock_pre == AtomicIncAndDec._lock && AtomicIncAndDec.n_nextThread_pre == AtomicIncAndDec.n_nextThread && AtomicIncAndDec.n_nextValue_pre == AtomicIncAndDec.n_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(AtomicIncAndDec._state[this], tid);                                            
 assume Y(tid , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue , AtomicIncAndDec._state_p, AtomicIncAndDec.n_p, AtomicIncAndDec._lock_p, AtomicIncAndDec.n_nextThread_p, AtomicIncAndDec.n_nextValue_p);
 assume Y_AtomicIncAndDec._lock(tid, this, newValue , AtomicIncAndDec._state_p, AtomicIncAndDec.n_p, AtomicIncAndDec._lock_p, AtomicIncAndDec.n_nextThread_p, AtomicIncAndDec.n_nextValue_p);
assume AtomicIncAndDec._state_post == AtomicIncAndDec._state_p && AtomicIncAndDec.n_post == AtomicIncAndDec.n_p && AtomicIncAndDec._lock_post == AtomicIncAndDec._lock_p && AtomicIncAndDec.n_nextThread_post == AtomicIncAndDec.n_nextThread_p && AtomicIncAndDec.n_nextValue_post == AtomicIncAndDec.n_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_AtomicIncAndDec._lock(tid, this, newValue , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue);
}                                                                                                   
// AtomicIncAndDec.n_nextThread:                                                                    
                                                                                                    
function {:inline} Y_AtomicIncAndDec.n_nextThread(tid : Tid, this: AtomicIncAndDec, newValue: Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 ((isAccessible(AtomicIncAndDec._state[this], tid) && leq(m#moverPath(ReadEval.AtomicIncAndDec.n_nextThread(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)), _R)) ==> (AtomicIncAndDec.n_nextThread[this] == newValue))
 &&(((AtomicIncAndDec.n_nextThread[this]==tid)==>(newValue==tid)))                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicIncAndDec.n_nextThread(tid : Tid, this: AtomicIncAndDec, newValue: Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// AtomicIncAndDec.n_nextValue:                                                                     
                                                                                                    
function {:inline} Y_AtomicIncAndDec.n_nextValue(tid : Tid, this: AtomicIncAndDec, newValue: int , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 ((isAccessible(AtomicIncAndDec._state[this], tid) && leq(m#moverPath(ReadEval.AtomicIncAndDec.n_nextValue(tid: Tid,this: AtomicIncAndDec,AtomicIncAndDec._state,AtomicIncAndDec.n,AtomicIncAndDec._lock,AtomicIncAndDec.n_nextThread,AtomicIncAndDec.n_nextValue)), _R)) ==> (AtomicIncAndDec.n_nextValue[this] == newValue))
 &&(((AtomicIncAndDec.n_nextThread[this]==tid)==>(newValue==AtomicIncAndDec.n_nextValue[this])))    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicIncAndDec.n_nextValue(tid : Tid, this: AtomicIncAndDec, newValue: int , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , AtomicIncAndDec._state: [AtomicIncAndDec]State, AtomicIncAndDec.n: [AtomicIncAndDec]int, AtomicIncAndDec._lock: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue: [AtomicIncAndDec]int , AtomicIncAndDec._state_p: [AtomicIncAndDec]State, AtomicIncAndDec.n_p: [AtomicIncAndDec]int, AtomicIncAndDec._lock_p: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextThread_p: [AtomicIncAndDec]Tid, AtomicIncAndDec.n_nextValue_p: [AtomicIncAndDec]int): bool
{                                                                                                   
 (forall this: AtomicIncAndDec :: Y_AtomicIncAndDec.n(tid : Tid, this, AtomicIncAndDec.n_p[this] , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue))
 && (forall this: AtomicIncAndDec :: Y_AtomicIncAndDec._lock(tid : Tid, this, AtomicIncAndDec._lock_p[this] , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue))
 && (forall this: AtomicIncAndDec :: Y_AtomicIncAndDec.n_nextThread(tid : Tid, this, AtomicIncAndDec.n_nextThread_p[this] , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue))
 && (forall this: AtomicIncAndDec :: Y_AtomicIncAndDec.n_nextValue(tid : Tid, this, AtomicIncAndDec.n_nextValue_p[this] , AtomicIncAndDec._state, AtomicIncAndDec.n, AtomicIncAndDec._lock, AtomicIncAndDec.n_nextThread, AtomicIncAndDec.n_nextValue))
 && (forall _i : AtomicIncAndDec :: isShared(AtomicIncAndDec._state[_i]) ==> isShared(AtomicIncAndDec._state_p[_i]))
 && (forall _i : AtomicIncAndDec :: isLocal(AtomicIncAndDec._state[_i], tid) <==> isLocal(AtomicIncAndDec._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1100.1-1837.2: (Method:7.5)
// 1109.1-1109.24: (7.5): Bad tid
// 1110.1-1110.49: (7.5): this is not global
// 1432.2-1436.14: (class anchor.sink.While:10.9)
// 1438.1-1438.27: (7.5): Bad tid
// 1439.1-1439.52: (7.5): this is not global
// 1442.1-1442.274: (10.9): Loop does not preserve yields_as annotation for field n
// 1443.1-1443.32: (10.9): Phase must be invariant at loop head
// 1444.1-1444.30: (10.9): Potentially infinite loop cannot be in post-commit phase.
// 1446.3-1448.3: (class anchor.sink.VarDeclStmt:10.16)
// 1449.3-1452.16: (class anchor.sink.Assign:10.16)
// 1454.4-1457.10: (class anchor.sink.Break:10.9)
// 1460.3-1462.3: (class anchor.sink.VarDeclStmt:11.13)
// 1464.3-1466.3: (class anchor.sink.VarDeclStmt:11.13)
// 1467.3-1484.46: (class anchor.sink.Read:11.13)
// 1479.1-1479.40: (11.13): Cannot have potential null deference in left-mover part.
// 1483.1-1483.28: (11.13): Reduction failure
// 1485.3-1487.3: (class anchor.sink.VarDeclStmt:11.13)
// 1488.3-1505.45: (class anchor.sink.Read:11.13)
// 1500.1-1500.40: (11.13): Cannot have potential null deference in left-mover part.
// 1504.1-1504.28: (11.13): Reduction failure
// 1506.3-1508.3: (class anchor.sink.VarDeclStmt:11.13)
// 1509.3-1526.44: (class anchor.sink.Read:11.13)
// 1521.1-1521.40: (11.13): Cannot have potential null deference in left-mover part.
// 1525.1-1525.28: (11.13): Reduction failure
// 1527.3-1529.3: (class anchor.sink.VarDeclStmt:11.13)
// 1530.3-1533.203: (class anchor.sink.Assign:11.13)
// 1534.3-1536.3: (class anchor.sink.VarDeclStmt:11.13)
// 1537.3-1540.75: (class anchor.sink.Assign:11.13)
// 1543.4-1560.33: (class anchor.sink.Read:11.13)
// 1555.1-1555.41: (11.13): Cannot have potential null deference in left-mover part.
// 1559.1-1559.29: (11.13): Reduction failure
// 1563.4-1580.33: (class anchor.sink.Read:11.13)
// 1575.1-1575.41: (11.13): Cannot have potential null deference in left-mover part.
// 1579.1-1579.29: (11.13): Reduction failure
// 1582.3-1590.42: (class anchor.sink.Yield:12.13)
// 1591.3-1593.3: (class anchor.sink.VarDeclStmt:13.13)
// 1594.3-1596.3: (class anchor.sink.VarDeclStmt:13.13)
// 1597.3-1600.17: (class anchor.sink.Assign:13.13)
// 1602.3-1604.3: (class anchor.sink.VarDeclStmt:13.13)
// 1605.3-1608.20: (class anchor.sink.Assign:13.13)
// 1611.4-1614.18: (class anchor.sink.Assign:13.13)
// 1616.4-1619.21: (class anchor.sink.Assign:13.13)
// 1621.5-1623.5: (class anchor.sink.VarDeclStmt:13.13)
// 1624.5-1626.5: (class anchor.sink.VarDeclStmt:13.13)
// 1627.5-1629.5: (class anchor.sink.VarDeclStmt:13.13)
// 1630.5-1633.214: (class anchor.sink.Assign:13.13)
// 1634.5-1637.41: (class anchor.sink.Assume:13.13)
// 1638.5-1641.49: (class anchor.sink.Assume:13.13)
// 1642.5-1645.54: (class anchor.sink.Assume:13.13)
// 1646.5-1649.51: (class anchor.sink.Assume:13.13)
// 1651.5-1667.50: (class anchor.sink.Write:13.13)
// 1663.1-1663.42: (13.13): Cannot have potential null deference in left-mover part.
// 1666.1-1666.30: (13.13): Reduction failure
// 1669.5-1685.51: (class anchor.sink.Write:13.13)
// 1681.1-1681.42: (13.13): Cannot have potential null deference in left-mover part.
// 1684.1-1684.30: (13.13): Reduction failure
// 1688.5-1704.37: (class anchor.sink.Write:13.13)
// 1700.1-1700.42: (13.13): Cannot have potential null deference in left-mover part.
// 1703.1-1703.30: (13.13): Reduction failure
// 1705.5-1708.18: (class anchor.sink.Assign:13.13)
// 1710.5-1713.54: (class anchor.sink.Assume:13.13)
// 1714.5-1717.51: (class anchor.sink.Assume:13.13)
// 1718.5-1720.5: (class anchor.sink.VarDeclStmt:13.13)
// 1721.5-1738.46: (class anchor.sink.Read:13.13)
// 1733.1-1733.42: (13.13): Cannot have potential null deference in left-mover part.
// 1737.1-1737.30: (13.13): Reduction failure
// 1740.5-1756.34: (class anchor.sink.Write:13.13)
// 1752.1-1752.42: (13.13): Cannot have potential null deference in left-mover part.
// 1755.1-1755.30: (13.13): Reduction failure
// 1757.5-1759.5: (class anchor.sink.VarDeclStmt:13.13)
// 1760.5-1763.214: (class anchor.sink.Assign:13.13)
// 1765.5-1781.46: (class anchor.sink.Write:13.13)
// 1777.1-1777.42: (13.13): Cannot have potential null deference in left-mover part.
// 1780.1-1780.30: (13.13): Reduction failure
// 1782.5-1785.46: (class anchor.sink.Assume:13.13)
// 1788.5-1804.37: (class anchor.sink.Write:13.13)
// 1800.1-1800.42: (13.13): Cannot have potential null deference in left-mover part.
// 1803.1-1803.30: (13.13): Reduction failure
// 1805.5-1808.19: (class anchor.sink.Assign:13.13)
// 1812.4-1815.10: (class anchor.sink.Break:14.17)
// 1818.3-1826.42: (class anchor.sink.Yield:16.13)
// 1829.1-1829.29: (10.9): Phase must be invariant at loop head
// 1831.2-1836.9: (class anchor.sink.Return:9.23)
// 1838.1-2575.2: (Method:20.5)
// 1847.1-1847.24: (20.5): Bad tid
// 1848.1-1848.49: (20.5): this is not global
// 2170.2-2174.14: (class anchor.sink.While:23.9)
// 2176.1-2176.27: (20.5): Bad tid
// 2177.1-2177.52: (20.5): this is not global
// 2180.1-2180.274: (23.9): Loop does not preserve yields_as annotation for field n
// 2181.1-2181.32: (23.9): Phase must be invariant at loop head
// 2182.1-2182.30: (23.9): Potentially infinite loop cannot be in post-commit phase.
// 2184.3-2186.3: (class anchor.sink.VarDeclStmt:23.16)
// 2187.3-2190.16: (class anchor.sink.Assign:23.16)
// 2192.4-2195.10: (class anchor.sink.Break:23.9)
// 2198.3-2200.3: (class anchor.sink.VarDeclStmt:24.13)
// 2202.3-2204.3: (class anchor.sink.VarDeclStmt:24.13)
// 2205.3-2222.46: (class anchor.sink.Read:24.13)
// 2217.1-2217.40: (24.13): Cannot have potential null deference in left-mover part.
// 2221.1-2221.28: (24.13): Reduction failure
// 2223.3-2225.3: (class anchor.sink.VarDeclStmt:24.13)
// 2226.3-2243.45: (class anchor.sink.Read:24.13)
// 2238.1-2238.40: (24.13): Cannot have potential null deference in left-mover part.
// 2242.1-2242.28: (24.13): Reduction failure
// 2244.3-2246.3: (class anchor.sink.VarDeclStmt:24.13)
// 2247.3-2264.44: (class anchor.sink.Read:24.13)
// 2259.1-2259.40: (24.13): Cannot have potential null deference in left-mover part.
// 2263.1-2263.28: (24.13): Reduction failure
// 2265.3-2267.3: (class anchor.sink.VarDeclStmt:24.13)
// 2268.3-2271.203: (class anchor.sink.Assign:24.13)
// 2272.3-2274.3: (class anchor.sink.VarDeclStmt:24.13)
// 2275.3-2278.75: (class anchor.sink.Assign:24.13)
// 2281.4-2298.33: (class anchor.sink.Read:24.13)
// 2293.1-2293.41: (24.13): Cannot have potential null deference in left-mover part.
// 2297.1-2297.29: (24.13): Reduction failure
// 2301.4-2318.33: (class anchor.sink.Read:24.13)
// 2313.1-2313.41: (24.13): Cannot have potential null deference in left-mover part.
// 2317.1-2317.29: (24.13): Reduction failure
// 2320.3-2328.42: (class anchor.sink.Yield:25.13)
// 2329.3-2331.3: (class anchor.sink.VarDeclStmt:26.13)
// 2332.3-2334.3: (class anchor.sink.VarDeclStmt:26.13)
// 2335.3-2338.17: (class anchor.sink.Assign:26.13)
// 2340.3-2342.3: (class anchor.sink.VarDeclStmt:26.13)
// 2343.3-2346.20: (class anchor.sink.Assign:26.13)
// 2349.4-2352.18: (class anchor.sink.Assign:26.13)
// 2354.4-2357.21: (class anchor.sink.Assign:26.13)
// 2359.5-2361.5: (class anchor.sink.VarDeclStmt:26.13)
// 2362.5-2364.5: (class anchor.sink.VarDeclStmt:26.13)
// 2365.5-2367.5: (class anchor.sink.VarDeclStmt:26.13)
// 2368.5-2371.214: (class anchor.sink.Assign:26.13)
// 2372.5-2375.41: (class anchor.sink.Assume:26.13)
// 2376.5-2379.49: (class anchor.sink.Assume:26.13)
// 2380.5-2383.54: (class anchor.sink.Assume:26.13)
// 2384.5-2387.51: (class anchor.sink.Assume:26.13)
// 2389.5-2405.50: (class anchor.sink.Write:26.13)
// 2401.1-2401.42: (26.13): Cannot have potential null deference in left-mover part.
// 2404.1-2404.30: (26.13): Reduction failure
// 2407.5-2423.51: (class anchor.sink.Write:26.13)
// 2419.1-2419.42: (26.13): Cannot have potential null deference in left-mover part.
// 2422.1-2422.30: (26.13): Reduction failure
// 2426.5-2442.37: (class anchor.sink.Write:26.13)
// 2438.1-2438.42: (26.13): Cannot have potential null deference in left-mover part.
// 2441.1-2441.30: (26.13): Reduction failure
// 2443.5-2446.18: (class anchor.sink.Assign:26.13)
// 2448.5-2451.54: (class anchor.sink.Assume:26.13)
// 2452.5-2455.51: (class anchor.sink.Assume:26.13)
// 2456.5-2458.5: (class anchor.sink.VarDeclStmt:26.13)
// 2459.5-2476.46: (class anchor.sink.Read:26.13)
// 2471.1-2471.42: (26.13): Cannot have potential null deference in left-mover part.
// 2475.1-2475.30: (26.13): Reduction failure
// 2478.5-2494.34: (class anchor.sink.Write:26.13)
// 2490.1-2490.42: (26.13): Cannot have potential null deference in left-mover part.
// 2493.1-2493.30: (26.13): Reduction failure
// 2495.5-2497.5: (class anchor.sink.VarDeclStmt:26.13)
// 2498.5-2501.214: (class anchor.sink.Assign:26.13)
// 2503.5-2519.46: (class anchor.sink.Write:26.13)
// 2515.1-2515.42: (26.13): Cannot have potential null deference in left-mover part.
// 2518.1-2518.30: (26.13): Reduction failure
// 2520.5-2523.46: (class anchor.sink.Assume:26.13)
// 2526.5-2542.37: (class anchor.sink.Write:26.13)
// 2538.1-2538.42: (26.13): Cannot have potential null deference in left-mover part.
// 2541.1-2541.30: (26.13): Reduction failure
// 2543.5-2546.19: (class anchor.sink.Assign:26.13)
// 2550.4-2553.10: (class anchor.sink.Break:27.17)
// 2556.3-2564.42: (class anchor.sink.Yield:29.13)
// 2567.1-2567.29: (23.9): Phase must be invariant at loop head
// 2569.2-2574.9: (class anchor.sink.Return:22.23)
// 2653.1-2653.34: (5.5): AtomicIncAndDec.n failed Write-Write Right-Mover Check
// 2714.1-2714.30: (5.5): AtomicIncAndDec.n failed Write-Read Right-Mover Check
// 2779.1-2779.34: (5.5): AtomicIncAndDec.n failed Write-Write Left-Mover Check
// 2841.1-2841.30: (5.5): AtomicIncAndDec.n failed Write-Read Left-Mover Check
// 2900.1-2900.34: (5.5): AtomicIncAndDec.n failed Read-Write Right-Mover Check
// 2962.1-2962.34: (5.5): AtomicIncAndDec.n failed Read-Write Left-Mover Check
// 3035.1-3035.140: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case A.1)
// 3036.1-3036.101: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case A.2)
// 3037.1-3037.158: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case A.3)
// 3136.1-3136.140: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case C)
// 3240.1-3240.144: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case D)
// 3241.1-3241.144: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case R)
// 3314.1-3314.136: (5.5): AtomicIncAndDec.n is not Read-Write Stable with respect to AtomicIncAndDec.n (case F)
// 3315.1-3315.136: (5.5): AtomicIncAndDec.n is not Read-Write Stable with respect to AtomicIncAndDec.n (case H)
// 3316.1-3316.146: (5.5): AtomicIncAndDec.n is not Read-Write Stable with respect to AtomicIncAndDec.n (case I)
// 3388.1-3388.136: (5.5): AtomicIncAndDec.n is not Write-Read Stable with respect to AtomicIncAndDec.n (case J)
// 3389.1-3389.136: (5.5): AtomicIncAndDec.n is not Write-Read Stable with respect to AtomicIncAndDec.n (case K)
// 3390.1-3390.99: (5.5): AtomicIncAndDec.n is not Write-Read Stable with respect to AtomicIncAndDec.n (case L)
// 3499.1-3499.142: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case M)
// 3606.1-3606.130: (5.5): AtomicIncAndDec.n is not Write-Write Stable with respect to AtomicIncAndDec.n (case N)
// 3640.1-3661.2: (5.5): yields_as clause for AtomicIncAndDec.n is not valid
// 3666.1-3682.2: (5.5): yields_as clause for AtomicIncAndDec.n is not reflexive
// 3688.1-3720.2: (5.5): yields_as clause for AtomicIncAndDec.n is not transitive
// 3740.1-3761.2: (7.32): yields_as clause for AtomicIncAndDec._lock is not valid
// 3766.1-3782.2: (7.32): yields_as clause for AtomicIncAndDec._lock is not reflexive
// 3788.1-3820.2: (7.32): yields_as clause for AtomicIncAndDec._lock is not transitive
