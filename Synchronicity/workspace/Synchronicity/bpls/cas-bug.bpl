                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-bug.anchor:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      volatile Node next isLocal(this, tid) ? B : N                                                 
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(Node next) {                                                                        
        assume this.next == Node.null;                                                              
        {                                                                                           
          this.next := next;                                                                        
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Queue {                                                                                   
      volatile Node tail N                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.tail == Node.null;                                                              
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void enqueue(int value) {                                                              
        Node n;                                                                                     
        n = new Node();                                                                             
        n.init(Node.null)                                                                           
        Node last;                                                                                  
        last := this.tail;                                                                          
        yield;                                                                                      
        Node next;                                                                                  
        next := last.next;                                                                          
        boolean tmp1;                                                                               
        tmp1 = last.next@next :~ n;                                                                 
        if (tmp1) {                                                                                 
                                                                                                    
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        assert false /* == false */;                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      hasCASOperation volatile Node next isLocal(this, tid) ? B : N                                 
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid next_nextThread isLocal(this, tid)                                          
       ? B                                                                                          
       : this.next_nextThread == tid ? N : E                                                        
        yields_as this.next_nextThread == tid ==> newValue == tid;                                  
                                                                                                    
                                                                                                    
      updatesViaCAS Node next_nextValue isLocal(this, tid)                                          
       ? B                                                                                          
       : this.next_nextThread == tid ? N : E                                                        
        yields_as this.next_nextThread == tid ==> newValue == this.next_nextValue;                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(Node next) {                                                                        
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            noop(TraceOff);                                                                         
            assume this.next_nextThread == tid;                                                     
            noop(TraceOn);                                                                          
            this.next := next;                                                                      
          }                                                                                         
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Queue {                                                                                   
      volatile Node tail N                                                                          
                                                                                                    
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
        assume this.tail == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void enqueue(int value) {                                                              
        Node n;                                                                                     
        n = new Node();                                                                             
        n.init(Node.null)                                                                           
        Node last;                                                                                  
        last := this.tail;                                                                          
        yield;                                                                                      
        Node next;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := last.next_nextThread  as B;                                                       
          Node _C_v;                                                                                
          _C_v := last.next_nextValue  as B;                                                        
          Node _currentValue;                                                                       
          _currentValue := last.next  as B;                                                         
          Mover _R_t;                                                                               
          _R_t = readPermission(last.next);                                                         
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            next := last.next  as R;                                                                
          } else {                                                                                  
            noop(TraceOn);                                                                          
            next := last.next;                                                                      
          }                                                                                         
        }                                                                                           
        boolean tmp1;                                                                               
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp478622;                                                                       
          ctmp478622 = *;                                                                           
          if (ctmp478622) {                                                                         
            noop(TraceOn);                                                                          
            tmp1 = false;                                                                           
          } else {                                                                                  
            ctmp478622 = *;                                                                         
            if (ctmp478622) {                                                                       
              Tid tmpTid;                                                                           
              Node tmpValue;                                                                        
              Mover _m;                                                                             
              _m = writePermission(last.next, n);                                                   
              assume last.next == next;                                                             
              assume !goesWrong(_m);                                                                
              assume last.next_nextThread == tid;                                                   
              assume last.next_nextValue == next;                                                   
              last.next_nextThread := tmpTid as B;                                                  
              last.next_nextValue := tmpValue as B;                                                 
              noop(TraceOn);                                                                        
              last.next := n;                                                                       
              tmp1 = true;                                                                          
            } else {                                                                                
              assume last.next_nextThread == tid;                                                   
              assume last.next_nextValue == next;                                                   
              Node _currentValue;                                                                   
              _currentValue := last.next  as B;                                                     
              last.next := next as B;                                                               
              Mover _m;                                                                             
              _m = writePermission(last.next, n);                                                   
              last.next := _currentValue as B;                                                      
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              last.next := n;                                                                       
              tmp1 = false;                                                                         
            }                                                                                       
          }                                                                                         
        }                                                                                           
        if (tmp1) {                                                                                 
                                                                                                    
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        assert false /* == false */;                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      hasCASOperation volatile Node next isLocal(this, tid) ? B : N                                 
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid next_nextThread isLocal(this, tid)                                          
       ? B                                                                                          
       : this.next_nextThread == tid ? N : E                                                        
        yields_as this.next_nextThread == tid ==> newValue == tid;                                  
                                                                                                    
                                                                                                    
      updatesViaCAS Node next_nextValue isLocal(this, tid)                                          
       ? B                                                                                          
       : this.next_nextThread == tid ? N : E                                                        
        yields_as this.next_nextThread == tid ==> newValue == this.next_nextValue;                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(Node next) {                                                                        
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            noop(TraceOff);                                                                         
            assume this.next_nextThread == tid;                                                     
            noop(TraceOn);                                                                          
            this.next := next;                                                                      
          }                                                                                         
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Queue {                                                                                   
      volatile Node tail N                                                                          
                                                                                                    
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
        assume this.tail == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void enqueue(int value) {                                                              
        Node n;                                                                                     
        n = new Node();                                                                             
        {                                                                                           
          inlined n.init(Node.null);                                                                
          exit$17: {                                                                                
            Node next$17;                                                                           
            Node this$17;                                                                           
            next$17 = Node.null;                                                                    
            this$17 = n;                                                                            
            {                                                                                       
              assume this$17.next == Node.null;                                                     
              {                                                                                     
                {                                                                                   
                  noop(TraceOff);                                                                   
                  assume this$17.next_nextThread == tid;                                            
                  noop(TraceOn);                                                                    
                  this$17.next := next$17;                                                          
                }                                                                                   
                {                                                                                   
                  break exit$17;                                                                    
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Node last;                                                                                  
        last := this.tail;                                                                          
        yield;                                                                                      
        Node next;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := last.next_nextThread  as B;                                                       
          Node _C_v;                                                                                
          _C_v := last.next_nextValue  as B;                                                        
          Node _currentValue;                                                                       
          _currentValue := last.next  as B;                                                         
          Mover _R_t;                                                                               
          _R_t = readPermission(last.next);                                                         
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            next := last.next  as R;                                                                
          } else {                                                                                  
            noop(TraceOn);                                                                          
            next := last.next;                                                                      
          }                                                                                         
        }                                                                                           
        boolean tmp1;                                                                               
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp478622;                                                                       
          ctmp478622 = *;                                                                           
          if (ctmp478622) {                                                                         
            noop(TraceOn);                                                                          
            tmp1 = false;                                                                           
          } else {                                                                                  
            ctmp478622 = *;                                                                         
            if (ctmp478622) {                                                                       
              Tid tmpTid;                                                                           
              Node tmpValue;                                                                        
              Mover _m;                                                                             
              _m = writePermission(last.next, n);                                                   
              assume last.next == next;                                                             
              assume !goesWrong(_m);                                                                
              assume last.next_nextThread == tid;                                                   
              assume last.next_nextValue == next;                                                   
              last.next_nextThread := tmpTid as B;                                                  
              last.next_nextValue := tmpValue as B;                                                 
              noop(TraceOn);                                                                        
              last.next := n;                                                                       
              tmp1 = true;                                                                          
            } else {                                                                                
              assume last.next_nextThread == tid;                                                   
              assume last.next_nextValue == next;                                                   
              Node _currentValue;                                                                   
              _currentValue := last.next  as B;                                                     
              last.next := next as B;                                                               
              Mover _m;                                                                             
              _m = writePermission(last.next, n);                                                   
              last.next := _currentValue as B;                                                      
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              last.next := n;                                                                       
              tmp1 = false;                                                                         
            }                                                                                       
          }                                                                                         
        }                                                                                           
        if (tmp1) {                                                                                 
                                                                                                    
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        assert false /* == false */;                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Node {                                                                                    
      hasCASOperation volatile Node next isLocal(this, tid) ? B : N                                 
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid next_nextThread isLocal(this, tid)                                          
       ? B                                                                                          
       : this.next_nextThread == tid ? N : E                                                        
        yields_as this.next_nextThread == tid ==> newValue == tid;                                  
                                                                                                    
                                                                                                    
      updatesViaCAS Node next_nextValue isLocal(this, tid)                                          
       ? B                                                                                          
       : this.next_nextThread == tid ? N : E                                                        
        yields_as this.next_nextThread == tid ==> newValue == this.next_nextValue;                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init(Node next) {                                                                        
        assume this.next == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            noop(TraceOff);                                                                         
            assume this.next_nextThread == tid;                                                     
            noop(TraceOn);                                                                          
            this.next := next;                                                                      
          }                                                                                         
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Queue {                                                                                   
      volatile Node tail N                                                                          
                                                                                                    
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
        assume this.tail == Node.null;                                                              
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void enqueue(int value) {                                                              
        Node n;                                                                                     
        n = new Node();                                                                             
        {                                                                                           
          inlined n.init(Node.null);                                                                
          exit$17: {                                                                                
            Node next$17;                                                                           
            Node this$17;                                                                           
            next$17 = Node.null;                                                                    
            this$17 = n;                                                                            
            {                                                                                       
              assume this$17.next == Node.null;                                                     
              {                                                                                     
                {                                                                                   
                  noop(TraceOff);                                                                   
                  assume this$17.next_nextThread == tid;                                            
                  noop(TraceOn);                                                                    
                  this$17.next := next$17;                                                          
                }                                                                                   
                {                                                                                   
                  break exit$17;                                                                    
                }                                                                                   
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        Node last;                                                                                  
        last := this.tail;                                                                          
        yield;                                                                                      
        Node next;                                                                                  
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := last.next_nextThread  as B;                                                       
          Node _C_v;                                                                                
          _C_v := last.next_nextValue  as B;                                                        
          Node _currentValue;                                                                       
          _currentValue := last.next  as B;                                                         
          Mover _R_t;                                                                               
          _R_t = readPermission(last.next);                                                         
          boolean _casable;                                                                         
          _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            next := last.next  as R;                                                                
          } else {                                                                                  
            noop(TraceOn);                                                                          
            next := last.next;                                                                      
          }                                                                                         
        }                                                                                           
        boolean tmp1;                                                                               
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp478622;                                                                       
          ctmp478622 = *;                                                                           
          if (ctmp478622) {                                                                         
            noop(TraceOn);                                                                          
            tmp1 = false;                                                                           
          } else {                                                                                  
            ctmp478622 = *;                                                                         
            if (ctmp478622) {                                                                       
              Tid tmpTid;                                                                           
              Node tmpValue;                                                                        
              Mover _m;                                                                             
              _m = writePermission(last.next, n);                                                   
              assume last.next == next;                                                             
              assume !goesWrong(_m);                                                                
              assume last.next_nextThread == tid;                                                   
              assume last.next_nextValue == next;                                                   
              last.next_nextThread := tmpTid as B;                                                  
              last.next_nextValue := tmpValue as B;                                                 
              noop(TraceOn);                                                                        
              last.next := n;                                                                       
              tmp1 = true;                                                                          
            } else {                                                                                
              assume last.next_nextThread == tid;                                                   
              assume last.next_nextValue == next;                                                   
              Node _currentValue;                                                                   
              _currentValue := last.next  as B;                                                     
              last.next := next as B;                                                               
              Mover _m;                                                                             
              _m = writePermission(last.next, n);                                                   
              last.next := _currentValue as B;                                                      
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              last.next := n;                                                                       
              tmp1 = false;                                                                         
            }                                                                                       
          }                                                                                         
        }                                                                                           
        if (tmp1) {                                                                                 
                                                                                                    
        } else {                                                                                    
                                                                                                    
        }                                                                                           
        assert false /* == false */;                                                                
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
                                                                                                    
                                                                                                    
/*** Class Decl Node ***/                                                                           
                                                                                                    
type Node;                                                                                          
const unique Node.null: Node;                                                                       
var Node._state: [Node]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.next: [Node]Node;                                                                          
                                                                                                    
function {:inline} ReadEval.Node.next(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.next(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node._lock: [Node]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Node._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Node._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Node._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Node._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Node._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Node._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.next_nextThread: [Node]Tid;                                                                
                                                                                                    
function {:inline} ReadEval.Node.next_nextThread(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.next_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.next_nextThread(tid: Tid,this : Node,newValue: Tid,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.next_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.next_nextValue: [Node]Node;                                                                
                                                                                                    
function {:inline} ReadEval.Node.next_nextValue(tid: Tid,this : Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.next_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.next_nextValue(tid: Tid,this : Node,newValue: Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.next_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Queue ***/                                                                          
                                                                                                    
type Queue;                                                                                         
const unique Queue.null: Queue;                                                                     
var Queue._state: [Queue]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Queue.tail: [Queue]Node;                                                                        
                                                                                                    
function {:inline} ReadEval.Queue.tail(tid: Tid,this : Queue,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Node.null;                                                                        
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Queue.tail(tid: Tid,this : Queue,newValue: Node,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Queue._lock: [Queue]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Queue._lock(tid: Tid,this : Queue,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Queue._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Queue._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Queue._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Queue._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Queue._lock(tid: Tid,this : Queue,newValue: Tid,Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Queue._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Queue._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Queue._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Queue._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Queue.enqueue(tid:Tid, this : Queue, value : int)                                        
modifies Node._state;                                                                               
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Node.next_nextThread;                                                                      
modifies Node.next_nextValue;                                                                       
modifies Queue._state;                                                                              
modifies Queue.tail;                                                                                
modifies Queue._lock;                                                                               
                                                                                                    
requires ValidTid(tid);                                                                                    // (14.5): Bad tid
requires isShared(Queue._state[this]);                                                                     // (14.5): this is not global
                                                                                                    
requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
                                                                                                    
ensures StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
{                                                                                                   
 var Queue._lock494943: [Queue]Tid;                                                                 
 var _C_t494795: Tid;                                                                               
 var Queue.tail494965: [Queue]Node;                                                                 
 var this494984: Queue;                                                                             
 var tid494801: Tid;                                                                                
 var Queue._lock494850: [Queue]Tid;                                                                 
 var last494784: Node;                                                                              
 var mover494807: Mover;                                                                            
 var Node.next_nextThread494984: [Node]Tid;                                                         
 var value494983: int;                                                                              
 var _m494916: Mover;                                                                               
 var last494916: Node;                                                                              
 var this494943: Queue;                                                                             
 var n494795: Node;                                                                                 
 var tid494785_post: Tid;                                                                           
 var $pc494943: Phase;                                                                              
 var next494795: Node;                                                                              
 var Queue._state494946: [Queue]State;                                                              
 var value494801: int;                                                                              
 var n494984: Node;                                                                                 
 var Queue._lock494764: [Queue]Tid;                                                                 
 var value494916: int;                                                                              
 var tmp1494946: bool;                                                                              
 var Node.next_nextThread494958: [Node]Tid;                                                         
 var last494983: Node;                                                                              
 var next: Node;                                                                                    
 var _C_t: Tid;                                                                                     
 var Node.next494965: [Node]Node;                                                                   
 var Node.next494785: [Node]Node;                                                                   
 var $recorded.state494785: int;                                                                    
 var Node._state494795: [Node]State;                                                                
 var ctmp478622494920: bool;                                                                        
 var $pc494784: Phase;                                                                              
 var Node.next494913: [Node]Node;                                                                   
 var _m494965: Mover;                                                                               
 var value494785: int;                                                                              
 var last494965: Node;                                                                              
 var _m494920: Mover;                                                                               
 var this494807: Queue;                                                                             
 var Node.next_nextThread494920: [Node]Tid;                                                         
 var moverPath494958: MoverPath;                                                                    
 var n494845: Node;                                                                                 
 var path494764: int;                                                                               
 var Node.next494801: [Node]Node;                                                                   
 var $pc494920: Phase;                                                                              
 var $recorded.state494983: int;                                                                    
 var Queue.tail494801: [Queue]Node;                                                                 
 var tmpValue: Node;                                                                                
 var Node.next_nextValue494845: [Node]Node;                                                         
 var _casable: bool;                                                                                
 var Queue._lock494801: [Queue]Tid;                                                                 
 var $pc494984: Phase;                                                                              
 var last494946: Node;                                                                              
 var Node._state494958: [Node]State;                                                                
 var Queue._state494785_post: [Queue]State;                                                         
 var Node.next_nextValue494965: [Node]Node;                                                         
 var mover494913: Mover;                                                                            
 var mover494795: Mover;                                                                            
 var tmp1494984: bool;                                                                              
 var $pc494845: Phase;                                                                              
 var tmp1494913: bool;                                                                              
 var Queue.tail494785_post: [Queue]Node;                                                            
 var Node._state494984: [Node]State;                                                                
 var Node.next494920: [Node]Node;                                                                   
 var $pc494958: Phase;                                                                              
 var Node._lock494946: [Node]Tid;                                                                   
 var Queue.tail494916: [Queue]Node;                                                                 
 var Queue._state494784: [Queue]State;                                                              
 var n: Node;                                                                                       
 var Queue._lock494920: [Queue]Tid;                                                                 
 var _casable494850: bool;                                                                          
 var Queue._state494764: [Queue]State;                                                              
 var last494958: Node;                                                                              
 var _m494958: Mover;                                                                               
 var n494784: Node;                                                                                 
 var moverPath494916: MoverPath;                                                                    
 var _C_v494845: Node;                                                                              
 var ctmp478622494965: bool;                                                                        
 var this494850: Queue;                                                                             
 var Node.next_nextValue494785: [Node]Node;                                                         
 var this494784: Queue;                                                                             
 var last494850: Node;                                                                              
 var n494913: Node;                                                                                 
 var tmp1: bool;                                                                                    
 var value494845: int;                                                                              
 var next494920: Node;                                                                              
 var Node.next_nextValue494764: [Node]Node;                                                         
 var _casable494845: bool;                                                                          
 var Node.next_nextThread494850: [Node]Tid;                                                         
 var next494807: Node;                                                                              
 var Node.next_nextThread494965: [Node]Tid;                                                         
 var next494965: Node;                                                                              
 var Node._lock494785_post: [Node]Tid;                                                              
 var Queue._state494913: [Queue]State;                                                              
 var last494785_post: Node;                                                                         
 var path494850: int;                                                                               
 var Node.next494850: [Node]Node;                                                                   
 var ctmp478622: bool;                                                                              
 var Queue.tail494983: [Queue]Node;                                                                 
 var next494958: Node;                                                                              
 var _currentValue494965: Node;                                                                     
 var Node.next494807: [Node]Node;                                                                   
 var value494946: int;                                                                              
 var tmpTid494913: Tid;                                                                             
 var _currentValue494943: Node;                                                                     
 var Node.next_nextThread494943: [Node]Tid;                                                         
 var Queue._lock494845: [Queue]Tid;                                                                 
 var path494958: int;                                                                               
 var Node._lock494850: [Node]Tid;                                                                   
 var moverPath494807: MoverPath;                                                                    
 var next494946: Node;                                                                              
 var $recorded.state494943: int;                                                                    
 var moverPath494795: MoverPath;                                                                    
 var Node.next_nextThread494845: [Node]Tid;                                                         
 var Node._state494807: [Node]State;                                                                
 var path494807: int;                                                                               
 var n494916: Node;                                                                                 
 var _m494913: Mover;                                                                               
 var $recorded.state494850: int;                                                                    
 var next494943: Node;                                                                              
 var this494958: Queue;                                                                             
 var Node._lock494845: [Node]Tid;                                                                   
 var _currentValue494807: Node;                                                                     
 var next494916: Node;                                                                              
 var Queue.tail494845: [Queue]Node;                                                                 
 var mover494958: Mover;                                                                            
 var Queue.tail494920: [Queue]Node;                                                                 
 var Node.next_nextThread494764: [Node]Tid;                                                         
 var this494764: Queue;                                                                             
 var n494850: Node;                                                                                 
 var Node.next_nextThread494913: [Node]Tid;                                                         
 var this$17494764: Node;                                                                           
 var Node.next_nextThread494983: [Node]Tid;                                                         
 var last494913: Node;                                                                              
 var Node._state494785: [Node]State;                                                                
 var Node._state494784: [Node]State;                                                                
 var this$17: Node;                                                                                 
 var $recorded.state494958: int;                                                                    
 var Node.next_nextValue494943: [Node]Node;                                                         
 var tmpValue494920: Node;                                                                          
 var Node.next_nextValue494958: [Node]Node;                                                         
 var n494785: Node;                                                                                 
 var path494943: int;                                                                               
 var Node.next_nextValue494946: [Node]Node;                                                         
 var _currentValue494845: Node;                                                                     
 var tid494850: Tid;                                                                                
 var Node.next494764: [Node]Node;                                                                   
 var _C_v: Node;                                                                                    
 var $pc494946: Phase;                                                                              
 var Node.next_nextValue494801: [Node]Node;                                                         
 var $recorded.state494764: int;                                                                    
 var moverPath494946: MoverPath;                                                                    
 var moverPath494943: MoverPath;                                                                    
 var _C_t494845: Tid;                                                                               
 var Queue._state494845: [Queue]State;                                                              
 var Node._state494764: [Node]State;                                                                
 var this494785_post: Queue;                                                                        
 var Queue._lock494984: [Queue]Tid;                                                                 
 var Queue._lock494785: [Queue]Tid;                                                                 
 var $recorded.state494795: int;                                                                    
 var Queue.tail494764: [Queue]Node;                                                                 
 var value494920: int;                                                                              
 var mover494784: Mover;                                                                            
 var n494946: Node;                                                                                 
 var n494920: Node;                                                                                 
 var next494983: Node;                                                                              
 var moverPath494913: MoverPath;                                                                    
 var Node._state494920: [Node]State;                                                                
 var this494845: Queue;                                                                             
 var value494764: int;                                                                              
 var Node._state494943: [Node]State;                                                                
 var value494913: int;                                                                              
 var next494984: Node;                                                                              
 var this494785: Queue;                                                                             
 var tmp1494958: bool;                                                                              
 var tid494946: Tid;                                                                                
 var path494916: int;                                                                               
 var tmp1494920: bool;                                                                              
 var tmp1494965: bool;                                                                              
 var next494801: Node;                                                                              
 var $pc494983: Phase;                                                                              
 var Node._lock494984: [Node]Tid;                                                                   
 var Node._lock494958: [Node]Tid;                                                                   
 var Node.next494785_post: [Node]Node;                                                              
 var _R_t494845: Mover;                                                                             
 var tmpValue494916: Node;                                                                          
 var Queue._state494965: [Queue]State;                                                              
 var last: Node;                                                                                    
 var $recorded.state494845: int;                                                                    
 var Node._state494850: [Node]State;                                                                
 var _currentValue494958: Node;                                                                     
 var Queue._state494916: [Queue]State;                                                              
 var this494946: Queue;                                                                             
 var Queue._state494983: [Queue]State;                                                              
 var value494943: int;                                                                              
 var Node.next494983: [Node]Node;                                                                   
 var tmp1494943: bool;                                                                              
 var last494785: Node;                                                                              
 var path494913: int;                                                                               
 var $recorded.state494801: int;                                                                    
 var value494795: int;                                                                              
 var Node.next_nextThread494801: [Node]Tid;                                                         
 var next494913: Node;                                                                              
 var last494943: Node;                                                                              
 var Queue.tail494946: [Queue]Node;                                                                 
 var Node._lock494916: [Node]Tid;                                                                   
 var mover494920: Mover;                                                                            
 var Queue.tail494850: [Queue]Node;                                                                 
 var Queue.tail494784: [Queue]Node;                                                                 
 var Node.next494795: [Node]Node;                                                                   
 var Node.next494845: [Node]Node;                                                                   
 var $pc494801: Phase;                                                                              
 var tid494984: Tid;                                                                                
 var n494764: Node;                                                                                 
 var _C_t494807: Tid;                                                                               
 var mover494946: Mover;                                                                            
 var next494845: Node;                                                                              
 var moverPath494801: MoverPath;                                                                    
 var Queue.tail494943: [Queue]Node;                                                                 
 var $pc494965: Phase;                                                                              
 var Node._state494965: [Node]State;                                                                
 var tmpTid494916: Tid;                                                                             
 var Queue.tail494795: [Queue]Node;                                                                 
 var _currentValue: Node;                                                                           
 var ctmp478622494946: bool;                                                                        
 var mover494764: Mover;                                                                            
 var tmp1494983: bool;                                                                              
 var Queue._state494785: [Queue]State;                                                              
 var path494801: int;                                                                               
 var $recorded.state494784: int;                                                                    
 var _C_t494801: Tid;                                                                               
 var $pc494850: Phase;                                                                              
 var moverPath494965: MoverPath;                                                                    
 var _R_t: Mover;                                                                                   
 var Queue._state494795: [Queue]State;                                                              
 var this494920: Queue;                                                                             
 var $recorded.state494807: int;                                                                    
 var _C_v494850: Node;                                                                              
 var Node._lock494943: [Node]Tid;                                                                   
 var n494983: Node;                                                                                 
 var n494807: Node;                                                                                 
 var _C_v494807: Node;                                                                              
 var $recorded.state494965: int;                                                                    
 var $pc494807: Phase;                                                                              
 var Queue._lock494795: [Queue]Tid;                                                                 
 var Queue.tail494807: [Queue]Node;                                                                 
 var Queue._lock494785_post: [Queue]Tid;                                                            
 var _m: Mover;                                                                                     
 var Node._state494913: [Node]State;                                                                
 var Queue._state494958: [Queue]State;                                                              
 var $pc494785_post: Phase;                                                                         
 var last494920: Node;                                                                              
 var Node.next494984: [Node]Node;                                                                   
 var $recorded.state494785_post: int;                                                               
 var $pc494764: Phase;                                                                              
 var tid494913: Tid;                                                                                
 var _R_t494850: Mover;                                                                             
 var Queue._lock494946: [Queue]Tid;                                                                 
 var Node._lock494983: [Node]Tid;                                                                   
 var _currentValue494850: Node;                                                                     
 var Queue._lock494784: [Queue]Tid;                                                                 
 var $pc494916: Phase;                                                                              
 var Queue.tail494984: [Queue]Node;                                                                 
 var Node._state494983: [Node]State;                                                                
 var next494850: Node;                                                                              
 var Queue._lock494965: [Queue]Tid;                                                                 
 var this494801: Queue;                                                                             
 var Queue._lock494913: [Queue]Tid;                                                                 
 var Node.next_nextValue494784: [Node]Node;                                                         
 var mover494943: Mover;                                                                            
 var Node.next494784: [Node]Node;                                                                   
 var Node._lock494965: [Node]Tid;                                                                   
 var Node.next_nextValue494795: [Node]Node;                                                         
 var Node._lock494807: [Node]Tid;                                                                   
 var Node.next_nextThread494785_post: [Node]Tid;                                                    
 var Queue._lock494916: [Queue]Tid;                                                                 
 var mover494845: Mover;                                                                            
 var Node.next494916: [Node]Node;                                                                   
 var $pc494785: Phase;                                                                              
 var mover494801: Mover;                                                                            
 var $recorded.state494984: int;                                                                    
 var _currentValue494946: Node;                                                                     
 var last494807: Node;                                                                              
 var tid494916: Tid;                                                                                
 var tid494784: Tid;                                                                                
 var path494845: int;                                                                               
 var Node.next494946: [Node]Node;                                                                   
 var Node._lock494913: [Node]Tid;                                                                   
 var this494913: Queue;                                                                             
 var Queue._state494984: [Queue]State;                                                              
 var next$17: Node;                                                                                 
 var Queue._lock494958: [Queue]Tid;                                                                 
 var tmpTid: Tid;                                                                                   
 var Queue._lock494983: [Queue]Tid;                                                                 
 var _C_v494801: Node;                                                                              
 var Node._lock494784: [Node]Tid;                                                                   
 var Node.next_nextThread494807: [Node]Tid;                                                         
 var ctmp478622494958: bool;                                                                        
 var path494965: int;                                                                               
 var Node.next_nextThread494784: [Node]Tid;                                                         
 var tid494983: Tid;                                                                                
 var next$17494764: Node;                                                                           
 var moverPath494845: MoverPath;                                                                    
 var Node.next_nextThread494785: [Node]Tid;                                                         
 var Queue._state494807: [Queue]State;                                                              
 var Node._lock494795: [Node]Tid;                                                                   
 var value494784: int;                                                                              
 var this494965: Queue;                                                                             
 var tid494943: Tid;                                                                                
 var Queue._state494943: [Queue]State;                                                              
 var tmpTid494920: Tid;                                                                             
 var n494965: Node;                                                                                 
 var value494850: int;                                                                              
 var n494785_post: Node;                                                                            
 var Node.next_nextValue494807: [Node]Node;                                                         
 var tid494920: Tid;                                                                                
 var Queue._lock494807: [Queue]Tid;                                                                 
 var $pc494795: Phase;                                                                              
 var $recorded.state494920: int;                                                                    
 var ctmp478622494913: bool;                                                                        
 var Queue.tail494913: [Queue]Node;                                                                 
 var moverPath494764: MoverPath;                                                                    
 var mover494965: Mover;                                                                            
 var this494983: Queue;                                                                             
 var value494958: int;                                                                              
 var Node.next_nextValue494984: [Node]Node;                                                         
 var ctmp478622494916: bool;                                                                        
 var tid494958: Tid;                                                                                
 var Node._state494845: [Node]State;                                                                
 var Queue.tail494958: [Queue]Node;                                                                 
 var last494795: Node;                                                                              
 var last494801: Node;                                                                              
 var Node.next_nextThread494916: [Node]Tid;                                                         
 var value494807: int;                                                                              
 var last494845: Node;                                                                              
 var last494984: Node;                                                                              
 var path494920: int;                                                                               
 var Node.next494958: [Node]Node;                                                                   
 var value494965: int;                                                                              
 var Node._state494801: [Node]State;                                                                
 var Node._lock494764: [Node]Tid;                                                                   
 var moverPath494784: MoverPath;                                                                    
 var value494785_post: int;                                                                         
 var $pc494913: Phase;                                                                              
 var Node.next_nextValue494850: [Node]Node;                                                         
 var Node._lock494785: [Node]Tid;                                                                   
 var Queue._state494920: [Queue]State;                                                              
 var Node._lock494801: [Node]Tid;                                                                   
 var Queue._state494850: [Queue]State;                                                              
 var n494943: Node;                                                                                 
 var tid494965: Tid;                                                                                
 var path494784: int;                                                                               
 var $recorded.state494913: int;                                                                    
 var value494984: int;                                                                              
 var tid494764: Tid;                                                                                
 var Node.next494943: [Node]Node;                                                                   
 var Node.next_nextValue494920: [Node]Node;                                                         
 var this494795: Queue;                                                                             
 var path494946: int;                                                                               
 var moverPath494850: MoverPath;                                                                    
 var Queue.tail494785: [Queue]Node;                                                                 
 var Node.next_nextValue494785_post: [Node]Node;                                                    
 var n494801: Node;                                                                                 
 var path494795: int;                                                                               
 var n494958: Node;                                                                                 
 var tid494785: Tid;                                                                                
 var Node.next_nextValue494913: [Node]Node;                                                         
 var tid494845: Tid;                                                                                
 var Node._state494785_post: [Node]State;                                                           
 var tid494807: Tid;                                                                                
 var moverPath494920: MoverPath;                                                                    
 var this494916: Queue;                                                                             
 var mover494916: Mover;                                                                            
 var Node._state494916: [Node]State;                                                                
 var tmpValue494913: Node;                                                                          
 var Node.next_nextThread494795: [Node]Tid;                                                         
 var Node.next_nextThread494946: [Node]Tid;                                                         
 var tmp1494916: bool;                                                                              
 var $recorded.state494916: int;                                                                    
 var _C_t494850: Tid;                                                                               
 var Queue._state494801: [Queue]State;                                                              
 var $recorded.state494946: int;                                                                    
 var Node.next_nextValue494916: [Node]Node;                                                         
 var tid494795: Tid;                                                                                
 var Node._state494946: [Node]State;                                                                
 var Node._lock494920: [Node]Tid;                                                                   
 var ctmp478622494943: bool;                                                                        
 var Node.next_nextValue494983: [Node]Node;                                                         
 var mover494850: Mover;                                                                            
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 15.9: Node n;                                                                                   
                                                                                                    
                                                                                                    
 // 15.9: n = new Node();                                                                           
                                                                                                    
 havoc n;                                                                                           
 assume n != Node.null && isFresh(Node._state[n]);                                                  
 Node._state[n] := LOCAL(tid);                                                                      
 assume Node.next[n]  == Node.null;                                                                 
 assume Node._lock[n]  == Tid.null;                                                                 
 // inlined: n.init(Node.null)}                                                                     
 exit$17_top:                                                                                       
                                                                                                    
 // 15.9: Node next$17;                                                                             
                                                                                                    
                                                                                                    
 // 15.9: Node this$17;                                                                             
                                                                                                    
                                                                                                    
 // 15.9: next$17 = Node.null;                                                                      
                                                                                                    
 next$17 := Node.null;                                                                              
                                                                                                    
 // 15.9: this$17 = n;                                                                              
                                                                                                    
 this$17 := n;                                                                                      
                                                                                                    
 // 5.5: assume this$17.next == Node.null;                                                          
                                                                                                    
 assume (Node.next[this$17]==Node.null);                                                            
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 6.9: assume this$17.next_nextThread == tid;                                                     
                                                                                                    
 assume (Node.next_nextThread[this$17]==tid);                                                       
 // NoOp: 'TraceOn'                                                                                 
                                                                                                    
                                                                                                    
 // 6.9: this$17.next := next$17;                                                                   
                                                                                                    
                                                                                                    
 moverPath494764 := WriteEval.Node.next(tid: Tid,this$17: Node,next$17: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 mover494764 := m#moverPath(moverPath494764);                                                       
 path494764 := p#moverPath(moverPath494764);                                                        
 assume Node._state494764 == Node._state && Node.next494764 == Node.next && Node._lock494764 == Node._lock && Node.next_nextThread494764 == Node.next_nextThread && Node.next_nextValue494764 == Node.next_nextValue && Queue._state494764 == Queue._state && Queue.tail494764 == Queue.tail && Queue._lock494764 == Queue._lock && this$17494764 == this$17 && next$17494764 == next$17 && n494764 == n && value494764 == value && this494764 == this && tid494764 == tid && $pc494764 == $pc;
 assume $recorded.state494764 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this$17 != Node.null;                                                                      
 } else {                                                                                           
  assert this$17 != Node.null;                                                                             // (6.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover494764);                                                               
 assert $pc != PhaseError;                                                                                 // (6.9): Reduction failure
 Node.next[this$17] := next$17;                                                                     
 if (isLocal(Node._state[next$17], tid)) {                                                          
  Node._state[next$17] := SHARED();                                                                 
  assert isSharedAssignable(Node._state[Node.next[next$17]]);                                              // (6.9): next$17 became shared, but next$17.next may not be shared.
 }                                                                                                  
                                                                                                    
                                                                                                    
 // 5.21: break exit$17;                                                                            
                                                                                                    
 goto exit$17_bottom;                                                                               
 exit$17_bottom:                                                                                    
                                                                                                    
 // 16.9: Node last;                                                                                
                                                                                                    
                                                                                                    
 // 16.9: last := this.tail;                                                                        
                                                                                                    
                                                                                                    
 moverPath494784 := ReadEval.Queue.tail(tid: Tid,this: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 mover494784 := m#moverPath(moverPath494784);                                                       
 path494784 := p#moverPath(moverPath494784);                                                        
 assume Node._state494784 == Node._state && Node.next494784 == Node.next && Node._lock494784 == Node._lock && Node.next_nextThread494784 == Node.next_nextThread && Node.next_nextValue494784 == Node.next_nextValue && Queue._state494784 == Queue._state && Queue.tail494784 == Queue.tail && Queue._lock494784 == Queue._lock && last494784 == last && n494784 == n && value494784 == value && this494784 == this && tid494784 == tid && $pc494784 == $pc;
 assume $recorded.state494784 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Queue.null;                                                                        
 } else {                                                                                           
  assert this != Queue.null;                                                                               // (16.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover494784);                                                               
 assert $pc != PhaseError;                                                                                 // (16.9): Reduction failure
 last := Queue.tail[this];                                                                          
                                                                                                    
 // 17.9: yield;                                                                                    
                                                                                                    
 assume Node._state494785 == Node._state && Node.next494785 == Node.next && Node._lock494785 == Node._lock && Node.next_nextThread494785 == Node.next_nextThread && Node.next_nextValue494785 == Node.next_nextValue && Queue._state494785 == Queue._state && Queue.tail494785 == Queue.tail && Queue._lock494785 == Queue._lock && last494785 == last && n494785 == n && value494785 == value && this494785 == this && tid494785 == tid;
 assume $recorded.state494785 == 1;                                                                 
 call Yield(tid);                                                                                   
 $pc := PreCommit;                                                                                  
 assume Node._state494785_post == Node._state && Node.next494785_post == Node.next && Node._lock494785_post == Node._lock && Node.next_nextThread494785_post == Node.next_nextThread && Node.next_nextValue494785_post == Node.next_nextValue && Queue._state494785_post == Queue._state && Queue.tail494785_post == Queue.tail && Queue._lock494785_post == Queue._lock && last494785_post == last && n494785_post == n && value494785_post == value && this494785_post == this && tid494785_post == tid;
 assume $recorded.state494785_post == 1;                                                            
                                                                                                    
 // 18.9: Node next;                                                                                
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 18.9: Tid _C_t;                                                                                 
                                                                                                    
                                                                                                    
 // 18.9: _C_t := last.next_nextThread  as B;                                                       
                                                                                                    
                                                                                                    
 moverPath494795 := ReadEval.Node.next_nextThread(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 mover494795 := m#moverPath(moverPath494795);                                                       
 path494795 := p#moverPath(moverPath494795);                                                        
 assume Node._state494795 == Node._state && Node.next494795 == Node.next && Node._lock494795 == Node._lock && Node.next_nextThread494795 == Node.next_nextThread && Node.next_nextValue494795 == Node.next_nextValue && Queue._state494795 == Queue._state && Queue.tail494795 == Queue.tail && Queue._lock494795 == Queue._lock && _C_t494795 == _C_t && next494795 == next && last494795 == last && n494795 == n && value494795 == value && this494795 == this && tid494795 == tid && $pc494795 == $pc;
 assume $recorded.state494795 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume last != Node.null;                                                                         
 } else {                                                                                           
  assert last != Node.null;                                                                                // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (18.9): Reduction failure
 _C_t := Node.next_nextThread[last];                                                                
                                                                                                    
 // 18.9: Node _C_v;                                                                                
                                                                                                    
                                                                                                    
 // 18.9: _C_v := last.next_nextValue  as B;                                                        
                                                                                                    
                                                                                                    
 moverPath494801 := ReadEval.Node.next_nextValue(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 mover494801 := m#moverPath(moverPath494801);                                                       
 path494801 := p#moverPath(moverPath494801);                                                        
 assume Node._state494801 == Node._state && Node.next494801 == Node.next && Node._lock494801 == Node._lock && Node.next_nextThread494801 == Node.next_nextThread && Node.next_nextValue494801 == Node.next_nextValue && Queue._state494801 == Queue._state && Queue.tail494801 == Queue.tail && Queue._lock494801 == Queue._lock && _C_v494801 == _C_v && _C_t494801 == _C_t && next494801 == next && last494801 == last && n494801 == n && value494801 == value && this494801 == this && tid494801 == tid && $pc494801 == $pc;
 assume $recorded.state494801 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume last != Node.null;                                                                         
 } else {                                                                                           
  assert last != Node.null;                                                                                // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (18.9): Reduction failure
 _C_v := Node.next_nextValue[last];                                                                 
                                                                                                    
 // 18.9: Node _currentValue;                                                                       
                                                                                                    
                                                                                                    
 // 18.9: _currentValue := last.next  as B;                                                         
                                                                                                    
                                                                                                    
 moverPath494807 := ReadEval.Node.next(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 mover494807 := m#moverPath(moverPath494807);                                                       
 path494807 := p#moverPath(moverPath494807);                                                        
 assume Node._state494807 == Node._state && Node.next494807 == Node.next && Node._lock494807 == Node._lock && Node.next_nextThread494807 == Node.next_nextThread && Node.next_nextValue494807 == Node.next_nextValue && Queue._state494807 == Queue._state && Queue.tail494807 == Queue.tail && Queue._lock494807 == Queue._lock && _currentValue494807 == _currentValue && _C_v494807 == _C_v && _C_t494807 == _C_t && next494807 == next && last494807 == last && n494807 == n && value494807 == value && this494807 == this && tid494807 == tid && $pc494807 == $pc;
 assume $recorded.state494807 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume last != Node.null;                                                                         
 } else {                                                                                           
  assert last != Node.null;                                                                                // (18.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (18.9): Reduction failure
 _currentValue := Node.next[last];                                                                  
                                                                                                    
 // 18.9: Mover _R_t;                                                                               
                                                                                                    
                                                                                                    
 // 18.9: _R_t = readPermission(last.next);                                                         
                                                                                                    
 _R_t := m#moverPath(ReadEval.Node.next(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock));
                                                                                                    
 // 18.9: boolean _casable;                                                                         
                                                                                                    
                                                                                                    
 // 18.9: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                    
                                                                                                    
 _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                           
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 18.9: next := last.next  as R;                                                                 
                                                                                                    
                                                                                                    
  moverPath494845 := ReadEval.Node.next(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
  mover494845 := m#moverPath(moverPath494845);                                                      
  path494845 := p#moverPath(moverPath494845);                                                       
  assume Node._state494845 == Node._state && Node.next494845 == Node.next && Node._lock494845 == Node._lock && Node.next_nextThread494845 == Node.next_nextThread && Node.next_nextValue494845 == Node.next_nextValue && Queue._state494845 == Queue._state && Queue.tail494845 == Queue.tail && Queue._lock494845 == Queue._lock && _casable494845 == _casable && _R_t494845 == _R_t && _currentValue494845 == _currentValue && _C_v494845 == _C_v && _C_t494845 == _C_t && next494845 == next && last494845 == last && n494845 == n && value494845 == value && this494845 == this && tid494845 == tid && $pc494845 == $pc;
  assume $recorded.state494845 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume last != Node.null;                                                                        
  } else {                                                                                          
   assert last != Node.null;                                                                               // (18.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (18.9): Reduction failure
  next := Node.next[last];                                                                          
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 18.9: next := last.next;                                                                       
                                                                                                    
                                                                                                    
  moverPath494850 := ReadEval.Node.next(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
  mover494850 := m#moverPath(moverPath494850);                                                      
  path494850 := p#moverPath(moverPath494850);                                                       
  assume Node._state494850 == Node._state && Node.next494850 == Node.next && Node._lock494850 == Node._lock && Node.next_nextThread494850 == Node.next_nextThread && Node.next_nextValue494850 == Node.next_nextValue && Queue._state494850 == Queue._state && Queue.tail494850 == Queue.tail && Queue._lock494850 == Queue._lock && _casable494850 == _casable && _R_t494850 == _R_t && _currentValue494850 == _currentValue && _C_v494850 == _C_v && _C_t494850 == _C_t && next494850 == next && last494850 == last && n494850 == n && value494850 == value && this494850 == this && tid494850 == tid && $pc494850 == $pc;
  assume $recorded.state494850 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume last != Node.null;                                                                        
  } else {                                                                                          
   assert last != Node.null;                                                                               // (18.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover494850);                                                              
  assert $pc != PhaseError;                                                                                // (18.9): Reduction failure
  next := Node.next[last];                                                                          
 }                                                                                                  
                                                                                                    
 // 19.9: boolean tmp1;                                                                             
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 19.9: boolean ctmp478622;                                                                       
                                                                                                    
                                                                                                    
 // 19.9: ctmp478622 = *;                                                                           
                                                                                                    
 havoc ctmp478622;                                                                                  
 if (ctmp478622) {                                                                                  
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 19.9: tmp1 = false;                                                                            
                                                                                                    
  tmp1 := false;                                                                                    
 } else {                                                                                           
                                                                                                    
  // 19.9: ctmp478622 = *;                                                                          
                                                                                                    
  havoc ctmp478622;                                                                                 
  if (ctmp478622) {                                                                                 
                                                                                                    
   // 19.9: Tid tmpTid;                                                                             
                                                                                                    
                                                                                                    
   // 19.9: Node tmpValue;                                                                          
                                                                                                    
                                                                                                    
   // 19.9: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 19.9: _m = writePermission(last.next, n);                                                     
                                                                                                    
   _m := m#moverPath(WriteEval.Node.next(tid: Tid,last: Node,n: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock));
                                                                                                    
   // 19.9: assume last.next == next;                                                               
                                                                                                    
   assume (Node.next[last]==next);                                                                  
                                                                                                    
   // 19.9: assume !goesWrong(_m);                                                                  
                                                                                                    
   assume !(transition($pc, _m) == PhaseError);                                                     
                                                                                                    
   // 19.9: assume last.next_nextThread == tid;                                                     
                                                                                                    
   assume (Node.next_nextThread[last]==tid);                                                        
                                                                                                    
   // 19.9: assume last.next_nextValue == next;                                                     
                                                                                                    
   assume (Node.next_nextValue[last]==next);                                                        
                                                                                                    
                                                                                                    
   // 19.9: last.next_nextThread := tmpTid as B;                                                    
                                                                                                    
                                                                                                    
   moverPath494913 := WriteEval.Node.next_nextThread(tid: Tid,last: Node,tmpTid: Tid,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494913 := m#moverPath(moverPath494913);                                                     
   path494913 := p#moverPath(moverPath494913);                                                      
   assume Node._state494913 == Node._state && Node.next494913 == Node.next && Node._lock494913 == Node._lock && Node.next_nextThread494913 == Node.next_nextThread && Node.next_nextValue494913 == Node.next_nextValue && Queue._state494913 == Queue._state && Queue.tail494913 == Queue.tail && Queue._lock494913 == Queue._lock && _m494913 == _m && tmpValue494913 == tmpValue && tmpTid494913 == tmpTid && ctmp478622494913 == ctmp478622 && tmp1494913 == tmp1 && next494913 == next && last494913 == last && n494913 == n && value494913 == value && this494913 == this && tid494913 == tid && $pc494913 == $pc;
   assume $recorded.state494913 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   Node.next_nextThread[last] := tmpTid;                                                            
                                                                                                    
                                                                                                    
   // 19.9: last.next_nextValue := tmpValue as B;                                                   
                                                                                                    
                                                                                                    
   moverPath494916 := WriteEval.Node.next_nextValue(tid: Tid,last: Node,tmpValue: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494916 := m#moverPath(moverPath494916);                                                     
   path494916 := p#moverPath(moverPath494916);                                                      
   assume Node._state494916 == Node._state && Node.next494916 == Node.next && Node._lock494916 == Node._lock && Node.next_nextThread494916 == Node.next_nextThread && Node.next_nextValue494916 == Node.next_nextValue && Queue._state494916 == Queue._state && Queue.tail494916 == Queue.tail && Queue._lock494916 == Queue._lock && _m494916 == _m && tmpValue494916 == tmpValue && tmpTid494916 == tmpTid && ctmp478622494916 == ctmp478622 && tmp1494916 == tmp1 && next494916 == next && last494916 == last && n494916 == n && value494916 == value && this494916 == this && tid494916 == tid && $pc494916 == $pc;
   assume $recorded.state494916 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   Node.next_nextValue[last] := tmpValue;                                                           
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 19.9: last.next := n;                                                                         
                                                                                                    
                                                                                                    
   moverPath494920 := WriteEval.Node.next(tid: Tid,last: Node,n: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494920 := m#moverPath(moverPath494920);                                                     
   path494920 := p#moverPath(moverPath494920);                                                      
   assume Node._state494920 == Node._state && Node.next494920 == Node.next && Node._lock494920 == Node._lock && Node.next_nextThread494920 == Node.next_nextThread && Node.next_nextValue494920 == Node.next_nextValue && Queue._state494920 == Queue._state && Queue.tail494920 == Queue.tail && Queue._lock494920 == Queue._lock && _m494920 == _m && tmpValue494920 == tmpValue && tmpTid494920 == tmpTid && ctmp478622494920 == ctmp478622 && tmp1494920 == tmp1 && next494920 == next && last494920 == last && n494920 == n && value494920 == value && this494920 == this && tid494920 == tid && $pc494920 == $pc;
   assume $recorded.state494920 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover494920);                                                             
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   Node.next[last] := n;                                                                            
   if (isLocal(Node._state[n], tid)) {                                                              
    Node._state[n] := SHARED();                                                                     
    assert isSharedAssignable(Node._state[Node.next[n]]);                                                  // (19.9): n became shared, but n.next may not be shared.
   }                                                                                                
                                                                                                    
                                                                                                    
   // 19.9: tmp1 = true;                                                                            
                                                                                                    
   tmp1 := true;                                                                                    
  } else {                                                                                          
                                                                                                    
   // 19.9: assume last.next_nextThread == tid;                                                     
                                                                                                    
   assume (Node.next_nextThread[last]==tid);                                                        
                                                                                                    
   // 19.9: assume last.next_nextValue == next;                                                     
                                                                                                    
   assume (Node.next_nextValue[last]==next);                                                        
                                                                                                    
   // 19.9: Node _currentValue;                                                                     
                                                                                                    
                                                                                                    
   // 19.9: _currentValue := last.next  as B;                                                       
                                                                                                    
                                                                                                    
   moverPath494943 := ReadEval.Node.next(tid: Tid,last: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494943 := m#moverPath(moverPath494943);                                                     
   path494943 := p#moverPath(moverPath494943);                                                      
   assume Node._state494943 == Node._state && Node.next494943 == Node.next && Node._lock494943 == Node._lock && Node.next_nextThread494943 == Node.next_nextThread && Node.next_nextValue494943 == Node.next_nextValue && Queue._state494943 == Queue._state && Queue.tail494943 == Queue.tail && Queue._lock494943 == Queue._lock && _currentValue494943 == _currentValue && ctmp478622494943 == ctmp478622 && tmp1494943 == tmp1 && next494943 == next && last494943 == last && n494943 == n && value494943 == value && this494943 == this && tid494943 == tid && $pc494943 == $pc;
   assume $recorded.state494943 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   _currentValue := Node.next[last];                                                                
                                                                                                    
                                                                                                    
   // 19.9: last.next := next as B;                                                                 
                                                                                                    
                                                                                                    
   moverPath494946 := WriteEval.Node.next(tid: Tid,last: Node,next: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494946 := m#moverPath(moverPath494946);                                                     
   path494946 := p#moverPath(moverPath494946);                                                      
   assume Node._state494946 == Node._state && Node.next494946 == Node.next && Node._lock494946 == Node._lock && Node.next_nextThread494946 == Node.next_nextThread && Node.next_nextValue494946 == Node.next_nextValue && Queue._state494946 == Queue._state && Queue.tail494946 == Queue.tail && Queue._lock494946 == Queue._lock && _currentValue494946 == _currentValue && ctmp478622494946 == ctmp478622 && tmp1494946 == tmp1 && next494946 == next && last494946 == last && n494946 == n && value494946 == value && this494946 == this && tid494946 == tid && $pc494946 == $pc;
   assume $recorded.state494946 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   Node.next[last] := next;                                                                         
   if (isLocal(Node._state[next], tid)) {                                                           
    Node._state[next] := SHARED();                                                                  
    assert isSharedAssignable(Node._state[Node.next[next]]);                                               // (19.9): next became shared, but next.next may not be shared.
   }                                                                                                
                                                                                                    
                                                                                                    
   // 19.9: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 19.9: _m = writePermission(last.next, n);                                                     
                                                                                                    
   _m := m#moverPath(WriteEval.Node.next(tid: Tid,last: Node,n: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock));
                                                                                                    
                                                                                                    
   // 19.9: last.next := _currentValue as B;                                                        
                                                                                                    
                                                                                                    
   moverPath494958 := WriteEval.Node.next(tid: Tid,last: Node,_currentValue: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494958 := m#moverPath(moverPath494958);                                                     
   path494958 := p#moverPath(moverPath494958);                                                      
   assume Node._state494958 == Node._state && Node.next494958 == Node.next && Node._lock494958 == Node._lock && Node.next_nextThread494958 == Node.next_nextThread && Node.next_nextValue494958 == Node.next_nextValue && Queue._state494958 == Queue._state && Queue.tail494958 == Queue.tail && Queue._lock494958 == Queue._lock && _m494958 == _m && _currentValue494958 == _currentValue && ctmp478622494958 == ctmp478622 && tmp1494958 == tmp1 && next494958 == next && last494958 == last && n494958 == n && value494958 == value && this494958 == this && tid494958 == tid && $pc494958 == $pc;
   assume $recorded.state494958 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   Node.next[last] := _currentValue;                                                                
   if (isLocal(Node._state[_currentValue], tid)) {                                                  
    Node._state[_currentValue] := SHARED();                                                         
    assert isSharedAssignable(Node._state[Node.next[_currentValue]]);                                      // (19.9): _currentValue became shared, but _currentValue.next may not be shared.
   }                                                                                                
                                                                                                    
                                                                                                    
   // 19.9: assume goesWrong(_m);                                                                   
                                                                                                    
   assume transition($pc, _m) == PhaseError;                                                        
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 19.9: last.next := n;                                                                         
                                                                                                    
                                                                                                    
   moverPath494965 := WriteEval.Node.next(tid: Tid,last: Node,n: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
   mover494965 := m#moverPath(moverPath494965);                                                     
   path494965 := p#moverPath(moverPath494965);                                                      
   assume Node._state494965 == Node._state && Node.next494965 == Node.next && Node._lock494965 == Node._lock && Node.next_nextThread494965 == Node.next_nextThread && Node.next_nextValue494965 == Node.next_nextValue && Queue._state494965 == Queue._state && Queue.tail494965 == Queue.tail && Queue._lock494965 == Queue._lock && _m494965 == _m && _currentValue494965 == _currentValue && ctmp478622494965 == ctmp478622 && tmp1494965 == tmp1 && next494965 == next && last494965 == last && n494965 == n && value494965 == value && this494965 == this && tid494965 == tid && $pc494965 == $pc;
   assume $recorded.state494965 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume last != Node.null;                                                                       
   } else {                                                                                         
    assert last != Node.null;                                                                              // (19.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover494965);                                                             
   assert $pc != PhaseError;                                                                               // (19.9): Reduction failure
   Node.next[last] := n;                                                                            
   if (isLocal(Node._state[n], tid)) {                                                              
    Node._state[n] := SHARED();                                                                     
    assert isSharedAssignable(Node._state[Node.next[n]]);                                                  // (19.9): n became shared, but n.next may not be shared.
   }                                                                                                
                                                                                                    
                                                                                                    
   // 19.9: tmp1 = false;                                                                           
                                                                                                    
   tmp1 := false;                                                                                   
  }                                                                                                 
 }                                                                                                  
 if (tmp1) {                                                                                        
 } else {                                                                                           
 }                                                                                                  
                                                                                                    
 // 21.9: assert false /* == false */;                                                              
                                                                                                    
 assume Node._state494983 == Node._state && Node.next494983 == Node.next && Node._lock494983 == Node._lock && Node.next_nextThread494983 == Node.next_nextThread && Node.next_nextValue494983 == Node.next_nextValue && Queue._state494983 == Queue._state && Queue.tail494983 == Queue.tail && Queue._lock494983 == Queue._lock && tmp1494983 == tmp1 && next494983 == next && last494983 == last && n494983 == n && value494983 == value && this494983 == this && tid494983 == tid;
 assume $recorded.state494983 == 1;                                                                 
 assert false /* lowered false */;                                                                         // (21.9): This assertion may not hold.
                                                                                                    
 // 14.36: // return;                                                                               
                                                                                                    
 assume Node._state494984 == Node._state && Node.next494984 == Node.next && Node._lock494984 == Node._lock && Node.next_nextThread494984 == Node.next_nextThread && Node.next_nextValue494984 == Node.next_nextValue && Queue._state494984 == Queue._state && Queue.tail494984 == Queue.tail && Queue._lock494984 == Queue._lock && tmp1494984 == tmp1 && next494984 == next && last494984 == last && n494984 == n && value494984 == value && this494984 == this && tid494984 == tid;
 assume $recorded.state494984 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Node._state: [Node]State,Node.next: [Node]Node,Node._lock: [Node]Tid,Node.next_nextThread: [Node]Tid,Node.next_nextValue: [Node]Node,Queue._state: [Queue]State,Queue.tail: [Queue]Node,Queue._lock: [Queue]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: Node  :: _i == Node.null <==> isNull(Node._state[_i])) &&                             
  (forall _i: Queue  :: _i == Queue.null <==> isNull(Queue._state[_i])) &&                          
  (forall _i: Node ::  (isShared(Node._state[_i]) ==> isSharedAssignable(Node._state[Node.next[_i]]))) &&
  (forall _i: Node ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Node._state[_i],_t) ==> isLocalAssignable(Node._state[Node.next[_i]], _t)))) &&
  (forall _i: Queue ::  (isShared(Queue._state[_i]) ==> isSharedAssignable(Node._state[Queue.tail[_i]]))) &&
  (forall _i: Queue ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Queue._state[_i],_t) ==> isLocalAssignable(Node._state[Queue.tail[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)         
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)          
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)           
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Node.next[x];                                                                          
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.next(u: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Node.next failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)               
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.next(t: Tid, u: Tid, v: Node, w: Node, x: Node)                
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == Node.next[x];                                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.next[x] := havocValue;                                                                        
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.next(u: Tid,x: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Node.next failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, x: Queue)       
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.tail[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.tail(u: Tid,x: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.tail failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, x: Queue)        
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Queue.tail[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Queue.tail(u: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (12.5): Queue.tail failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, x: Queue)        
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Queue.tail[x];                                                                         
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Queue.tail[x] := havocValue;                                                                       
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Queue.tail(u: Tid,x: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.tail failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, x: Queue)         
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume w == Queue.tail[x];                                                                         
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Queue.tail(u: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (12.5): Queue.tail failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, x: Queue)             
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.tail(t: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Queue.tail(u: Tid,x: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.tail failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, x: Queue)              
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[x], u);                                                         
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Node;                                                                             
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
 assume w == Queue.tail[x];                                                                         
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Queue.tail(t: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Queue.tail[x] := havocValue;                                                                       
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Queue.tail(u: Tid,x: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): Queue.tail failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.Node.next.Node.next(t: Tid, u: Tid, v: Node, w1: Node, w2: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpW: Node;                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var w2_pre: Node;                                                                                  
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w1_pre: Node;                                                                                  
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var w2_mid: Node;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w1_mid: Node;                                                                                  
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var w2_post: Node;                                                                                 
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w1_post: Node;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w1: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := Node.next[y];                                                                              
 Node.next[y] := w1;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.Node.next(u: Tid,y: Node,w2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 Node.next[y] := tmpW;                                                                              
                                                                                                    
 Node.next[x] := v;                                                                                 
 Node.next[y] := w1;                                                                                
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.Node.next(u: Tid,y: Node,w2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.Node.next.Node.next(t: Tid, u: Tid, v1: Node, v2: Node, w: Node, x: Node, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.next;                                                                                
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV: Node;                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var v2_pre: Node;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v1_pre: Node;                                                                                  
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var v2_mid: Node;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var v1_mid: Node;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var v1_post: Node;                                                                                 
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v2_post: Node;                                                                                 
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v1;                                                                                
 _writeByTAfterT := WriteEval.Node.next(t: Tid,x: Node,v2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 Node.next[x] := tmpV;                                                                              
                                                                                                    
 Node.next[y] := w;                                                                                 
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v1: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 Node.next[x] := v1;                                                                                
 _writeByTAfterUAndT := WriteEval.Node.next(t: Tid,x: Node,v2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Node.next (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.next.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.next.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Queue.tail[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.next.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v;                                                                                 
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.next[x] := tmpV;                                                                              
 Queue.tail[y] := w;                                                                                
 _writeByTPost := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.next.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.tail[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.next(t: Tid,x: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Queue.tail (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Queue.tail (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Node.next is not Read-Write Stable with respect to Queue.tail (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.next.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.tail(u: Tid,y: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[x] := v;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.tail(u: Tid,y: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.tail is not Write-Read Stable with respect to Node.next (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.tail is not Write-Read Stable with respect to Node.next (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Queue.tail is not Write-Read Stable with respect to Node.next (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.Node.next.Queue.tail(t: Tid, u: Tid, v: Node, w1: Node, w2: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpW: Node;                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var w2_pre: Node;                                                                                  
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var w1_pre: Node;                                                                                  
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var w2_mid: Node;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
 var w1_mid: Node;                                                                                  
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w2_post: Node;                                                                                 
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w1_post: Node;                                                                                 
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w1: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := Queue.tail[y];                                                                             
 Queue.tail[y] := w1;                                                                               
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.Queue.tail(u: Tid,y: Queue,w2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 Queue.tail[y] := tmpW;                                                                             
                                                                                                    
 Node.next[x] := v;                                                                                 
 Queue.tail[y] := w1;                                                                               
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.Queue.tail(u: Tid,y: Queue,w2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.Node.next.Queue.tail(t: Tid, u: Tid, v1: Node, v2: Node, w: Node, x: Node, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Node.next;                                                                                
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV: Node;                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var x_pre: Node;                                                                                   
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var v2_pre: Node;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v1_pre: Node;                                                                                  
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var y_mid: Queue;                                                                                  
 var v2_mid: Node;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var v1_mid: Node;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var v1_post: Node;                                                                                 
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v2_post: Node;                                                                                 
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := Node.next[x];                                                                              
 Node.next[x] := v1;                                                                                
 _writeByTAfterT := WriteEval.Node.next(t: Tid,x: Node,v2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 Node.next[x] := tmpV;                                                                              
                                                                                                    
 Queue.tail[y] := w;                                                                                
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.Node.next(t: Tid,x: Node,v1: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 Node.next[x] := v1;                                                                                
 _writeByTAfterUAndT := WriteEval.Node.next(t: Tid,x: Node,v2: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.tail.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Queue.tail;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.tail[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.tail.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Queue.tail;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.tail[x];                                                                             
 Queue.tail[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.tail[x] := tmpV;                                                                             
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.tail.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Queue.tail;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.tail[x];                                                                             
 Queue.tail[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.tail[x] := tmpV;                                                                             
 Node.next[y] := w;                                                                                 
 _writeByTPost := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.tail.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Queue.tail;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.tail(t: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.next(u: Tid,y: Node,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.next[y] := w;                                                                                 
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.tail(t: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.tail is not Read-Write Stable with respect to Node.next (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.tail is not Read-Write Stable with respect to Node.next (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.tail is not Read-Write Stable with respect to Node.next (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.tail.Node.next(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Node)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Node._state[y], u);                                                          
 modifies Queue.tail;                                                                               
 modifies Node.next;                                                                                
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.tail[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.next(u: Tid,y: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Queue.tail (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Node.next is not Write-Read Stable with respect to Queue.tail (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Node.next is not Write-Read Stable with respect to Queue.tail (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Queue.tail.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.tail;                                                                               
 modifies Queue.tail;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.tail[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Queue.tail.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.tail;                                                                               
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Queue.tail[x];                                                                             
 Queue.tail[x] := v;                                                                                
                                                                                                    
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Queue.tail[x] := tmpV;                                                                             
 Queue.tail[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Queue.tail.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.tail;                                                                               
 modifies Queue.tail;                                                                               
                                                                                                    
 {                                                                                                  
 var tmpV : Node;                                                                                   
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Queue.tail_mid: [Queue]Node;                                                                   
 var Node.next_mid: [Node]Node;                                                                     
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var w_mid: Node;                                                                                   
 var y_mid: Queue;                                                                                  
 var $recorded.state_mid: int;                                                                      
 var v_mid: Node;                                                                                   
 var Queue._lock_mid: [Queue]Tid;                                                                   
 var x_mid: Queue;                                                                                  
 var Node.next_nextValue_mid: [Node]Node;                                                           
 var Node.next_nextThread_mid: [Node]Tid;                                                           
 var w0_mid: Node;                                                                                  
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var Queue._state_mid: [Queue]State;                                                                
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Queue.tail[x];                                                                             
 Queue.tail[x] := v;                                                                                
 assume Node._state_mid == Node._state && Node.next_mid == Node.next && Node._lock_mid == Node._lock && Node.next_nextThread_mid == Node.next_nextThread && Node.next_nextValue_mid == Node.next_nextValue && Queue._state_mid == Queue._state && Queue.tail_mid == Queue.tail && Queue._lock_mid == Queue._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Queue.tail[x] := tmpV;                                                                             
 Queue.tail[y] := w;                                                                                
 _writeByTPost := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Queue.tail.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.tail;                                                                               
 modifies Queue.tail;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Queue.tail(t: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Queue.tail(u: Tid,y: Queue,w: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.tail[y] := w;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Queue.tail(t: Tid,x: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.tail is not Read-Write Stable with respect to Queue.tail (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.tail is not Read-Write Stable with respect to Queue.tail (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): Queue.tail is not Read-Write Stable with respect to Queue.tail (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Queue.tail.Queue.tail(t: Tid, u: Tid, v: Node, w: Node, w0: Node, x: Queue, y: Queue)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Queue._state[x], t);                                                         
 requires isAccessible(Queue._state[y], u);                                                         
 modifies Queue.tail;                                                                               
 modifies Queue.tail;                                                                               
                                                                                                    
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
 var Node._lock_pre: [Node]Tid;                                                                     
 var Node.next_nextValue_pre: [Node]Node;                                                           
 var x_pre: Queue;                                                                                  
 var Node.next_nextThread_pre: [Node]Tid;                                                           
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Queue;                                                                                  
 var Queue._lock_pre: [Queue]Tid;                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var v_pre: Node;                                                                                   
 var Queue.tail_pre: [Queue]Node;                                                                   
 var Queue._state_pre: [Queue]State;                                                                
 var $pc_pre: Phase;                                                                                
 var w0_pre: Node;                                                                                  
 var w_pre: Node;                                                                                   
 var Node.next_pre: [Node]Node;                                                                     
 var t_pre: Tid;                                                                                    
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Node.next_nextThread_post: [Node]Tid;                                                          
 var x_post: Queue;                                                                                 
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var Queue.tail_post: [Queue]Node;                                                                  
 var Node.next_nextValue_post: [Node]Node;                                                          
 var w0_post: Node;                                                                                 
 var y_post: Queue;                                                                                 
 var Node._state_post: [Node]State;                                                                 
 var Node.next_post: [Node]Node;                                                                    
 var Queue._state_post: [Queue]State;                                                               
 var v_post: Node;                                                                                  
 var Queue._lock_post: [Queue]Tid;                                                                  
 var u_post: Tid;                                                                                   
 var w_post: Node;                                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Queue.tail(u: Tid,y: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Queue.tail(t: Tid,x: Queue,v: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Queue.tail[x] := v;                                                                                
 assume Node._state_post == Node._state && Node.next_post == Node.next && Node._lock_post == Node._lock && Node.next_nextThread_post == Node.next_nextThread && Node.next_nextValue_post == Node.next_nextValue && Queue._state_post == Queue._state && Queue.tail_post == Queue.tail && Queue._lock_post == Queue._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Queue.tail(u: Tid,y: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.tail is not Write-Read Stable with respect to Queue.tail (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): Queue.tail is not Write-Read Stable with respect to Queue.tail (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): Queue.tail is not Write-Read Stable with respect to Queue.tail (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
requires ValidTid(tid);                                                                             
modifies Node._state;                                                                               
modifies Node.next;                                                                                 
modifies Node._lock;                                                                                
modifies Node.next_nextThread;                                                                      
modifies Node.next_nextValue;                                                                       
modifies Queue._state;                                                                              
modifies Queue.tail;                                                                                
modifies Queue._lock;                                                                               
ensures StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
ensures Y(tid , old(Node._state), old(Node.next), old(Node._lock), old(Node.next_nextThread), old(Node.next_nextValue), old(Queue._state), old(Queue.tail), old(Queue._lock) , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
                                                                                                    
// Node.next:                                                                                       
                                                                                                    
function {:inline} Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _R)) ==> (Node.next[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var newValue_yield: Node;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.next(u: Tid,this: Node,newValue: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.next(tid, this, Node.next[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node.next.Transitive(tid : Tid, this: Node, newValue : Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Node.next_nextThread_p: [Node]Tid, Node.next_nextValue_p: [Node]Node, Queue._state_p: [Queue]State, Queue.tail_p: [Queue]Node, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var Node.next_nextValue_pre: [Node]Node;                                                            
var Node.next_nextThread_pre: [Node]Tid;                                                            
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Queue._lock_pre: [Queue]Tid;                                                                    
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Queue.tail_pre: [Queue]Node;                                                                    
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var Node.next_nextThread_post: [Node]Tid;                                                           
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var Queue.tail_post: [Queue]Node;                                                                   
var Node.next_nextValue_post: [Node]Node;                                                           
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var Queue._state_post: [Queue]State;                                                                
var this_post: Node;                                                                                
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 assume Y_Node.next(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Node.next_nextThread_post == Node.next_nextThread_p && Node.next_nextValue_post == Node.next_nextValue_p && Queue._state_post == Queue._state_p && Queue.tail_post == Queue.tail_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.next(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var newValue_yield: Tid;                                                                            
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _N);
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var this_yield: Node;                                                                               
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Node.next_nextThread_p: [Node]Tid, Node.next_nextValue_p: [Node]Node, Queue._state_p: [Queue]State, Queue.tail_p: [Queue]Node, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var Node.next_nextValue_pre: [Node]Node;                                                            
var Node.next_nextThread_pre: [Node]Tid;                                                            
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Queue._lock_pre: [Queue]Tid;                                                                    
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Queue.tail_pre: [Queue]Node;                                                                    
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.next_nextThread_post: [Node]Tid;                                                           
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var Queue.tail_post: [Queue]Node;                                                                   
var Node.next_nextValue_post: [Node]Node;                                                           
var tid_post: Tid;                                                                                  
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var Queue._state_post: [Queue]State;                                                                
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 assume Y_Node._lock(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Node.next_nextThread_post == Node.next_nextThread_p && Node.next_nextValue_post == Node.next_nextValue_p && Queue._state_post == Queue._state_p && Queue.tail_post == Queue.tail_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
// Node.next_nextThread:                                                                            
                                                                                                    
function {:inline} Y_Node.next_nextThread(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next_nextThread(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _R)) ==> (Node.next_nextThread[this] == newValue))
 &&(((Node.next_nextThread[this]==tid)==>(newValue==tid)))                                          
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next_nextThread(tid : Tid, this: Node, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// Node.next_nextValue:                                                                             
                                                                                                    
function {:inline} Y_Node.next_nextValue(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.next_nextValue(tid: Tid,this: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _R)) ==> (Node.next_nextValue[this] == newValue))
 &&(((Node.next_nextThread[this]==tid)==>(newValue==Node.next_nextValue[this])))                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.next_nextValue(tid : Tid, this: Node, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// Queue.tail:                                                                                      
                                                                                                    
function {:inline} Y_Queue.tail(tid : Tid, this: Queue, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Queue._state[this], tid) && leq(m#moverPath(ReadEval.Queue.tail(tid: Tid,this: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _R)) ==> (Queue.tail[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Queue.tail(tid : Tid, this: Queue, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Queue.tail.Subsumes.W(tid : Tid, u : Tid, this: Queue, newValue: Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var newValue_yield: Node;                                                                           
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume isAccessible(Queue._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Queue.tail(u: Tid,this: Queue,newValue: Node,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)));
                                                                                                    
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.tail(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.tail.Reflexive(tid : Tid, this: Queue , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue.tail(tid, this, Queue.tail[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue.tail.Transitive(tid : Tid, this: Queue, newValue : Node , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Node.next_nextThread_p: [Node]Tid, Node.next_nextValue_p: [Node]Node, Queue._state_p: [Queue]State, Queue.tail_p: [Queue]Node, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var newValue_pre: Node;                                                                             
var Node._lock_pre: [Node]Tid;                                                                      
var Node.next_nextValue_pre: [Node]Node;                                                            
var Node.next_nextThread_pre: [Node]Tid;                                                            
var $recorded.state_pre: int;                                                                       
var Queue._lock_pre: [Queue]Tid;                                                                    
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Queue.tail_pre: [Queue]Node;                                                                    
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var this_pre: Queue;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var newValue_post: Node;                                                                            
var Node.next_nextThread_post: [Node]Tid;                                                           
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var Queue.tail_post: [Queue]Node;                                                                   
var Node.next_nextValue_post: [Node]Node;                                                           
var tid_post: Tid;                                                                                  
var this_post: Queue;                                                                               
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var Queue._state_post: [Queue]State;                                                                
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume Y(tid , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 assume Y_Queue.tail(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Node.next_nextThread_post == Node.next_nextThread_p && Node.next_nextValue_post == Node.next_nextValue_p && Queue._state_post == Queue._state_p && Queue.tail_post == Queue.tail_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Queue.tail(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
// Queue._lock:                                                                                     
                                                                                                    
function {:inline} Y_Queue._lock(tid : Tid, this: Queue, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 ((isAccessible(Queue._state[this], tid) && leq(m#moverPath(ReadEval.Queue._lock(tid: Tid,this: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _R)) ==> (Queue._lock[this] == newValue))
 &&(((Queue._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Queue._lock(tid : Tid, this: Queue, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Queue._lock.Subsumes.W(tid : Tid, u : Tid, this: Queue, newValue: Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var newValue_yield: Tid;                                                                            
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume isAccessible(Queue._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Queue._lock(u: Tid,this: Queue,newValue: Tid,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)));
 assume leq(m#moverPath(ReadEval.Queue._lock(tid: Tid,this: Queue,Node._state,Node.next,Node._lock,Node.next_nextThread,Node.next_nextValue,Queue._state,Queue.tail,Queue._lock)), _N);
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue._lock.Reflexive(tid : Tid, this: Queue , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Queue.tail_yield: [Queue]Node;                                                                  
var Node.next_yield: [Node]Node;                                                                    
var Queue._state_yield: [Queue]State;                                                               
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Node.next_nextThread_yield: [Node]Tid;                                                          
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var Queue._lock_yield: [Queue]Tid;                                                                  
var Node.next_nextValue_yield: [Node]Node;                                                          
var $recorded.state_yield: int;                                                                     
var this_yield: Queue;                                                                              
                                                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
assume Node._state_yield == Node._state && Node.next_yield == Node.next && Node._lock_yield == Node._lock && Node.next_nextThread_yield == Node.next_nextThread && Node.next_nextValue_yield == Node.next_nextValue && Queue._state_yield == Queue._state && Queue.tail_yield == Queue.tail && Queue._lock_yield == Queue._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Queue._lock(tid, this, Queue._lock[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
procedure Y_Queue._lock.Transitive(tid : Tid, this: Queue, newValue : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Node.next_nextThread_p: [Node]Tid, Node.next_nextValue_p: [Node]Node, Queue._state_p: [Queue]State, Queue.tail_p: [Queue]Node, Queue._lock_p: [Queue]Tid)
 requires StateInvariant(Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
 requires StateInvariant(Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var Node.next_nextValue_pre: [Node]Node;                                                            
var Node.next_nextThread_pre: [Node]Tid;                                                            
var $recorded.state_pre: int;                                                                       
var Queue._lock_pre: [Queue]Tid;                                                                    
var Node._state_pre: [Node]State;                                                                   
var tid_pre: Tid;                                                                                   
var Queue.tail_pre: [Queue]Node;                                                                    
var Queue._state_pre: [Queue]State;                                                                 
var $pc_pre: Phase;                                                                                 
var Node.next_pre: [Node]Node;                                                                      
var newValue_pre: Tid;                                                                              
var this_pre: Queue;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var Node.next_nextThread_post: [Node]Tid;                                                           
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var Queue.tail_post: [Queue]Node;                                                                   
var Node.next_nextValue_post: [Node]Node;                                                           
var tid_post: Tid;                                                                                  
var this_post: Queue;                                                                               
var Node._state_post: [Node]State;                                                                  
var Node.next_post: [Node]Node;                                                                     
var Queue._state_post: [Queue]State;                                                                
var newValue_post: Tid;                                                                             
var Queue._lock_post: [Queue]Tid;                                                                   
                                                                                                    
assume Node._state_pre == Node._state && Node.next_pre == Node.next && Node._lock_pre == Node._lock && Node.next_nextThread_pre == Node.next_nextThread && Node.next_nextValue_pre == Node.next_nextValue && Queue._state_pre == Queue._state && Queue.tail_pre == Queue.tail && Queue._lock_pre == Queue._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Queue._state[this], tid);                                                      
 assume Y(tid , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
 assume Y_Queue._lock(tid, this, newValue , Node._state_p, Node.next_p, Node._lock_p, Node.next_nextThread_p, Node.next_nextValue_p, Queue._state_p, Queue.tail_p, Queue._lock_p);
assume Node._state_post == Node._state_p && Node.next_post == Node.next_p && Node._lock_post == Node._lock_p && Node.next_nextThread_post == Node.next_nextThread_p && Node.next_nextValue_post == Node.next_nextValue_p && Queue._state_post == Queue._state_p && Queue.tail_post == Queue.tail_p && Queue._lock_post == Queue._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Queue._lock(tid, this, newValue , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Node._state: [Node]State, Node.next: [Node]Node, Node._lock: [Node]Tid, Node.next_nextThread: [Node]Tid, Node.next_nextValue: [Node]Node, Queue._state: [Queue]State, Queue.tail: [Queue]Node, Queue._lock: [Queue]Tid , Node._state_p: [Node]State, Node.next_p: [Node]Node, Node._lock_p: [Node]Tid, Node.next_nextThread_p: [Node]Tid, Node.next_nextValue_p: [Node]Node, Queue._state_p: [Queue]State, Queue.tail_p: [Queue]Node, Queue._lock_p: [Queue]Tid): bool
{                                                                                                   
 (forall this: Node :: Y_Node.next(tid : Tid, this, Node.next_p[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock))
 && (forall this: Node :: Y_Node.next_nextThread(tid : Tid, this, Node.next_nextThread_p[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock))
 && (forall this: Node :: Y_Node.next_nextValue(tid : Tid, this, Node.next_nextValue_p[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock))
 && (forall this: Queue :: Y_Queue.tail(tid : Tid, this, Queue.tail_p[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock))
 && (forall this: Queue :: Y_Queue._lock(tid : Tid, this, Queue._lock_p[this] , Node._state, Node.next, Node._lock, Node.next_nextThread, Node.next_nextValue, Queue._state, Queue.tail, Queue._lock))
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
 && (forall _i : Queue :: isShared(Queue._state[_i]) ==> isShared(Queue._state_p[_i]))              
 && (forall _i : Queue :: isLocal(Queue._state[_i], tid) <==> isLocal(Queue._state_p[_i], tid))     
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 1001.1-1879.2: (Method:14.5)
// 1013.1-1013.24: (14.5): Bad tid
// 1014.1-1014.39: (14.5): this is not global
// 1414.2-1416.2: (class anchor.sink.VarDeclStmt:15.9)
// 1417.2-1424.36: (class anchor.sink.Alloc:15.9)
// 1427.2-1429.2: (class anchor.sink.VarDeclStmt:15.9)
// 1430.2-1432.2: (class anchor.sink.VarDeclStmt:15.9)
// 1433.2-1436.23: (class anchor.sink.Assign:15.9)
// 1437.2-1440.15: (class anchor.sink.Assign:15.9)
// 1441.2-1444.41: (class anchor.sink.Assume:5.5)
// 1446.2-1449.46: (class anchor.sink.Assume:6.9)
// 1452.2-1473.2: (class anchor.sink.Write:6.9)
// 1464.1-1464.31: (6.9): Cannot have potential null deference in left-mover part.
// 1467.1-1467.27: (6.9): Reduction failure
// 1471.1-1471.62: (6.9): next$17 became shared, but next$17.next may not be shared.
// 1474.2-1477.22: (class anchor.sink.Break:5.21)
// 1479.2-1481.2: (class anchor.sink.VarDeclStmt:16.9)
// 1482.2-1499.27: (class anchor.sink.Read:16.9)
// 1494.1-1494.29: (16.9): Cannot have potential null deference in left-mover part.
// 1498.1-1498.27: (16.9): Reduction failure
// 1500.2-1508.41: (class anchor.sink.Yield:17.9)
// 1509.2-1511.2: (class anchor.sink.VarDeclStmt:18.9)
// 1513.2-1515.2: (class anchor.sink.VarDeclStmt:18.9)
// 1516.2-1533.37: (class anchor.sink.Read:18.9)
// 1528.1-1528.28: (18.9): Cannot have potential null deference in left-mover part.
// 1532.1-1532.27: (18.9): Reduction failure
// 1534.2-1536.2: (class anchor.sink.VarDeclStmt:18.9)
// 1537.2-1554.36: (class anchor.sink.Read:18.9)
// 1549.1-1549.28: (18.9): Cannot have potential null deference in left-mover part.
// 1553.1-1553.27: (18.9): Reduction failure
// 1555.2-1557.2: (class anchor.sink.VarDeclStmt:18.9)
// 1558.2-1575.35: (class anchor.sink.Read:18.9)
// 1570.1-1570.28: (18.9): Cannot have potential null deference in left-mover part.
// 1574.1-1574.27: (18.9): Reduction failure
// 1576.2-1578.2: (class anchor.sink.VarDeclStmt:18.9)
// 1579.2-1582.173: (class anchor.sink.Assign:18.9)
// 1583.2-1585.2: (class anchor.sink.VarDeclStmt:18.9)
// 1586.2-1589.74: (class anchor.sink.Assign:18.9)
// 1592.3-1609.27: (class anchor.sink.Read:18.9)
// 1604.1-1604.29: (18.9): Cannot have potential null deference in left-mover part.
// 1608.1-1608.28: (18.9): Reduction failure
// 1612.3-1629.27: (class anchor.sink.Read:18.9)
// 1624.1-1624.29: (18.9): Cannot have potential null deference in left-mover part.
// 1628.1-1628.28: (18.9): Reduction failure
// 1631.2-1633.2: (class anchor.sink.VarDeclStmt:19.9)
// 1635.2-1637.2: (class anchor.sink.VarDeclStmt:19.9)
// 1638.2-1641.19: (class anchor.sink.Assign:19.9)
// 1644.3-1647.17: (class anchor.sink.Assign:19.9)
// 1649.3-1652.20: (class anchor.sink.Assign:19.9)
// 1654.4-1656.4: (class anchor.sink.VarDeclStmt:19.9)
// 1657.4-1659.4: (class anchor.sink.VarDeclStmt:19.9)
// 1660.4-1662.4: (class anchor.sink.VarDeclStmt:19.9)
// 1663.4-1666.182: (class anchor.sink.Assign:19.9)
// 1667.4-1670.35: (class anchor.sink.Assume:19.9)
// 1671.4-1674.48: (class anchor.sink.Assume:19.9)
// 1675.4-1678.45: (class anchor.sink.Assume:19.9)
// 1679.4-1682.45: (class anchor.sink.Assume:19.9)
// 1684.4-1700.41: (class anchor.sink.Write:19.9)
// 1696.1-1696.30: (19.9): Cannot have potential null deference in left-mover part.
// 1699.1-1699.29: (19.9): Reduction failure
// 1702.4-1718.42: (class anchor.sink.Write:19.9)
// 1714.1-1714.30: (19.9): Cannot have potential null deference in left-mover part.
// 1717.1-1717.29: (19.9): Reduction failure
// 1721.4-1742.4: (class anchor.sink.Write:19.9)
// 1733.1-1733.30: (19.9): Cannot have potential null deference in left-mover part.
// 1736.1-1736.29: (19.9): Reduction failure
// 1740.1-1740.58: (19.9): n became shared, but n.next may not be shared.
// 1743.4-1746.17: (class anchor.sink.Assign:19.9)
// 1748.4-1751.45: (class anchor.sink.Assume:19.9)
// 1752.4-1755.45: (class anchor.sink.Assume:19.9)
// 1756.4-1758.4: (class anchor.sink.VarDeclStmt:19.9)
// 1759.4-1776.37: (class anchor.sink.Read:19.9)
// 1771.1-1771.30: (19.9): Cannot have potential null deference in left-mover part.
// 1775.1-1775.29: (19.9): Reduction failure
// 1778.4-1799.4: (class anchor.sink.Write:19.9)
// 1790.1-1790.30: (19.9): Cannot have potential null deference in left-mover part.
// 1793.1-1793.29: (19.9): Reduction failure
// 1797.1-1797.61: (19.9): next became shared, but next.next may not be shared.
// 1800.4-1802.4: (class anchor.sink.VarDeclStmt:19.9)
// 1803.4-1806.182: (class anchor.sink.Assign:19.9)
// 1808.4-1829.4: (class anchor.sink.Write:19.9)
// 1820.1-1820.30: (19.9): Cannot have potential null deference in left-mover part.
// 1823.1-1823.29: (19.9): Reduction failure
// 1827.1-1827.70: (19.9): _currentValue became shared, but _currentValue.next may not be shared.
// 1830.4-1833.45: (class anchor.sink.Assume:19.9)
// 1836.4-1857.4: (class anchor.sink.Write:19.9)
// 1848.1-1848.30: (19.9): Cannot have potential null deference in left-mover part.
// 1851.1-1851.29: (19.9): Reduction failure
// 1855.1-1855.58: (19.9): n became shared, but n.next may not be shared.
// 1858.4-1861.18: (class anchor.sink.Assign:19.9)
// 1867.2-1872.35: (class anchor.sink.Assert:21.9)
// 1872.1-1872.35: (21.9): This assertion may not hold.
// 1873.2-1878.9: (class anchor.sink.Return:14.36)
// 1968.1-1968.34: (3.5): Node.next failed Write-Write Right-Mover Check
// 2035.1-2035.30: (3.5): Node.next failed Write-Read Right-Mover Check
// 2106.1-2106.34: (3.5): Node.next failed Write-Write Left-Mover Check
// 2174.1-2174.30: (3.5): Node.next failed Write-Read Left-Mover Check
// 2239.1-2239.34: (3.5): Node.next failed Read-Write Right-Mover Check
// 2307.1-2307.34: (3.5): Node.next failed Read-Write Left-Mover Check
// 2374.1-2374.34: (12.5): Queue.tail failed Write-Write Right-Mover Check
// 2441.1-2441.30: (12.5): Queue.tail failed Write-Read Right-Mover Check
// 2512.1-2512.34: (12.5): Queue.tail failed Write-Write Left-Mover Check
// 2580.1-2580.30: (12.5): Queue.tail failed Write-Read Left-Mover Check
// 2645.1-2645.34: (12.5): Queue.tail failed Read-Write Right-Mover Check
// 2713.1-2713.34: (12.5): Queue.tail failed Read-Write Left-Mover Check
// 2792.1-2792.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.1)
// 2793.1-2793.101: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.2)
// 2794.1-2794.158: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case A.3)
// 2902.1-2902.140: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case C)
// 3015.1-3015.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case D)
// 3016.1-3016.144: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case R)
// 3095.1-3095.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case F)
// 3096.1-3096.136: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case H)
// 3097.1-3097.146: (3.5): Node.next is not Read-Write Stable with respect to Node.next (case I)
// 3175.1-3175.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case J)
// 3176.1-3176.136: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case K)
// 3177.1-3177.99: (3.5): Node.next is not Write-Read Stable with respect to Node.next (case L)
// 3295.1-3295.142: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case M)
// 3411.1-3411.130: (3.5): Node.next is not Write-Write Stable with respect to Node.next (case N)
// 3492.1-3492.140: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case A.1)
// 3493.1-3493.101: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case A.2)
// 3494.1-3494.156: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case A.3)
// 3602.1-3602.140: (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case C)
// 3715.1-3715.144: (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case D)
// 3716.1-3716.144: (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case R)
// 3795.1-3795.136: (3.5): Node.next is not Read-Write Stable with respect to Queue.tail (case F)
// 3796.1-3796.136: (3.5): Node.next is not Read-Write Stable with respect to Queue.tail (case H)
// 3797.1-3797.144: (3.5): Node.next is not Read-Write Stable with respect to Queue.tail (case I)
// 3875.1-3875.136: (12.5): Queue.tail is not Write-Read Stable with respect to Node.next (case J)
// 3876.1-3876.136: (12.5): Queue.tail is not Write-Read Stable with respect to Node.next (case K)
// 3877.1-3877.99: (12.5): Queue.tail is not Write-Read Stable with respect to Node.next (case L)
// 3995.1-3995.142: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case M)
// 4111.1-4111.130: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case N)
// 4192.1-4192.140: (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case A.1)
// 4193.1-4193.101: (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case A.2)
// 4194.1-4194.156: (3.5): Node.next is not Write-Write Stable with respect to Queue.tail (case A.3)
// 4302.1-4302.140: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case C)
// 4415.1-4415.144: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case D)
// 4416.1-4416.144: (12.5): Queue.tail is not Write-Write Stable with respect to Node.next (case R)
// 4495.1-4495.136: (12.5): Queue.tail is not Read-Write Stable with respect to Node.next (case F)
// 4496.1-4496.136: (12.5): Queue.tail is not Read-Write Stable with respect to Node.next (case H)
// 4497.1-4497.144: (12.5): Queue.tail is not Read-Write Stable with respect to Node.next (case I)
// 4575.1-4575.136: (3.5): Node.next is not Write-Read Stable with respect to Queue.tail (case J)
// 4576.1-4576.136: (3.5): Node.next is not Write-Read Stable with respect to Queue.tail (case K)
// 4577.1-4577.99: (3.5): Node.next is not Write-Read Stable with respect to Queue.tail (case L)
// 4657.1-4657.140: (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case A.1)
// 4658.1-4658.101: (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case A.2)
// 4659.1-4659.158: (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case A.3)
// 4767.1-4767.140: (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case C)
// 4880.1-4880.144: (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case D)
// 4881.1-4881.144: (12.5): Queue.tail is not Write-Write Stable with respect to Queue.tail (case R)
// 4960.1-4960.136: (12.5): Queue.tail is not Read-Write Stable with respect to Queue.tail (case F)
// 4961.1-4961.136: (12.5): Queue.tail is not Read-Write Stable with respect to Queue.tail (case H)
// 4962.1-4962.146: (12.5): Queue.tail is not Read-Write Stable with respect to Queue.tail (case I)
// 5040.1-5040.136: (12.5): Queue.tail is not Write-Read Stable with respect to Queue.tail (case J)
// 5041.1-5041.136: (12.5): Queue.tail is not Write-Read Stable with respect to Queue.tail (case K)
// 5042.1-5042.99: (12.5): Queue.tail is not Write-Read Stable with respect to Queue.tail (case L)
// 5078.1-5102.2: (3.5): yields_as clause for Node.next is not valid
// 5107.1-5126.2: (3.5): yields_as clause for Node.next is not reflexive
// 5132.1-5170.2: (3.5): yields_as clause for Node.next is not transitive
// 5190.1-5214.2: (7.32): yields_as clause for Node._lock is not valid
// 5219.1-5238.2: (7.32): yields_as clause for Node._lock is not reflexive
// 5244.1-5282.2: (7.32): yields_as clause for Node._lock is not transitive
// 5329.1-5353.2: (12.5): yields_as clause for Queue.tail is not valid
// 5358.1-5377.2: (12.5): yields_as clause for Queue.tail is not reflexive
// 5383.1-5421.2: (12.5): yields_as clause for Queue.tail is not transitive
// 5441.1-5465.2: (7.32): yields_as clause for Queue._lock is not valid
// 5470.1-5489.2: (7.32): yields_as clause for Queue._lock is not reflexive
// 5495.1-5533.2: (7.32): yields_as clause for Queue._lock is not transitive
