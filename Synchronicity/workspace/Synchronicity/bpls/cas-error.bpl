                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-error.anchor:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Ref {                                                                                     
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
    class Node {                                                                                    
      noABA volatile Ref pair isLocal(this, tid)                                                    
       ? isRead                                                                                     
         ? B                                                                                        
         : isLocal(newValue, tid) ? B : E                                                           
       : isRead                                                                                     
         ? N                                                                                        
         : isLocal(newValue, tid) ? N : E                                                           
        yields_as newValue == this.pair || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Ref.null;
                                                                                                    
                                                                                                    
      invariant  this.pair != Ref.null;                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.pair == Ref.null;                                                               
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public boolean compareAndSet(Node expectedReference,Node newReference,boolean expectedMark,boolean newMark) {
        Ref current;                                                                                
        current := this.pair;                                                                       
        boolean tmp1;                                                                               
        Ref tmp2;                                                                                   
        tmp2 = new Ref();                                                                           
        tmp2.init()                                                                                 
        tmp1 = this.pair@current :~ tmp2;                                                           
         return tmp1;                                                                               
        // return false;                                                                            
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Ref {                                                                                     
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
    class Node {                                                                                    
      hasCASOperation noABA volatile Ref pair isLocal(this, tid)                                    
       ? isRead                                                                                     
         ? B                                                                                        
         : isLocal(newValue, tid) ? B : E                                                           
       : isRead                                                                                     
         ? N                                                                                        
         : isLocal(newValue, tid) ? N : E                                                           
        yields_as newValue == this.pair || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Ref.null;
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid pair_nextThread isLocal(this, tid)                                          
       ? B                                                                                          
       : this.pair_nextThread == tid ? N : E                                                        
        yields_as this.pair_nextThread == tid ==> newValue == tid;                                  
                                                                                                    
                                                                                                    
      updatesViaCAS Ref pair_nextValue isLocal(this, tid)                                           
       ? B                                                                                          
       : this.pair_nextThread == tid ? N : E                                                        
        yields_as this.pair_nextThread == tid ==> newValue == this.pair_nextValue;                  
                                                                                                    
                                                                                                    
      invariant  this.pair != Ref.null;                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.pair == Ref.null;                                                               
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public boolean compareAndSet(Node expectedReference,Node newReference,boolean expectedMark,boolean newMark) {
        Ref current;                                                                                
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.pair_nextThread  as B;                                                       
          Ref _C_v;                                                                                 
          _C_v := this.pair_nextValue  as B;                                                        
          Ref _currentValue;                                                                        
          _currentValue := this.pair  as B;                                                         
          Mover _R_t;                                                                               
          _R_t = readPermission(this.pair);                                                         
          boolean _casable;                                                                         
          _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                     
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            current := this.pair  as R;                                                             
          } else {                                                                                  
            noop(TraceOn);                                                                          
            current := this.pair;                                                                   
          }                                                                                         
        }                                                                                           
        boolean tmp1;                                                                               
        Ref tmp2;                                                                                   
        tmp2 = new Ref();                                                                           
        tmp2.init()                                                                                 
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp512005;                                                                       
          ctmp512005 = *;                                                                           
          if (ctmp512005) {                                                                         
            noop(TraceOn);                                                                          
            tmp1 = false;                                                                           
          } else {                                                                                  
            ctmp512005 = *;                                                                         
            if (ctmp512005) {                                                                       
              Tid tmpTid;                                                                           
              Ref tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.pair, tmp2);                                                
              assume this.pair == current;                                                          
              assume !goesWrong(_m);                                                                
              assume this.pair_nextThread == tid;                                                   
              assume this.pair_nextValue == current;                                                
              this.pair_nextThread := tmpTid as B;                                                  
              this.pair_nextValue := tmpValue as B;                                                 
              noop(TraceOn);                                                                        
              this.pair := tmp2;                                                                    
              tmp1 = true;                                                                          
            } else {                                                                                
              assume this.pair_nextThread == tid;                                                   
              assume this.pair_nextValue == current;                                                
              Ref _currentValue;                                                                    
              _currentValue := this.pair  as B;                                                     
              this.pair := current as B;                                                            
              Mover _m;                                                                             
              _m = writePermission(this.pair, tmp2);                                                
              this.pair := _currentValue as B;                                                      
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.pair := tmp2;                                                                    
              tmp1 = false;                                                                         
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return tmp1;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Ref {                                                                                     
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
    class Node {                                                                                    
      hasCASOperation noABA volatile Ref pair isLocal(this, tid)                                    
       ? isRead                                                                                     
         ? B                                                                                        
         : isLocal(newValue, tid) ? B : E                                                           
       : isRead                                                                                     
         ? N                                                                                        
         : isLocal(newValue, tid) ? N : E                                                           
        yields_as newValue == this.pair || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Ref.null;
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid pair_nextThread isLocal(this, tid)                                          
       ? B                                                                                          
       : this.pair_nextThread == tid ? N : E                                                        
        yields_as this.pair_nextThread == tid ==> newValue == tid;                                  
                                                                                                    
                                                                                                    
      updatesViaCAS Ref pair_nextValue isLocal(this, tid)                                           
       ? B                                                                                          
       : this.pair_nextThread == tid ? N : E                                                        
        yields_as this.pair_nextThread == tid ==> newValue == this.pair_nextValue;                  
                                                                                                    
                                                                                                    
      invariant  this.pair != Ref.null;                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.pair == Ref.null;                                                               
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public boolean compareAndSet(Node expectedReference,Node newReference,boolean expectedMark,boolean newMark) {
        Ref current;                                                                                
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.pair_nextThread  as B;                                                       
          Ref _C_v;                                                                                 
          _C_v := this.pair_nextValue  as B;                                                        
          Ref _currentValue;                                                                        
          _currentValue := this.pair  as B;                                                         
          Mover _R_t;                                                                               
          _R_t = readPermission(this.pair);                                                         
          boolean _casable;                                                                         
          _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                     
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            current := this.pair  as R;                                                             
          } else {                                                                                  
            noop(TraceOn);                                                                          
            current := this.pair;                                                                   
          }                                                                                         
        }                                                                                           
        boolean tmp1;                                                                               
        Ref tmp2;                                                                                   
        tmp2 = new Ref();                                                                           
        {                                                                                           
          inlined tmp2.init();                                                                      
          exit$18: {                                                                                
            Ref this$18;                                                                            
            this$18 = tmp2;                                                                         
            {                                                                                       
              {                                                                                     
                break exit$18;                                                                      
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp512005;                                                                       
          ctmp512005 = *;                                                                           
          if (ctmp512005) {                                                                         
            noop(TraceOn);                                                                          
            tmp1 = false;                                                                           
          } else {                                                                                  
            ctmp512005 = *;                                                                         
            if (ctmp512005) {                                                                       
              Tid tmpTid;                                                                           
              Ref tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.pair, tmp2);                                                
              assume this.pair == current;                                                          
              assume !goesWrong(_m);                                                                
              assume this.pair_nextThread == tid;                                                   
              assume this.pair_nextValue == current;                                                
              this.pair_nextThread := tmpTid as B;                                                  
              this.pair_nextValue := tmpValue as B;                                                 
              noop(TraceOn);                                                                        
              this.pair := tmp2;                                                                    
              tmp1 = true;                                                                          
            } else {                                                                                
              assume this.pair_nextThread == tid;                                                   
              assume this.pair_nextValue == current;                                                
              Ref _currentValue;                                                                    
              _currentValue := this.pair  as B;                                                     
              this.pair := current as B;                                                            
              Mover _m;                                                                             
              _m = writePermission(this.pair, tmp2);                                                
              this.pair := _currentValue as B;                                                      
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.pair := tmp2;                                                                    
              tmp1 = false;                                                                         
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return tmp1;                                                                             
        }                                                                                           
        {                                                                                           
          // return false;                                                                          
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Ref {                                                                                     
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
    class Node {                                                                                    
      hasCASOperation noABA volatile Ref pair isLocal(this, tid)                                    
       ? isRead                                                                                     
         ? B                                                                                        
         : isLocal(newValue, tid) ? B : E                                                           
       : isRead                                                                                     
         ? N                                                                                        
         : isLocal(newValue, tid) ? N : E                                                           
        yields_as newValue == this.pair || !isLocal(newValue, tid) && !isShared(newValue) && newValue != Ref.null;
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid pair_nextThread isLocal(this, tid)                                          
       ? B                                                                                          
       : this.pair_nextThread == tid ? N : E                                                        
        yields_as this.pair_nextThread == tid ==> newValue == tid;                                  
                                                                                                    
                                                                                                    
      updatesViaCAS Ref pair_nextValue isLocal(this, tid)                                           
       ? B                                                                                          
       : this.pair_nextThread == tid ? N : E                                                        
        yields_as this.pair_nextThread == tid ==> newValue == this.pair_nextValue;                  
                                                                                                    
                                                                                                    
      invariant  this.pair != Ref.null;                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.pair == Ref.null;                                                               
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public boolean compareAndSet(Node expectedReference,Node newReference,boolean expectedMark,boolean newMark) {
        Ref current;                                                                                
        {                                                                                           
          noop(TraceOff);                                                                           
          Tid _C_t;                                                                                 
          _C_t := this.pair_nextThread  as B;                                                       
          Ref _C_v;                                                                                 
          _C_v := this.pair_nextValue  as B;                                                        
          Ref _currentValue;                                                                        
          _currentValue := this.pair  as B;                                                         
          Mover _R_t;                                                                               
          _R_t = readPermission(this.pair);                                                         
          boolean _casable;                                                                         
          _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                     
          if (_casable) {                                                                           
            noop(TraceOn);                                                                          
            current := this.pair  as R;                                                             
          } else {                                                                                  
            noop(TraceOn);                                                                          
            current := this.pair;                                                                   
          }                                                                                         
        }                                                                                           
        boolean tmp1;                                                                               
        Ref tmp2;                                                                                   
        tmp2 = new Ref();                                                                           
        {                                                                                           
          inlined tmp2.init();                                                                      
          exit$18: {                                                                                
            Ref this$18;                                                                            
            this$18 = tmp2;                                                                         
            {                                                                                       
              {                                                                                     
                break exit$18;                                                                      
              }                                                                                     
            }                                                                                       
          }                                                                                         
          inlined return;                                                                           
        }                                                                                           
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp512005;                                                                       
          ctmp512005 = *;                                                                           
          if (ctmp512005) {                                                                         
            noop(TraceOn);                                                                          
            tmp1 = false;                                                                           
          } else {                                                                                  
            ctmp512005 = *;                                                                         
            if (ctmp512005) {                                                                       
              Tid tmpTid;                                                                           
              Ref tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.pair, tmp2);                                                
              assume this.pair == current;                                                          
              assume !goesWrong(_m);                                                                
              assume this.pair_nextThread == tid;                                                   
              assume this.pair_nextValue == current;                                                
              this.pair_nextThread := tmpTid as B;                                                  
              this.pair_nextValue := tmpValue as B;                                                 
              noop(TraceOn);                                                                        
              this.pair := tmp2;                                                                    
              tmp1 = true;                                                                          
            } else {                                                                                
              assume this.pair_nextThread == tid;                                                   
              assume this.pair_nextValue == current;                                                
              Ref _currentValue;                                                                    
              _currentValue := this.pair  as B;                                                     
              this.pair := current as B;                                                            
              Mover _m;                                                                             
              _m = writePermission(this.pair, tmp2);                                                
              this.pair := _currentValue as B;                                                      
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.pair := tmp2;                                                                    
              tmp1 = false;                                                                         
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
           return tmp1;                                                                             
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
                                                                                                    
                                                                                                    
/*** Class Decl Ref ***/                                                                            
                                                                                                    
type Ref;                                                                                           
const unique Ref.null: Ref;                                                                         
var Ref._state: [Ref]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Ref._lock: [Ref]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Ref._lock(tid: Tid,this : Ref,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Ref._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Ref._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Ref._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Ref._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Ref._lock(tid: Tid,this : Ref,newValue: Tid,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Ref._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Ref._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Ref._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Ref._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
/*** Class Decl Node ***/                                                                           
                                                                                                    
type Node;                                                                                          
const unique Node.null: Node;                                                                       
var Node._state: [Node]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.pair: [Node]Ref;                                                                           
                                                                                                    
function {:inline} ReadEval.Node.pair(tid: Tid,this : Node,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Ref.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (isLocal(Ref._state[newValue], tid)) then                                                     
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   if (isLocal(Ref._state[newValue], tid)) then                                                     
    moverPath(_N, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.pair(tid: Tid,this : Node,newValue: Ref,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (isLocal(Ref._state[newValue], tid)) then                                                     
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   if (isLocal(Ref._state[newValue], tid)) then                                                     
    moverPath(_N, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node._lock: [Node]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Node._lock(tid: Tid,this : Node,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
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
                                                                                                    
function {:inline} WriteEval.Node._lock(tid: Tid,this : Node,newValue: Tid,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
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
                                                                                                    
var Node.pair_nextThread: [Node]Tid;                                                                
                                                                                                    
function {:inline} ReadEval.Node.pair_nextThread(tid: Tid,this : Node,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.pair_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.pair_nextThread(tid: Tid,this : Node,newValue: Tid,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.pair_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Node.pair_nextValue: [Node]Ref;                                                                 
                                                                                                    
function {:inline} ReadEval.Node.pair_nextValue(tid: Tid,this : Node,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Ref.null;                                                                         
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.pair_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Node.pair_nextValue(tid: Tid,this : Node,newValue: Ref,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Node._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Node.pair_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.Node.522287(tid: Tid,this : Node,Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (bool) {
 (Node.pair[this]!=Ref.null)                                                                        
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Node.compareAndSet(tid:Tid, this : Node, expectedReference : Node, newReference : Node, expectedMark : bool, newMark : bool)
returns ($result : bool)                                                                            
modifies Ref._state;                                                                                
modifies Ref._lock;                                                                                 
modifies Node._state;                                                                               
modifies Node.pair;                                                                                 
modifies Node._lock;                                                                                
modifies Node.pair_nextThread;                                                                      
modifies Node.pair_nextValue;                                                                       
                                                                                                    
requires ValidTid(tid);                                                                                    // (15.5): Bad tid
requires isSharedAssignable(Node._state[expectedReference]);                                               // (15.5): Parameter VarDecl(ClassType(Node),expectedReference) is not global
requires isSharedAssignable(Node._state[newReference]);                                                    // (15.5): Parameter VarDecl(ClassType(Node),newReference) is not global
requires isShared(Node._state[this]);                                                                      // (15.5): this is not global
                                                                                                    
requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (15.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
ensures  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (15.5): Object invariant may not hold.
{                                                                                                   
 var Node.pair_nextThread528332: [Node]Tid;                                                         
 var expectedMark528166: bool;                                                                      
 var Node.pair_nextThread528160: [Node]Tid;                                                         
 var Ref._lock528329: [Ref]Tid;                                                                     
 var this528332: Node;                                                                              
 var Ref._lock528362: [Ref]Tid;                                                                     
 var Ref._lock528302: [Ref]Tid;                                                                     
 var Node.pair_nextValue528302: [Node]Ref;                                                          
 var newMark528302: bool;                                                                           
 var _C_v528215: Ref;                                                                               
 var Node._lock528302: [Node]Tid;                                                                   
 var path528306: int;                                                                               
 var _currentValue528172: Ref;                                                                      
 var current528299: Ref;                                                                            
 var expectedReference528351: Node;                                                                 
 var Node._lock528299: [Node]Tid;                                                                   
 var tid528299: Tid;                                                                                
 var $result528366: bool;                                                                           
 var expectedMark528302: bool;                                                                      
 var newMark528210: bool;                                                                           
 var Node._state528160: [Node]State;                                                                
 var moverPath528160: MoverPath;                                                                    
 var expectedMark528215: bool;                                                                      
 var _C_t528160: Tid;                                                                               
 var tmp1528332: bool;                                                                              
 var _C_t: Tid;                                                                                     
 var Node.pair528332: [Node]Ref;                                                                    
 var tmp1528302: bool;                                                                              
 var $pc528302: Phase;                                                                              
 var $result528306: bool;                                                                           
 var moverPath528210: MoverPath;                                                                    
 var Ref._state528362: [Ref]State;                                                                  
 var tid528329: Tid;                                                                                
 var $result528362: bool;                                                                           
 var tmp2528329: Ref;                                                                               
 var path528302: int;                                                                               
 var $recorded.state528166: int;                                                                    
 var Ref._lock528366: [Ref]Tid;                                                                     
 var tmp2: Ref;                                                                                     
 var tid528215: Tid;                                                                                
 var $pc528166: Phase;                                                                              
 var _C_t528215: Tid;                                                                               
 var $recorded.state528210: int;                                                                    
 var $pc528215: Phase;                                                                              
 var $pc528332: Phase;                                                                              
 var newMark528332: bool;                                                                           
 var Ref._state528172: [Ref]State;                                                                  
 var Node.pair528366: [Node]Ref;                                                                    
 var Node._state528306: [Node]State;                                                                
 var _currentValue528344: Ref;                                                                      
 var tmpTid528302: Tid;                                                                             
 var $result528299: bool;                                                                           
 var current528306: Ref;                                                                            
 var _casable: bool;                                                                                
 var tmp1528329: bool;                                                                              
 var mover528302: Mover;                                                                            
 var newReference528172: Node;                                                                      
 var Node.pair_nextThread528172: [Node]Tid;                                                         
 var Node.pair528329: [Node]Ref;                                                                    
 var $result528302: bool;                                                                           
 var newReference528351: Node;                                                                      
 var this528329: Node;                                                                              
 var this528351: Node;                                                                              
 var Node.pair_nextThread528302: [Node]Tid;                                                         
 var Node._state528172: [Node]State;                                                                
 var Node._lock528160: [Node]Tid;                                                                   
 var newMark528329: bool;                                                                           
 var current528160: Ref;                                                                            
 var newMark528166: bool;                                                                           
 var Node.pair_nextValue528329: [Node]Ref;                                                          
 var tid528306: Tid;                                                                                
 var Node.pair_nextThread528215: [Node]Tid;                                                         
 var newMark528215: bool;                                                                           
 var Node.pair_nextThread528166: [Node]Tid;                                                         
 var newReference528306: Node;                                                                      
 var current528351: Ref;                                                                            
 var Node.pair_nextThread528329: [Node]Tid;                                                         
 var tmp1: bool;                                                                                    
 var expectedMark528332: bool;                                                                      
 var expectedReference528166: Node;                                                                 
 var this528302: Node;                                                                              
 var _R_t528210: Mover;                                                                             
 var Node._lock528366: [Node]Tid;                                                                   
 var expectedReference528366: Node;                                                                 
 var Node.pair_nextThread528362: [Node]Tid;                                                         
 var moverPath528215: MoverPath;                                                                    
 var Node.pair_nextThread528351: [Node]Tid;                                                         
 var Ref._lock528306: [Ref]Tid;                                                                     
 var mover528306: Mover;                                                                            
 var Node.pair528351: [Node]Ref;                                                                    
 var Ref._lock528160: [Ref]Tid;                                                                     
 var tmp2528299: Ref;                                                                               
 var $pc528351: Phase;                                                                              
 var _m528344: Mover;                                                                               
 var Node._lock528329: [Node]Tid;                                                                   
 var Node._lock528210: [Node]Tid;                                                                   
 var expectedMark528366: bool;                                                                      
 var $result528332: bool;                                                                           
 var $result528215: bool;                                                                           
 var ctmp512005: bool;                                                                              
 var _m528302: Mover;                                                                               
 var tid528210: Tid;                                                                                
 var newReference528362: Node;                                                                      
 var Ref._state528166: [Ref]State;                                                                  
 var tmp2528351: Ref;                                                                               
 var ctmp512005528344: bool;                                                                        
 var Ref._lock528172: [Ref]Tid;                                                                     
 var this528215: Node;                                                                              
 var $result528160: bool;                                                                           
 var $recorded.state528215: int;                                                                    
 var _currentValue528351: Ref;                                                                      
 var Node._lock528172: [Node]Tid;                                                                   
 var this528306: Node;                                                                              
 var this528299: Node;                                                                              
 var $pc528306: Phase;                                                                              
 var path528299: int;                                                                               
 var _m528351: Mover;                                                                               
 var ctmp512005528306: bool;                                                                        
 var current528329: Ref;                                                                            
 var _C_t528210: Tid;                                                                               
 var newReference528210: Node;                                                                      
 var _currentValue528329: Ref;                                                                      
 var Node.pair_nextValue528160: [Node]Ref;                                                          
 var this528210: Node;                                                                              
 var current528332: Ref;                                                                            
 var newMark528362: bool;                                                                           
 var Node.pair_nextValue528366: [Node]Ref;                                                          
 var Ref._lock528299: [Ref]Tid;                                                                     
 var Ref._lock528332: [Ref]Tid;                                                                     
 var current528210: Ref;                                                                            
 var expectedReference528172: Node;                                                                 
 var Node._state528332: [Node]State;                                                                
 var expectedMark528160: bool;                                                                      
 var mover528166: Mover;                                                                            
 var expectedReference528344: Node;                                                                 
 var $recorded.state528362: int;                                                                    
 var expectedMark528172: bool;                                                                      
 var $recorded.state528302: int;                                                                    
 var Ref._state528302: [Ref]State;                                                                  
 var $recorded.state528329: int;                                                                    
 var newReference528332: Node;                                                                      
 var tmp2528366: Ref;                                                                               
 var current528344: Ref;                                                                            
 var expectedMark528299: bool;                                                                      
 var $result528172: bool;                                                                           
 var Ref._state528215: [Ref]State;                                                                  
 var moverPath528351: MoverPath;                                                                    
 var expectedReference528160: Node;                                                                 
 var Node.pair528302: [Node]Ref;                                                                    
 var path528344: int;                                                                               
 var _casable528215: bool;                                                                          
 var Ref._lock528210: [Ref]Tid;                                                                     
 var Ref._state528332: [Ref]State;                                                                  
 var _currentValue528215: Ref;                                                                      
 var tmp2528302: Ref;                                                                               
 var _casable528210: bool;                                                                          
 var path528329: int;                                                                               
 var tid528160: Tid;                                                                                
 var mover528172: Mover;                                                                            
 var _m528306: Mover;                                                                               
 var Ref._lock528344: [Ref]Tid;                                                                     
 var this528172: Node;                                                                              
 var moverPath528332: MoverPath;                                                                    
 var tid528344: Tid;                                                                                
 var Node.pair_nextValue528344: [Node]Ref;                                                          
 var expectedReference528362: Node;                                                                 
 var Ref._state528344: [Ref]State;                                                                  
 var path528166: int;                                                                               
 var expectedMark528306: bool;                                                                      
 var _C_v528166: Ref;                                                                               
 var tmp2528362: Ref;                                                                               
 var ctmp512005528302: bool;                                                                        
 var tid528172: Tid;                                                                                
 var $recorded.state528299: int;                                                                    
 var _C_t528172: Tid;                                                                               
 var expectedReference528210: Node;                                                                 
 var $recorded.state528332: int;                                                                    
 var this528344: Node;                                                                              
 var $recorded.state528344: int;                                                                    
 var Ref._state528306: [Ref]State;                                                                  
 var tmp1528366: bool;                                                                              
 var $result528166: bool;                                                                           
 var Node.pair528166: [Node]Ref;                                                                    
 var Node.pair_nextThread528299: [Node]Tid;                                                         
 var Ref._state528299: [Ref]State;                                                                  
 var tmpValue: Ref;                                                                                 
 var Node.pair_nextValue528306: [Node]Ref;                                                          
 var newMark528306: bool;                                                                           
 var mover528299: Mover;                                                                            
 var Node.pair528210: [Node]Ref;                                                                    
 var newReference528160: Node;                                                                      
 var current528166: Ref;                                                                            
 var $recorded.state528366: int;                                                                    
 var Node._lock528344: [Node]Tid;                                                                   
 var $pc528329: Phase;                                                                              
 var tid528366: Tid;                                                                                
 var Node.pair_nextValue528351: [Node]Ref;                                                          
 var $pc528299: Phase;                                                                              
 var this528362: Node;                                                                              
 var path528215: int;                                                                               
 var path528210: int;                                                                               
 var current528366: Ref;                                                                            
 var expectedMark528344: bool;                                                                      
 var mover528160: Mover;                                                                            
 var tmp1528351: bool;                                                                              
 var $recorded.state528351: int;                                                                    
 var _R_t528215: Mover;                                                                             
 var Ref._lock528215: [Ref]Tid;                                                                     
 var this$18: Ref;                                                                                  
 var Ref._state528351: [Ref]State;                                                                  
 var expectedMark528329: bool;                                                                      
 var $result528329: bool;                                                                           
 var newMark528344: bool;                                                                           
 var tmp2528332: Ref;                                                                               
 var _R_t: Mover;                                                                                   
 var _C_v528210: Ref;                                                                               
 var _m528299: Mover;                                                                               
 var mover528351: Mover;                                                                            
 var moverPath528344: MoverPath;                                                                    
 var tid528166: Tid;                                                                                
 var Node._lock528332: [Node]Tid;                                                                   
 var path528351: int;                                                                               
 var Node._lock528215: [Node]Tid;                                                                   
 var newReference528366: Node;                                                                      
 var Ref._state528160: [Ref]State;                                                                  
 var current528362: Ref;                                                                            
 var _m: Mover;                                                                                     
 var newMark528299: bool;                                                                           
 var $pc528366: Phase;                                                                              
 var newReference528299: Node;                                                                      
 var Ref._lock528351: [Ref]Tid;                                                                     
 var Node._state528302: [Node]State;                                                                
 var Ref._state528329: [Ref]State;                                                                  
 var expectedReference528215: Node;                                                                 
 var Node._state528299: [Node]State;                                                                
 var this528160: Node;                                                                              
 var Node.pair_nextThread528366: [Node]Tid;                                                         
 var ctmp512005528329: bool;                                                                        
 var Node.pair_nextThread528210: [Node]Tid;                                                         
 var $result528210: bool;                                                                           
 var Node._state528362: [Node]State;                                                                
 var ctmp512005528332: bool;                                                                        
 var expectedReference528299: Node;                                                                 
 var $result528344: bool;                                                                           
 var mover528332: Mover;                                                                            
 var Node._state528351: [Node]State;                                                                
 var mover528210: Mover;                                                                            
 var tid528302: Tid;                                                                                
 var Node.pair_nextValue528215: [Node]Ref;                                                          
 var mover528344: Mover;                                                                            
 var path528332: int;                                                                               
 var Node.pair_nextValue528172: [Node]Ref;                                                          
 var newReference528166: Node;                                                                      
 var tid528332: Tid;                                                                                
 var mover528329: Mover;                                                                            
 var Node.pair528215: [Node]Ref;                                                                    
 var expectedReference528306: Node;                                                                 
 var newReference528302: Node;                                                                      
 var Node.pair528344: [Node]Ref;                                                                    
 var tmp1528306: bool;                                                                              
 var ctmp512005528299: bool;                                                                        
 var Ref._lock528166: [Ref]Tid;                                                                     
 var ctmp512005528351: bool;                                                                        
 var Node._lock528362: [Node]Tid;                                                                   
 var Node.pair_nextValue528210: [Node]Ref;                                                          
 var _C_v528172: Ref;                                                                               
 var Node._state528329: [Node]State;                                                                
 var tmpValue528299: Ref;                                                                           
 var tmp1528299: bool;                                                                              
 var $recorded.state528172: int;                                                                    
 var Node.pair_nextThread528344: [Node]Tid;                                                         
 var expectedReference528329: Node;                                                                 
 var $result528351: bool;                                                                           
 var tmpTid: Tid;                                                                                   
 var Node.pair528160: [Node]Ref;                                                                    
 var _currentValue528210: Ref;                                                                      
 var tmp2528344: Ref;                                                                               
 var current528215: Ref;                                                                            
 var Node._lock528351: [Node]Tid;                                                                   
 var newMark528351: bool;                                                                           
 var current528172: Ref;                                                                            
 var newReference528215: Node;                                                                      
 var _currentValue528332: Ref;                                                                      
 var tmp1528344: bool;                                                                              
 var current528302: Ref;                                                                            
 var $pc528210: Phase;                                                                              
 var Node._state528344: [Node]State;                                                                
 var this528166: Node;                                                                              
 var Node._state528366: [Node]State;                                                                
 var Node._state528215: [Node]State;                                                                
 var newMark528366: bool;                                                                           
 var Node.pair528299: [Node]Ref;                                                                    
 var Node.pair_nextThread528306: [Node]Tid;                                                         
 var tmpTid528299: Tid;                                                                             
 var tmpValue528306: Ref;                                                                           
 var Node.pair_nextValue528332: [Node]Ref;                                                          
 var moverPath528306: MoverPath;                                                                    
 var _C_t528166: Tid;                                                                               
 var _C_v: Ref;                                                                                     
 var expectedMark528362: bool;                                                                      
 var moverPath528166: MoverPath;                                                                    
 var Node.pair_nextValue528299: [Node]Ref;                                                          
 var $recorded.state528160: int;                                                                    
 var expectedMark528210: bool;                                                                      
 var current: Ref;                                                                                  
 var moverPath528329: MoverPath;                                                                    
 var moverPath528172: MoverPath;                                                                    
 var newReference528329: Node;                                                                      
 var tid528362: Tid;                                                                                
 var $pc528172: Phase;                                                                              
 var tmpTid528306: Tid;                                                                             
 var $pc528160: Phase;                                                                              
 var tmp1528362: bool;                                                                              
 var Node.pair_nextValue528362: [Node]Ref;                                                          
 var Ref._state528366: [Ref]State;                                                                  
 var Node.pair_nextValue528166: [Node]Ref;                                                          
 var path528160: int;                                                                               
 var expectedReference528302: Node;                                                                 
 var mover528215: Mover;                                                                            
 var Node._lock528306: [Node]Tid;                                                                   
 var tmpValue528302: Ref;                                                                           
 var newReference528344: Node;                                                                      
 var _currentValue: Ref;                                                                            
 var moverPath528302: MoverPath;                                                                    
 var tmp2528306: Ref;                                                                               
 var $recorded.state528306: int;                                                                    
 var expectedMark528351: bool;                                                                      
 var tid528351: Tid;                                                                                
 var Node.pair528172: [Node]Ref;                                                                    
 var newMark528160: bool;                                                                           
 var moverPath528299: MoverPath;                                                                    
 var path528172: int;                                                                               
 var expectedReference528332: Node;                                                                 
 var Node.pair528362: [Node]Ref;                                                                    
 var Node._state528166: [Node]State;                                                                
 var Ref._state528210: [Ref]State;                                                                  
 var $pc528362: Phase;                                                                              
 var Node._lock528166: [Node]Tid;                                                                   
 var Node._state528210: [Node]State;                                                                
 var this528366: Node;                                                                              
 var Node.pair528306: [Node]Ref;                                                                    
 var newMark528172: bool;                                                                           
 var $pc528344: Phase;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 20.9: Ref current;                                                                              
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 20.9: Tid _C_t;                                                                                 
                                                                                                    
                                                                                                    
 // 20.9: _C_t := this.pair_nextThread  as B;                                                       
                                                                                                    
                                                                                                    
 moverPath528160 := ReadEval.Node.pair_nextThread(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 mover528160 := m#moverPath(moverPath528160);                                                       
 path528160 := p#moverPath(moverPath528160);                                                        
 assume Ref._state528160 == Ref._state && Ref._lock528160 == Ref._lock && Node._state528160 == Node._state && Node.pair528160 == Node.pair && Node._lock528160 == Node._lock && Node.pair_nextThread528160 == Node.pair_nextThread && Node.pair_nextValue528160 == Node.pair_nextValue && _C_t528160 == _C_t && current528160 == current && $result528160 == $result && expectedReference528160 == expectedReference && newReference528160 == newReference && expectedMark528160 == expectedMark && newMark528160 == newMark && this528160 == this && tid528160 == tid && $pc528160 == $pc;
 assume $recorded.state528160 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 _C_t := Node.pair_nextThread[this];                                                                
                                                                                                    
 // 20.9: Ref _C_v;                                                                                 
                                                                                                    
                                                                                                    
 // 20.9: _C_v := this.pair_nextValue  as B;                                                        
                                                                                                    
                                                                                                    
 moverPath528166 := ReadEval.Node.pair_nextValue(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 mover528166 := m#moverPath(moverPath528166);                                                       
 path528166 := p#moverPath(moverPath528166);                                                        
 assume Ref._state528166 == Ref._state && Ref._lock528166 == Ref._lock && Node._state528166 == Node._state && Node.pair528166 == Node.pair && Node._lock528166 == Node._lock && Node.pair_nextThread528166 == Node.pair_nextThread && Node.pair_nextValue528166 == Node.pair_nextValue && _C_v528166 == _C_v && _C_t528166 == _C_t && current528166 == current && $result528166 == $result && expectedReference528166 == expectedReference && newReference528166 == newReference && expectedMark528166 == expectedMark && newMark528166 == newMark && this528166 == this && tid528166 == tid && $pc528166 == $pc;
 assume $recorded.state528166 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 _C_v := Node.pair_nextValue[this];                                                                 
                                                                                                    
 // 20.9: Ref _currentValue;                                                                        
                                                                                                    
                                                                                                    
 // 20.9: _currentValue := this.pair  as B;                                                         
                                                                                                    
                                                                                                    
 moverPath528172 := ReadEval.Node.pair(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 mover528172 := m#moverPath(moverPath528172);                                                       
 path528172 := p#moverPath(moverPath528172);                                                        
 assume Ref._state528172 == Ref._state && Ref._lock528172 == Ref._lock && Node._state528172 == Node._state && Node.pair528172 == Node.pair && Node._lock528172 == Node._lock && Node.pair_nextThread528172 == Node.pair_nextThread && Node.pair_nextValue528172 == Node.pair_nextValue && _currentValue528172 == _currentValue && _C_v528172 == _C_v && _C_t528172 == _C_t && current528172 == current && $result528172 == $result && expectedReference528172 == expectedReference && newReference528172 == newReference && expectedMark528172 == expectedMark && newMark528172 == newMark && this528172 == this && tid528172 == tid && $pc528172 == $pc;
 assume $recorded.state528172 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Node.null;                                                                         
 } else {                                                                                           
  assert this != Node.null;                                                                                // (20.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (20.9): Reduction failure
 _currentValue := Node.pair[this];                                                                  
                                                                                                    
 // 20.9: Mover _R_t;                                                                               
                                                                                                    
                                                                                                    
 // 20.9: _R_t = readPermission(this.pair);                                                         
                                                                                                    
 _R_t := m#moverPath(ReadEval.Node.pair(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));
                                                                                                    
 // 20.9: boolean _casable;                                                                         
                                                                                                    
                                                                                                    
 // 20.9: _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                     
                                                                                                    
 _casable := ((((_R_t!=_E)&&true)&&(_C_t==tid))&&(_C_v==_currentValue));                            
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 20.9: current := this.pair  as R;                                                              
                                                                                                    
                                                                                                    
  moverPath528210 := ReadEval.Node.pair(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
  mover528210 := m#moverPath(moverPath528210);                                                      
  path528210 := p#moverPath(moverPath528210);                                                       
  assume Ref._state528210 == Ref._state && Ref._lock528210 == Ref._lock && Node._state528210 == Node._state && Node.pair528210 == Node.pair && Node._lock528210 == Node._lock && Node.pair_nextThread528210 == Node.pair_nextThread && Node.pair_nextValue528210 == Node.pair_nextValue && _casable528210 == _casable && _R_t528210 == _R_t && _currentValue528210 == _currentValue && _C_v528210 == _C_v && _C_t528210 == _C_t && current528210 == current && $result528210 == $result && expectedReference528210 == expectedReference && newReference528210 == newReference && expectedMark528210 == expectedMark && newMark528210 == newMark && this528210 == this && tid528210 == tid && $pc528210 == $pc;
  assume $recorded.state528210 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Node.null;                                                                        
  } else {                                                                                          
   assert this != Node.null;                                                                               // (20.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (20.9): Reduction failure
  current := Node.pair[this];                                                                       
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 20.9: current := this.pair;                                                                    
                                                                                                    
                                                                                                    
  moverPath528215 := ReadEval.Node.pair(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
  mover528215 := m#moverPath(moverPath528215);                                                      
  path528215 := p#moverPath(moverPath528215);                                                       
  assume Ref._state528215 == Ref._state && Ref._lock528215 == Ref._lock && Node._state528215 == Node._state && Node.pair528215 == Node.pair && Node._lock528215 == Node._lock && Node.pair_nextThread528215 == Node.pair_nextThread && Node.pair_nextValue528215 == Node.pair_nextValue && _casable528215 == _casable && _R_t528215 == _R_t && _currentValue528215 == _currentValue && _C_v528215 == _C_v && _C_t528215 == _C_t && current528215 == current && $result528215 == $result && expectedReference528215 == expectedReference && newReference528215 == newReference && expectedMark528215 == expectedMark && newMark528215 == newMark && this528215 == this && tid528215 == tid && $pc528215 == $pc;
  assume $recorded.state528215 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Node.null;                                                                        
  } else {                                                                                          
   assert this != Node.null;                                                                               // (20.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover528215);                                                              
  assert $pc != PhaseError;                                                                                // (20.9): Reduction failure
  current := Node.pair[this];                                                                       
 }                                                                                                  
                                                                                                    
 // 21.9: boolean tmp1;                                                                             
                                                                                                    
                                                                                                    
 // 21.9: Ref tmp2;                                                                                 
                                                                                                    
                                                                                                    
 // 21.9: tmp2 = new Ref();                                                                         
                                                                                                    
 havoc tmp2;                                                                                        
 assume tmp2 != Ref.null && isFresh(Ref._state[tmp2]);                                              
 Ref._state[tmp2] := LOCAL(tid);                                                                    
 assume Ref._lock[tmp2]  == Tid.null;                                                               
 // inlined: tmp2.init()}                                                                           
 exit$18_top:                                                                                       
                                                                                                    
 // 21.9: Ref this$18;                                                                              
                                                                                                    
                                                                                                    
 // 21.9: this$18 = tmp2;                                                                           
                                                                                                    
 this$18 := tmp2;                                                                                   
                                                                                                    
 // 4.1: break exit$18;                                                                             
                                                                                                    
 goto exit$18_bottom;                                                                               
 exit$18_bottom:                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 21.9: boolean ctmp512005;                                                                       
                                                                                                    
                                                                                                    
 // 21.9: ctmp512005 = *;                                                                           
                                                                                                    
 havoc ctmp512005;                                                                                  
 if (ctmp512005) {                                                                                  
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 21.9: tmp1 = false;                                                                            
                                                                                                    
  tmp1 := false;                                                                                    
 } else {                                                                                           
                                                                                                    
  // 21.9: ctmp512005 = *;                                                                          
                                                                                                    
  havoc ctmp512005;                                                                                 
  if (ctmp512005) {                                                                                 
                                                                                                    
   // 21.9: Tid tmpTid;                                                                             
                                                                                                    
                                                                                                    
   // 21.9: Ref tmpValue;                                                                           
                                                                                                    
                                                                                                    
   // 21.9: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 21.9: _m = writePermission(this.pair, tmp2);                                                  
                                                                                                    
   _m := m#moverPath(WriteEval.Node.pair(tid: Tid,this: Node,tmp2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));
                                                                                                    
   // 21.9: assume this.pair == current;                                                            
                                                                                                    
   assume (Node.pair[this]==current);                                                               
                                                                                                    
   // 21.9: assume !goesWrong(_m);                                                                  
                                                                                                    
   assume !(transition($pc, _m) == PhaseError);                                                     
                                                                                                    
   // 21.9: assume this.pair_nextThread == tid;                                                     
                                                                                                    
   assume (Node.pair_nextThread[this]==tid);                                                        
                                                                                                    
   // 21.9: assume this.pair_nextValue == current;                                                  
                                                                                                    
   assume (Node.pair_nextValue[this]==current);                                                     
                                                                                                    
                                                                                                    
   // 21.9: this.pair_nextThread := tmpTid as B;                                                    
                                                                                                    
                                                                                                    
   moverPath528299 := WriteEval.Node.pair_nextThread(tid: Tid,this: Node,tmpTid: Tid,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528299 := m#moverPath(moverPath528299);                                                     
   path528299 := p#moverPath(moverPath528299);                                                      
   assume Ref._state528299 == Ref._state && Ref._lock528299 == Ref._lock && Node._state528299 == Node._state && Node.pair528299 == Node.pair && Node._lock528299 == Node._lock && Node.pair_nextThread528299 == Node.pair_nextThread && Node.pair_nextValue528299 == Node.pair_nextValue && _m528299 == _m && tmpValue528299 == tmpValue && tmpTid528299 == tmpTid && ctmp512005528299 == ctmp512005 && tmp2528299 == tmp2 && tmp1528299 == tmp1 && current528299 == current && $result528299 == $result && expectedReference528299 == expectedReference && newReference528299 == newReference && expectedMark528299 == expectedMark && newMark528299 == newMark && this528299 == this && tid528299 == tid && $pc528299 == $pc;
   assume $recorded.state528299 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   Node.pair_nextThread[this] := tmpTid;                                                            
                                                                                                    
                                                                                                    
   // 21.9: this.pair_nextValue := tmpValue as B;                                                   
                                                                                                    
                                                                                                    
   moverPath528302 := WriteEval.Node.pair_nextValue(tid: Tid,this: Node,tmpValue: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528302 := m#moverPath(moverPath528302);                                                     
   path528302 := p#moverPath(moverPath528302);                                                      
   assume Ref._state528302 == Ref._state && Ref._lock528302 == Ref._lock && Node._state528302 == Node._state && Node.pair528302 == Node.pair && Node._lock528302 == Node._lock && Node.pair_nextThread528302 == Node.pair_nextThread && Node.pair_nextValue528302 == Node.pair_nextValue && _m528302 == _m && tmpValue528302 == tmpValue && tmpTid528302 == tmpTid && ctmp512005528302 == ctmp512005 && tmp2528302 == tmp2 && tmp1528302 == tmp1 && current528302 == current && $result528302 == $result && expectedReference528302 == expectedReference && newReference528302 == newReference && expectedMark528302 == expectedMark && newMark528302 == newMark && this528302 == this && tid528302 == tid && $pc528302 == $pc;
   assume $recorded.state528302 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   Node.pair_nextValue[this] := tmpValue;                                                           
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 21.9: this.pair := tmp2;                                                                      
                                                                                                    
                                                                                                    
   moverPath528306 := WriteEval.Node.pair(tid: Tid,this: Node,tmp2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528306 := m#moverPath(moverPath528306);                                                     
   path528306 := p#moverPath(moverPath528306);                                                      
   assume Ref._state528306 == Ref._state && Ref._lock528306 == Ref._lock && Node._state528306 == Node._state && Node.pair528306 == Node.pair && Node._lock528306 == Node._lock && Node.pair_nextThread528306 == Node.pair_nextThread && Node.pair_nextValue528306 == Node.pair_nextValue && _m528306 == _m && tmpValue528306 == tmpValue && tmpTid528306 == tmpTid && ctmp512005528306 == ctmp512005 && tmp2528306 == tmp2 && tmp1528306 == tmp1 && current528306 == current && $result528306 == $result && expectedReference528306 == expectedReference && newReference528306 == newReference && expectedMark528306 == expectedMark && newMark528306 == newMark && this528306 == this && tid528306 == tid && $pc528306 == $pc;
   assume $recorded.state528306 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover528306);                                                             
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   Node.pair[this] := tmp2;                                                                         
   if (isLocal(Ref._state[tmp2], tid)) {                                                            
    Ref._state[tmp2] := SHARED();                                                                   
   }                                                                                                
                                                                                                    
                                                                                                    
   // 21.9: tmp1 = true;                                                                            
                                                                                                    
   tmp1 := true;                                                                                    
  } else {                                                                                          
                                                                                                    
   // 21.9: assume this.pair_nextThread == tid;                                                     
                                                                                                    
   assume (Node.pair_nextThread[this]==tid);                                                        
                                                                                                    
   // 21.9: assume this.pair_nextValue == current;                                                  
                                                                                                    
   assume (Node.pair_nextValue[this]==current);                                                     
                                                                                                    
   // 21.9: Ref _currentValue;                                                                      
                                                                                                    
                                                                                                    
   // 21.9: _currentValue := this.pair  as B;                                                       
                                                                                                    
                                                                                                    
   moverPath528329 := ReadEval.Node.pair(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528329 := m#moverPath(moverPath528329);                                                     
   path528329 := p#moverPath(moverPath528329);                                                      
   assume Ref._state528329 == Ref._state && Ref._lock528329 == Ref._lock && Node._state528329 == Node._state && Node.pair528329 == Node.pair && Node._lock528329 == Node._lock && Node.pair_nextThread528329 == Node.pair_nextThread && Node.pair_nextValue528329 == Node.pair_nextValue && _currentValue528329 == _currentValue && ctmp512005528329 == ctmp512005 && tmp2528329 == tmp2 && tmp1528329 == tmp1 && current528329 == current && $result528329 == $result && expectedReference528329 == expectedReference && newReference528329 == newReference && expectedMark528329 == expectedMark && newMark528329 == newMark && this528329 == this && tid528329 == tid && $pc528329 == $pc;
   assume $recorded.state528329 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   _currentValue := Node.pair[this];                                                                
                                                                                                    
                                                                                                    
   // 21.9: this.pair := current as B;                                                              
                                                                                                    
                                                                                                    
   moverPath528332 := WriteEval.Node.pair(tid: Tid,this: Node,current: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528332 := m#moverPath(moverPath528332);                                                     
   path528332 := p#moverPath(moverPath528332);                                                      
   assume Ref._state528332 == Ref._state && Ref._lock528332 == Ref._lock && Node._state528332 == Node._state && Node.pair528332 == Node.pair && Node._lock528332 == Node._lock && Node.pair_nextThread528332 == Node.pair_nextThread && Node.pair_nextValue528332 == Node.pair_nextValue && _currentValue528332 == _currentValue && ctmp512005528332 == ctmp512005 && tmp2528332 == tmp2 && tmp1528332 == tmp1 && current528332 == current && $result528332 == $result && expectedReference528332 == expectedReference && newReference528332 == newReference && expectedMark528332 == expectedMark && newMark528332 == newMark && this528332 == this && tid528332 == tid && $pc528332 == $pc;
   assume $recorded.state528332 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   Node.pair[this] := current;                                                                      
   if (isLocal(Ref._state[current], tid)) {                                                         
    Ref._state[current] := SHARED();                                                                
   }                                                                                                
                                                                                                    
                                                                                                    
   // 21.9: Mover _m;                                                                               
                                                                                                    
                                                                                                    
   // 21.9: _m = writePermission(this.pair, tmp2);                                                  
                                                                                                    
   _m := m#moverPath(WriteEval.Node.pair(tid: Tid,this: Node,tmp2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));
                                                                                                    
                                                                                                    
   // 21.9: this.pair := _currentValue as B;                                                        
                                                                                                    
                                                                                                    
   moverPath528344 := WriteEval.Node.pair(tid: Tid,this: Node,_currentValue: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528344 := m#moverPath(moverPath528344);                                                     
   path528344 := p#moverPath(moverPath528344);                                                      
   assume Ref._state528344 == Ref._state && Ref._lock528344 == Ref._lock && Node._state528344 == Node._state && Node.pair528344 == Node.pair && Node._lock528344 == Node._lock && Node.pair_nextThread528344 == Node.pair_nextThread && Node.pair_nextValue528344 == Node.pair_nextValue && _m528344 == _m && _currentValue528344 == _currentValue && ctmp512005528344 == ctmp512005 && tmp2528344 == tmp2 && tmp1528344 == tmp1 && current528344 == current && $result528344 == $result && expectedReference528344 == expectedReference && newReference528344 == newReference && expectedMark528344 == expectedMark && newMark528344 == newMark && this528344 == this && tid528344 == tid && $pc528344 == $pc;
   assume $recorded.state528344 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   Node.pair[this] := _currentValue;                                                                
   if (isLocal(Ref._state[_currentValue], tid)) {                                                   
    Ref._state[_currentValue] := SHARED();                                                          
   }                                                                                                
                                                                                                    
                                                                                                    
   // 21.9: assume goesWrong(_m);                                                                   
                                                                                                    
   assume transition($pc, _m) == PhaseError;                                                        
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 21.9: this.pair := tmp2;                                                                      
                                                                                                    
                                                                                                    
   moverPath528351 := WriteEval.Node.pair(tid: Tid,this: Node,tmp2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
   mover528351 := m#moverPath(moverPath528351);                                                     
   path528351 := p#moverPath(moverPath528351);                                                      
   assume Ref._state528351 == Ref._state && Ref._lock528351 == Ref._lock && Node._state528351 == Node._state && Node.pair528351 == Node.pair && Node._lock528351 == Node._lock && Node.pair_nextThread528351 == Node.pair_nextThread && Node.pair_nextValue528351 == Node.pair_nextValue && _m528351 == _m && _currentValue528351 == _currentValue && ctmp512005528351 == ctmp512005 && tmp2528351 == tmp2 && tmp1528351 == tmp1 && current528351 == current && $result528351 == $result && expectedReference528351 == expectedReference && newReference528351 == newReference && expectedMark528351 == expectedMark && newMark528351 == newMark && this528351 == this && tid528351 == tid && $pc528351 == $pc;
   assume $recorded.state528351 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Node.null;                                                                       
   } else {                                                                                         
    assert this != Node.null;                                                                              // (21.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover528351);                                                             
   assert $pc != PhaseError;                                                                               // (21.9): Reduction failure
   Node.pair[this] := tmp2;                                                                         
   if (isLocal(Ref._state[tmp2], tid)) {                                                            
    Ref._state[tmp2] := SHARED();                                                                   
   }                                                                                                
                                                                                                    
                                                                                                    
   // 21.9: tmp1 = false;                                                                           
                                                                                                    
   tmp1 := false;                                                                                   
  }                                                                                                 
 }                                                                                                  
                                                                                                    
 // 21.9:  return tmp1;                                                                             
                                                                                                    
 assume Ref._state528362 == Ref._state && Ref._lock528362 == Ref._lock && Node._state528362 == Node._state && Node.pair528362 == Node.pair && Node._lock528362 == Node._lock && Node.pair_nextThread528362 == Node.pair_nextThread && Node.pair_nextValue528362 == Node.pair_nextValue && tmp2528362 == tmp2 && tmp1528362 == tmp1 && current528362 == current && $result528362 == $result && expectedReference528362 == expectedReference && newReference528362 == newReference && expectedMark528362 == expectedMark && newMark528362 == newMark && this528362 == this && tid528362 == tid;
 assume $recorded.state528362 == 1;                                                                 
 $result := tmp1;                                                                                   
 assert  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (21.9): Object invariant may not hold.
 return;                                                                                            
                                                                                                    
 // 18.39: // return false;                                                                         
                                                                                                    
 assume Ref._state528366 == Ref._state && Ref._lock528366 == Ref._lock && Node._state528366 == Node._state && Node.pair528366 == Node.pair && Node._lock528366 == Node._lock && Node.pair_nextThread528366 == Node.pair_nextThread && Node.pair_nextValue528366 == Node.pair_nextValue && tmp2528366 == tmp2 && tmp1528366 == tmp1 && current528366 == current && $result528366 == $result && expectedReference528366 == expectedReference && newReference528366 == newReference && expectedMark528366 == expectedMark && newMark528366 == newMark && this528366 == this && tid528366 == tid;
 assume $recorded.state528366 == 1;                                                                 
 $result := false;                                                                                  
 assert  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (18.39): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Ref._state: [Ref]State,Ref._lock: [Ref]Tid,Node._state: [Node]State,Node.pair: [Node]Ref,Node._lock: [Node]Tid,Node.pair_nextThread: [Node]Tid,Node.pair_nextValue: [Node]Ref) returns (bool) {
  true &&                                                                                           
  (forall _i: Ref  :: _i == Ref.null <==> isNull(Ref._state[_i])) &&                                
  (forall _i: Node  :: _i == Node.null <==> isNull(Node._state[_i])) &&                             
  (forall _i: Node ::  (isShared(Node._state[_i]) ==> isSharedAssignable(Ref._state[Node.pair[_i]]))) &&
  (forall _i: Node ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Node._state[_i],_t) ==> isLocalAssignable(Ref._state[Node.pair[_i]], _t)))) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, x: Node)           
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.pair[x] := v;                                                                                 
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.pair(u: Tid,x: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Node.pair failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, x: Node)            
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Node._lock_pre: [Node]Tid;                                                                     
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Node.pair[x] := v;                                                                                 
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Node.pair(u: Tid,x: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (8.5): Node.pair failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, x: Node)            
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Ref;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.pair[x];                                                                          
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Node.pair[x] := havocValue;                                                                        
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Node.pair(u: Tid,x: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (8.5): Node.pair failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, x: Node)             
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Ref;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Node.pair[x];                                                                          
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Node.pair(u: Tid,x: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (8.5): Node.pair failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, x: Node)                 
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Node._lock_pre: [Node]Tid;                                                                     
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.pair(t: Tid,x: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Node.pair(u: Tid,x: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Node.pair failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, x: Node)                  
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[x], u);                                                          
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Ref;                                                                              
 var Node._lock_pre: [Node]Tid;                                                                     
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Node.pair[x];                                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Node.pair(t: Tid,x: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Node.pair[x] := havocValue;                                                                        
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Node.pair(u: Tid,x: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (8.5): Node.pair failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Node.pair.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, w0: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var w0_pre: Ref;                                                                                   
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Ref;                                                                                  
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.pair[x] := v;                                                                                 
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Node.pair.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, w0: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Ref;                                                                                    
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var w0_pre: Ref;                                                                                   
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_mid: Ref;                                                                                    
 var t_mid: Tid;                                                                                    
 var Node.pair_mid: [Node]Ref;                                                                      
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: Ref;                                                                                    
 var Ref._lock_mid: [Ref]Tid;                                                                       
 var Node.pair_nextThread_mid: [Node]Tid;                                                           
 var Ref._state_mid: [Ref]State;                                                                    
 var w0_mid: Ref;                                                                                   
 var Node.pair_nextValue_mid: [Node]Ref;                                                            
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Ref;                                                                                  
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Node.pair[x];                                                                              
 Node.pair[x] := v;                                                                                 
                                                                                                    
 assume Ref._state_mid == Ref._state && Ref._lock_mid == Ref._lock && Node._state_mid == Node._state && Node.pair_mid == Node.pair && Node._lock_mid == Node._lock && Node.pair_nextThread_mid == Node.pair_nextThread && Node.pair_nextValue_mid == Node.pair_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Node.pair[x] := tmpV;                                                                              
 Node.pair[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Node.pair.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, w0: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV : Ref;                                                                                    
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var w0_pre: Ref;                                                                                   
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_mid: Ref;                                                                                    
 var t_mid: Tid;                                                                                    
 var Node.pair_mid: [Node]Ref;                                                                      
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: Ref;                                                                                    
 var Ref._lock_mid: [Ref]Tid;                                                                       
 var Node.pair_nextThread_mid: [Node]Tid;                                                           
 var Ref._state_mid: [Ref]State;                                                                    
 var w0_mid: Ref;                                                                                   
 var Node.pair_nextValue_mid: [Node]Ref;                                                            
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Ref;                                                                                  
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Node.pair[x];                                                                              
 Node.pair[x] := v;                                                                                 
 assume Ref._state_mid == Ref._state && Ref._lock_mid == Ref._lock && Node._state_mid == Node._state && Node.pair_mid == Node.pair && Node._lock_mid == Node._lock && Node.pair_nextThread_mid == Node.pair_nextThread && Node.pair_nextValue_mid == Node.pair_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Node.pair[x] := tmpV;                                                                              
 Node.pair[y] := w;                                                                                 
 _writeByTPost := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Node.pair.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, w0: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var w0_pre: Ref;                                                                                   
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Ref;                                                                                  
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Node.pair(t: Tid,x: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.pair[y] := w;                                                                                 
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Node.pair(t: Tid,x: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Node.pair is not Read-Write Stable with respect to Node.pair (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Node.pair is not Read-Write Stable with respect to Node.pair (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (8.5): Node.pair is not Read-Write Stable with respect to Node.pair (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Node.pair.Node.pair(t: Tid, u: Tid, v: Ref, w: Ref, w0: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var w0_pre: Ref;                                                                                   
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w0_post: Ref;                                                                                  
 var v_post: Ref;                                                                                   
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Node.pair(u: Tid,y: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Node.pair[x] := v;                                                                                 
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Node.pair(u: Tid,y: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Node.pair is not Write-Read Stable with respect to Node.pair (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (8.5): Node.pair is not Write-Read Stable with respect to Node.pair (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (8.5): Node.pair is not Write-Read Stable with respect to Node.pair (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.Node.pair.Node.pair(t: Tid, u: Tid, v: Ref, w1: Ref, w2: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpW: Ref;                                                                                     
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var v_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var w2_pre: Ref;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var w1_pre: Ref;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var v_mid: Ref;                                                                                    
 var t_mid: Tid;                                                                                    
 var Node.pair_mid: [Node]Ref;                                                                      
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w2_mid: Ref;                                                                                   
 var Ref._lock_mid: [Ref]Tid;                                                                       
 var Node.pair_nextThread_mid: [Node]Tid;                                                           
 var Ref._state_mid: [Ref]State;                                                                    
 var w1_mid: Ref;                                                                                   
 var Node.pair_nextValue_mid: [Node]Ref;                                                            
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var w2_post: Ref;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var v_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var w1_post: Ref;                                                                                  
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.pair(u: Tid,y: Node,w1: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := Node.pair[y];                                                                              
 Node.pair[y] := w1;                                                                                
                                                                                                    
 assume Ref._state_mid == Ref._state && Ref._lock_mid == Ref._lock && Node._state_mid == Node._state && Node.pair_mid == Node.pair && Node._lock_mid == Node._lock && Node.pair_nextThread_mid == Node.pair_nextThread && Node.pair_nextValue_mid == Node.pair_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.Node.pair(u: Tid,y: Node,w2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 Node.pair[y] := tmpW;                                                                              
                                                                                                    
 Node.pair[x] := v;                                                                                 
 Node.pair[y] := w1;                                                                                
                                                                                                    
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.Node.pair(u: Tid,y: Node,w2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.Node.pair.Node.pair(t: Tid, u: Tid, v1: Ref, v2: Ref, w: Ref, x: Node, y: Node)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Node._state[x], t);                                                          
 requires isAccessible(Node._state[y], u);                                                          
 modifies Node.pair;                                                                                
 modifies Node.pair;                                                                                
                                                                                                    
 {                                                                                                  
 var tmpV: Ref;                                                                                     
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
 var Ref._state_pre: [Ref]State;                                                                    
 var x_pre: Node;                                                                                   
 var w_pre: Ref;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Node.pair_pre: [Node]Ref;                                                                      
 var v2_pre: Ref;                                                                                   
 var Node._state_pre: [Node]State;                                                                  
 var y_pre: Node;                                                                                   
 var Node.pair_nextValue_pre: [Node]Ref;                                                            
 var Ref._lock_pre: [Ref]Tid;                                                                       
 var $pc_pre: Phase;                                                                                
 var Node.pair_nextThread_pre: [Node]Tid;                                                           
 var v1_pre: Ref;                                                                                   
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Node.pair_mid: [Node]Ref;                                                                      
 var v2_mid: Ref;                                                                                   
 var v1_mid: Ref;                                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: Ref;                                                                                    
 var Ref._lock_mid: [Ref]Tid;                                                                       
 var Node.pair_nextThread_mid: [Node]Tid;                                                           
 var Ref._state_mid: [Ref]State;                                                                    
 var Node.pair_nextValue_mid: [Node]Ref;                                                            
 var y_mid: Node;                                                                                   
 var Node._lock_mid: [Node]Tid;                                                                     
 var Node._state_mid: [Node]State;                                                                  
 var x_mid: Node;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Node.pair_nextValue_post: [Node]Ref;                                                           
 var y_post: Node;                                                                                  
 var v1_post: Ref;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Node.pair_post: [Node]Ref;                                                                     
 var t_post: Tid;                                                                                   
 var x_post: Node;                                                                                  
 var v2_post: Ref;                                                                                  
 var $pc_post: Phase;                                                                               
 var Node._lock_post: [Node]Tid;                                                                    
 var w_post: Ref;                                                                                   
 var Ref._state_post: [Ref]State;                                                                   
 var Node._state_post: [Node]State;                                                                 
 var Ref._lock_post: [Ref]Tid;                                                                      
 var Node.pair_nextThread_post: [Node]Tid;                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Node.pair(u: Tid,y: Node,w: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := Node.pair[x];                                                                              
 Node.pair[x] := v1;                                                                                
 _writeByTAfterT := WriteEval.Node.pair(t: Tid,x: Node,v2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 Node.pair[x] := tmpV;                                                                              
                                                                                                    
 Node.pair[y] := w;                                                                                 
 assume Ref._state_mid == Ref._state && Ref._lock_mid == Ref._lock && Node._state_mid == Node._state && Node.pair_mid == Node.pair && Node._lock_mid == Node._lock && Node.pair_nextThread_mid == Node.pair_nextThread && Node.pair_nextValue_mid == Node.pair_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.Node.pair(t: Tid,x: Node,v1: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 Node.pair[x] := v1;                                                                                
 _writeByTAfterUAndT := WriteEval.Node.pair(t: Tid,x: Node,v2: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
requires ValidTid(tid);                                                                             
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (<undefined position>): Object invariant may not hold.
modifies Ref._state;                                                                                
modifies Ref._lock;                                                                                 
modifies Node._state;                                                                               
modifies Node.pair;                                                                                 
modifies Node._lock;                                                                                
modifies Node.pair_nextThread;                                                                      
modifies Node.pair_nextValue;                                                                       
ensures StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
ensures Y(tid , old(Ref._state), old(Ref._lock), old(Node._state), old(Node.pair), old(Node._lock), old(Node.pair_nextThread), old(Node.pair_nextValue) , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
ensures  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// Ref._lock:                                                                                       
                                                                                                    
function {:inline} Y_Ref._lock(tid : Tid, this: Ref, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 ((isAccessible(Ref._state[this], tid) && leq(m#moverPath(ReadEval.Ref._lock(tid: Tid,this: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _R)) ==> (Ref._lock[this] == newValue))
 &&(((Ref._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Ref._lock(tid : Tid, this: Ref, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Ref._lock.Subsumes.W(tid : Tid, u : Tid, this: Ref, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Node.pair_yield: [Node]Ref;                                                                     
var Ref._lock_yield: [Ref]Tid;                                                                      
var newValue_yield: Tid;                                                                            
var Node.pair_nextThread_yield: [Node]Tid;                                                          
var Node.pair_nextValue_yield: [Node]Ref;                                                           
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Ref._state_yield: [Ref]State;                                                                   
var this_yield: Ref;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Ref._state[this], tid);                                                        
 assume isAccessible(Ref._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Ref._lock(u: Tid,this: Ref,newValue: Tid,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)));
 assume leq(m#moverPath(ReadEval.Ref._lock(tid: Tid,this: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _N);
assume Ref._state_yield == Ref._state && Ref._lock_yield == Ref._lock && Node._state_yield == Node._state && Node.pair_yield == Node.pair && Node._lock_yield == Node._lock && Node.pair_nextThread_yield == Node.pair_nextThread && Node.pair_nextValue_yield == Node.pair_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Ref._lock(tid, this, newValue , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Ref._lock.Reflexive(tid : Tid, this: Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Node.pair_yield: [Node]Ref;                                                                     
var Ref._lock_yield: [Ref]Tid;                                                                      
var Node.pair_nextThread_yield: [Node]Tid;                                                          
var Node.pair_nextValue_yield: [Node]Ref;                                                           
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Ref._state_yield: [Ref]State;                                                                   
var this_yield: Ref;                                                                                
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Ref._state[this], tid);                                                        
assume Ref._state_yield == Ref._state && Ref._lock_yield == Ref._lock && Node._state_yield == Node._state && Node.pair_yield == Node.pair && Node._lock_yield == Node._lock && Node.pair_nextThread_yield == Node.pair_nextThread && Node.pair_nextValue_yield == Node.pair_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Ref._lock(tid, this, Ref._lock[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Ref._lock.Transitive(tid : Tid, this: Ref, newValue : Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref , Ref._state_p: [Ref]State, Ref._lock_p: [Ref]Tid, Node._state_p: [Node]State, Node.pair_p: [Node]Ref, Node._lock_p: [Node]Tid, Node.pair_nextThread_p: [Node]Tid, Node.pair_nextValue_p: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires StateInvariant(Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (3.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var Ref._state_pre: [Ref]State;                                                                     
var this_pre: Ref;                                                                                  
var $recorded.state_pre: int;                                                                       
var Node.pair_pre: [Node]Ref;                                                                       
var Node._state_pre: [Node]State;                                                                   
var Node.pair_nextValue_pre: [Node]Ref;                                                             
var tid_pre: Tid;                                                                                   
var Ref._lock_pre: [Ref]Tid;                                                                        
var $pc_pre: Phase;                                                                                 
var Node.pair_nextThread_pre: [Node]Tid;                                                            
var newValue_pre: Tid;                                                                              
                                                                                                    
var Node.pair_nextValue_post: [Node]Ref;                                                            
var $recorded.state_post: int;                                                                      
var Node.pair_post: [Node]Ref;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var this_post: Ref;                                                                                 
var Ref._state_post: [Ref]State;                                                                    
var Node._state_post: [Node]State;                                                                  
var newValue_post: Tid;                                                                             
var Ref._lock_post: [Ref]Tid;                                                                       
var Node.pair_nextThread_post: [Node]Tid;                                                           
                                                                                                    
assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Ref._state[this], tid);                                                        
 assume Y(tid , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue , Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
 assume Y_Ref._lock(tid, this, newValue , Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
assume Ref._state_post == Ref._state_p && Ref._lock_post == Ref._lock_p && Node._state_post == Node._state_p && Node.pair_post == Node.pair_p && Node._lock_post == Node._lock_p && Node.pair_nextThread_post == Node.pair_nextThread_p && Node.pair_nextValue_post == Node.pair_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Ref._lock(tid, this, newValue , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
// Node.pair:                                                                                       
                                                                                                    
function {:inline} Y_Node.pair(tid : Tid, this: Node, newValue: Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.pair(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _R)) ==> (Node.pair[this] == newValue))
 &&(((newValue==Node.pair[this])||((!(isLocal(Ref._state[newValue], tid))&&!(isShared(Ref._state[newValue])))&&(newValue!=Ref.null))))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.pair(tid : Tid, this: Node, newValue: Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node.pair.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: Node;                                                                               
var Node.pair_yield: [Node]Ref;                                                                     
var Ref._lock_yield: [Ref]Tid;                                                                      
var Node.pair_nextThread_yield: [Node]Tid;                                                          
var Node.pair_nextValue_yield: [Node]Ref;                                                           
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Ref._state_yield: [Ref]State;                                                                   
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var newValue_yield: Ref;                                                                            
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node.pair(u: Tid,this: Node,newValue: Ref,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)));
                                                                                                    
assume Ref._state_yield == Ref._state && Ref._lock_yield == Ref._lock && Node._state_yield == Node._state && Node.pair_yield == Node.pair && Node._lock_yield == Node._lock && Node.pair_nextThread_yield == Node.pair_nextThread && Node.pair_nextValue_yield == Node.pair_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.pair(tid, this, newValue , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Node.pair.Reflexive(tid : Tid, this: Node , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Node;                                                                               
var Node.pair_yield: [Node]Ref;                                                                     
var Ref._lock_yield: [Ref]Tid;                                                                      
var Node.pair_nextThread_yield: [Node]Tid;                                                          
var Node.pair_nextValue_yield: [Node]Ref;                                                           
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Ref._state_yield: [Ref]State;                                                                   
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Ref._state_yield == Ref._state && Ref._lock_yield == Ref._lock && Node._state_yield == Node._state && Node.pair_yield == Node.pair && Node._lock_yield == Node._lock && Node.pair_nextThread_yield == Node.pair_nextThread && Node.pair_nextValue_yield == Node.pair_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node.pair(tid, this, Node.pair[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Node.pair.Transitive(tid : Tid, this: Node, newValue : Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref , Ref._state_p: [Ref]State, Ref._lock_p: [Ref]Tid, Node._state_p: [Node]State, Node.pair_p: [Node]Ref, Node._lock_p: [Node]Tid, Node.pair_nextThread_p: [Node]Tid, Node.pair_nextValue_p: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires StateInvariant(Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (8.39): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var Ref._state_pre: [Ref]State;                                                                     
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node.pair_pre: [Node]Ref;                                                                       
var newValue_pre: Ref;                                                                              
var Node._state_pre: [Node]State;                                                                   
var Node.pair_nextValue_pre: [Node]Ref;                                                             
var tid_pre: Tid;                                                                                   
var Ref._lock_pre: [Ref]Tid;                                                                        
var $pc_pre: Phase;                                                                                 
var Node.pair_nextThread_pre: [Node]Tid;                                                            
                                                                                                    
var Node.pair_nextValue_post: [Node]Ref;                                                            
var $recorded.state_post: int;                                                                      
var Node.pair_post: [Node]Ref;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var newValue_post: Ref;                                                                             
var Ref._state_post: [Ref]State;                                                                    
var Node._state_post: [Node]State;                                                                  
var this_post: Node;                                                                                
var Ref._lock_post: [Ref]Tid;                                                                       
var Node.pair_nextThread_post: [Node]Tid;                                                           
                                                                                                    
assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue , Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
 assume Y_Node.pair(tid, this, newValue , Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
assume Ref._state_post == Ref._state_p && Ref._lock_post == Ref._lock_p && Node._state_post == Node._state_p && Node.pair_post == Node.pair_p && Node._lock_post == Node._lock_p && Node.pair_nextThread_post == Node.pair_nextThread_p && Node.pair_nextValue_post == Node.pair_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node.pair(tid, this, newValue , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Check_Node.pair.ABAFree(tid : Tid, this: Node, A : Ref, B : Ref)                          
 modifies Node.pair;                                                                                
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires Node.pair[this] == A;                                                                     
 requires isAccessible(Node._state[this], tid);                                                     
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (8.39): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var Ref._state_pre: [Ref]State;                                                                     
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node.pair_pre: [Node]Ref;                                                                       
var A_pre: Ref;                                                                                     
var Node._state_pre: [Node]State;                                                                   
var B_pre: Ref;                                                                                     
var Node.pair_nextValue_pre: [Node]Ref;                                                             
var tid_pre: Tid;                                                                                   
var Ref._lock_pre: [Ref]Tid;                                                                        
var $pc_pre: Phase;                                                                                 
var Node.pair_nextThread_pre: [Node]Tid;                                                            
                                                                                                    
var Node.pair_nextValue_post: [Node]Ref;                                                            
var $recorded.state_post: int;                                                                      
var Node.pair_post: [Node]Ref;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var B_post: Ref;                                                                                    
var tid_post: Tid;                                                                                  
var A_post: Ref;                                                                                    
var Ref._state_post: [Ref]State;                                                                    
var Node._state_post: [Node]State;                                                                  
var this_post: Node;                                                                                
var Ref._lock_post: [Ref]Tid;                                                                       
var Node.pair_nextThread_post: [Node]Tid;                                                           
                                                                                                    
assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_Node.pair(tid, this, B , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 assume A != B;                                                                                     
Node.pair[this] := B;                                                                               
assume Ref._state_post == Ref._state && Ref._lock_post == Ref._lock && Node._state_post == Node._state && Node.pair_post == Node.pair && Node._lock_post == Node._lock && Node.pair_nextThread_post == Node.pair_nextThread && Node.pair_nextValue_post == Node.pair_nextValue && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_Node.pair(tid, this, A , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue));
}                                                                                                   
// Node._lock:                                                                                      
                                                                                                    
function {:inline} Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _R)) ==> (Node._lock[this] == newValue))
 &&(((Node._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node._lock(tid : Tid, this: Node, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Subsumes.W(tid : Tid, u : Tid, this: Node, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: Node;                                                                               
var Node.pair_yield: [Node]Ref;                                                                     
var Ref._lock_yield: [Ref]Tid;                                                                      
var newValue_yield: Tid;                                                                            
var Node.pair_nextThread_yield: [Node]Tid;                                                          
var Node.pair_nextValue_yield: [Node]Ref;                                                           
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Ref._state_yield: [Ref]State;                                                                   
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume isAccessible(Node._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Node._lock(u: Tid,this: Node,newValue: Tid,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)));
 assume leq(m#moverPath(ReadEval.Node._lock(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _N);
assume Ref._state_yield == Ref._state && Ref._lock_yield == Ref._lock && Node._state_yield == Node._state && Node.pair_yield == Node.pair && Node._lock_yield == Node._lock && Node.pair_nextThread_yield == Node.pair_nextThread && Node.pair_nextValue_yield == Node.pair_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, newValue , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Reflexive(tid : Tid, this: Node , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: Node;                                                                               
var Node.pair_yield: [Node]Ref;                                                                     
var Ref._lock_yield: [Ref]Tid;                                                                      
var Node.pair_nextThread_yield: [Node]Tid;                                                          
var Node.pair_nextValue_yield: [Node]Ref;                                                           
var Node._state_yield: [Node]State;                                                                 
var tid_yield: Tid;                                                                                 
var Ref._state_yield: [Ref]State;                                                                   
var $pc_yield: Phase;                                                                               
var Node._lock_yield: [Node]Tid;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
assume Ref._state_yield == Ref._state && Ref._lock_yield == Ref._lock && Node._state_yield == Node._state && Node.pair_yield == Node.pair && Node._lock_yield == Node._lock && Node.pair_nextThread_yield == Node.pair_nextThread && Node.pair_nextValue_yield == Node.pair_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Node._lock(tid, this, Node._lock[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Node._lock.Transitive(tid : Tid, this: Node, newValue : Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref , Ref._state_p: [Ref]State, Ref._lock_p: [Ref]Tid, Node._state_p: [Node]State, Node.pair_p: [Node]Ref, Node._lock_p: [Node]Tid, Node.pair_nextThread_p: [Node]Tid, Node.pair_nextValue_p: [Node]Ref)
 requires StateInvariant(Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
 requires StateInvariant(Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
 requires ValidTid(tid);                                                                            
requires  (forall _this : Node ::  { Node._state[_this] } isAccessible(Node._state[_this], tid) && true ==> Invariant.Node.522287(tid: Tid,_this : Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue));       // (6.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var Node._lock_pre: [Node]Tid;                                                                      
var Ref._state_pre: [Ref]State;                                                                     
var $recorded.state_pre: int;                                                                       
var this_pre: Node;                                                                                 
var Node.pair_pre: [Node]Ref;                                                                       
var Node._state_pre: [Node]State;                                                                   
var Node.pair_nextValue_pre: [Node]Ref;                                                             
var tid_pre: Tid;                                                                                   
var Ref._lock_pre: [Ref]Tid;                                                                        
var $pc_pre: Phase;                                                                                 
var Node.pair_nextThread_pre: [Node]Tid;                                                            
var newValue_pre: Tid;                                                                              
                                                                                                    
var Node.pair_nextValue_post: [Node]Ref;                                                            
var $recorded.state_post: int;                                                                      
var Node.pair_post: [Node]Ref;                                                                      
var $pc_post: Phase;                                                                                
var Node._lock_post: [Node]Tid;                                                                     
var tid_post: Tid;                                                                                  
var Ref._state_post: [Ref]State;                                                                    
var Node._state_post: [Node]State;                                                                  
var this_post: Node;                                                                                
var newValue_post: Tid;                                                                             
var Ref._lock_post: [Ref]Tid;                                                                       
var Node.pair_nextThread_post: [Node]Tid;                                                           
                                                                                                    
assume Ref._state_pre == Ref._state && Ref._lock_pre == Ref._lock && Node._state_pre == Node._state && Node.pair_pre == Node.pair && Node._lock_pre == Node._lock && Node.pair_nextThread_pre == Node.pair_nextThread && Node.pair_nextValue_pre == Node.pair_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Node._state[this], tid);                                                       
 assume Y(tid , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue , Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
 assume Y_Node._lock(tid, this, newValue , Ref._state_p, Ref._lock_p, Node._state_p, Node.pair_p, Node._lock_p, Node.pair_nextThread_p, Node.pair_nextValue_p);
assume Ref._state_post == Ref._state_p && Ref._lock_post == Ref._lock_p && Node._state_post == Node._state_p && Node.pair_post == Node.pair_p && Node._lock_post == Node._lock_p && Node.pair_nextThread_post == Node.pair_nextThread_p && Node.pair_nextValue_post == Node.pair_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Node._lock(tid, this, newValue , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue);
}                                                                                                   
// Node.pair_nextThread:                                                                            
                                                                                                    
function {:inline} Y_Node.pair_nextThread(tid : Tid, this: Node, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.pair_nextThread(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _R)) ==> (Node.pair_nextThread[this] == newValue))
 &&(((Node.pair_nextThread[this]==tid)==>(newValue==tid)))                                          
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.pair_nextThread(tid : Tid, this: Node, newValue: Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// Node.pair_nextValue:                                                                             
                                                                                                    
function {:inline} Y_Node.pair_nextValue(tid : Tid, this: Node, newValue: Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 ((isAccessible(Node._state[this], tid) && leq(m#moverPath(ReadEval.Node.pair_nextValue(tid: Tid,this: Node,Ref._state,Ref._lock,Node._state,Node.pair,Node._lock,Node.pair_nextThread,Node.pair_nextValue)), _R)) ==> (Node.pair_nextValue[this] == newValue))
 &&(((Node.pair_nextThread[this]==tid)==>(newValue==Node.pair_nextValue[this])))                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Node.pair_nextValue(tid : Tid, this: Node, newValue: Ref , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Ref._state: [Ref]State, Ref._lock: [Ref]Tid, Node._state: [Node]State, Node.pair: [Node]Ref, Node._lock: [Node]Tid, Node.pair_nextThread: [Node]Tid, Node.pair_nextValue: [Node]Ref , Ref._state_p: [Ref]State, Ref._lock_p: [Ref]Tid, Node._state_p: [Node]State, Node.pair_p: [Node]Ref, Node._lock_p: [Node]Tid, Node.pair_nextThread_p: [Node]Tid, Node.pair_nextValue_p: [Node]Ref): bool
{                                                                                                   
 (forall this: Ref :: Y_Ref._lock(tid : Tid, this, Ref._lock_p[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue))
 && (forall this: Node :: Y_Node.pair(tid : Tid, this, Node.pair_p[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue))
 && (forall this: Node :: Y_Node._lock(tid : Tid, this, Node._lock_p[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue))
 && (forall this: Node :: Y_Node.pair_nextThread(tid : Tid, this, Node.pair_nextThread_p[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue))
 && (forall this: Node :: Y_Node.pair_nextValue(tid : Tid, this, Node.pair_nextValue_p[this] , Ref._state, Ref._lock, Node._state, Node.pair, Node._lock, Node.pair_nextThread, Node.pair_nextValue))
 && (forall _i : Ref :: isShared(Ref._state[_i]) ==> isShared(Ref._state_p[_i]))                    
 && (forall _i : Ref :: isLocal(Ref._state[_i], tid) <==> isLocal(Ref._state_p[_i], tid))           
 && (forall _i : Node :: isShared(Node._state[_i]) ==> isShared(Node._state_p[_i]))                 
 && (forall _i : Node :: isLocal(Node._state[_i], tid) <==> isLocal(Node._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 958.1-1720.2: (Method:15.5)
// 970.1-970.24: (15.5): Bad tid
// 971.1-971.61: (15.5): Parameter VarDecl(ClassType(Node),expectedReference) is not global
// 972.1-972.56: (15.5): Parameter VarDecl(ClassType(Node),newReference) is not global
// 973.1-973.38: (15.5): this is not global
// 976.1-976.250: (15.5): Object invariant may not hold.
// 979.1-979.249: (15.5): Object invariant may not hold.
// 1329.2-1331.2: (class anchor.sink.VarDeclStmt:20.9)
// 1333.2-1335.2: (class anchor.sink.VarDeclStmt:20.9)
// 1336.2-1353.37: (class anchor.sink.Read:20.9)
// 1348.1-1348.28: (20.9): Cannot have potential null deference in left-mover part.
// 1352.1-1352.27: (20.9): Reduction failure
// 1354.2-1356.2: (class anchor.sink.VarDeclStmt:20.9)
// 1357.2-1374.36: (class anchor.sink.Read:20.9)
// 1369.1-1369.28: (20.9): Cannot have potential null deference in left-mover part.
// 1373.1-1373.27: (20.9): Reduction failure
// 1375.2-1377.2: (class anchor.sink.VarDeclStmt:20.9)
// 1378.2-1395.35: (class anchor.sink.Read:20.9)
// 1390.1-1390.28: (20.9): Cannot have potential null deference in left-mover part.
// 1394.1-1394.27: (20.9): Reduction failure
// 1396.2-1398.2: (class anchor.sink.VarDeclStmt:20.9)
// 1399.2-1402.158: (class anchor.sink.Assign:20.9)
// 1403.2-1405.2: (class anchor.sink.VarDeclStmt:20.9)
// 1406.2-1409.73: (class anchor.sink.Assign:20.9)
// 1412.3-1429.30: (class anchor.sink.Read:20.9)
// 1424.1-1424.29: (20.9): Cannot have potential null deference in left-mover part.
// 1428.1-1428.28: (20.9): Reduction failure
// 1432.3-1449.30: (class anchor.sink.Read:20.9)
// 1444.1-1444.29: (20.9): Cannot have potential null deference in left-mover part.
// 1448.1-1448.28: (20.9): Reduction failure
// 1451.2-1453.2: (class anchor.sink.VarDeclStmt:21.9)
// 1454.2-1456.2: (class anchor.sink.VarDeclStmt:21.9)
// 1457.2-1463.38: (class anchor.sink.Alloc:21.9)
// 1466.2-1468.2: (class anchor.sink.VarDeclStmt:21.9)
// 1469.2-1472.18: (class anchor.sink.Assign:21.9)
// 1473.2-1476.22: (class anchor.sink.Break:4.1)
// 1479.2-1481.2: (class anchor.sink.VarDeclStmt:21.9)
// 1482.2-1485.19: (class anchor.sink.Assign:21.9)
// 1488.3-1491.17: (class anchor.sink.Assign:21.9)
// 1493.3-1496.20: (class anchor.sink.Assign:21.9)
// 1498.4-1500.4: (class anchor.sink.VarDeclStmt:21.9)
// 1501.4-1503.4: (class anchor.sink.VarDeclStmt:21.9)
// 1504.4-1506.4: (class anchor.sink.VarDeclStmt:21.9)
// 1507.4-1510.169: (class anchor.sink.Assign:21.9)
// 1511.4-1514.38: (class anchor.sink.Assume:21.9)
// 1515.4-1518.48: (class anchor.sink.Assume:21.9)
// 1519.4-1522.45: (class anchor.sink.Assume:21.9)
// 1523.4-1526.48: (class anchor.sink.Assume:21.9)
// 1528.4-1544.41: (class anchor.sink.Write:21.9)
// 1540.1-1540.30: (21.9): Cannot have potential null deference in left-mover part.
// 1543.1-1543.29: (21.9): Reduction failure
// 1546.4-1562.42: (class anchor.sink.Write:21.9)
// 1558.1-1558.30: (21.9): Cannot have potential null deference in left-mover part.
// 1561.1-1561.29: (21.9): Reduction failure
// 1565.4-1585.4: (class anchor.sink.Write:21.9)
// 1577.1-1577.30: (21.9): Cannot have potential null deference in left-mover part.
// 1580.1-1580.29: (21.9): Reduction failure
// 1586.4-1589.17: (class anchor.sink.Assign:21.9)
// 1591.4-1594.45: (class anchor.sink.Assume:21.9)
// 1595.4-1598.48: (class anchor.sink.Assume:21.9)
// 1599.4-1601.4: (class anchor.sink.VarDeclStmt:21.9)
// 1602.4-1619.37: (class anchor.sink.Read:21.9)
// 1614.1-1614.30: (21.9): Cannot have potential null deference in left-mover part.
// 1618.1-1618.29: (21.9): Reduction failure
// 1621.4-1641.4: (class anchor.sink.Write:21.9)
// 1633.1-1633.30: (21.9): Cannot have potential null deference in left-mover part.
// 1636.1-1636.29: (21.9): Reduction failure
// 1642.4-1644.4: (class anchor.sink.VarDeclStmt:21.9)
// 1645.4-1648.169: (class anchor.sink.Assign:21.9)
// 1650.4-1670.4: (class anchor.sink.Write:21.9)
// 1662.1-1662.30: (21.9): Cannot have potential null deference in left-mover part.
// 1665.1-1665.29: (21.9): Reduction failure
// 1671.4-1674.45: (class anchor.sink.Assume:21.9)
// 1677.4-1697.4: (class anchor.sink.Write:21.9)
// 1689.1-1689.30: (21.9): Cannot have potential null deference in left-mover part.
// 1692.1-1692.29: (21.9): Reduction failure
// 1698.4-1701.18: (class anchor.sink.Assign:21.9)
// 1704.2-1711.9: (class anchor.sink.Return:21.9)
// 1710.1-1710.249: (21.9): Object invariant may not hold.
// 1712.2-1719.9: (class anchor.sink.Return:18.39)
// 1718.1-1718.249: (18.39): Object invariant may not hold.
// 1805.1-1805.34: (8.5): Node.pair failed Write-Write Right-Mover Check
// 1870.1-1870.30: (8.5): Node.pair failed Write-Read Right-Mover Check
// 1939.1-1939.34: (8.5): Node.pair failed Write-Write Left-Mover Check
// 2005.1-2005.30: (8.5): Node.pair failed Write-Read Left-Mover Check
// 2068.1-2068.34: (8.5): Node.pair failed Read-Write Right-Mover Check
// 2134.1-2134.34: (8.5): Node.pair failed Read-Write Left-Mover Check
// 2211.1-2211.140: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case A.1)
// 2212.1-2212.101: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case A.2)
// 2213.1-2213.158: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case A.3)
// 2318.1-2318.140: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case C)
// 2428.1-2428.144: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case D)
// 2429.1-2429.144: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case R)
// 2506.1-2506.136: (8.5): Node.pair is not Read-Write Stable with respect to Node.pair (case F)
// 2507.1-2507.136: (8.5): Node.pair is not Read-Write Stable with respect to Node.pair (case H)
// 2508.1-2508.146: (8.5): Node.pair is not Read-Write Stable with respect to Node.pair (case I)
// 2584.1-2584.136: (8.5): Node.pair is not Write-Read Stable with respect to Node.pair (case J)
// 2585.1-2585.136: (8.5): Node.pair is not Write-Read Stable with respect to Node.pair (case K)
// 2586.1-2586.99: (8.5): Node.pair is not Write-Read Stable with respect to Node.pair (case L)
// 2701.1-2701.142: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case M)
// 2814.1-2814.130: (8.5): Node.pair is not Write-Write Stable with respect to Node.pair (case N)
// 2822.1-2822.250: (<undefined position>): Object invariant may not hold.
// 2832.1-2832.249: (<undefined position>): Object invariant may not hold.
// 2853.1-2876.2: (7.32): yields_as clause for Ref._lock is not valid
// 2881.1-2899.2: (7.32): yields_as clause for Ref._lock is not reflexive
// 2905.1-2905.250: (3.1): Object invariant may not hold.
// 2906.1-2942.2: (7.32): yields_as clause for Ref._lock is not transitive
// 2962.1-2985.2: (11.28): yields_as clause for Node.pair is not valid
// 2990.1-3008.2: (11.28): yields_as clause for Node.pair is not reflexive
// 3014.1-3014.250: (8.39): Object invariant may not hold.
// 3015.1-3051.2: (11.28): yields_as clause for Node.pair is not transitive
// 3059.1-3059.250: (8.39): Object invariant may not hold.
// 3060.1-3098.2: (11.28): Node.pair is not ABA-free
// 3118.1-3141.2: (7.32): yields_as clause for Node._lock is not valid
// 3146.1-3164.2: (7.32): yields_as clause for Node._lock is not reflexive
// 3170.1-3170.250: (6.1): Object invariant may not hold.
// 3171.1-3207.2: (7.32): yields_as clause for Node._lock is not transitive
