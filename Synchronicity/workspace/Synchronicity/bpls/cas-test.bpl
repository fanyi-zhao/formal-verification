                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-test.sink:                           
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
       int x N                                                                                      
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f1() {                                                                            
        this.x := 3;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        int y;                                                                                      
        y := this.x;                                                                                
        yield;                                                                                      
        int y2;                                                                                     
        y2 := this.x;                                                                               
        yield;                                                                                      
        boolean z;                                                                                  
        z = this.x@y :~ 0;                                                                          
        if (z) {                                                                                    
          assert y == y2;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
         return;                                                                                    
        // return;                                                                                  
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4b() {                                                                           
        int y;                                                                                      
        y := this.x;                                                                                
        yield;                                                                                      
        int y2;                                                                                     
        y2 := this.x;                                                                               
        yield;                                                                                      
        boolean z;                                                                                  
        z = this.x@y2 :~ 0;                                                                         
         return;                                                                                    
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      hasCASOperation int x N                                                                       
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid x_nextThread isLocal(this, tid)                                             
       ? B                                                                                          
       : this.x_nextThread == tid ? N : E                                                           
        yields_as this.x_nextThread == tid ==> newValue == tid;                                     
                                                                                                    
                                                                                                    
      updatesViaCAS int x_nextValue isLocal(this, tid)                                              
       ? B                                                                                          
       : this.x_nextThread == tid ? N : E                                                           
        yields_as this.x_nextThread == tid ==> newValue == this.x_nextValue;                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f1() {                                                                            
        {                                                                                           
          noop(TraceOff);                                                                           
          assume this.x_nextThread == tid;                                                          
          noop(TraceOn);                                                                            
          this.x := 3;                                                                              
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        int y;                                                                                      
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y := this.x  as R;                                                                      
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y := this.x;                                                                            
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        int y2;                                                                                     
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y2 := this.x  as R;                                                                     
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y2 := this.x;                                                                           
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        boolean z;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp686560;                                                                       
          ctmp686560 = *;                                                                           
          if (ctmp686560) {                                                                         
            noop(TraceOn);                                                                          
            z = false;                                                                              
          } else {                                                                                  
            ctmp686560 = *;                                                                         
            if (ctmp686560) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              assume this.x == y;                                                                   
              assume !goesWrong(_m);                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y;                                                         
              this.x_nextThread := tmpTid as B;                                                     
              this.x_nextValue := tmpValue as B;                                                    
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = true;                                                                             
            } else {                                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y;                                                         
              int _currentValue;                                                                    
              _currentValue := this.x  as B;                                                        
              this.x := y as B;                                                                     
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              this.x := _currentValue as B;                                                         
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        if (z) {                                                                                    
          assert y == y2;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4b() {                                                                           
        int y;                                                                                      
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y := this.x  as R;                                                                      
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y := this.x;                                                                            
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        int y2;                                                                                     
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y2 := this.x  as R;                                                                     
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y2 := this.x;                                                                           
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        boolean z;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp686600;                                                                       
          ctmp686600 = *;                                                                           
          if (ctmp686600) {                                                                         
            noop(TraceOn);                                                                          
            z = false;                                                                              
          } else {                                                                                  
            ctmp686600 = *;                                                                         
            if (ctmp686600) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              assume this.x == y2;                                                                  
              assume !goesWrong(_m);                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y2;                                                        
              this.x_nextThread := tmpTid as B;                                                     
              this.x_nextValue := tmpValue as B;                                                    
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = true;                                                                             
            } else {                                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y2;                                                        
              int _currentValue;                                                                    
              _currentValue := this.x  as B;                                                        
              this.x := y2 as B;                                                                    
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              this.x := _currentValue as B;                                                         
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      hasCASOperation int x N                                                                       
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid x_nextThread isLocal(this, tid)                                             
       ? B                                                                                          
       : this.x_nextThread == tid ? N : E                                                           
        yields_as this.x_nextThread == tid ==> newValue == tid;                                     
                                                                                                    
                                                                                                    
      updatesViaCAS int x_nextValue isLocal(this, tid)                                              
       ? B                                                                                          
       : this.x_nextThread == tid ? N : E                                                           
        yields_as this.x_nextThread == tid ==> newValue == this.x_nextValue;                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f1() {                                                                            
        {                                                                                           
          noop(TraceOff);                                                                           
          assume this.x_nextThread == tid;                                                          
          noop(TraceOn);                                                                            
          this.x := 3;                                                                              
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        int y;                                                                                      
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y := this.x  as R;                                                                      
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y := this.x;                                                                            
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        int y2;                                                                                     
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y2 := this.x  as R;                                                                     
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y2 := this.x;                                                                           
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        boolean z;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp686560;                                                                       
          ctmp686560 = *;                                                                           
          if (ctmp686560) {                                                                         
            noop(TraceOn);                                                                          
            z = false;                                                                              
          } else {                                                                                  
            ctmp686560 = *;                                                                         
            if (ctmp686560) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              assume this.x == y;                                                                   
              assume !goesWrong(_m);                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y;                                                         
              this.x_nextThread := tmpTid as B;                                                     
              this.x_nextValue := tmpValue as B;                                                    
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = true;                                                                             
            } else {                                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y;                                                         
              int _currentValue;                                                                    
              _currentValue := this.x  as B;                                                        
              this.x := y as B;                                                                     
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              this.x := _currentValue as B;                                                         
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        if (z) {                                                                                    
          assert y == y2;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4b() {                                                                           
        int y;                                                                                      
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y := this.x  as R;                                                                      
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y := this.x;                                                                            
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        int y2;                                                                                     
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y2 := this.x  as R;                                                                     
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y2 := this.x;                                                                           
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        boolean z;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp686600;                                                                       
          ctmp686600 = *;                                                                           
          if (ctmp686600) {                                                                         
            noop(TraceOn);                                                                          
            z = false;                                                                              
          } else {                                                                                  
            ctmp686600 = *;                                                                         
            if (ctmp686600) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              assume this.x == y2;                                                                  
              assume !goesWrong(_m);                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y2;                                                        
              this.x_nextThread := tmpTid as B;                                                     
              this.x_nextValue := tmpValue as B;                                                    
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = true;                                                                             
            } else {                                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y2;                                                        
              int _currentValue;                                                                    
              _currentValue := this.x  as B;                                                        
              this.x := y2 as B;                                                                    
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              this.x := _currentValue as B;                                                         
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class C {                                                                                       
      hasCASOperation int x N                                                                       
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid x_nextThread isLocal(this, tid)                                             
       ? B                                                                                          
       : this.x_nextThread == tid ? N : E                                                           
        yields_as this.x_nextThread == tid ==> newValue == tid;                                     
                                                                                                    
                                                                                                    
      updatesViaCAS int x_nextValue isLocal(this, tid)                                              
       ? B                                                                                          
       : this.x_nextThread == tid ? N : E                                                           
        yields_as this.x_nextThread == tid ==> newValue == this.x_nextValue;                        
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f1() {                                                                            
        {                                                                                           
          noop(TraceOff);                                                                           
          assume this.x_nextThread == tid;                                                          
          noop(TraceOn);                                                                            
          this.x := 3;                                                                              
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4() {                                                                            
        int y;                                                                                      
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y := this.x  as R;                                                                      
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y := this.x;                                                                            
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        int y2;                                                                                     
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y2 := this.x  as R;                                                                     
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y2 := this.x;                                                                           
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        boolean z;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp686560;                                                                       
          ctmp686560 = *;                                                                           
          if (ctmp686560) {                                                                         
            noop(TraceOn);                                                                          
            z = false;                                                                              
          } else {                                                                                  
            ctmp686560 = *;                                                                         
            if (ctmp686560) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              assume this.x == y;                                                                   
              assume !goesWrong(_m);                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y;                                                         
              this.x_nextThread := tmpTid as B;                                                     
              this.x_nextValue := tmpValue as B;                                                    
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = true;                                                                             
            } else {                                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y;                                                         
              int _currentValue;                                                                    
              _currentValue := this.x  as B;                                                        
              this.x := y as B;                                                                     
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              this.x := _currentValue as B;                                                         
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        if (z) {                                                                                    
          assert y == y2;                                                                           
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        {                                                                                           
           return;                                                                                  
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f4b() {                                                                           
        int y;                                                                                      
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y := this.x  as R;                                                                      
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y := this.x;                                                                            
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        int y2;                                                                                     
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.x_nextThread  as B;                                                          
          int _C_v;                                                                                 
          _C_v := this.x_nextValue  as B;                                                           
          int _currentValue;                                                                        
          _currentValue := this.x  as B;                                                            
          Mover _R_t;                                                                               
          _R_t = readPermission(this.x);                                                            
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            y2 := this.x  as R;                                                                     
          } else {                                                                                  
            noop(TraceOn);                                                                          
            y2 := this.x;                                                                           
          }                                                                                         
        }                                                                                           
        yield;                                                                                      
        boolean z;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp686600;                                                                       
          ctmp686600 = *;                                                                           
          if (ctmp686600) {                                                                         
            noop(TraceOn);                                                                          
            z = false;                                                                              
          } else {                                                                                  
            ctmp686600 = *;                                                                         
            if (ctmp686600) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              assume this.x == y2;                                                                  
              assume !goesWrong(_m);                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y2;                                                        
              this.x_nextThread := tmpTid as B;                                                     
              this.x_nextValue := tmpValue as B;                                                    
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = true;                                                                             
            } else {                                                                                
              assume this.x_nextThread == tid;                                                      
              assume this.x_nextValue == y2;                                                        
              int _currentValue;                                                                    
              _currentValue := this.x  as B;                                                        
              this.x := y2 as B;                                                                    
              Mover _m;                                                                             
              _m = writePermission(this.x, 0);                                                      
              this.x := _currentValue as B;                                                         
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.x := 0;                                                                          
              z = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return;                                                                                  
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
                                                                                                    
                                                                                                    
/*** Class Decl C ***/                                                                              
                                                                                                    
type C;                                                                                             
const unique C.null: C;                                                                             
var C._state: [C]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var C.x: [C]int;                                                                                    
                                                                                                    
function {:inline} ReadEval.C.x(tid: Tid,this : C,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.C.x(tid: Tid,this : C,newValue: int,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var C._lock: [C]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.C._lock(tid: Tid,this : C,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(C._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((C._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((C._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((C._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.C._lock(tid: Tid,this : C,newValue: Tid,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(C._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((C._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((C._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((C._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var C.x_nextThread: [C]Tid;                                                                         
                                                                                                    
function {:inline} ReadEval.C.x_nextThread(tid: Tid,this : C,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(C._state[this], tid)) then                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((C.x_nextThread[this]==tid)) then                                                             
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.C.x_nextThread(tid: Tid,this : C,newValue: Tid,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(C._state[this], tid)) then                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((C.x_nextThread[this]==tid)) then                                                             
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var C.x_nextValue: [C]int;                                                                          
                                                                                                    
function {:inline} ReadEval.C.x_nextValue(tid: Tid,this : C,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(C._state[this], tid)) then                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((C.x_nextThread[this]==tid)) then                                                             
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.C.x_nextValue(tid: Tid,this : C,newValue: int,C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(C._state[this], tid)) then                                                             
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((C.x_nextThread[this]==tid)) then                                                             
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  C.f1(tid:Tid, this : C)                                                                  
modifies C._state;                                                                                  
modifies C.x;                                                                                       
modifies C._lock;                                                                                   
modifies C.x_nextThread;                                                                            
modifies C.x_nextValue;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (5.3): Bad tid
requires isShared(C._state[this]);                                                                         // (5.3): this is not global
                                                                                                    
requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                     
                                                                                                    
ensures StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                      
{                                                                                                   
 var this691960: C;                                                                                 
 var C.x691958: [C]int;                                                                             
 var C.x_nextThread691958: [C]Tid;                                                                  
 var tid691958: Tid;                                                                                
 var C._lock691958: [C]Tid;                                                                         
 var C._state691958: [C]State;                                                                      
 var this691958: C;                                                                                 
 var C.x_nextValue691958: [C]int;                                                                   
 var C._state691960: [C]State;                                                                      
 var moverPath691958: MoverPath;                                                                    
 var $recorded.state691960: int;                                                                    
 var path691958: int;                                                                               
 var mover691958: Mover;                                                                            
 var C.x691960: [C]int;                                                                             
 var $pc691960: Phase;                                                                              
 var C.x_nextThread691960: [C]Tid;                                                                  
 var $recorded.state691958: int;                                                                    
 var C.x_nextValue691960: [C]int;                                                                   
 var C._lock691960: [C]Tid;                                                                         
 var $pc691958: Phase;                                                                              
 var tid691960: Tid;                                                                                
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 6.5: assume this.x_nextThread == tid;                                                           
                                                                                                    
 assume (C.x_nextThread[this]==tid);                                                                
 // NoOp: 'TraceOn'                                                                                 
                                                                                                    
                                                                                                    
 // 6.5: this.x := 3;                                                                               
                                                                                                    
                                                                                                    
 moverPath691958 := WriteEval.C.x(tid: Tid,this: C,3: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover691958 := m#moverPath(moverPath691958);                                                       
 path691958 := p#moverPath(moverPath691958);                                                        
 assume C._state691958 == C._state && C.x691958 == C.x && C._lock691958 == C._lock && C.x_nextThread691958 == C.x_nextThread && C.x_nextValue691958 == C.x_nextValue && this691958 == this && tid691958 == tid && $pc691958 == $pc;
 assume $recorded.state691958 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (6.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover691958);                                                               
 assert $pc != PhaseError;                                                                                 // (6.5): Reduction failure
 C.x[this] := 3;                                                                                    
                                                                                                    
 // 5.20: // return;                                                                                
                                                                                                    
 assume C._state691960 == C._state && C.x691960 == C.x && C._lock691960 == C._lock && C.x_nextThread691960 == C.x_nextThread && C.x_nextValue691960 == C.x_nextValue && this691960 == this && tid691960 == tid;
 assume $recorded.state691960 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  C.f4(tid:Tid, this : C)                                                                  
modifies C._state;                                                                                  
modifies C.x;                                                                                       
modifies C._lock;                                                                                   
modifies C.x_nextThread;                                                                            
modifies C.x_nextValue;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (9.3): Bad tid
requires isShared(C._state[this]);                                                                         // (9.3): this is not global
                                                                                                    
requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                     
                                                                                                    
ensures StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                      
{                                                                                                   
 var _R_t692028: Mover;                                                                             
 var z692165: bool;                                                                                 
 var C.x692032_post: [C]int;                                                                        
 var $recorded.state692032_post: int;                                                               
 var _C_v692054: int;                                                                               
 var _casable692097: bool;                                                                          
 var y2692165: int;                                                                                 
 var $pc691985: Phase;                                                                              
 var y2692048: int;                                                                                 
 var C.x_nextThread692101_post: [C]Tid;                                                             
 var _currentValue: int;                                                                            
 var _R_t692092: Mover;                                                                             
 var mover691985: Mover;                                                                            
 var tid692048: Tid;                                                                                
 var y691985: int;                                                                                  
 var tid692028: Tid;                                                                                
 var C.x_nextValue692235: [C]int;                                                                   
 var C.x_nextValue692217: [C]int;                                                                   
 var C._lock692193: [C]Tid;                                                                         
 var $pc692162: Phase;                                                                              
 var _C_t692028: Tid;                                                                               
 var tid692101: Tid;                                                                                
 var tid692209: Tid;                                                                                
 var _C_t: Tid;                                                                                     
 var C._lock691979: [C]Tid;                                                                         
 var C._state692042: [C]State;                                                                      
 var C.x692217: [C]int;                                                                             
 var moverPath692028: MoverPath;                                                                    
 var this692170: C;                                                                                 
 var ctmp686560692165: bool;                                                                        
 var tid692165: Tid;                                                                                
 var C.x_nextValue692032: [C]int;                                                                   
 var C.x692092: [C]int;                                                                             
 var this692209: C;                                                                                 
 var C.x_nextThread692092: [C]Tid;                                                                  
 var C.x692101: [C]int;                                                                             
 var C.x_nextValue692231: [C]int;                                                                   
 var $recorded.state692170: int;                                                                    
 var C.x692097: [C]int;                                                                             
 var z692217: bool;                                                                                 
 var C.x692196: [C]int;                                                                             
 var _casable: bool;                                                                                
 var this692235: C;                                                                                 
 var _currentValue692193: int;                                                                      
 var C.x692237: [C]int;                                                                             
 var y2692196: int;                                                                                 
 var y2692217: int;                                                                                 
 var $pc692048: Phase;                                                                              
 var C._state691985: [C]State;                                                                      
 var C._lock692231: [C]Tid;                                                                         
 var y2692237: int;                                                                                 
 var C.x_nextValue692101_post: [C]int;                                                              
 var _C_v691985: int;                                                                               
 var C.x_nextThread692101: [C]Tid;                                                                  
 var mover692170: Mover;                                                                            
 var $pc692193: Phase;                                                                              
 var moverPath692092: MoverPath;                                                                    
 var path692209: int;                                                                               
 var $recorded.state692165: int;                                                                    
 var _C_t691985: Tid;                                                                               
 var y692101_post: int;                                                                             
 var $pc692231: Phase;                                                                              
 var moverPath692209: MoverPath;                                                                    
 var tid692032: Tid;                                                                                
 var tid692196: Tid;                                                                                
 var C._lock692165: [C]Tid;                                                                         
 var ctmp686560692162: bool;                                                                        
 var y691979: int;                                                                                  
 var z692193: bool;                                                                                 
 var $recorded.state692217: int;                                                                    
 var this692231: C;                                                                                 
 var $recorded.state692231: int;                                                                    
 var C._lock691973: [C]Tid;                                                                         
 var C.x_nextValue692042: [C]int;                                                                   
 var tmpValue: int;                                                                                 
 var C.x692170: [C]int;                                                                             
 var mover692162: Mover;                                                                            
 var C.x692193: [C]int;                                                                             
 var ctmp686560692196: bool;                                                                        
 var C.x_nextValue692237: [C]int;                                                                   
 var y2692101_post: int;                                                                            
 var $pc692092: Phase;                                                                              
 var _C_v692097: int;                                                                               
 var tid691979: Tid;                                                                                
 var mover692042: Mover;                                                                            
 var _m692217: Mover;                                                                               
 var this692032_post: C;                                                                            
 var $recorded.state692196: int;                                                                    
 var path692048: int;                                                                               
 var this692196: C;                                                                                 
 var mover691973: Mover;                                                                            
 var C.x692162: [C]int;                                                                             
 var C.x692235: [C]int;                                                                             
 var _casable692023: bool;                                                                          
 var C.x_nextValue692170: [C]int;                                                                   
 var C._lock692054: [C]Tid;                                                                         
 var C._state692101: [C]State;                                                                      
 var C.x_nextThread692209: [C]Tid;                                                                  
 var C.x692023: [C]int;                                                                             
 var path692042: int;                                                                               
 var $recorded.state691973: int;                                                                    
 var y692196: int;                                                                                  
 var _currentValue692054: int;                                                                      
 var $pc692028: Phase;                                                                              
 var tid692092: Tid;                                                                                
 var C.x_nextThread692196: [C]Tid;                                                                  
 var C.x_nextThread692097: [C]Tid;                                                                  
 var path692170: int;                                                                               
 var C._state692196: [C]State;                                                                      
 var C._state692028: [C]State;                                                                      
 var y692092: int;                                                                                  
 var _C_t692054: Tid;                                                                               
 var _currentValue692092: int;                                                                      
 var path692097: int;                                                                               
 var tmpTid692162: Tid;                                                                             
 var $pc692170: Phase;                                                                              
 var tid691973: Tid;                                                                                
 var z692196: bool;                                                                                 
 var C.x_nextValue692165: [C]int;                                                                   
 var $recorded.state692054: int;                                                                    
 var C._lock692032: [C]Tid;                                                                         
 var _m692209: Mover;                                                                               
 var moverPath692048: MoverPath;                                                                    
 var this692028: C;                                                                                 
 var _C_v: int;                                                                                     
 var y692042: int;                                                                                  
 var _R_t692097: Mover;                                                                             
 var C._lock692097: [C]Tid;                                                                         
 var moverPath691985: MoverPath;                                                                    
 var C.x_nextThread692054: [C]Tid;                                                                  
 var ctmp686560: bool;                                                                              
 var this692101_post: C;                                                                            
 var this692048: C;                                                                                 
 var tmpValue692165: int;                                                                           
 var _R_t692023: Mover;                                                                             
 var C.x_nextValue691985: [C]int;                                                                   
 var y692032_post: int;                                                                             
 var $pc691973: Phase;                                                                              
 var path692028: int;                                                                               
 var $pc692235: Phase;                                                                              
 var _m692165: Mover;                                                                               
 var mover692209: Mover;                                                                            
 var C._lock692101: [C]Tid;                                                                         
 var this692101: C;                                                                                 
 var path692162: int;                                                                               
 var mover692023: Mover;                                                                            
 var tmpTid692170: Tid;                                                                             
 var y2692101: int;                                                                                 
 var C._lock692042: [C]Tid;                                                                         
 var _currentValue692217: int;                                                                      
 var y2692162: int;                                                                                 
 var C._lock692209: [C]Tid;                                                                         
 var C.x_nextThread691973: [C]Tid;                                                                  
 var path691979: int;                                                                               
 var path691985: int;                                                                               
 var path692217: int;                                                                               
 var moverPath692193: MoverPath;                                                                    
 var y692097: int;                                                                                  
 var C._state692048: [C]State;                                                                      
 var this692097: C;                                                                                 
 var $pc692032_post: Phase;                                                                         
 var tid692042: Tid;                                                                                
 var y692023: int;                                                                                  
 var C._lock692092: [C]Tid;                                                                         
 var C._lock692048: [C]Tid;                                                                         
 var y692237: int;                                                                                  
 var C._lock691985: [C]Tid;                                                                         
 var y692162: int;                                                                                  
 var $pc692237: Phase;                                                                              
 var C._state692237: [C]State;                                                                      
 var tid692097: Tid;                                                                                
 var C._lock692101_post: [C]Tid;                                                                    
 var tid692170: Tid;                                                                                
 var path692092: int;                                                                               
 var C.x_nextThread692231: [C]Tid;                                                                  
 var C._state692170: [C]State;                                                                      
 var _m692170: Mover;                                                                               
 var C.x692231: [C]int;                                                                             
 var path691973: int;                                                                               
 var C.x_nextValue692092: [C]int;                                                                   
 var $recorded.state692209: int;                                                                    
 var mover692048: Mover;                                                                            
 var C.x692165: [C]int;                                                                             
 var C.x692032: [C]int;                                                                             
 var ctmp686560692217: bool;                                                                        
 var C.x_nextValue692101: [C]int;                                                                   
 var this692042: C;                                                                                 
 var y2692193: int;                                                                                 
 var y692101: int;                                                                                  
 var $recorded.state691979: int;                                                                    
 var this691973: C;                                                                                 
 var moverPath692196: MoverPath;                                                                    
 var C._lock692162: [C]Tid;                                                                         
 var moverPath692042: MoverPath;                                                                    
 var _C_t691979: Tid;                                                                               
 var C.x_nextValue692162: [C]int;                                                                   
 var C._state692231: [C]State;                                                                      
 var C._state692217: [C]State;                                                                      
 var mover692196: Mover;                                                                            
 var _C_t692092: Tid;                                                                               
 var C._lock692023: [C]Tid;                                                                         
 var $recorded.state692101_post: int;                                                               
 var y2692170: int;                                                                                 
 var C._lock692028: [C]Tid;                                                                         
 var $recorded.state691985: int;                                                                    
 var y2692231: int;                                                                                 
 var _C_v692092: int;                                                                               
 var $recorded.state692042: int;                                                                    
 var $pc692196: Phase;                                                                              
 var moverPath692170: MoverPath;                                                                    
 var y2692054: int;                                                                                 
 var y2692042: int;                                                                                 
 var mover692165: Mover;                                                                            
 var C.x_nextThread692042: [C]Tid;                                                                  
 var C.x_nextValue692196: [C]int;                                                                   
 var C.x692209: [C]int;                                                                             
 var C.x_nextThread692235: [C]Tid;                                                                  
 var tmpValue692170: int;                                                                           
 var mover692028: Mover;                                                                            
 var tid692217: Tid;                                                                                
 var tid691985: Tid;                                                                                
 var y: int;                                                                                        
 var tid692193: Tid;                                                                                
 var C.x_nextThread692028: [C]Tid;                                                                  
 var C._state692023: [C]State;                                                                      
 var C.x_nextValue692032_post: [C]int;                                                              
 var y2692092: int;                                                                                 
 var moverPath692023: MoverPath;                                                                    
 var this692032: C;                                                                                 
 var y692032: int;                                                                                  
 var C.x692048: [C]int;                                                                             
 var mover692054: Mover;                                                                            
 var $recorded.state692023: int;                                                                    
 var ctmp686560692170: bool;                                                                        
 var $pc692023: Phase;                                                                              
 var y2692209: int;                                                                                 
 var y2692235: int;                                                                                 
 var tmpValue692162: int;                                                                           
 var C._state692162: [C]State;                                                                      
 var _R_t: Mover;                                                                                   
 var this691985: C;                                                                                 
 var _currentValue691985: int;                                                                      
 var C._lock692237: [C]Tid;                                                                         
 var _C_v692023: int;                                                                               
 var $pc692032: Phase;                                                                              
 var moverPath691979: MoverPath;                                                                    
 var C._state692101_post: [C]State;                                                                 
 var ctmp686560692209: bool;                                                                        
 var C._state691979: [C]State;                                                                      
 var y2: int;                                                                                       
 var y692048: int;                                                                                  
 var C.x692042: [C]int;                                                                             
 var C._lock692170: [C]Tid;                                                                         
 var _m: Mover;                                                                                     
 var C._state692209: [C]State;                                                                      
 var y692217: int;                                                                                  
 var _currentValue692028: int;                                                                      
 var ctmp686560692193: bool;                                                                        
 var C.x_nextThread692237: [C]Tid;                                                                  
 var $pc692209: Phase;                                                                              
 var $pc692101: Phase;                                                                              
 var C._lock692217: [C]Tid;                                                                         
 var $recorded.state692092: int;                                                                    
 var mover692097: Mover;                                                                            
 var C.x_nextThread692032: [C]Tid;                                                                  
 var y692170: int;                                                                                  
 var C.x_nextValue692097: [C]int;                                                                   
 var C.x691979: [C]int;                                                                             
 var z692235: bool;                                                                                 
 var _C_v691979: int;                                                                               
 var tid692101_post: Tid;                                                                           
 var C.x692101_post: [C]int;                                                                        
 var tid692231: Tid;                                                                                
 var z692162: bool;                                                                                 
 var path692196: int;                                                                               
 var C.x_nextThread692165: [C]Tid;                                                                  
 var C.x691985: [C]int;                                                                             
 var $recorded.state692193: int;                                                                    
 var moverPath692162: MoverPath;                                                                    
 var C._lock692196: [C]Tid;                                                                         
 var C._state692097: [C]State;                                                                      
 var _currentValue692196: int;                                                                      
 var tid692054: Tid;                                                                                
 var $pc692042: Phase;                                                                              
 var C._lock692032_post: [C]Tid;                                                                    
 var _C_v692028: int;                                                                               
 var C._state692032: [C]State;                                                                      
 var this692092: C;                                                                                 
 var $recorded.state692032: int;                                                                    
 var C.x_nextThread691979: [C]Tid;                                                                  
 var C.x_nextThread692162: [C]Tid;                                                                  
 var $pc692165: Phase;                                                                              
 var _casable692092: bool;                                                                          
 var y692193: int;                                                                                  
 var C.x_nextValue691979: [C]int;                                                                   
 var $recorded.state692237: int;                                                                    
 var C._state692054: [C]State;                                                                      
 var _C_t692097: Tid;                                                                               
 var $recorded.state692101: int;                                                                    
 var y691973: int;                                                                                  
 var C._state692193: [C]State;                                                                      
 var tmpTid: Tid;                                                                                   
 var this692162: C;                                                                                 
 var C.x_nextValue691973: [C]int;                                                                   
 var tid692235: Tid;                                                                                
 var C.x_nextValue692023: [C]int;                                                                   
 var C.x_nextThread692217: [C]Tid;                                                                  
 var C.x_nextThread692193: [C]Tid;                                                                  
 var _currentValue692209: int;                                                                      
 var C._state691973: [C]State;                                                                      
 var $pc692101_post: Phase;                                                                         
 var z692209: bool;                                                                                 
 var mover692193: Mover;                                                                            
 var $pc691979: Phase;                                                                              
 var $recorded.state692097: int;                                                                    
 var $pc692217: Phase;                                                                              
 var $pc692097: Phase;                                                                              
 var C.x691973: [C]int;                                                                             
 var C._lock692235: [C]Tid;                                                                         
 var C.x_nextThread692048: [C]Tid;                                                                  
 var C.x_nextValue692048: [C]int;                                                                   
 var z: bool;                                                                                       
 var _m692162: Mover;                                                                               
 var z692170: bool;                                                                                 
 var $recorded.state692235: int;                                                                    
 var moverPath691973: MoverPath;                                                                    
 var mover692217: Mover;                                                                            
 var z692237: bool;                                                                                 
 var moverPath692165: MoverPath;                                                                    
 var C._state692092: [C]State;                                                                      
 var this692193: C;                                                                                 
 var C.x_nextValue692193: [C]int;                                                                   
 var y692235: int;                                                                                  
 var y692209: int;                                                                                  
 var tid692023: Tid;                                                                                
 var this692054: C;                                                                                 
 var _C_v692048: int;                                                                               
 var path692193: int;                                                                               
 var _C_t691973: Tid;                                                                               
 var $recorded.state692162: int;                                                                    
 var _C_t692023: Tid;                                                                               
 var path692023: int;                                                                               
 var C.x_nextValue692054: [C]int;                                                                   
 var C.x_nextThread691985: [C]Tid;                                                                  
 var _currentValue692097: int;                                                                      
 var _C_t692042: Tid;                                                                               
 var C._state692165: [C]State;                                                                      
 var C.x_nextThread692023: [C]Tid;                                                                  
 var moverPath692097: MoverPath;                                                                    
 var tid692162: Tid;                                                                                
 var C.x_nextThread692170: [C]Tid;                                                                  
 var C._state692032_post: [C]State;                                                                 
 var mover692092: Mover;                                                                            
 var this691979: C;                                                                                 
 var _C_t692048: Tid;                                                                               
 var C.x_nextThread692032_post: [C]Tid;                                                             
 var C._state692235: [C]State;                                                                      
 var _casable692028: bool;                                                                          
 var path692165: int;                                                                               
 var tid692032_post: Tid;                                                                           
 var this692237: C;                                                                                 
 var this692165: C;                                                                                 
 var y692028: int;                                                                                  
 var C.x_nextValue692028: [C]int;                                                                   
 var C.x692054: [C]int;                                                                             
 var this692023: C;                                                                                 
 var moverPath692054: MoverPath;                                                                    
 var this692217: C;                                                                                 
 var $recorded.state692028: int;                                                                    
 var C.x692028: [C]int;                                                                             
 var _currentValue692023: int;                                                                      
 var tmpTid692165: Tid;                                                                             
 var z692231: bool;                                                                                 
 var mover691979: Mover;                                                                            
 var $pc692054: Phase;                                                                              
 var tid692237: Tid;                                                                                
 var moverPath692217: MoverPath;                                                                    
 var path692054: int;                                                                               
 var $recorded.state692048: int;                                                                    
 var y2692097: int;                                                                                 
 var y692054: int;                                                                                  
 var y692165: int;                                                                                  
 var y692231: int;                                                                                  
 var C.x_nextValue692209: [C]int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 10.5: int y;                                                                                    
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 10.5: Tid _C_t;                                                                                 
                                                                                                    
                                                                                                    
 // 10.5: _C_t := this.x_nextThread  as B;                                                          
                                                                                                    
                                                                                                    
 moverPath691973 := ReadEval.C.x_nextThread(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover691973 := m#moverPath(moverPath691973);                                                       
 path691973 := p#moverPath(moverPath691973);                                                        
 assume C._state691973 == C._state && C.x691973 == C.x && C._lock691973 == C._lock && C.x_nextThread691973 == C.x_nextThread && C.x_nextValue691973 == C.x_nextValue && _C_t691973 == _C_t && y691973 == y && this691973 == this && tid691973 == tid && $pc691973 == $pc;
 assume $recorded.state691973 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (10.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.5): Reduction failure
 _C_t := C.x_nextThread[this];                                                                      
                                                                                                    
 // 10.5: int _C_v;                                                                                 
                                                                                                    
                                                                                                    
 // 10.5: _C_v := this.x_nextValue  as B;                                                           
                                                                                                    
                                                                                                    
 moverPath691979 := ReadEval.C.x_nextValue(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover691979 := m#moverPath(moverPath691979);                                                       
 path691979 := p#moverPath(moverPath691979);                                                        
 assume C._state691979 == C._state && C.x691979 == C.x && C._lock691979 == C._lock && C.x_nextThread691979 == C.x_nextThread && C.x_nextValue691979 == C.x_nextValue && _C_v691979 == _C_v && _C_t691979 == _C_t && y691979 == y && this691979 == this && tid691979 == tid && $pc691979 == $pc;
 assume $recorded.state691979 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (10.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.5): Reduction failure
 _C_v := C.x_nextValue[this];                                                                       
                                                                                                    
 // 10.5: int _currentValue;                                                                        
                                                                                                    
                                                                                                    
 // 10.5: _currentValue := this.x  as B;                                                            
                                                                                                    
                                                                                                    
 moverPath691985 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover691985 := m#moverPath(moverPath691985);                                                       
 path691985 := p#moverPath(moverPath691985);                                                        
 assume C._state691985 == C._state && C.x691985 == C.x && C._lock691985 == C._lock && C.x_nextThread691985 == C.x_nextThread && C.x_nextValue691985 == C.x_nextValue && _currentValue691985 == _currentValue && _C_v691985 == _C_v && _C_t691985 == _C_t && y691985 == y && this691985 == this && tid691985 == tid && $pc691985 == $pc;
 assume $recorded.state691985 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (10.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.5): Reduction failure
 _currentValue := C.x[this];                                                                        
                                                                                                    
 // 10.5: Mover _R_t;                                                                               
                                                                                                    
                                                                                                    
 // 10.5: _R_t = readPermission(this.x);                                                            
                                                                                                    
 _R_t := m#moverPath(ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
 // 10.5: boolean _casable;                                                                         
                                                                                                    
                                                                                                    
 // 10.5: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
                                                                                                    
 _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                           
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 10.5: y := this.x  as R;                                                                       
                                                                                                    
                                                                                                    
  moverPath692023 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692023 := m#moverPath(moverPath692023);                                                      
  path692023 := p#moverPath(moverPath692023);                                                       
  assume C._state692023 == C._state && C.x692023 == C.x && C._lock692023 == C._lock && C.x_nextThread692023 == C.x_nextThread && C.x_nextValue692023 == C.x_nextValue && _casable692023 == _casable && _R_t692023 == _R_t && _currentValue692023 == _currentValue && _C_v692023 == _C_v && _C_t692023 == _C_t && y692023 == y && this692023 == this && tid692023 == tid && $pc692023 == $pc;
  assume $recorded.state692023 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (10.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (10.5): Reduction failure
  y := C.x[this];                                                                                   
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 10.5: y := this.x;                                                                             
                                                                                                    
                                                                                                    
  moverPath692028 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692028 := m#moverPath(moverPath692028);                                                      
  path692028 := p#moverPath(moverPath692028);                                                       
  assume C._state692028 == C._state && C.x692028 == C.x && C._lock692028 == C._lock && C.x_nextThread692028 == C.x_nextThread && C.x_nextValue692028 == C.x_nextValue && _casable692028 == _casable && _R_t692028 == _R_t && _currentValue692028 == _currentValue && _C_v692028 == _C_v && _C_t692028 == _C_t && y692028 == y && this692028 == this && tid692028 == tid && $pc692028 == $pc;
  assume $recorded.state692028 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (10.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover692028);                                                              
  assert $pc != PhaseError;                                                                                // (10.5): Reduction failure
  y := C.x[this];                                                                                   
 }                                                                                                  
                                                                                                    
 // 11.5: yield;                                                                                    
                                                                                                    
 assume C._state692032 == C._state && C.x692032 == C.x && C._lock692032 == C._lock && C.x_nextThread692032 == C.x_nextThread && C.x_nextValue692032 == C.x_nextValue && y692032 == y && this692032 == this && tid692032 == tid;
 assume $recorded.state692032 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume C._state692032_post == C._state && C.x692032_post == C.x && C._lock692032_post == C._lock && C.x_nextThread692032_post == C.x_nextThread && C.x_nextValue692032_post == C.x_nextValue && y692032_post == y && this692032_post == this && tid692032_post == tid;
 assume $recorded.state692032_post == 1;                                                            
                                                                                                    
 // 12.5: int y2;                                                                                   
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 12.5: Tid _C_t;                                                                                 
                                                                                                    
                                                                                                    
 // 12.5: _C_t := this.x_nextThread  as B;                                                          
                                                                                                    
                                                                                                    
 moverPath692042 := ReadEval.C.x_nextThread(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692042 := m#moverPath(moverPath692042);                                                       
 path692042 := p#moverPath(moverPath692042);                                                        
 assume C._state692042 == C._state && C.x692042 == C.x && C._lock692042 == C._lock && C.x_nextThread692042 == C.x_nextThread && C.x_nextValue692042 == C.x_nextValue && _C_t692042 == _C_t && y2692042 == y2 && y692042 == y && this692042 == this && tid692042 == tid && $pc692042 == $pc;
 assume $recorded.state692042 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (12.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (12.5): Reduction failure
 _C_t := C.x_nextThread[this];                                                                      
                                                                                                    
 // 12.5: int _C_v;                                                                                 
                                                                                                    
                                                                                                    
 // 12.5: _C_v := this.x_nextValue  as B;                                                           
                                                                                                    
                                                                                                    
 moverPath692048 := ReadEval.C.x_nextValue(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692048 := m#moverPath(moverPath692048);                                                       
 path692048 := p#moverPath(moverPath692048);                                                        
 assume C._state692048 == C._state && C.x692048 == C.x && C._lock692048 == C._lock && C.x_nextThread692048 == C.x_nextThread && C.x_nextValue692048 == C.x_nextValue && _C_v692048 == _C_v && _C_t692048 == _C_t && y2692048 == y2 && y692048 == y && this692048 == this && tid692048 == tid && $pc692048 == $pc;
 assume $recorded.state692048 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (12.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (12.5): Reduction failure
 _C_v := C.x_nextValue[this];                                                                       
                                                                                                    
 // 12.5: int _currentValue;                                                                        
                                                                                                    
                                                                                                    
 // 12.5: _currentValue := this.x  as B;                                                            
                                                                                                    
                                                                                                    
 moverPath692054 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692054 := m#moverPath(moverPath692054);                                                       
 path692054 := p#moverPath(moverPath692054);                                                        
 assume C._state692054 == C._state && C.x692054 == C.x && C._lock692054 == C._lock && C.x_nextThread692054 == C.x_nextThread && C.x_nextValue692054 == C.x_nextValue && _currentValue692054 == _currentValue && _C_v692054 == _C_v && _C_t692054 == _C_t && y2692054 == y2 && y692054 == y && this692054 == this && tid692054 == tid && $pc692054 == $pc;
 assume $recorded.state692054 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (12.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (12.5): Reduction failure
 _currentValue := C.x[this];                                                                        
                                                                                                    
 // 12.5: Mover _R_t;                                                                               
                                                                                                    
                                                                                                    
 // 12.5: _R_t = readPermission(this.x);                                                            
                                                                                                    
 _R_t := m#moverPath(ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
 // 12.5: boolean _casable;                                                                         
                                                                                                    
                                                                                                    
 // 12.5: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
                                                                                                    
 _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                           
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 12.5: y2 := this.x  as R;                                                                      
                                                                                                    
                                                                                                    
  moverPath692092 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692092 := m#moverPath(moverPath692092);                                                      
  path692092 := p#moverPath(moverPath692092);                                                       
  assume C._state692092 == C._state && C.x692092 == C.x && C._lock692092 == C._lock && C.x_nextThread692092 == C.x_nextThread && C.x_nextValue692092 == C.x_nextValue && _casable692092 == _casable && _R_t692092 == _R_t && _currentValue692092 == _currentValue && _C_v692092 == _C_v && _C_t692092 == _C_t && y2692092 == y2 && y692092 == y && this692092 == this && tid692092 == tid && $pc692092 == $pc;
  assume $recorded.state692092 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (12.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (12.5): Reduction failure
  y2 := C.x[this];                                                                                  
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 12.5: y2 := this.x;                                                                            
                                                                                                    
                                                                                                    
  moverPath692097 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692097 := m#moverPath(moverPath692097);                                                      
  path692097 := p#moverPath(moverPath692097);                                                       
  assume C._state692097 == C._state && C.x692097 == C.x && C._lock692097 == C._lock && C.x_nextThread692097 == C.x_nextThread && C.x_nextValue692097 == C.x_nextValue && _casable692097 == _casable && _R_t692097 == _R_t && _currentValue692097 == _currentValue && _C_v692097 == _C_v && _C_t692097 == _C_t && y2692097 == y2 && y692097 == y && this692097 == this && tid692097 == tid && $pc692097 == $pc;
  assume $recorded.state692097 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (12.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover692097);                                                              
  assert $pc != PhaseError;                                                                                // (12.5): Reduction failure
  y2 := C.x[this];                                                                                  
 }                                                                                                  
                                                                                                    
 // 13.5: yield;                                                                                    
                                                                                                    
 assume C._state692101 == C._state && C.x692101 == C.x && C._lock692101 == C._lock && C.x_nextThread692101 == C.x_nextThread && C.x_nextValue692101 == C.x_nextValue && y2692101 == y2 && y692101 == y && this692101 == this && tid692101 == tid;
 assume $recorded.state692101 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume C._state692101_post == C._state && C.x692101_post == C.x && C._lock692101_post == C._lock && C.x_nextThread692101_post == C.x_nextThread && C.x_nextValue692101_post == C.x_nextValue && y2692101_post == y2 && y692101_post == y && this692101_post == this && tid692101_post == tid;
 assume $recorded.state692101_post == 1;                                                            
                                                                                                    
 // 14.5: boolean z;                                                                                
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 14.5: boolean ctmp686560;                                                                       
                                                                                                    
                                                                                                    
 // 14.5: ctmp686560 = *;                                                                           
                                                                                                    
 havoc ctmp686560;                                                                                  
 if (ctmp686560) {                                                                                  
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 14.5: z = false;                                                                               
                                                                                                    
  z := false;                                                                                       
 } else {                                                                                           
                                                                                                    
  // 14.5: ctmp686560 = *;                                                                          
                                                                                                    
  havoc ctmp686560;                                                                                 
  if (ctmp686560) {                                                                                 
                                                                                                    
   // 14.5: Tid tmpTid;                                                                             
                                                                                                    
                                                                                                    
   // 14.5: int tmpValue;                                                                           
                                                                                                    
                                                                                                    
   // 14.5: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 14.5: _m = writePermission(this.x, 0);                                                        
                                                                                                    
   _m := m#moverPath(WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
   // 14.5: assume this.x == y;                                                                     
                                                                                                    
   assume (C.x[this]==y);                                                                           
                                                                                                    
   // 14.5: assume !goesWrong(_m);                                                                  
                                                                                                    
   assume !(transition($pc, _m) == PhaseError);                                                     
                                                                                                    
   // 14.5: assume this.x_nextThread == tid;                                                        
                                                                                                    
   assume (C.x_nextThread[this]==tid);                                                              
                                                                                                    
   // 14.5: assume this.x_nextValue == y;                                                           
                                                                                                    
   assume (C.x_nextValue[this]==y);                                                                 
                                                                                                    
                                                                                                    
   // 14.5: this.x_nextThread := tmpTid as B;                                                       
                                                                                                    
                                                                                                    
   moverPath692162 := WriteEval.C.x_nextThread(tid: Tid,this: C,tmpTid: Tid,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692162 := m#moverPath(moverPath692162);                                                     
   path692162 := p#moverPath(moverPath692162);                                                      
   assume C._state692162 == C._state && C.x692162 == C.x && C._lock692162 == C._lock && C.x_nextThread692162 == C.x_nextThread && C.x_nextValue692162 == C.x_nextValue && _m692162 == _m && tmpValue692162 == tmpValue && tmpTid692162 == tmpTid && ctmp686560692162 == ctmp686560 && z692162 == z && y2692162 == y2 && y692162 == y && this692162 == this && tid692162 == tid && $pc692162 == $pc;
   assume $recorded.state692162 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   C.x_nextThread[this] := tmpTid;                                                                  
                                                                                                    
                                                                                                    
   // 14.5: this.x_nextValue := tmpValue as B;                                                      
                                                                                                    
                                                                                                    
   moverPath692165 := WriteEval.C.x_nextValue(tid: Tid,this: C,tmpValue: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692165 := m#moverPath(moverPath692165);                                                     
   path692165 := p#moverPath(moverPath692165);                                                      
   assume C._state692165 == C._state && C.x692165 == C.x && C._lock692165 == C._lock && C.x_nextThread692165 == C.x_nextThread && C.x_nextValue692165 == C.x_nextValue && _m692165 == _m && tmpValue692165 == tmpValue && tmpTid692165 == tmpTid && ctmp686560692165 == ctmp686560 && z692165 == z && y2692165 == y2 && y692165 == y && this692165 == this && tid692165 == tid && $pc692165 == $pc;
   assume $recorded.state692165 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   C.x_nextValue[this] := tmpValue;                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 14.5: this.x := 0;                                                                            
                                                                                                    
                                                                                                    
   moverPath692170 := WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692170 := m#moverPath(moverPath692170);                                                     
   path692170 := p#moverPath(moverPath692170);                                                      
   assume C._state692170 == C._state && C.x692170 == C.x && C._lock692170 == C._lock && C.x_nextThread692170 == C.x_nextThread && C.x_nextValue692170 == C.x_nextValue && _m692170 == _m && tmpValue692170 == tmpValue && tmpTid692170 == tmpTid && ctmp686560692170 == ctmp686560 && z692170 == z && y2692170 == y2 && y692170 == y && this692170 == this && tid692170 == tid && $pc692170 == $pc;
   assume $recorded.state692170 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover692170);                                                             
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   C.x[this] := 0;                                                                                  
                                                                                                    
   // 14.5: z = true;                                                                               
                                                                                                    
   z := true;                                                                                       
  } else {                                                                                          
                                                                                                    
   // 14.5: assume this.x_nextThread == tid;                                                        
                                                                                                    
   assume (C.x_nextThread[this]==tid);                                                              
                                                                                                    
   // 14.5: assume this.x_nextValue == y;                                                           
                                                                                                    
   assume (C.x_nextValue[this]==y);                                                                 
                                                                                                    
   // 14.5: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
   // 14.5: _currentValue := this.x  as B;                                                          
                                                                                                    
                                                                                                    
   moverPath692193 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692193 := m#moverPath(moverPath692193);                                                     
   path692193 := p#moverPath(moverPath692193);                                                      
   assume C._state692193 == C._state && C.x692193 == C.x && C._lock692193 == C._lock && C.x_nextThread692193 == C.x_nextThread && C.x_nextValue692193 == C.x_nextValue && _currentValue692193 == _currentValue && ctmp686560692193 == ctmp686560 && z692193 == z && y2692193 == y2 && y692193 == y && this692193 == this && tid692193 == tid && $pc692193 == $pc;
   assume $recorded.state692193 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   _currentValue := C.x[this];                                                                      
                                                                                                    
                                                                                                    
   // 14.5: this.x := y as B;                                                                       
                                                                                                    
                                                                                                    
   moverPath692196 := WriteEval.C.x(tid: Tid,this: C,y: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692196 := m#moverPath(moverPath692196);                                                     
   path692196 := p#moverPath(moverPath692196);                                                      
   assume C._state692196 == C._state && C.x692196 == C.x && C._lock692196 == C._lock && C.x_nextThread692196 == C.x_nextThread && C.x_nextValue692196 == C.x_nextValue && _currentValue692196 == _currentValue && ctmp686560692196 == ctmp686560 && z692196 == z && y2692196 == y2 && y692196 == y && this692196 == this && tid692196 == tid && $pc692196 == $pc;
   assume $recorded.state692196 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   C.x[this] := y;                                                                                  
                                                                                                    
   // 14.5: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 14.5: _m = writePermission(this.x, 0);                                                        
                                                                                                    
   _m := m#moverPath(WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
                                                                                                    
   // 14.5: this.x := _currentValue as B;                                                           
                                                                                                    
                                                                                                    
   moverPath692209 := WriteEval.C.x(tid: Tid,this: C,_currentValue: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692209 := m#moverPath(moverPath692209);                                                     
   path692209 := p#moverPath(moverPath692209);                                                      
   assume C._state692209 == C._state && C.x692209 == C.x && C._lock692209 == C._lock && C.x_nextThread692209 == C.x_nextThread && C.x_nextValue692209 == C.x_nextValue && _m692209 == _m && _currentValue692209 == _currentValue && ctmp686560692209 == ctmp686560 && z692209 == z && y2692209 == y2 && y692209 == y && this692209 == this && tid692209 == tid && $pc692209 == $pc;
   assume $recorded.state692209 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   C.x[this] := _currentValue;                                                                      
                                                                                                    
   // 14.5: assume goesWrong(_m);                                                                   
                                                                                                    
   assume transition($pc, _m) == PhaseError;                                                        
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 14.5: this.x := 0;                                                                            
                                                                                                    
                                                                                                    
   moverPath692217 := WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692217 := m#moverPath(moverPath692217);                                                     
   path692217 := p#moverPath(moverPath692217);                                                      
   assume C._state692217 == C._state && C.x692217 == C.x && C._lock692217 == C._lock && C.x_nextThread692217 == C.x_nextThread && C.x_nextValue692217 == C.x_nextValue && _m692217 == _m && _currentValue692217 == _currentValue && ctmp686560692217 == ctmp686560 && z692217 == z && y2692217 == y2 && y692217 == y && this692217 == this && tid692217 == tid && $pc692217 == $pc;
   assume $recorded.state692217 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (14.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover692217);                                                             
   assert $pc != PhaseError;                                                                               // (14.5): Reduction failure
   C.x[this] := 0;                                                                                  
                                                                                                    
   // 14.5: z = false;                                                                              
                                                                                                    
   z := false;                                                                                      
  }                                                                                                 
 }                                                                                                  
 if (z) {                                                                                           
                                                                                                    
  // 16.7: assert y == y2;                                                                          
                                                                                                    
  assume C._state692231 == C._state && C.x692231 == C.x && C._lock692231 == C._lock && C.x_nextThread692231 == C.x_nextThread && C.x_nextValue692231 == C.x_nextValue && z692231 == z && y2692231 == y2 && y692231 == y && this692231 == this && tid692231 == tid;
  assume $recorded.state692231 == 1;                                                                
  assert (y==y2);                                                                                          // (16.7): This assertion may not hold.
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 18.5:  return;                                                                                  
                                                                                                    
 assume C._state692235 == C._state && C.x692235 == C.x && C._lock692235 == C._lock && C.x_nextThread692235 == C.x_nextThread && C.x_nextValue692235 == C.x_nextValue && z692235 == z && y2692235 == y2 && y692235 == y && this692235 == this && tid692235 == tid;
 assume $recorded.state692235 == 1;                                                                 
 return;                                                                                            
                                                                                                    
 // 9.20: // return;                                                                                
                                                                                                    
 assume C._state692237 == C._state && C.x692237 == C.x && C._lock692237 == C._lock && C.x_nextThread692237 == C.x_nextThread && C.x_nextValue692237 == C.x_nextValue && z692237 == z && y2692237 == y2 && y692237 == y && this692237 == this && tid692237 == tid;
 assume $recorded.state692237 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
procedure  C.f4b(tid:Tid, this : C)                                                                 
modifies C._state;                                                                                  
modifies C.x;                                                                                       
modifies C._lock;                                                                                   
modifies C.x_nextThread;                                                                            
modifies C.x_nextValue;                                                                             
                                                                                                    
requires ValidTid(tid);                                                                                    // (21.3): Bad tid
requires isShared(C._state[this]);                                                                         // (21.3): this is not global
                                                                                                    
requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                     
                                                                                                    
ensures StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                      
{                                                                                                   
 var C._state692262: [C]State;                                                                      
 var C._state692486: [C]State;                                                                      
 var moverPath692473: MoverPath;                                                                    
 var C.x_nextValue692378_post: [C]int;                                                              
 var C.x_nextValue692369: [C]int;                                                                   
 var this692331: C;                                                                                 
 var mover692447: Mover;                                                                            
 var C.x692504: [C]int;                                                                             
 var _currentValue692473: int;                                                                      
 var C._lock692504: [C]Tid;                                                                         
 var C._lock692256: [C]Tid;                                                                         
 var _currentValue: int;                                                                            
 var $recorded.state692262: int;                                                                    
 var C.x_nextThread692309_post: [C]Tid;                                                             
 var C.x_nextThread692331: [C]Tid;                                                                  
 var path692470: int;                                                                               
 var mover692300: Mover;                                                                            
 var C.x_nextValue692262: [C]int;                                                                   
 var moverPath692262: MoverPath;                                                                    
 var C._state692369: [C]State;                                                                      
 var C._lock692309: [C]Tid;                                                                         
 var y692378_post: int;                                                                             
 var C.x_nextThread692374: [C]Tid;                                                                  
 var _currentValue692494: int;                                                                      
 var _C_t: Tid;                                                                                     
 var path692300: int;                                                                               
 var mover692369: Mover;                                                                            
 var C._state692309: [C]State;                                                                      
 var tid692378_post: Tid;                                                                           
 var y692300: int;                                                                                  
 var moverPath692486: MoverPath;                                                                    
 var $pc692486: Phase;                                                                              
 var path692447: int;                                                                               
 var path692369: int;                                                                               
 var _casable692369: bool;                                                                          
 var $recorded.state692504: int;                                                                    
 var y692262: int;                                                                                  
 var _currentValue692331: int;                                                                      
 var _C_t692374: Tid;                                                                               
 var tid692473: Tid;                                                                                
 var C.x692325: [C]int;                                                                             
 var moverPath692256: MoverPath;                                                                    
 var $pc692309_post: Phase;                                                                         
 var mover692262: Mover;                                                                            
 var C.x_nextValue692305: [C]int;                                                                   
 var y2692473: int;                                                                                 
 var C._state692300: [C]State;                                                                      
 var C.x692378: [C]int;                                                                             
 var _C_t692369: Tid;                                                                               
 var tid692470: Tid;                                                                                
 var _casable: bool;                                                                                
 var tid692262: Tid;                                                                                
 var y692504: int;                                                                                  
 var C.x_nextValue692378: [C]int;                                                                   
 var path692494: int;                                                                               
 var y2692470: int;                                                                                 
 var C.x692494: [C]int;                                                                             
 var path692319: int;                                                                               
 var y2692506: int;                                                                                 
 var $pc692305: Phase;                                                                              
 var this692504: C;                                                                                 
 var $pc692473: Phase;                                                                              
 var path692473: int;                                                                               
 var y692439: int;                                                                                  
 var y692374: int;                                                                                  
 var C.x_nextValue692447: [C]int;                                                                   
 var C._state692504: [C]State;                                                                      
 var C.x692256: [C]int;                                                                             
 var tid692325: Tid;                                                                                
 var z692494: bool;                                                                                 
 var y2692486: int;                                                                                 
 var $recorded.state692309_post: int;                                                               
 var C._lock692378: [C]Tid;                                                                         
 var C._lock692250: [C]Tid;                                                                         
 var y2692374: int;                                                                                 
 var C._state692378_post: [C]State;                                                                 
 var mover692439: Mover;                                                                            
 var path692262: int;                                                                               
 var $pc692439: Phase;                                                                              
 var $recorded.state692331: int;                                                                    
 var _C_v692369: int;                                                                               
 var C.x_nextThread692442: [C]Tid;                                                                  
 var tmpValue: int;                                                                                 
 var _C_v692256: int;                                                                               
 var _casable692300: bool;                                                                          
 var _C_v692305: int;                                                                               
 var $pc692325: Phase;                                                                              
 var C.x_nextValue692331: [C]int;                                                                   
 var C.x_nextValue692256: [C]int;                                                                   
 var _currentValue692486: int;                                                                      
 var y692442: int;                                                                                  
 var this692506: C;                                                                                 
 var path692305: int;                                                                               
 var $recorded.state692319: int;                                                                    
 var C._state692374: [C]State;                                                                      
 var C.x692331: [C]int;                                                                             
 var _currentValue692262: int;                                                                      
 var y2692325: int;                                                                                 
 var mover692319: Mover;                                                                            
 var _C_v692262: int;                                                                               
 var C.x692470: [C]int;                                                                             
 var z692470: bool;                                                                                 
 var tid692442: Tid;                                                                                
 var mover692305: Mover;                                                                            
 var moverPath692369: MoverPath;                                                                    
 var C._state692439: [C]State;                                                                      
 var z692447: bool;                                                                                 
 var $pc692378_post: Phase;                                                                         
 var _casable692374: bool;                                                                          
 var this692250: C;                                                                                 
 var this692442: C;                                                                                 
 var _casable692305: bool;                                                                          
 var C._lock692439: [C]Tid;                                                                         
 var $pc692309: Phase;                                                                              
 var this692447: C;                                                                                 
 var y692331: int;                                                                                  
 var C.x_nextThread692506: [C]Tid;                                                                  
 var C._state692473: [C]State;                                                                      
 var ctmp686600692447: bool;                                                                        
 var tid692378: Tid;                                                                                
 var moverPath692300: MoverPath;                                                                    
 var $recorded.state692473: int;                                                                    
 var ctmp686600692439: bool;                                                                        
 var C._lock692473: [C]Tid;                                                                         
 var y2692439: int;                                                                                 
 var moverPath692374: MoverPath;                                                                    
 var this692378_post: C;                                                                            
 var C.x692473: [C]int;                                                                             
 var tid692309_post: Tid;                                                                           
 var _C_v692331: int;                                                                               
 var C._lock692331: [C]Tid;                                                                         
 var C.x_nextThread692250: [C]Tid;                                                                  
 var moverPath692319: MoverPath;                                                                    
 var moverPath692250: MoverPath;                                                                    
 var y2692331: int;                                                                                 
 var _C_t692262: Tid;                                                                               
 var _currentValue692369: int;                                                                      
 var mover692486: Mover;                                                                            
 var _C_t692300: Tid;                                                                               
 var tmpValue692439: int;                                                                           
 var _C_t692325: Tid;                                                                               
 var C._state692470: [C]State;                                                                      
 var _C_v: int;                                                                                     
 var path692250: int;                                                                               
 var $pc692256: Phase;                                                                              
 var C._state692506: [C]State;                                                                      
 var $recorded.state692486: int;                                                                    
 var C._state692378: [C]State;                                                                      
 var C._state692447: [C]State;                                                                      
 var C._lock692369: [C]Tid;                                                                         
 var _R_t692300: Mover;                                                                             
 var y692447: int;                                                                                  
 var C.x692262: [C]int;                                                                             
 var y692506: int;                                                                                  
 var z692442: bool;                                                                                 
 var tmpTid692447: Tid;                                                                             
 var moverPath692447: MoverPath;                                                                    
 var $recorded.state692494: int;                                                                    
 var ctmp686600692470: bool;                                                                        
 var y692319: int;                                                                                  
 var y692250: int;                                                                                  
 var _C_v692374: int;                                                                               
 var mover692331: Mover;                                                                            
 var C._lock692325: [C]Tid;                                                                         
 var tmpTid692439: Tid;                                                                             
 var y692378: int;                                                                                  
 var C.x_nextValue692300: [C]int;                                                                   
 var C._state692331: [C]State;                                                                      
 var $recorded.state692506: int;                                                                    
 var C.x_nextValue692486: [C]int;                                                                   
 var $pc692378: Phase;                                                                              
 var C.x_nextThread692378_post: [C]Tid;                                                             
 var $pc692250: Phase;                                                                              
 var $recorded.state692369: int;                                                                    
 var y692486: int;                                                                                  
 var $recorded.state692325: int;                                                                    
 var $pc692374: Phase;                                                                              
 var C._state692442: [C]State;                                                                      
 var tid692305: Tid;                                                                                
 var this692473: C;                                                                                 
 var $pc692504: Phase;                                                                              
 var C.x_nextValue692442: [C]int;                                                                   
 var C.x_nextValue692439: [C]int;                                                                   
 var C.x_nextThread692305: [C]Tid;                                                                  
 var y692309: int;                                                                                  
 var y692305: int;                                                                                  
 var C.x_nextThread692256: [C]Tid;                                                                  
 var C.x692319: [C]int;                                                                             
 var moverPath692305: MoverPath;                                                                    
 var _C_v692300: int;                                                                               
 var moverPath692470: MoverPath;                                                                    
 var C.x692250: [C]int;                                                                             
 var y692473: int;                                                                                  
 var tid692300: Tid;                                                                                
 var path692331: int;                                                                               
 var this692305: C;                                                                                 
 var C._lock692374: [C]Tid;                                                                         
 var _R_t692374: Mover;                                                                             
 var z692504: bool;                                                                                 
 var tid692486: Tid;                                                                                
 var y2692378_post: int;                                                                            
 var _m692442: Mover;                                                                               
 var y692470: int;                                                                                  
 var C._lock692470: [C]Tid;                                                                         
 var C.x692305: [C]int;                                                                             
 var C.x_nextThread692439: [C]Tid;                                                                  
 var C._lock692262: [C]Tid;                                                                         
 var C.x_nextThread692325: [C]Tid;                                                                  
 var C.x_nextThread692447: [C]Tid;                                                                  
 var C._state692494: [C]State;                                                                      
 var C._lock692442: [C]Tid;                                                                         
 var path692439: int;                                                                               
 var y692256: int;                                                                                  
 var this692319: C;                                                                                 
 var C.x_nextValue692325: [C]int;                                                                   
 var $recorded.state692447: int;                                                                    
 var mover692473: Mover;                                                                            
 var y: int;                                                                                        
 var _currentValue692470: int;                                                                      
 var C.x692442: [C]int;                                                                             
 var $pc692506: Phase;                                                                              
 var _C_t692256: Tid;                                                                               
 var path692325: int;                                                                               
 var tid692504: Tid;                                                                                
 var this692486: C;                                                                                 
 var C.x692369: [C]int;                                                                             
 var tid692250: Tid;                                                                                
 var $pc692300: Phase;                                                                              
 var $pc692447: Phase;                                                                              
 var y2692494: int;                                                                                 
 var this692374: C;                                                                                 
 var tid692319: Tid;                                                                                
 var C._state692319: [C]State;                                                                      
 var C.x692486: [C]int;                                                                             
 var path692486: int;                                                                               
 var _R_t: Mover;                                                                                   
 var C.x_nextThread692262: [C]Tid;                                                                  
 var z692439: bool;                                                                                 
 var $recorded.state692442: int;                                                                    
 var ctmp686600692486: bool;                                                                        
 var ctmp686600: bool;                                                                              
 var ctmp686600692442: bool;                                                                        
 var tmpValue692442: int;                                                                           
 var y2: int;                                                                                       
 var moverPath692494: MoverPath;                                                                    
 var _m: Mover;                                                                                     
 var C.x_nextValue692374: [C]int;                                                                   
 var C.x_nextThread692369: [C]Tid;                                                                  
 var _C_t692305: Tid;                                                                               
 var this692494: C;                                                                                 
 var y2692447: int;                                                                                 
 var _C_v692325: int;                                                                               
 var $pc692319: Phase;                                                                              
 var $recorded.state692439: int;                                                                    
 var C.x_nextThread692470: [C]Tid;                                                                  
 var tid692331: Tid;                                                                                
 var C.x692378_post: [C]int;                                                                        
 var C.x692309: [C]int;                                                                             
 var this692325: C;                                                                                 
 var this692439: C;                                                                                 
 var $pc692470: Phase;                                                                              
 var _R_t692305: Mover;                                                                             
 var C.x_nextThread692494: [C]Tid;                                                                  
 var tid692506: Tid;                                                                                
 var this692256: C;                                                                                 
 var C.x692300: [C]int;                                                                             
 var y2692378: int;                                                                                 
 var y2692442: int;                                                                                 
 var C.x692506: [C]int;                                                                             
 var C.x_nextValue692309_post: [C]int;                                                              
 var _C_t692331: Tid;                                                                               
 var y692494: int;                                                                                  
 var path692374: int;                                                                               
 var this692262: C;                                                                                 
 var y692369: int;                                                                                  
 var $recorded.state692374: int;                                                                    
 var tmpValue692447: int;                                                                           
 var C.x_nextThread692378: [C]Tid;                                                                  
 var C._state692309_post: [C]State;                                                                 
 var this692369: C;                                                                                 
 var ctmp686600692494: bool;                                                                        
 var C._lock692494: [C]Tid;                                                                         
 var tid692494: Tid;                                                                                
 var tid692374: Tid;                                                                                
 var C.x_nextValue692506: [C]int;                                                                   
 var C.x692309_post: [C]int;                                                                        
 var $recorded.state692305: int;                                                                    
 var ctmp686600692473: bool;                                                                        
 var C.x_nextValue692250: [C]int;                                                                   
 var mover692374: Mover;                                                                            
 var C.x_nextThread692473: [C]Tid;                                                                  
 var moverPath692331: MoverPath;                                                                    
 var C._lock692486: [C]Tid;                                                                         
 var C._state692305: [C]State;                                                                      
 var y2692369: int;                                                                                 
 var tmpTid: Tid;                                                                                   
 var $recorded.state692309: int;                                                                    
 var C._lock692447: [C]Tid;                                                                         
 var this692309: C;                                                                                 
 var tid692439: Tid;                                                                                
 var C.x692439: [C]int;                                                                             
 var this692470: C;                                                                                 
 var z: bool;                                                                                       
 var mover692256: Mover;                                                                            
 var $pc692262: Phase;                                                                              
 var C._lock692506: [C]Tid;                                                                         
 var y692309_post: int;                                                                             
 var tmpTid692442: Tid;                                                                             
 var mover692250: Mover;                                                                            
 var _currentValue692374: int;                                                                      
 var $recorded.state692378: int;                                                                    
 var moverPath692442: MoverPath;                                                                    
 var tid692447: Tid;                                                                                
 var _currentValue692305: int;                                                                      
 var _m692486: Mover;                                                                               
 var C.x_nextValue692473: [C]int;                                                                   
 var _C_t692250: Tid;                                                                               
 var $recorded.state692250: int;                                                                    
 var _currentValue692300: int;                                                                      
 var _C_t692319: Tid;                                                                               
 var y2692319: int;                                                                                 
 var moverPath692325: MoverPath;                                                                    
 var $recorded.state692470: int;                                                                    
 var y692325: int;                                                                                  
 var moverPath692439: MoverPath;                                                                    
 var mover692494: Mover;                                                                            
 var C._lock692305: [C]Tid;                                                                         
 var y2692504: int;                                                                                 
 var C._state692250: [C]State;                                                                      
 var C.x_nextValue692494: [C]int;                                                                   
 var C.x_nextValue692470: [C]int;                                                                   
 var C.x_nextValue692504: [C]int;                                                                   
 var C._lock692319: [C]Tid;                                                                         
 var $recorded.state692256: int;                                                                    
 var C._state692325: [C]State;                                                                      
 var z692506: bool;                                                                                 
 var C.x_nextValue692319: [C]int;                                                                   
 var $pc692442: Phase;                                                                              
 var $pc692494: Phase;                                                                              
 var $pc692369: Phase;                                                                              
 var _R_t692369: Mover;                                                                             
 var _m692494: Mover;                                                                               
 var C.x_nextThread692300: [C]Tid;                                                                  
 var $pc692331: Phase;                                                                              
 var tid692256: Tid;                                                                                
 var C.x_nextThread692486: [C]Tid;                                                                  
 var C._state692256: [C]State;                                                                      
 var C.x_nextThread692504: [C]Tid;                                                                  
 var z692473: bool;                                                                                 
 var z692486: bool;                                                                                 
 var C.x_nextThread692309: [C]Tid;                                                                  
 var this692378: C;                                                                                 
 var this692309_post: C;                                                                            
 var mover692325: Mover;                                                                            
 var C._lock692378_post: [C]Tid;                                                                    
 var C.x_nextValue692309: [C]int;                                                                   
 var $recorded.state692378_post: int;                                                               
 var _m692447: Mover;                                                                               
 var _m692439: Mover;                                                                               
 var mover692470: Mover;                                                                            
 var tid692369: Tid;                                                                                
 var mover692442: Mover;                                                                            
 var C.x_nextThread692319: [C]Tid;                                                                  
 var path692256: int;                                                                               
 var C.x692447: [C]int;                                                                             
 var tid692309: Tid;                                                                                
 var $recorded.state692300: int;                                                                    
 var path692442: int;                                                                               
 var C._lock692300: [C]Tid;                                                                         
 var C._lock692309_post: [C]Tid;                                                                    
 var C.x692374: [C]int;                                                                             
 var this692300: C;                                                                                 
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 22.5: int y;                                                                                    
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 22.5: Tid _C_t;                                                                                 
                                                                                                    
                                                                                                    
 // 22.5: _C_t := this.x_nextThread  as B;                                                          
                                                                                                    
                                                                                                    
 moverPath692250 := ReadEval.C.x_nextThread(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692250 := m#moverPath(moverPath692250);                                                       
 path692250 := p#moverPath(moverPath692250);                                                        
 assume C._state692250 == C._state && C.x692250 == C.x && C._lock692250 == C._lock && C.x_nextThread692250 == C.x_nextThread && C.x_nextValue692250 == C.x_nextValue && _C_t692250 == _C_t && y692250 == y && this692250 == this && tid692250 == tid && $pc692250 == $pc;
 assume $recorded.state692250 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (22.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.5): Reduction failure
 _C_t := C.x_nextThread[this];                                                                      
                                                                                                    
 // 22.5: int _C_v;                                                                                 
                                                                                                    
                                                                                                    
 // 22.5: _C_v := this.x_nextValue  as B;                                                           
                                                                                                    
                                                                                                    
 moverPath692256 := ReadEval.C.x_nextValue(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692256 := m#moverPath(moverPath692256);                                                       
 path692256 := p#moverPath(moverPath692256);                                                        
 assume C._state692256 == C._state && C.x692256 == C.x && C._lock692256 == C._lock && C.x_nextThread692256 == C.x_nextThread && C.x_nextValue692256 == C.x_nextValue && _C_v692256 == _C_v && _C_t692256 == _C_t && y692256 == y && this692256 == this && tid692256 == tid && $pc692256 == $pc;
 assume $recorded.state692256 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (22.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.5): Reduction failure
 _C_v := C.x_nextValue[this];                                                                       
                                                                                                    
 // 22.5: int _currentValue;                                                                        
                                                                                                    
                                                                                                    
 // 22.5: _currentValue := this.x  as B;                                                            
                                                                                                    
                                                                                                    
 moverPath692262 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692262 := m#moverPath(moverPath692262);                                                       
 path692262 := p#moverPath(moverPath692262);                                                        
 assume C._state692262 == C._state && C.x692262 == C.x && C._lock692262 == C._lock && C.x_nextThread692262 == C.x_nextThread && C.x_nextValue692262 == C.x_nextValue && _currentValue692262 == _currentValue && _C_v692262 == _C_v && _C_t692262 == _C_t && y692262 == y && this692262 == this && tid692262 == tid && $pc692262 == $pc;
 assume $recorded.state692262 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (22.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (22.5): Reduction failure
 _currentValue := C.x[this];                                                                        
                                                                                                    
 // 22.5: Mover _R_t;                                                                               
                                                                                                    
                                                                                                    
 // 22.5: _R_t = readPermission(this.x);                                                            
                                                                                                    
 _R_t := m#moverPath(ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
 // 22.5: boolean _casable;                                                                         
                                                                                                    
                                                                                                    
 // 22.5: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
                                                                                                    
 _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                           
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 22.5: y := this.x  as R;                                                                       
                                                                                                    
                                                                                                    
  moverPath692300 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692300 := m#moverPath(moverPath692300);                                                      
  path692300 := p#moverPath(moverPath692300);                                                       
  assume C._state692300 == C._state && C.x692300 == C.x && C._lock692300 == C._lock && C.x_nextThread692300 == C.x_nextThread && C.x_nextValue692300 == C.x_nextValue && _casable692300 == _casable && _R_t692300 == _R_t && _currentValue692300 == _currentValue && _C_v692300 == _C_v && _C_t692300 == _C_t && y692300 == y && this692300 == this && tid692300 == tid && $pc692300 == $pc;
  assume $recorded.state692300 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (22.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (22.5): Reduction failure
  y := C.x[this];                                                                                   
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 22.5: y := this.x;                                                                             
                                                                                                    
                                                                                                    
  moverPath692305 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692305 := m#moverPath(moverPath692305);                                                      
  path692305 := p#moverPath(moverPath692305);                                                       
  assume C._state692305 == C._state && C.x692305 == C.x && C._lock692305 == C._lock && C.x_nextThread692305 == C.x_nextThread && C.x_nextValue692305 == C.x_nextValue && _casable692305 == _casable && _R_t692305 == _R_t && _currentValue692305 == _currentValue && _C_v692305 == _C_v && _C_t692305 == _C_t && y692305 == y && this692305 == this && tid692305 == tid && $pc692305 == $pc;
  assume $recorded.state692305 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (22.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover692305);                                                              
  assert $pc != PhaseError;                                                                                // (22.5): Reduction failure
  y := C.x[this];                                                                                   
 }                                                                                                  
                                                                                                    
 // 23.5: yield;                                                                                    
                                                                                                    
 assume C._state692309 == C._state && C.x692309 == C.x && C._lock692309 == C._lock && C.x_nextThread692309 == C.x_nextThread && C.x_nextValue692309 == C.x_nextValue && y692309 == y && this692309 == this && tid692309 == tid;
 assume $recorded.state692309 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume C._state692309_post == C._state && C.x692309_post == C.x && C._lock692309_post == C._lock && C.x_nextThread692309_post == C.x_nextThread && C.x_nextValue692309_post == C.x_nextValue && y692309_post == y && this692309_post == this && tid692309_post == tid;
 assume $recorded.state692309_post == 1;                                                            
                                                                                                    
 // 24.5: int y2;                                                                                   
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 24.5: Tid _C_t;                                                                                 
                                                                                                    
                                                                                                    
 // 24.5: _C_t := this.x_nextThread  as B;                                                          
                                                                                                    
                                                                                                    
 moverPath692319 := ReadEval.C.x_nextThread(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692319 := m#moverPath(moverPath692319);                                                       
 path692319 := p#moverPath(moverPath692319);                                                        
 assume C._state692319 == C._state && C.x692319 == C.x && C._lock692319 == C._lock && C.x_nextThread692319 == C.x_nextThread && C.x_nextValue692319 == C.x_nextValue && _C_t692319 == _C_t && y2692319 == y2 && y692319 == y && this692319 == this && tid692319 == tid && $pc692319 == $pc;
 assume $recorded.state692319 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 _C_t := C.x_nextThread[this];                                                                      
                                                                                                    
 // 24.5: int _C_v;                                                                                 
                                                                                                    
                                                                                                    
 // 24.5: _C_v := this.x_nextValue  as B;                                                           
                                                                                                    
                                                                                                    
 moverPath692325 := ReadEval.C.x_nextValue(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692325 := m#moverPath(moverPath692325);                                                       
 path692325 := p#moverPath(moverPath692325);                                                        
 assume C._state692325 == C._state && C.x692325 == C.x && C._lock692325 == C._lock && C.x_nextThread692325 == C.x_nextThread && C.x_nextValue692325 == C.x_nextValue && _C_v692325 == _C_v && _C_t692325 == _C_t && y2692325 == y2 && y692325 == y && this692325 == this && tid692325 == tid && $pc692325 == $pc;
 assume $recorded.state692325 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 _C_v := C.x_nextValue[this];                                                                       
                                                                                                    
 // 24.5: int _currentValue;                                                                        
                                                                                                    
                                                                                                    
 // 24.5: _currentValue := this.x  as B;                                                            
                                                                                                    
                                                                                                    
 moverPath692331 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 mover692331 := m#moverPath(moverPath692331);                                                       
 path692331 := p#moverPath(moverPath692331);                                                        
 assume C._state692331 == C._state && C.x692331 == C.x && C._lock692331 == C._lock && C.x_nextThread692331 == C.x_nextThread && C.x_nextValue692331 == C.x_nextValue && _currentValue692331 == _currentValue && _C_v692331 == _C_v && _C_t692331 == _C_t && y2692331 == y2 && y692331 == y && this692331 == this && tid692331 == tid && $pc692331 == $pc;
 assume $recorded.state692331 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != C.null;                                                                            
 } else {                                                                                           
  assert this != C.null;                                                                                   // (24.5): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (24.5): Reduction failure
 _currentValue := C.x[this];                                                                        
                                                                                                    
 // 24.5: Mover _R_t;                                                                               
                                                                                                    
                                                                                                    
 // 24.5: _R_t = readPermission(this.x);                                                            
                                                                                                    
 _R_t := m#moverPath(ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
 // 24.5: boolean _casable;                                                                         
                                                                                                    
                                                                                                    
 // 24.5: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
                                                                                                    
 _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                           
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 24.5: y2 := this.x  as R;                                                                      
                                                                                                    
                                                                                                    
  moverPath692369 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692369 := m#moverPath(moverPath692369);                                                      
  path692369 := p#moverPath(moverPath692369);                                                       
  assume C._state692369 == C._state && C.x692369 == C.x && C._lock692369 == C._lock && C.x_nextThread692369 == C.x_nextThread && C.x_nextValue692369 == C.x_nextValue && _casable692369 == _casable && _R_t692369 == _R_t && _currentValue692369 == _currentValue && _C_v692369 == _C_v && _C_t692369 == _C_t && y2692369 == y2 && y692369 == y && this692369 == this && tid692369 == tid && $pc692369 == $pc;
  assume $recorded.state692369 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (24.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (24.5): Reduction failure
  y2 := C.x[this];                                                                                  
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 24.5: y2 := this.x;                                                                            
                                                                                                    
                                                                                                    
  moverPath692374 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
  mover692374 := m#moverPath(moverPath692374);                                                      
  path692374 := p#moverPath(moverPath692374);                                                       
  assume C._state692374 == C._state && C.x692374 == C.x && C._lock692374 == C._lock && C.x_nextThread692374 == C.x_nextThread && C.x_nextValue692374 == C.x_nextValue && _casable692374 == _casable && _R_t692374 == _R_t && _currentValue692374 == _currentValue && _C_v692374 == _C_v && _C_t692374 == _C_t && y2692374 == y2 && y692374 == y && this692374 == this && tid692374 == tid && $pc692374 == $pc;
  assume $recorded.state692374 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != C.null;                                                                           
  } else {                                                                                          
   assert this != C.null;                                                                                  // (24.5): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover692374);                                                              
  assert $pc != PhaseError;                                                                                // (24.5): Reduction failure
  y2 := C.x[this];                                                                                  
 }                                                                                                  
                                                                                                    
 // 25.5: yield;                                                                                    
                                                                                                    
 assume C._state692378 == C._state && C.x692378 == C.x && C._lock692378 == C._lock && C.x_nextThread692378 == C.x_nextThread && C.x_nextValue692378 == C.x_nextValue && y2692378 == y2 && y692378 == y && this692378 == this && tid692378 == tid;
 assume $recorded.state692378 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume C._state692378_post == C._state && C.x692378_post == C.x && C._lock692378_post == C._lock && C.x_nextThread692378_post == C.x_nextThread && C.x_nextValue692378_post == C.x_nextValue && y2692378_post == y2 && y692378_post == y && this692378_post == this && tid692378_post == tid;
 assume $recorded.state692378_post == 1;                                                            
                                                                                                    
 // 26.5: boolean z;                                                                                
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 26.5: boolean ctmp686600;                                                                       
                                                                                                    
                                                                                                    
 // 26.5: ctmp686600 = *;                                                                           
                                                                                                    
 havoc ctmp686600;                                                                                  
 if (ctmp686600) {                                                                                  
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 26.5: z = false;                                                                               
                                                                                                    
  z := false;                                                                                       
 } else {                                                                                           
                                                                                                    
  // 26.5: ctmp686600 = *;                                                                          
                                                                                                    
  havoc ctmp686600;                                                                                 
  if (ctmp686600) {                                                                                 
                                                                                                    
   // 26.5: Tid tmpTid;                                                                             
                                                                                                    
                                                                                                    
   // 26.5: int tmpValue;                                                                           
                                                                                                    
                                                                                                    
   // 26.5: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 26.5: _m = writePermission(this.x, 0);                                                        
                                                                                                    
   _m := m#moverPath(WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
   // 26.5: assume this.x == y2;                                                                    
                                                                                                    
   assume (C.x[this]==y2);                                                                          
                                                                                                    
   // 26.5: assume !goesWrong(_m);                                                                  
                                                                                                    
   assume !(transition($pc, _m) == PhaseError);                                                     
                                                                                                    
   // 26.5: assume this.x_nextThread == tid;                                                        
                                                                                                    
   assume (C.x_nextThread[this]==tid);                                                              
                                                                                                    
   // 26.5: assume this.x_nextValue == y2;                                                          
                                                                                                    
   assume (C.x_nextValue[this]==y2);                                                                
                                                                                                    
                                                                                                    
   // 26.5: this.x_nextThread := tmpTid as B;                                                       
                                                                                                    
                                                                                                    
   moverPath692439 := WriteEval.C.x_nextThread(tid: Tid,this: C,tmpTid: Tid,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692439 := m#moverPath(moverPath692439);                                                     
   path692439 := p#moverPath(moverPath692439);                                                      
   assume C._state692439 == C._state && C.x692439 == C.x && C._lock692439 == C._lock && C.x_nextThread692439 == C.x_nextThread && C.x_nextValue692439 == C.x_nextValue && _m692439 == _m && tmpValue692439 == tmpValue && tmpTid692439 == tmpTid && ctmp686600692439 == ctmp686600 && z692439 == z && y2692439 == y2 && y692439 == y && this692439 == this && tid692439 == tid && $pc692439 == $pc;
   assume $recorded.state692439 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   C.x_nextThread[this] := tmpTid;                                                                  
                                                                                                    
                                                                                                    
   // 26.5: this.x_nextValue := tmpValue as B;                                                      
                                                                                                    
                                                                                                    
   moverPath692442 := WriteEval.C.x_nextValue(tid: Tid,this: C,tmpValue: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692442 := m#moverPath(moverPath692442);                                                     
   path692442 := p#moverPath(moverPath692442);                                                      
   assume C._state692442 == C._state && C.x692442 == C.x && C._lock692442 == C._lock && C.x_nextThread692442 == C.x_nextThread && C.x_nextValue692442 == C.x_nextValue && _m692442 == _m && tmpValue692442 == tmpValue && tmpTid692442 == tmpTid && ctmp686600692442 == ctmp686600 && z692442 == z && y2692442 == y2 && y692442 == y && this692442 == this && tid692442 == tid && $pc692442 == $pc;
   assume $recorded.state692442 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   C.x_nextValue[this] := tmpValue;                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 26.5: this.x := 0;                                                                            
                                                                                                    
                                                                                                    
   moverPath692447 := WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692447 := m#moverPath(moverPath692447);                                                     
   path692447 := p#moverPath(moverPath692447);                                                      
   assume C._state692447 == C._state && C.x692447 == C.x && C._lock692447 == C._lock && C.x_nextThread692447 == C.x_nextThread && C.x_nextValue692447 == C.x_nextValue && _m692447 == _m && tmpValue692447 == tmpValue && tmpTid692447 == tmpTid && ctmp686600692447 == ctmp686600 && z692447 == z && y2692447 == y2 && y692447 == y && this692447 == this && tid692447 == tid && $pc692447 == $pc;
   assume $recorded.state692447 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover692447);                                                             
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   C.x[this] := 0;                                                                                  
                                                                                                    
   // 26.5: z = true;                                                                               
                                                                                                    
   z := true;                                                                                       
  } else {                                                                                          
                                                                                                    
   // 26.5: assume this.x_nextThread == tid;                                                        
                                                                                                    
   assume (C.x_nextThread[this]==tid);                                                              
                                                                                                    
   // 26.5: assume this.x_nextValue == y2;                                                          
                                                                                                    
   assume (C.x_nextValue[this]==y2);                                                                
                                                                                                    
   // 26.5: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
   // 26.5: _currentValue := this.x  as B;                                                          
                                                                                                    
                                                                                                    
   moverPath692470 := ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692470 := m#moverPath(moverPath692470);                                                     
   path692470 := p#moverPath(moverPath692470);                                                      
   assume C._state692470 == C._state && C.x692470 == C.x && C._lock692470 == C._lock && C.x_nextThread692470 == C.x_nextThread && C.x_nextValue692470 == C.x_nextValue && _currentValue692470 == _currentValue && ctmp686600692470 == ctmp686600 && z692470 == z && y2692470 == y2 && y692470 == y && this692470 == this && tid692470 == tid && $pc692470 == $pc;
   assume $recorded.state692470 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   _currentValue := C.x[this];                                                                      
                                                                                                    
                                                                                                    
   // 26.5: this.x := y2 as B;                                                                      
                                                                                                    
                                                                                                    
   moverPath692473 := WriteEval.C.x(tid: Tid,this: C,y2: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692473 := m#moverPath(moverPath692473);                                                     
   path692473 := p#moverPath(moverPath692473);                                                      
   assume C._state692473 == C._state && C.x692473 == C.x && C._lock692473 == C._lock && C.x_nextThread692473 == C.x_nextThread && C.x_nextValue692473 == C.x_nextValue && _currentValue692473 == _currentValue && ctmp686600692473 == ctmp686600 && z692473 == z && y2692473 == y2 && y692473 == y && this692473 == this && tid692473 == tid && $pc692473 == $pc;
   assume $recorded.state692473 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   C.x[this] := y2;                                                                                 
                                                                                                    
   // 26.5: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 26.5: _m = writePermission(this.x, 0);                                                        
                                                                                                    
   _m := m#moverPath(WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue));
                                                                                                    
                                                                                                    
   // 26.5: this.x := _currentValue as B;                                                           
                                                                                                    
                                                                                                    
   moverPath692486 := WriteEval.C.x(tid: Tid,this: C,_currentValue: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692486 := m#moverPath(moverPath692486);                                                     
   path692486 := p#moverPath(moverPath692486);                                                      
   assume C._state692486 == C._state && C.x692486 == C.x && C._lock692486 == C._lock && C.x_nextThread692486 == C.x_nextThread && C.x_nextValue692486 == C.x_nextValue && _m692486 == _m && _currentValue692486 == _currentValue && ctmp686600692486 == ctmp686600 && z692486 == z && y2692486 == y2 && y692486 == y && this692486 == this && tid692486 == tid && $pc692486 == $pc;
   assume $recorded.state692486 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   C.x[this] := _currentValue;                                                                      
                                                                                                    
   // 26.5: assume goesWrong(_m);                                                                   
                                                                                                    
   assume transition($pc, _m) == PhaseError;                                                        
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 26.5: this.x := 0;                                                                            
                                                                                                    
                                                                                                    
   moverPath692494 := WriteEval.C.x(tid: Tid,this: C,0: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
   mover692494 := m#moverPath(moverPath692494);                                                     
   path692494 := p#moverPath(moverPath692494);                                                      
   assume C._state692494 == C._state && C.x692494 == C.x && C._lock692494 == C._lock && C.x_nextThread692494 == C.x_nextThread && C.x_nextValue692494 == C.x_nextValue && _m692494 == _m && _currentValue692494 == _currentValue && ctmp686600692494 == ctmp686600 && z692494 == z && y2692494 == y2 && y692494 == y && this692494 == this && tid692494 == tid && $pc692494 == $pc;
   assume $recorded.state692494 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != C.null;                                                                          
   } else {                                                                                         
    assert this != C.null;                                                                                 // (26.5): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover692494);                                                             
   assert $pc != PhaseError;                                                                               // (26.5): Reduction failure
   C.x[this] := 0;                                                                                  
                                                                                                    
   // 26.5: z = false;                                                                              
                                                                                                    
   z := false;                                                                                      
  }                                                                                                 
 }                                                                                                  
                                                                                                    
 // 31.5:  return;                                                                                  
                                                                                                    
 assume C._state692504 == C._state && C.x692504 == C.x && C._lock692504 == C._lock && C.x_nextThread692504 == C.x_nextThread && C.x_nextValue692504 == C.x_nextValue && z692504 == z && y2692504 == y2 && y692504 == y && this692504 == this && tid692504 == tid;
 assume $recorded.state692504 == 1;                                                                 
 return;                                                                                            
                                                                                                    
 // 21.21: // return;                                                                               
                                                                                                    
 assume C._state692506 == C._state && C.x692506 == C.x && C._lock692506 == C._lock && C.x_nextThread692506 == C.x_nextThread && C.x_nextValue692506 == C.x_nextValue && z692506 == z && y2692506 == y2 && y692506 == y && this692506 == this && tid692506 == tid;
 assume $recorded.state692506 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(C._state: [C]State,C.x: [C]int,C._lock: [C]Tid,C.x_nextThread: [C]Tid,C.x_nextValue: [C]int) returns (bool) {
  true &&                                                                                           
  (forall _i: C  :: _i == C.null <==> isNull(C._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.C.x(t: Tid, u: Tid, v: int, w: int, x: C)                    
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 C.x[x] := v;                                                                                       
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.C.x(u: Tid,x: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): C.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.C.x(t: Tid, u: Tid, v: int, w: int, x: C)                     
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 C.x[x] := v;                                                                                       
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.C.x(u: Tid,x: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);           
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.3): C.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.C.x(t: Tid, u: Tid, v: int, w: int, x: C)                     
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 assume w == C.x[x];                                                                                
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 C.x[x] := havocValue;                                                                              
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.C.x(u: Tid,x: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.3): C.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.C.x(t: Tid, u: Tid, v: int, w: int, x: C)                      
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 assume w == C.x[x];                                                                                
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.C.x(u: Tid,x: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);           
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.3): C.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.C.x(t: Tid, u: Tid, v: int, w: int, x: C)                          
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.C.x(t: Tid,x: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);           
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.C.x(u: Tid,x: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): C.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.C.x(t: Tid, u: Tid, v: int, w: int, x: C)                           
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[x], u);                                                             
 modifies C.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
 assume w == C.x[x];                                                                                
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.C.x(t: Tid,x: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);           
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 C.x[x] := havocValue;                                                                              
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.C.x(u: Tid,x: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.3): C.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.C.x.C.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: C, y: C)              
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.x[x] := v;                                                                                       
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.C.x.C.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: C, y: C)              
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var y_mid: C;                                                                                      
 var C.x_nextThread_mid: [C]Tid;                                                                    
 var C.x_mid: [C]int;                                                                               
 var x_mid: C;                                                                                      
 var C.x_nextValue_mid: [C]int;                                                                     
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := C.x[x];                                                                                    
 C.x[x] := v;                                                                                       
                                                                                                    
 assume C._state_mid == C._state && C.x_mid == C.x && C._lock_mid == C._lock && C.x_nextThread_mid == C.x_nextThread && C.x_nextValue_mid == C.x_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 C.x[x] := tmpV;                                                                                    
 C.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.C.x.C.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: C, y: C)             
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var y_mid: C;                                                                                      
 var C.x_nextThread_mid: [C]Tid;                                                                    
 var C.x_mid: [C]int;                                                                               
 var x_mid: C;                                                                                      
 var C.x_nextValue_mid: [C]int;                                                                     
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := C.x[x];                                                                                    
 C.x[x] := v;                                                                                       
 assume C._state_mid == C._state && C.x_mid == C.x && C._lock_mid == C._lock && C.x_nextThread_mid == C.x_nextThread && C.x_nextValue_mid == C.x_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 C.x[x] := tmpV;                                                                                    
 C.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.C.x.C.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: C, y: C)            
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.C.x(t: Tid,x: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);           
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.x[y] := w;                                                                                       
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.C.x(t: Tid,x: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);       
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): C.x is not Read-Write Stable with respect to C.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): C.x is not Read-Write Stable with respect to C.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.3): C.x is not Read-Write Stable with respect to C.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.C.x.C.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: C, y: C)            
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.C.x(u: Tid,y: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);           
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 C.x[x] := v;                                                                                       
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.C.x(u: Tid,y: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);       
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): C.x is not Write-Read Stable with respect to C.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.3): C.x is not Write-Read Stable with respect to C.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.3): C.x is not Write-Read Stable with respect to C.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.C.x.C.x(t: Tid, u: Tid, v: int, w1: int, w2: int, x: C, y: C)             
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var w2_pre: int;                                                                                   
 var v_pre: int;                                                                                    
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var w1_pre: int;                                                                                   
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var y_mid: C;                                                                                      
 var C.x_nextThread_mid: [C]Tid;                                                                    
 var C.x_mid: [C]int;                                                                               
 var x_mid: C;                                                                                      
 var C.x_nextValue_mid: [C]int;                                                                     
 var v_mid: int;                                                                                    
 var w2_mid: int;                                                                                   
 var w1_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w2_post: int;                                                                                  
 var w1_post: int;                                                                                  
 var $recorded.state_post: int;                                                                     
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var v_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.x(u: Tid,y: C,w1: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue); 
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.C.x(t: Tid,x: C,v: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := C.x[y];                                                                                    
 C.x[y] := w1;                                                                                      
                                                                                                    
 assume C._state_mid == C._state && C.x_mid == C.x && C._lock_mid == C._lock && C.x_nextThread_mid == C.x_nextThread && C.x_nextValue_mid == C.x_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.C.x(u: Tid,y: C,w2: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 C.x[y] := tmpW;                                                                                    
                                                                                                    
 C.x[x] := v;                                                                                       
 C.x[y] := w1;                                                                                      
                                                                                                    
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.C.x(u: Tid,y: C,w2: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.C.x.C.x(t: Tid, u: Tid, v1: int, v2: int, w: int, x: C, y: C)             
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(C._state[x], t);                                                             
 requires isAccessible(C._state[y], u);                                                             
 modifies C.x;                                                                                      
 modifies C.x;                                                                                      
                                                                                                    
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
 var C.x_nextThread_pre: [C]Tid;                                                                    
 var v1_pre: int;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var C._lock_pre: [C]Tid;                                                                           
 var w_pre: int;                                                                                    
 var x_pre: C;                                                                                      
 var C._state_pre: [C]State;                                                                        
 var y_pre: C;                                                                                      
 var $pc_pre: Phase;                                                                                
 var v2_pre: int;                                                                                   
 var C.x_nextValue_pre: [C]int;                                                                     
 var t_pre: Tid;                                                                                    
 var C.x_pre: [C]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var C._lock_mid: [C]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var C._state_mid: [C]State;                                                                        
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v1_mid: int;                                                                                   
 var y_mid: C;                                                                                      
 var C.x_nextThread_mid: [C]Tid;                                                                    
 var C.x_mid: [C]int;                                                                               
 var x_mid: C;                                                                                      
 var C.x_nextValue_mid: [C]int;                                                                     
 var v2_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v1_post: int;                                                                                  
 var C.x_nextThread_post: [C]Tid;                                                                   
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var x_post: C;                                                                                     
 var C._lock_post: [C]Tid;                                                                          
 var C.x_nextValue_post: [C]int;                                                                    
 var y_post: C;                                                                                     
 var w_post: int;                                                                                   
 var C._state_post: [C]State;                                                                       
 var v2_post: int;                                                                                  
 var u_post: Tid;                                                                                   
 var C.x_post: [C]int;                                                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.C.x(u: Tid,y: C,w: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);  
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := C.x[x];                                                                                    
 C.x[x] := v1;                                                                                      
 _writeByTAfterT := WriteEval.C.x(t: Tid,x: C,v2: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 C.x[x] := tmpV;                                                                                    
                                                                                                    
 C.x[y] := w;                                                                                       
 assume C._state_mid == C._state && C.x_mid == C.x && C._lock_mid == C._lock && C.x_nextThread_mid == C.x_nextThread && C.x_nextValue_mid == C.x_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.C.x(t: Tid,x: C,v1: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue); 
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 C.x[x] := v1;                                                                                      
 _writeByTAfterUAndT := WriteEval.C.x(t: Tid,x: C,v2: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume C._state_post == C._state && C.x_post == C.x && C._lock_post == C._lock && C.x_nextThread_post == C.x_nextThread && C.x_nextValue_post == C.x_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (3.3): C.x is not Write-Write Stable with respect to C.x (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                     
requires ValidTid(tid);                                                                             
modifies C._state;                                                                                  
modifies C.x;                                                                                       
modifies C._lock;                                                                                   
modifies C.x_nextThread;                                                                            
modifies C.x_nextValue;                                                                             
ensures StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                      
ensures Y(tid , old(C._state), old(C.x), old(C._lock), old(C.x_nextThread), old(C.x_nextValue) , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);
                                                                                                    
// C.x:                                                                                             
                                                                                                    
function {:inline} Y_C.x(tid : Tid, this: C, newValue: int , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 ((isAccessible(C._state[this], tid) && leq(m#moverPath(ReadEval.C.x(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)), _R)) ==> (C.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_C.x(tid : Tid, this: C, newValue: int , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_C.x.Subsumes.W(tid : Tid, u : Tid, this: C, newValue: int , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int)
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var C.x_yield: [C]int;                                                                              
var C.x_nextValue_yield: [C]int;                                                                    
var this_yield: C;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var C.x_nextThread_yield: [C]Tid;                                                                   
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume isAccessible(C._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.C.x(u: Tid,this: C,newValue: int,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)));
                                                                                                    
assume C._state_yield == C._state && C.x_yield == C.x && C._lock_yield == C._lock && C.x_nextThread_yield == C.x_nextThread && C.x_nextValue_yield == C.x_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C.x(tid, this, newValue , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);         
}                                                                                                   
                                                                                                    
procedure Y_C.x.Reflexive(tid : Tid, this: C , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int)
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var C.x_yield: [C]int;                                                                              
var C.x_nextValue_yield: [C]int;                                                                    
var this_yield: C;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var C.x_nextThread_yield: [C]Tid;                                                                   
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
assume C._state_yield == C._state && C.x_yield == C.x && C._lock_yield == C._lock && C.x_nextThread_yield == C.x_nextThread && C.x_nextValue_yield == C.x_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C.x(tid, this, C.x[this] , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);        
}                                                                                                   
                                                                                                    
procedure Y_C.x.Transitive(tid : Tid, this: C, newValue : int , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int , C._state_p: [C]State, C.x_p: [C]int, C._lock_p: [C]Tid, C.x_nextThread_p: [C]Tid, C.x_nextValue_p: [C]int)
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires StateInvariant(C._state_p, C.x_p, C._lock_p, C.x_nextThread_p, C.x_nextValue_p);          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: C;                                                                                    
var C.x_nextThread_pre: [C]Tid;                                                                     
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var C._lock_pre: [C]Tid;                                                                            
var tid_pre: Tid;                                                                                   
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
var C.x_nextValue_pre: [C]int;                                                                      
var C.x_pre: [C]int;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var C.x_nextThread_post: [C]Tid;                                                                    
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var C._lock_post: [C]Tid;                                                                           
var C.x_nextValue_post: [C]int;                                                                     
var tid_post: Tid;                                                                                  
var this_post: C;                                                                                   
var C._state_post: [C]State;                                                                        
var C.x_post: [C]int;                                                                               
                                                                                                    
assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume Y(tid , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue , C._state_p, C.x_p, C._lock_p, C.x_nextThread_p, C.x_nextValue_p);
 assume Y_C.x(tid, this, newValue , C._state_p, C.x_p, C._lock_p, C.x_nextThread_p, C.x_nextValue_p);
assume C._state_post == C._state_p && C.x_post == C.x_p && C._lock_post == C._lock_p && C.x_nextThread_post == C.x_nextThread_p && C.x_nextValue_post == C.x_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_C.x(tid, this, newValue , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);         
}                                                                                                   
// C._lock:                                                                                         
                                                                                                    
function {:inline} Y_C._lock(tid : Tid, this: C, newValue: Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 ((isAccessible(C._state[this], tid) && leq(m#moverPath(ReadEval.C._lock(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)), _R)) ==> (C._lock[this] == newValue))
 &&(((C._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_C._lock(tid : Tid, this: C, newValue: Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_C._lock.Subsumes.W(tid : Tid, u : Tid, this: C, newValue: Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int)
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var C.x_yield: [C]int;                                                                              
var C.x_nextValue_yield: [C]int;                                                                    
var this_yield: C;                                                                                  
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var C.x_nextThread_yield: [C]Tid;                                                                   
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume isAccessible(C._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.C._lock(u: Tid,this: C,newValue: Tid,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)));
 assume leq(m#moverPath(ReadEval.C._lock(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)), _N);
assume C._state_yield == C._state && C.x_yield == C.x && C._lock_yield == C._lock && C.x_nextThread_yield == C.x_nextThread && C.x_nextValue_yield == C.x_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C._lock(tid, this, newValue , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);     
}                                                                                                   
                                                                                                    
procedure Y_C._lock.Reflexive(tid : Tid, this: C , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int)
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var C._state_yield: [C]State;                                                                       
var C.x_yield: [C]int;                                                                              
var C.x_nextValue_yield: [C]int;                                                                    
var this_yield: C;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var C.x_nextThread_yield: [C]Tid;                                                                   
var C._lock_yield: [C]Tid;                                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(C._state[this], tid);                                                          
assume C._state_yield == C._state && C.x_yield == C.x && C._lock_yield == C._lock && C.x_nextThread_yield == C.x_nextThread && C.x_nextValue_yield == C.x_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_C._lock(tid, this, C._lock[this] , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_C._lock.Transitive(tid : Tid, this: C, newValue : Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int , C._state_p: [C]State, C.x_p: [C]int, C._lock_p: [C]Tid, C.x_nextThread_p: [C]Tid, C.x_nextValue_p: [C]int)
 requires StateInvariant(C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);                    
 requires StateInvariant(C._state_p, C.x_p, C._lock_p, C.x_nextThread_p, C.x_nextValue_p);          
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: C;                                                                                    
var C.x_nextThread_pre: [C]Tid;                                                                     
var $recorded.state_pre: int;                                                                       
var C._lock_pre: [C]Tid;                                                                            
var tid_pre: Tid;                                                                                   
var C._state_pre: [C]State;                                                                         
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var C.x_nextValue_pre: [C]int;                                                                      
var C.x_pre: [C]int;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var C.x_nextThread_post: [C]Tid;                                                                    
var $pc_post: Phase;                                                                                
var C._lock_post: [C]Tid;                                                                           
var C.x_nextValue_post: [C]int;                                                                     
var tid_post: Tid;                                                                                  
var this_post: C;                                                                                   
var C._state_post: [C]State;                                                                        
var newValue_post: Tid;                                                                             
var C.x_post: [C]int;                                                                               
                                                                                                    
assume C._state_pre == C._state && C.x_pre == C.x && C._lock_pre == C._lock && C.x_nextThread_pre == C.x_nextThread && C.x_nextValue_pre == C.x_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(C._state[this], tid);                                                          
 assume Y(tid , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue , C._state_p, C.x_p, C._lock_p, C.x_nextThread_p, C.x_nextValue_p);
 assume Y_C._lock(tid, this, newValue , C._state_p, C.x_p, C._lock_p, C.x_nextThread_p, C.x_nextValue_p);
assume C._state_post == C._state_p && C.x_post == C.x_p && C._lock_post == C._lock_p && C.x_nextThread_post == C.x_nextThread_p && C.x_nextValue_post == C.x_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_C._lock(tid, this, newValue , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue);     
}                                                                                                   
// C.x_nextThread:                                                                                  
                                                                                                    
function {:inline} Y_C.x_nextThread(tid : Tid, this: C, newValue: Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 ((isAccessible(C._state[this], tid) && leq(m#moverPath(ReadEval.C.x_nextThread(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)), _R)) ==> (C.x_nextThread[this] == newValue))
 &&(((C.x_nextThread[this]==tid)==>(newValue==tid)))                                                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_C.x_nextThread(tid : Tid, this: C, newValue: Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// C.x_nextValue:                                                                                   
                                                                                                    
function {:inline} Y_C.x_nextValue(tid : Tid, this: C, newValue: int , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 ((isAccessible(C._state[this], tid) && leq(m#moverPath(ReadEval.C.x_nextValue(tid: Tid,this: C,C._state,C.x,C._lock,C.x_nextThread,C.x_nextValue)), _R)) ==> (C.x_nextValue[this] == newValue))
 &&(((C.x_nextThread[this]==tid)==>(newValue==C.x_nextValue[this])))                                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_C.x_nextValue(tid : Tid, this: C, newValue: int , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , C._state: [C]State, C.x: [C]int, C._lock: [C]Tid, C.x_nextThread: [C]Tid, C.x_nextValue: [C]int , C._state_p: [C]State, C.x_p: [C]int, C._lock_p: [C]Tid, C.x_nextThread_p: [C]Tid, C.x_nextValue_p: [C]int): bool
{                                                                                                   
 (forall this: C :: Y_C.x(tid : Tid, this, C.x_p[this] , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue))
 && (forall this: C :: Y_C._lock(tid : Tid, this, C._lock_p[this] , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue))
 && (forall this: C :: Y_C.x_nextThread(tid : Tid, this, C.x_nextThread_p[this] , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue))
 && (forall this: C :: Y_C.x_nextValue(tid : Tid, this, C.x_nextValue_p[this] , C._state, C.x, C._lock, C.x_nextThread, C.x_nextValue))
 && (forall _i : C :: isShared(C._state[_i]) ==> isShared(C._state_p[_i]))                          
 && (forall _i : C :: isLocal(C._state[_i], tid) <==> isLocal(C._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1125.1-1197.2: (Method:5.3)
// 1134.1-1134.24: (5.3): Bad tid
// 1135.1-1135.35: (5.3): this is not global
// 1168.2-1171.37: (class anchor.sink.Assume:6.5)
// 1174.2-1190.17: (class anchor.sink.Write:6.5)
// 1186.1-1186.25: (6.5): Cannot have potential null deference in left-mover part.
// 1189.1-1189.27: (6.5): Reduction failure
// 1191.2-1196.9: (class anchor.sink.Return:5.20)
// 1198.1-2099.2: (Method:9.3)
// 1207.1-1207.24: (9.3): Bad tid
// 1208.1-1208.35: (9.3): this is not global
// 1603.2-1605.2: (class anchor.sink.VarDeclStmt:10.5)
// 1607.2-1609.2: (class anchor.sink.VarDeclStmt:10.5)
// 1610.2-1627.31: (class anchor.sink.Read:10.5)
// 1622.1-1622.25: (10.5): Cannot have potential null deference in left-mover part.
// 1626.1-1626.27: (10.5): Reduction failure
// 1628.2-1630.2: (class anchor.sink.VarDeclStmt:10.5)
// 1631.2-1648.30: (class anchor.sink.Read:10.5)
// 1643.1-1643.25: (10.5): Cannot have potential null deference in left-mover part.
// 1647.1-1647.27: (10.5): Reduction failure
// 1649.2-1651.2: (class anchor.sink.VarDeclStmt:10.5)
// 1652.2-1669.29: (class anchor.sink.Read:10.5)
// 1664.1-1664.25: (10.5): Cannot have potential null deference in left-mover part.
// 1668.1-1668.27: (10.5): Reduction failure
// 1670.2-1672.2: (class anchor.sink.VarDeclStmt:10.5)
// 1673.2-1676.104: (class anchor.sink.Assign:10.5)
// 1677.2-1679.2: (class anchor.sink.VarDeclStmt:10.5)
// 1680.2-1683.74: (class anchor.sink.Assign:10.5)
// 1686.3-1703.18: (class anchor.sink.Read:10.5)
// 1698.1-1698.26: (10.5): Cannot have potential null deference in left-mover part.
// 1702.1-1702.28: (10.5): Reduction failure
// 1706.3-1723.18: (class anchor.sink.Read:10.5)
// 1718.1-1718.26: (10.5): Cannot have potential null deference in left-mover part.
// 1722.1-1722.28: (10.5): Reduction failure
// 1725.2-1733.41: (class anchor.sink.Yield:11.5)
// 1734.2-1736.2: (class anchor.sink.VarDeclStmt:12.5)
// 1738.2-1740.2: (class anchor.sink.VarDeclStmt:12.5)
// 1741.2-1758.31: (class anchor.sink.Read:12.5)
// 1753.1-1753.25: (12.5): Cannot have potential null deference in left-mover part.
// 1757.1-1757.27: (12.5): Reduction failure
// 1759.2-1761.2: (class anchor.sink.VarDeclStmt:12.5)
// 1762.2-1779.30: (class anchor.sink.Read:12.5)
// 1774.1-1774.25: (12.5): Cannot have potential null deference in left-mover part.
// 1778.1-1778.27: (12.5): Reduction failure
// 1780.2-1782.2: (class anchor.sink.VarDeclStmt:12.5)
// 1783.2-1800.29: (class anchor.sink.Read:12.5)
// 1795.1-1795.25: (12.5): Cannot have potential null deference in left-mover part.
// 1799.1-1799.27: (12.5): Reduction failure
// 1801.2-1803.2: (class anchor.sink.VarDeclStmt:12.5)
// 1804.2-1807.104: (class anchor.sink.Assign:12.5)
// 1808.2-1810.2: (class anchor.sink.VarDeclStmt:12.5)
// 1811.2-1814.74: (class anchor.sink.Assign:12.5)
// 1817.3-1834.19: (class anchor.sink.Read:12.5)
// 1829.1-1829.26: (12.5): Cannot have potential null deference in left-mover part.
// 1833.1-1833.28: (12.5): Reduction failure
// 1837.3-1854.19: (class anchor.sink.Read:12.5)
// 1849.1-1849.26: (12.5): Cannot have potential null deference in left-mover part.
// 1853.1-1853.28: (12.5): Reduction failure
// 1856.2-1864.41: (class anchor.sink.Yield:13.5)
// 1865.2-1867.2: (class anchor.sink.VarDeclStmt:14.5)
// 1869.2-1871.2: (class anchor.sink.VarDeclStmt:14.5)
// 1872.2-1875.19: (class anchor.sink.Assign:14.5)
// 1878.3-1881.14: (class anchor.sink.Assign:14.5)
// 1883.3-1886.20: (class anchor.sink.Assign:14.5)
// 1888.4-1890.4: (class anchor.sink.VarDeclStmt:14.5)
// 1891.4-1893.4: (class anchor.sink.VarDeclStmt:14.5)
// 1894.4-1896.4: (class anchor.sink.VarDeclStmt:14.5)
// 1897.4-1900.112: (class anchor.sink.Assign:14.5)
// 1901.4-1904.26: (class anchor.sink.Assume:14.5)
// 1905.4-1908.48: (class anchor.sink.Assume:14.5)
// 1909.4-1912.39: (class anchor.sink.Assume:14.5)
// 1913.4-1916.36: (class anchor.sink.Assume:14.5)
// 1918.4-1934.35: (class anchor.sink.Write:14.5)
// 1930.1-1930.27: (14.5): Cannot have potential null deference in left-mover part.
// 1933.1-1933.29: (14.5): Reduction failure
// 1936.4-1952.36: (class anchor.sink.Write:14.5)
// 1948.1-1948.27: (14.5): Cannot have potential null deference in left-mover part.
// 1951.1-1951.29: (14.5): Reduction failure
// 1955.4-1971.19: (class anchor.sink.Write:14.5)
// 1967.1-1967.27: (14.5): Cannot have potential null deference in left-mover part.
// 1970.1-1970.29: (14.5): Reduction failure
// 1972.4-1975.14: (class anchor.sink.Assign:14.5)
// 1977.4-1980.39: (class anchor.sink.Assume:14.5)
// 1981.4-1984.36: (class anchor.sink.Assume:14.5)
// 1985.4-1987.4: (class anchor.sink.VarDeclStmt:14.5)
// 1988.4-2005.31: (class anchor.sink.Read:14.5)
// 2000.1-2000.27: (14.5): Cannot have potential null deference in left-mover part.
// 2004.1-2004.29: (14.5): Reduction failure
// 2007.4-2023.19: (class anchor.sink.Write:14.5)
// 2019.1-2019.27: (14.5): Cannot have potential null deference in left-mover part.
// 2022.1-2022.29: (14.5): Reduction failure
// 2024.4-2026.4: (class anchor.sink.VarDeclStmt:14.5)
// 2027.4-2030.112: (class anchor.sink.Assign:14.5)
// 2032.4-2048.31: (class anchor.sink.Write:14.5)
// 2044.1-2044.27: (14.5): Cannot have potential null deference in left-mover part.
// 2047.1-2047.29: (14.5): Reduction failure
// 2049.4-2052.45: (class anchor.sink.Assume:14.5)
// 2055.4-2071.19: (class anchor.sink.Write:14.5)
// 2067.1-2067.27: (14.5): Cannot have potential null deference in left-mover part.
// 2070.1-2070.29: (14.5): Reduction failure
// 2072.4-2075.15: (class anchor.sink.Assign:14.5)
// 2079.3-2084.18: (class anchor.sink.Assert:16.7)
// 2084.1-2084.18: (16.7): This assertion may not hold.
// 2087.2-2092.9: (class anchor.sink.Return:18.5)
// 2093.2-2098.9: (class anchor.sink.Return:9.20)
// 2100.1-2980.2: (Method:21.3)
// 2109.1-2109.24: (21.3): Bad tid
// 2110.1-2110.35: (21.3): this is not global
// 2493.2-2495.2: (class anchor.sink.VarDeclStmt:22.5)
// 2497.2-2499.2: (class anchor.sink.VarDeclStmt:22.5)
// 2500.2-2517.31: (class anchor.sink.Read:22.5)
// 2512.1-2512.25: (22.5): Cannot have potential null deference in left-mover part.
// 2516.1-2516.27: (22.5): Reduction failure
// 2518.2-2520.2: (class anchor.sink.VarDeclStmt:22.5)
// 2521.2-2538.30: (class anchor.sink.Read:22.5)
// 2533.1-2533.25: (22.5): Cannot have potential null deference in left-mover part.
// 2537.1-2537.27: (22.5): Reduction failure
// 2539.2-2541.2: (class anchor.sink.VarDeclStmt:22.5)
// 2542.2-2559.29: (class anchor.sink.Read:22.5)
// 2554.1-2554.25: (22.5): Cannot have potential null deference in left-mover part.
// 2558.1-2558.27: (22.5): Reduction failure
// 2560.2-2562.2: (class anchor.sink.VarDeclStmt:22.5)
// 2563.2-2566.104: (class anchor.sink.Assign:22.5)
// 2567.2-2569.2: (class anchor.sink.VarDeclStmt:22.5)
// 2570.2-2573.74: (class anchor.sink.Assign:22.5)
// 2576.3-2593.18: (class anchor.sink.Read:22.5)
// 2588.1-2588.26: (22.5): Cannot have potential null deference in left-mover part.
// 2592.1-2592.28: (22.5): Reduction failure
// 2596.3-2613.18: (class anchor.sink.Read:22.5)
// 2608.1-2608.26: (22.5): Cannot have potential null deference in left-mover part.
// 2612.1-2612.28: (22.5): Reduction failure
// 2615.2-2623.41: (class anchor.sink.Yield:23.5)
// 2624.2-2626.2: (class anchor.sink.VarDeclStmt:24.5)
// 2628.2-2630.2: (class anchor.sink.VarDeclStmt:24.5)
// 2631.2-2648.31: (class anchor.sink.Read:24.5)
// 2643.1-2643.25: (24.5): Cannot have potential null deference in left-mover part.
// 2647.1-2647.27: (24.5): Reduction failure
// 2649.2-2651.2: (class anchor.sink.VarDeclStmt:24.5)
// 2652.2-2669.30: (class anchor.sink.Read:24.5)
// 2664.1-2664.25: (24.5): Cannot have potential null deference in left-mover part.
// 2668.1-2668.27: (24.5): Reduction failure
// 2670.2-2672.2: (class anchor.sink.VarDeclStmt:24.5)
// 2673.2-2690.29: (class anchor.sink.Read:24.5)
// 2685.1-2685.25: (24.5): Cannot have potential null deference in left-mover part.
// 2689.1-2689.27: (24.5): Reduction failure
// 2691.2-2693.2: (class anchor.sink.VarDeclStmt:24.5)
// 2694.2-2697.104: (class anchor.sink.Assign:24.5)
// 2698.2-2700.2: (class anchor.sink.VarDeclStmt:24.5)
// 2701.2-2704.74: (class anchor.sink.Assign:24.5)
// 2707.3-2724.19: (class anchor.sink.Read:24.5)
// 2719.1-2719.26: (24.5): Cannot have potential null deference in left-mover part.
// 2723.1-2723.28: (24.5): Reduction failure
// 2727.3-2744.19: (class anchor.sink.Read:24.5)
// 2739.1-2739.26: (24.5): Cannot have potential null deference in left-mover part.
// 2743.1-2743.28: (24.5): Reduction failure
// 2746.2-2754.41: (class anchor.sink.Yield:25.5)
// 2755.2-2757.2: (class anchor.sink.VarDeclStmt:26.5)
// 2759.2-2761.2: (class anchor.sink.VarDeclStmt:26.5)
// 2762.2-2765.19: (class anchor.sink.Assign:26.5)
// 2768.3-2771.14: (class anchor.sink.Assign:26.5)
// 2773.3-2776.20: (class anchor.sink.Assign:26.5)
// 2778.4-2780.4: (class anchor.sink.VarDeclStmt:26.5)
// 2781.4-2783.4: (class anchor.sink.VarDeclStmt:26.5)
// 2784.4-2786.4: (class anchor.sink.VarDeclStmt:26.5)
// 2787.4-2790.112: (class anchor.sink.Assign:26.5)
// 2791.4-2794.27: (class anchor.sink.Assume:26.5)
// 2795.4-2798.48: (class anchor.sink.Assume:26.5)
// 2799.4-2802.39: (class anchor.sink.Assume:26.5)
// 2803.4-2806.37: (class anchor.sink.Assume:26.5)
// 2808.4-2824.35: (class anchor.sink.Write:26.5)
// 2820.1-2820.27: (26.5): Cannot have potential null deference in left-mover part.
// 2823.1-2823.29: (26.5): Reduction failure
// 2826.4-2842.36: (class anchor.sink.Write:26.5)
// 2838.1-2838.27: (26.5): Cannot have potential null deference in left-mover part.
// 2841.1-2841.29: (26.5): Reduction failure
// 2845.4-2861.19: (class anchor.sink.Write:26.5)
// 2857.1-2857.27: (26.5): Cannot have potential null deference in left-mover part.
// 2860.1-2860.29: (26.5): Reduction failure
// 2862.4-2865.14: (class anchor.sink.Assign:26.5)
// 2867.4-2870.39: (class anchor.sink.Assume:26.5)
// 2871.4-2874.37: (class anchor.sink.Assume:26.5)
// 2875.4-2877.4: (class anchor.sink.VarDeclStmt:26.5)
// 2878.4-2895.31: (class anchor.sink.Read:26.5)
// 2890.1-2890.27: (26.5): Cannot have potential null deference in left-mover part.
// 2894.1-2894.29: (26.5): Reduction failure
// 2897.4-2913.20: (class anchor.sink.Write:26.5)
// 2909.1-2909.27: (26.5): Cannot have potential null deference in left-mover part.
// 2912.1-2912.29: (26.5): Reduction failure
// 2914.4-2916.4: (class anchor.sink.VarDeclStmt:26.5)
// 2917.4-2920.112: (class anchor.sink.Assign:26.5)
// 2922.4-2938.31: (class anchor.sink.Write:26.5)
// 2934.1-2934.27: (26.5): Cannot have potential null deference in left-mover part.
// 2937.1-2937.29: (26.5): Reduction failure
// 2939.4-2942.45: (class anchor.sink.Assume:26.5)
// 2945.4-2961.19: (class anchor.sink.Write:26.5)
// 2957.1-2957.27: (26.5): Cannot have potential null deference in left-mover part.
// 2960.1-2960.29: (26.5): Reduction failure
// 2962.4-2965.15: (class anchor.sink.Assign:26.5)
// 2968.2-2973.9: (class anchor.sink.Return:31.5)
// 2974.2-2979.9: (class anchor.sink.Return:21.21)
// 3058.1-3058.34: (3.3): C.x failed Write-Write Right-Mover Check
// 3119.1-3119.30: (3.3): C.x failed Write-Read Right-Mover Check
// 3184.1-3184.34: (3.3): C.x failed Write-Write Left-Mover Check
// 3246.1-3246.30: (3.3): C.x failed Write-Read Left-Mover Check
// 3305.1-3305.34: (3.3): C.x failed Read-Write Right-Mover Check
// 3367.1-3367.34: (3.3): C.x failed Read-Write Left-Mover Check
// 3440.1-3440.140: (3.3): C.x is not Write-Write Stable with respect to C.x (case A.1)
// 3441.1-3441.101: (3.3): C.x is not Write-Write Stable with respect to C.x (case A.2)
// 3442.1-3442.158: (3.3): C.x is not Write-Write Stable with respect to C.x (case A.3)
// 3541.1-3541.140: (3.3): C.x is not Write-Write Stable with respect to C.x (case C)
// 3645.1-3645.144: (3.3): C.x is not Write-Write Stable with respect to C.x (case D)
// 3646.1-3646.144: (3.3): C.x is not Write-Write Stable with respect to C.x (case R)
// 3719.1-3719.136: (3.3): C.x is not Read-Write Stable with respect to C.x (case F)
// 3720.1-3720.136: (3.3): C.x is not Read-Write Stable with respect to C.x (case H)
// 3721.1-3721.146: (3.3): C.x is not Read-Write Stable with respect to C.x (case I)
// 3793.1-3793.136: (3.3): C.x is not Write-Read Stable with respect to C.x (case J)
// 3794.1-3794.136: (3.3): C.x is not Write-Read Stable with respect to C.x (case K)
// 3795.1-3795.99: (3.3): C.x is not Write-Read Stable with respect to C.x (case L)
// 3904.1-3904.142: (3.3): C.x is not Write-Write Stable with respect to C.x (case M)
// 4011.1-4011.130: (3.3): C.x is not Write-Write Stable with respect to C.x (case N)
// 4045.1-4066.2: (3.3): yields_as clause for C.x is not valid
// 4071.1-4087.2: (3.3): yields_as clause for C.x is not reflexive
// 4093.1-4125.2: (3.3): yields_as clause for C.x is not transitive
// 4145.1-4166.2: (7.32): yields_as clause for C._lock is not valid
// 4171.1-4187.2: (7.32): yields_as clause for C._lock is not reflexive
// 4193.1-4225.2: (7.32): yields_as clause for C._lock is not transitive
