                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/atomic-inc-paper.anchor:                 
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicInc {                                                                               
      noABA volatile int n isRead                                                                   
       ? N                                                                                          
       : newValue == this.n + 1 ? N : E                                                             
        yields_as newValue >= this.n;                                                               
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.n == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
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
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicInc {                                                                               
      hasCASOperation noABA volatile int n isRead                                                   
       ? N                                                                                          
       : newValue == this.n + 1 ? N : E                                                             
        yields_as newValue >= this.n;                                                               
                                                                                                    
                                                                                                    
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
              _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                 
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp160796;                                                                   
              ctmp160796 = *;                                                                       
              if (ctmp160796) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp160796 = *;                                                                     
                if (ctmp160796) {                                                                   
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
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicInc {                                                                               
      hasCASOperation noABA volatile int n isRead                                                   
       ? N                                                                                          
       : newValue == this.n + 1 ? N : E                                                             
        yields_as newValue >= this.n;                                                               
                                                                                                    
                                                                                                    
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
              _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                 
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp160796;                                                                   
              ctmp160796 = *;                                                                       
              if (ctmp160796) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp160796 = *;                                                                     
                if (ctmp160796) {                                                                   
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
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class AtomicInc {                                                                               
      hasCASOperation noABA volatile int n isRead                                                   
       ? N                                                                                          
       : newValue == this.n + 1 ? N : E                                                             
        yields_as newValue >= this.n;                                                               
                                                                                                    
                                                                                                    
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
              _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                 
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.n  as R;                                                                  
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.n;                                                                        
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp160796;                                                                   
              ctmp160796 = *;                                                                       
              if (ctmp160796) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp160796 = *;                                                                     
                if (ctmp160796) {                                                                   
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
                                                                                                    
                                                                                                    
/*** Class Decl AtomicInc ***/                                                                      
                                                                                                    
type AtomicInc;                                                                                     
const unique AtomicInc.null: AtomicInc;                                                             
var AtomicInc._state: [AtomicInc]State;                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicInc.n: [AtomicInc]int;                                                                    
                                                                                                    
function {:inline} ReadEval.AtomicInc.n(tid: Tid,this : AtomicInc,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if ((newValue==(AtomicInc.n[this]+1))) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicInc.n(tid: Tid,this : AtomicInc,newValue: int,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if ((newValue==(AtomicInc.n[this]+1))) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicInc._lock: [AtomicInc]Tid;                                                                
                                                                                                    
function {:inline} ReadEval.AtomicInc._lock(tid: Tid,this : AtomicInc,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(AtomicInc._state[this], tid)) then                                                     
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((AtomicInc._lock[this]==tid)) then                                                           
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((AtomicInc._lock[this]==Tid.null)&&(newValue==tid))) then                                   
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((AtomicInc._lock[this]==tid)&&(newValue==Tid.null))) then                                  
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicInc._lock(tid: Tid,this : AtomicInc,newValue: Tid,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(AtomicInc._state[this], tid)) then                                                     
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((AtomicInc._lock[this]==tid)) then                                                           
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((AtomicInc._lock[this]==Tid.null)&&(newValue==tid))) then                                   
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((AtomicInc._lock[this]==tid)&&(newValue==Tid.null))) then                                  
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicInc.n_nextThread: [AtomicInc]Tid;                                                         
                                                                                                    
function {:inline} ReadEval.AtomicInc.n_nextThread(tid: Tid,this : AtomicInc,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(AtomicInc._state[this], tid)) then                                                     
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicInc.n_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicInc.n_nextThread(tid: Tid,this : AtomicInc,newValue: Tid,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(AtomicInc._state[this], tid)) then                                                     
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicInc.n_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var AtomicInc.n_nextValue: [AtomicInc]int;                                                          
                                                                                                    
function {:inline} ReadEval.AtomicInc.n_nextValue(tid: Tid,this : AtomicInc,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(AtomicInc._state[this], tid)) then                                                     
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicInc.n_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.AtomicInc.n_nextValue(tid: Tid,this : AtomicInc,newValue: int,AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(AtomicInc._state[this], tid)) then                                                     
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((AtomicInc.n_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  AtomicInc.inc(tid:Tid, this : AtomicInc)                                                 
modifies AtomicInc._state;                                                                          
modifies AtomicInc.n;                                                                               
modifies AtomicInc._lock;                                                                           
modifies AtomicInc.n_nextThread;                                                                    
modifies AtomicInc.n_nextValue;                                                                     
                                                                                                    
requires ValidTid(tid);                                                                                    // (9.2): Bad tid
requires isShared(AtomicInc._state[this]);                                                                 // (9.2): this is not global
                                                                                                    
requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
                                                                                                    
ensures StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
{                                                                                                   
 var AtomicInc._state176166_post: [AtomicInc]State;                                                 
 var AtomicInc.n_nextValue176102: [AtomicInc]int;                                                   
 var $pc176021: Phase;                                                                              
 var $pc176166_post: Phase;                                                                         
 var AtomicInc.n_nextThread176102: [AtomicInc]Tid;                                                  
 var moverPath175983: MoverPath;                                                                    
 var mover176026: Mover;                                                                            
 var _currentValue: int;                                                                            
 var moverPath176099: MoverPath;                                                                    
 var mover175983: Mover;                                                                            
 var AtomicInc._state176102: [AtomicInc]State;                                                      
 var moverPath176026: MoverPath;                                                                    
 var AtomicInc.n176166: [AtomicInc]int;                                                             
 var moverPath176021: MoverPath;                                                                    
 var x176144: int;                                                                                  
 var tmp1176144: bool;                                                                              
 var $recorded.state176170: int;                                                                    
 var this176099: AtomicInc;                                                                         
 var _C_t: Tid;                                                                                     
 var path176132: int;                                                                               
 var mover176021: Mover;                                                                            
 var mover176106: Mover;                                                                            
 var x175977: int;                                                                                  
 var AtomicInc.n_nextValue176169_bottom: [AtomicInc]int;                                            
 var AtomicInc.n_nextThread176132: [AtomicInc]Tid;                                                  
 var AtomicInc._lock175983: [AtomicInc]Tid;                                                         
 var tid175983: Tid;                                                                                
 var tid176169: Tid;                                                                                
 var x176106: int;                                                                                  
 var $pc176169: Phase;                                                                              
 var $pc176132: Phase;                                                                              
 var AtomicInc.n_nextThread176169: [AtomicInc]Tid;                                                  
 var _casable: bool;                                                                                
 var AtomicInc._state176170: [AtomicInc]State;                                                      
 var path176026: int;                                                                               
 var mover175971: Mover;                                                                            
 var _C_t175977: Tid;                                                                               
 var AtomicInc._lock176132: [AtomicInc]Tid;                                                         
 var this176169: AtomicInc;                                                                         
 var x: int;                                                                                        
 var this176026: AtomicInc;                                                                         
 var _C_v175983: int;                                                                               
 var moverPath175971: MoverPath;                                                                    
 var _C_t176021: Tid;                                                                               
 var $recorded.state176169: int;                                                                    
 var $pc175983: Phase;                                                                              
 var tmp3176099: int;                                                                               
 var AtomicInc.n_nextValue176129: [AtomicInc]int;                                                   
 var tmp1175971: bool;                                                                              
 var path176102: int;                                                                               
 var mover176102: Mover;                                                                            
 var $recorded.state176021: int;                                                                    
 var AtomicInc.n_nextThread176026: [AtomicInc]Tid;                                                  
 var AtomicInc.n_nextThread175971: [AtomicInc]Tid;                                                  
 var AtomicInc._lock176170: [AtomicInc]Tid;                                                         
 var this176169_bottom: AtomicInc;                                                                  
 var mover175977: Mover;                                                                            
 var AtomicInc.n_nextValue175983: [AtomicInc]int;                                                   
 var tmp1: bool;                                                                                    
 var tmp3176102: int;                                                                               
 var tmpValue: int;                                                                                 
 var tmp2176102: bool;                                                                              
 var _m176106: Mover;                                                                               
 var AtomicInc.n_nextValue176106: [AtomicInc]int;                                                   
 var path176151: int;                                                                               
 var $recorded.state175977: int;                                                                    
 var _currentValue176026: int;                                                                      
 var $pc176170: Phase;                                                                              
 var AtomicInc._state176026: [AtomicInc]State;                                                      
 var tmp3176106: int;                                                                               
 var $pc176169_bottom: Phase;                                                                       
 var AtomicInc._state176151: [AtomicInc]State;                                                      
 var AtomicInc.n_nextThread176169_bottom: [AtomicInc]Tid;                                           
 var AtomicInc.n_nextValue175971: [AtomicInc]int;                                                   
 var path176021: int;                                                                               
 var tmp2176144: bool;                                                                              
 var _m176144: Mover;                                                                               
 var _m176102: Mover;                                                                               
 var AtomicInc.n_nextValue176170: [AtomicInc]int;                                                   
 var tmp2: bool;                                                                                    
 var ctmp160796176144: bool;                                                                        
 var x176132: int;                                                                                  
 var AtomicInc._lock176166: [AtomicInc]Tid;                                                         
 var this176151: AtomicInc;                                                                         
 var ctmp160796176102: bool;                                                                        
 var tmp1175977: bool;                                                                              
 var AtomicInc.n176021: [AtomicInc]int;                                                             
 var tmpValue176102: int;                                                                           
 var phase176169: Phase;                                                                            
 var AtomicInc._state175971: [AtomicInc]State;                                                      
 var mover176132: Mover;                                                                            
 var _currentValue176132: int;                                                                      
 var AtomicInc.n_nextThread176166: [AtomicInc]Tid;                                                  
 var tid176021: Tid;                                                                                
 var AtomicInc.n_nextThread175983: [AtomicInc]Tid;                                                  
 var tid176169_bottom: Tid;                                                                         
 var AtomicInc.n176144: [AtomicInc]int;                                                             
 var AtomicInc._state176144: [AtomicInc]State;                                                      
 var $pc176099: Phase;                                                                              
 var AtomicInc.n176166_post: [AtomicInc]int;                                                        
 var tmpTid176106: Tid;                                                                             
 var AtomicInc.n_nextThread176129: [AtomicInc]Tid;                                                  
 var tmp1176151: bool;                                                                              
 var path175971: int;                                                                               
 var AtomicInc.n176169_bottom: [AtomicInc]int;                                                      
 var $pc176129: Phase;                                                                              
 var x175971: int;                                                                                  
 var _m176099: Mover;                                                                               
 var _C_v: int;                                                                                     
 var _casable176021: bool;                                                                          
 var tid176166_post: Tid;                                                                           
 var AtomicInc._state176106: [AtomicInc]State;                                                      
 var $recorded.state176026: int;                                                                    
 var x175983: int;                                                                                  
 var AtomicInc.n_nextThread176021: [AtomicInc]Tid;                                                  
 var tmpTid176099: Tid;                                                                             
 var $recorded.state175971: int;                                                                    
 var this176170: AtomicInc;                                                                         
 var AtomicInc.n176151: [AtomicInc]int;                                                             
 var tmp2176151: bool;                                                                              
 var moverPath176102: MoverPath;                                                                    
 var AtomicInc.n_nextValue176099: [AtomicInc]int;                                                   
 var x176099: int;                                                                                  
 var AtomicInc.n_nextThread176144: [AtomicInc]Tid;                                                  
 var tmp1176166: bool;                                                                              
 var tmp1176166_post: bool;                                                                         
 var ctmp160796176099: bool;                                                                        
 var AtomicInc.n_nextThread176151: [AtomicInc]Tid;                                                  
 var AtomicInc.n176026: [AtomicInc]int;                                                             
 var AtomicInc.n176129: [AtomicInc]int;                                                             
 var tid176129: Tid;                                                                                
 var this176144: AtomicInc;                                                                         
 var tid176026: Tid;                                                                                
 var AtomicInc.n_nextThread175977: [AtomicInc]Tid;                                                  
 var ctmp160796: bool;                                                                              
 var _currentValue175983: int;                                                                      
 var this176132: AtomicInc;                                                                         
 var moverPath176144: MoverPath;                                                                    
 var this176166_post: AtomicInc;                                                                    
 var AtomicInc.n176169: [AtomicInc]int;                                                             
 var tid176170: Tid;                                                                                
 var tmp2176166: bool;                                                                              
 var tid176106: Tid;                                                                                
 var tmp1175983: bool;                                                                              
 var this176021: AtomicInc;                                                                         
 var AtomicInc._lock176169_bottom: [AtomicInc]Tid;                                                  
 var AtomicInc.n_nextThread176099: [AtomicInc]Tid;                                                  
 var AtomicInc.n_nextValue176166_post: [AtomicInc]int;                                              
 var tmp3176144: int;                                                                               
 var _C_v176026: int;                                                                               
 var $pc176144: Phase;                                                                              
 var _C_t176026: Tid;                                                                               
 var $recorded.state176129: int;                                                                    
 var $recorded.state176132: int;                                                                    
 var x176166: int;                                                                                  
 var $recorded.state176102: int;                                                                    
 var mover176151: Mover;                                                                            
 var $recorded.state176166_post: int;                                                               
 var _R_t176026: Mover;                                                                             
 var $pc176151: Phase;                                                                              
 var tmp3176132: int;                                                                               
 var moverPath176129: MoverPath;                                                                    
 var AtomicInc.n_nextThread176170: [AtomicInc]Tid;                                                  
 var tmp1176106: bool;                                                                              
 var $recorded.state176099: int;                                                                    
 var AtomicInc._state176099: [AtomicInc]State;                                                      
 var _C_t175971: Tid;                                                                               
 var AtomicInc.n_nextValue176169: [AtomicInc]int;                                                   
 var AtomicInc.n_nextValue176021: [AtomicInc]int;                                                   
 var ctmp160796176129: bool;                                                                        
 var AtomicInc._state176169_bottom: [AtomicInc]State;                                               
 var moverPath176106: MoverPath;                                                                    
 var path176106: int;                                                                               
 var AtomicInc._state176166: [AtomicInc]State;                                                      
 var tmp3176166_post: int;                                                                          
 var AtomicInc._state176021: [AtomicInc]State;                                                      
 var AtomicInc._state176132: [AtomicInc]State;                                                      
 var AtomicInc._state176169: [AtomicInc]State;                                                      
 var mover176099: Mover;                                                                            
 var AtomicInc.n176102: [AtomicInc]int;                                                             
 var AtomicInc._state176129: [AtomicInc]State;                                                      
 var tmpValue176099: int;                                                                           
 var tmp1176021: bool;                                                                              
 var tid176099: Tid;                                                                                
 var this175971: AtomicInc;                                                                         
 var path176144: int;                                                                               
 var AtomicInc._lock176099: [AtomicInc]Tid;                                                         
 var AtomicInc.n176132: [AtomicInc]int;                                                             
 var moverPath176151: MoverPath;                                                                    
 var _R_t: Mover;                                                                                   
 var AtomicInc.n175971: [AtomicInc]int;                                                             
 var tid176151: Tid;                                                                                
 var AtomicInc._state175977: [AtomicInc]State;                                                      
 var tmpTid176102: Tid;                                                                             
 var this176102: AtomicInc;                                                                         
 var _m: Mover;                                                                                     
 var _currentValue176021: int;                                                                      
 var _C_v176021: int;                                                                               
 var AtomicInc._lock176026: [AtomicInc]Tid;                                                         
 var path176099: int;                                                                               
 var $pc175971: Phase;                                                                              
 var tmp2176129: bool;                                                                              
 var _casable176026: bool;                                                                          
 var tmp1176026: bool;                                                                              
 var x176151: int;                                                                                  
 var $recorded.state176106: int;                                                                    
 var AtomicInc.n_nextValue175977: [AtomicInc]int;                                                   
 var AtomicInc._state175983: [AtomicInc]State;                                                      
 var path175977: int;                                                                               
 var AtomicInc.n176099: [AtomicInc]int;                                                             
 var $recorded.state175983: int;                                                                    
 var path175983: int;                                                                               
 var this175983: AtomicInc;                                                                         
 var ctmp160796176106: bool;                                                                        
 var tid175971: Tid;                                                                                
 var tmp1176129: bool;                                                                              
 var AtomicInc.n176106: [AtomicInc]int;                                                             
 var AtomicInc.n_nextValue176166: [AtomicInc]int;                                                   
 var _currentValue176151: int;                                                                      
 var this176106: AtomicInc;                                                                         
 var AtomicInc.n175983: [AtomicInc]int;                                                             
 var AtomicInc._lock176169: [AtomicInc]Tid;                                                         
 var _C_v175977: int;                                                                               
 var $pc176102: Phase;                                                                              
 var x176102: int;                                                                                  
 var AtomicInc.n_nextThread176166_post: [AtomicInc]Tid;                                             
 var x176166_post: int;                                                                             
 var $recorded.state176144: int;                                                                    
 var tid175977: Tid;                                                                                
 var $pc176166: Phase;                                                                              
 var tmpTid: Tid;                                                                                   
 var this176166: AtomicInc;                                                                         
 var AtomicInc.n_nextValue176144: [AtomicInc]int;                                                   
 var moverPath175977: MoverPath;                                                                    
 var AtomicInc._lock176151: [AtomicInc]Tid;                                                         
 var AtomicInc.n175977: [AtomicInc]int;                                                             
 var tmp3176151: int;                                                                               
 var AtomicInc.n_nextValue176132: [AtomicInc]int;                                                   
 var mover176144: Mover;                                                                            
 var tid176144: Tid;                                                                                
 var x176129: int;                                                                                  
 var AtomicInc.n_nextThread176106: [AtomicInc]Tid;                                                  
 var tmp3: int;                                                                                     
 var AtomicInc.n176170: [AtomicInc]int;                                                             
 var this175977: AtomicInc;                                                                         
 var AtomicInc._lock175977: [AtomicInc]Tid;                                                         
 var mover176129: Mover;                                                                            
 var AtomicInc.n_nextValue176026: [AtomicInc]int;                                                   
 var tmp3176166: int;                                                                               
 var tmp2176099: bool;                                                                              
 var tid176166: Tid;                                                                                
 var $recorded.state176169_bottom: int;                                                             
 var tmp2176132: bool;                                                                              
 var x176026: int;                                                                                  
 var moverPath176132: MoverPath;                                                                    
 var $recorded.state176166: int;                                                                    
 var ctmp160796176132: bool;                                                                        
 var ctmp160796176151: bool;                                                                        
 var tmp2176166_post: bool;                                                                         
 var AtomicInc._lock176144: [AtomicInc]Tid;                                                         
 var tid176102: Tid;                                                                                
 var _R_t176021: Mover;                                                                             
 var AtomicInc._lock176021: [AtomicInc]Tid;                                                         
 var _currentValue176144: int;                                                                      
 var AtomicInc._lock175971: [AtomicInc]Tid;                                                         
 var tmpValue176106: int;                                                                           
 var $recorded.state176151: int;                                                                    
 var AtomicInc._lock176106: [AtomicInc]Tid;                                                         
 var $pc176026: Phase;                                                                              
 var path176129: int;                                                                               
 var _C_t175983: Tid;                                                                               
 var x176021: int;                                                                                  
 var tmp1176132: bool;                                                                              
 var _m176151: Mover;                                                                               
 var tid176132: Tid;                                                                                
 var _currentValue176129: int;                                                                      
 var tmp2176106: bool;                                                                              
 var tmp3176129: int;                                                                               
 var AtomicInc._lock176102: [AtomicInc]Tid;                                                         
 var $pc176106: Phase;                                                                              
 var $pc175977: Phase;                                                                              
 var tmp1176102: bool;                                                                              
 var this176129: AtomicInc;                                                                         
 var tmp1176099: bool;                                                                              
 var AtomicInc._lock176166_post: [AtomicInc]Tid;                                                    
 var AtomicInc.n_nextValue176151: [AtomicInc]int;                                                   
 var AtomicInc._lock176129: [AtomicInc]Tid;                                                         
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume AtomicInc._state176169 == AtomicInc._state && AtomicInc.n176169 == AtomicInc.n && AtomicInc._lock176169 == AtomicInc._lock && AtomicInc.n_nextThread176169 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176169 == AtomicInc.n_nextValue && this176169 == this && tid176169 == tid;
 assume $recorded.state176169 == 1;                                                                 
                                                                                                    
 // 11.9: while (true)   {                                                                          
                                                                                                    
 phase176169 := $pc;                                                                                
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (9.2): Bad tid
  invariant isShared(AtomicInc._state[this]);                                                              // (9.2): this is not global
                                                                                                    
  invariant StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
  invariant (forall _this : AtomicInc :: Invariant.Y_AtomicInc.n(tid : Tid, _this, AtomicInc.n[_this] ,AtomicInc._state176169,AtomicInc.n176169,AtomicInc._lock176169,AtomicInc.n_nextThread176169,AtomicInc.n_nextValue176169));       // (11.9): Loop does not preserve yields_as annotation for field n
  invariant phase176169 == $pc;                                                                            // (11.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (11.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 11.16: boolean tmp1;                                                                           
                                                                                                    
                                                                                                    
  // 11.16: tmp1 = true;                                                                            
                                                                                                    
  tmp1 := true;                                                                                     
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 11.9: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 12.13: int x;                                                                                  
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 12.13: Tid _C_t;                                                                               
                                                                                                    
                                                                                                    
  // 12.13: _C_t := this.n_nextThread  as B;                                                        
                                                                                                    
                                                                                                    
  moverPath175971 := ReadEval.AtomicInc.n_nextThread(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
  mover175971 := m#moverPath(moverPath175971);                                                      
  path175971 := p#moverPath(moverPath175971);                                                       
  assume AtomicInc._state175971 == AtomicInc._state && AtomicInc.n175971 == AtomicInc.n && AtomicInc._lock175971 == AtomicInc._lock && AtomicInc.n_nextThread175971 == AtomicInc.n_nextThread && AtomicInc.n_nextValue175971 == AtomicInc.n_nextValue && _C_t175971 == _C_t && x175971 == x && tmp1175971 == tmp1 && this175971 == this && tid175971 == tid && $pc175971 == $pc;
  assume $recorded.state175971 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicInc.null;                                                                   
  } else {                                                                                          
   assert this != AtomicInc.null;                                                                          // (12.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (12.13): Reduction failure
  _C_t := AtomicInc.n_nextThread[this];                                                             
                                                                                                    
  // 12.13: int _C_v;                                                                               
                                                                                                    
                                                                                                    
  // 12.13: _C_v := this.n_nextValue  as B;                                                         
                                                                                                    
                                                                                                    
  moverPath175977 := ReadEval.AtomicInc.n_nextValue(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
  mover175977 := m#moverPath(moverPath175977);                                                      
  path175977 := p#moverPath(moverPath175977);                                                       
  assume AtomicInc._state175977 == AtomicInc._state && AtomicInc.n175977 == AtomicInc.n && AtomicInc._lock175977 == AtomicInc._lock && AtomicInc.n_nextThread175977 == AtomicInc.n_nextThread && AtomicInc.n_nextValue175977 == AtomicInc.n_nextValue && _C_v175977 == _C_v && _C_t175977 == _C_t && x175977 == x && tmp1175977 == tmp1 && this175977 == this && tid175977 == tid && $pc175977 == $pc;
  assume $recorded.state175977 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicInc.null;                                                                   
  } else {                                                                                          
   assert this != AtomicInc.null;                                                                          // (12.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (12.13): Reduction failure
  _C_v := AtomicInc.n_nextValue[this];                                                              
                                                                                                    
  // 12.13: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
  // 12.13: _currentValue := this.n  as B;                                                          
                                                                                                    
                                                                                                    
  moverPath175983 := ReadEval.AtomicInc.n(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
  mover175983 := m#moverPath(moverPath175983);                                                      
  path175983 := p#moverPath(moverPath175983);                                                       
  assume AtomicInc._state175983 == AtomicInc._state && AtomicInc.n175983 == AtomicInc.n && AtomicInc._lock175983 == AtomicInc._lock && AtomicInc.n_nextThread175983 == AtomicInc.n_nextThread && AtomicInc.n_nextValue175983 == AtomicInc.n_nextValue && _currentValue175983 == _currentValue && _C_v175983 == _C_v && _C_t175983 == _C_t && x175983 == x && tmp1175983 == tmp1 && this175983 == this && tid175983 == tid && $pc175983 == $pc;
  assume $recorded.state175983 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != AtomicInc.null;                                                                   
  } else {                                                                                          
   assert this != AtomicInc.null;                                                                          // (12.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (12.13): Reduction failure
  _currentValue := AtomicInc.n[this];                                                               
                                                                                                    
  // 12.13: Mover _R_t;                                                                             
                                                                                                    
                                                                                                    
  // 12.13: _R_t = readPermission(this.n);                                                          
                                                                                                    
  _R_t := m#moverPath(ReadEval.AtomicInc.n(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue));
                                                                                                    
  // 12.13: boolean _casable;                                                                       
                                                                                                    
                                                                                                    
  // 12.13: _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                   
                                                                                                    
  _casable := ((((_R_t!=_E)&&true)&&(_C_t==tid))&&(_C_v==_currentValue));                           
  if (_casable) {                                                                                   
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 12.13: x := this.n  as R;                                                                     
                                                                                                    
                                                                                                    
   moverPath176021 := ReadEval.AtomicInc.n(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
   mover176021 := m#moverPath(moverPath176021);                                                     
   path176021 := p#moverPath(moverPath176021);                                                      
   assume AtomicInc._state176021 == AtomicInc._state && AtomicInc.n176021 == AtomicInc.n && AtomicInc._lock176021 == AtomicInc._lock && AtomicInc.n_nextThread176021 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176021 == AtomicInc.n_nextValue && _casable176021 == _casable && _R_t176021 == _R_t && _currentValue176021 == _currentValue && _C_v176021 == _C_v && _C_t176021 == _C_t && x176021 == x && tmp1176021 == tmp1 && this176021 == this && tid176021 == tid && $pc176021 == $pc;
   assume $recorded.state176021 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != AtomicInc.null;                                                                  
   } else {                                                                                         
    assert this != AtomicInc.null;                                                                         // (12.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _R);                                                                      
   assert $pc != PhaseError;                                                                               // (12.13): Reduction failure
   x := AtomicInc.n[this];                                                                          
  } else {                                                                                          
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 12.13: x := this.n;                                                                           
                                                                                                    
                                                                                                    
   moverPath176026 := ReadEval.AtomicInc.n(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
   mover176026 := m#moverPath(moverPath176026);                                                     
   path176026 := p#moverPath(moverPath176026);                                                      
   assume AtomicInc._state176026 == AtomicInc._state && AtomicInc.n176026 == AtomicInc.n && AtomicInc._lock176026 == AtomicInc._lock && AtomicInc.n_nextThread176026 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176026 == AtomicInc.n_nextValue && _casable176026 == _casable && _R_t176026 == _R_t && _currentValue176026 == _currentValue && _C_v176026 == _C_v && _C_t176026 == _C_t && x176026 == x && tmp1176026 == tmp1 && this176026 == this && tid176026 == tid && $pc176026 == $pc;
   assume $recorded.state176026 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != AtomicInc.null;                                                                  
   } else {                                                                                         
    assert this != AtomicInc.null;                                                                         // (12.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover176026);                                                             
   assert $pc != PhaseError;                                                                               // (12.13): Reduction failure
   x := AtomicInc.n[this];                                                                          
  }                                                                                                 
                                                                                                    
  // 13.13: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 13.13: int tmp3;                                                                               
                                                                                                    
                                                                                                    
  // 13.13: tmp3 = x + 1;                                                                           
                                                                                                    
  tmp3 := (x+1);                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 13.13: boolean ctmp160796;                                                                     
                                                                                                    
                                                                                                    
  // 13.13: ctmp160796 = *;                                                                         
                                                                                                    
  havoc ctmp160796;                                                                                 
  if (ctmp160796) {                                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 13.13: tmp2 = false;                                                                          
                                                                                                    
   tmp2 := false;                                                                                   
  } else {                                                                                          
                                                                                                    
   // 13.13: ctmp160796 = *;                                                                        
                                                                                                    
   havoc ctmp160796;                                                                                
   if (ctmp160796) {                                                                                
                                                                                                    
    // 13.13: Tid tmpTid;                                                                           
                                                                                                    
                                                                                                    
    // 13.13: int tmpValue;                                                                         
                                                                                                    
                                                                                                    
    // 13.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 13.13: _m = writePermission(this.n, tmp3);                                                   
                                                                                                    
    _m := m#moverPath(WriteEval.AtomicInc.n(tid: Tid,this: AtomicInc,tmp3: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue));
                                                                                                    
    // 13.13: assume this.n == x;                                                                   
                                                                                                    
    assume (AtomicInc.n[this]==x);                                                                  
                                                                                                    
    // 13.13: assume !goesWrong(_m);                                                                
                                                                                                    
    assume !(transition($pc, _m) == PhaseError);                                                    
                                                                                                    
    // 13.13: assume this.n_nextThread == tid;                                                      
                                                                                                    
    assume (AtomicInc.n_nextThread[this]==tid);                                                     
                                                                                                    
    // 13.13: assume this.n_nextValue == x;                                                         
                                                                                                    
    assume (AtomicInc.n_nextValue[this]==x);                                                        
                                                                                                    
                                                                                                    
    // 13.13: this.n_nextThread := tmpTid as B;                                                     
                                                                                                    
                                                                                                    
    moverPath176099 := WriteEval.AtomicInc.n_nextThread(tid: Tid,this: AtomicInc,tmpTid: Tid,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176099 := m#moverPath(moverPath176099);                                                    
    path176099 := p#moverPath(moverPath176099);                                                     
    assume AtomicInc._state176099 == AtomicInc._state && AtomicInc.n176099 == AtomicInc.n && AtomicInc._lock176099 == AtomicInc._lock && AtomicInc.n_nextThread176099 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176099 == AtomicInc.n_nextValue && _m176099 == _m && tmpValue176099 == tmpValue && tmpTid176099 == tmpTid && ctmp160796176099 == ctmp160796 && tmp3176099 == tmp3 && tmp2176099 == tmp2 && x176099 == x && tmp1176099 == tmp1 && this176099 == this && tid176099 == tid && $pc176099 == $pc;
    assume $recorded.state176099 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicInc.n_nextThread[this] := tmpTid;                                                         
                                                                                                    
                                                                                                    
    // 13.13: this.n_nextValue := tmpValue as B;                                                    
                                                                                                    
                                                                                                    
    moverPath176102 := WriteEval.AtomicInc.n_nextValue(tid: Tid,this: AtomicInc,tmpValue: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176102 := m#moverPath(moverPath176102);                                                    
    path176102 := p#moverPath(moverPath176102);                                                     
    assume AtomicInc._state176102 == AtomicInc._state && AtomicInc.n176102 == AtomicInc.n && AtomicInc._lock176102 == AtomicInc._lock && AtomicInc.n_nextThread176102 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176102 == AtomicInc.n_nextValue && _m176102 == _m && tmpValue176102 == tmpValue && tmpTid176102 == tmpTid && ctmp160796176102 == ctmp160796 && tmp3176102 == tmp3 && tmp2176102 == tmp2 && x176102 == x && tmp1176102 == tmp1 && this176102 == this && tid176102 == tid && $pc176102 == $pc;
    assume $recorded.state176102 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicInc.n_nextValue[this] := tmpValue;                                                        
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 13.13: this.n := tmp3;                                                                       
                                                                                                    
                                                                                                    
    moverPath176106 := WriteEval.AtomicInc.n(tid: Tid,this: AtomicInc,tmp3: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176106 := m#moverPath(moverPath176106);                                                    
    path176106 := p#moverPath(moverPath176106);                                                     
    assume AtomicInc._state176106 == AtomicInc._state && AtomicInc.n176106 == AtomicInc.n && AtomicInc._lock176106 == AtomicInc._lock && AtomicInc.n_nextThread176106 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176106 == AtomicInc.n_nextValue && _m176106 == _m && tmpValue176106 == tmpValue && tmpTid176106 == tmpTid && ctmp160796176106 == ctmp160796 && tmp3176106 == tmp3 && tmp2176106 == tmp2 && x176106 == x && tmp1176106 == tmp1 && this176106 == this && tid176106 == tid && $pc176106 == $pc;
    assume $recorded.state176106 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover176106);                                                            
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicInc.n[this] := tmp3;                                                                      
                                                                                                    
    // 13.13: tmp2 = true;                                                                          
                                                                                                    
    tmp2 := true;                                                                                   
   } else {                                                                                         
                                                                                                    
    // 13.13: assume this.n_nextThread == tid;                                                      
                                                                                                    
    assume (AtomicInc.n_nextThread[this]==tid);                                                     
                                                                                                    
    // 13.13: assume this.n_nextValue == x;                                                         
                                                                                                    
    assume (AtomicInc.n_nextValue[this]==x);                                                        
                                                                                                    
    // 13.13: int _currentValue;                                                                    
                                                                                                    
                                                                                                    
    // 13.13: _currentValue := this.n  as B;                                                        
                                                                                                    
                                                                                                    
    moverPath176129 := ReadEval.AtomicInc.n(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176129 := m#moverPath(moverPath176129);                                                    
    path176129 := p#moverPath(moverPath176129);                                                     
    assume AtomicInc._state176129 == AtomicInc._state && AtomicInc.n176129 == AtomicInc.n && AtomicInc._lock176129 == AtomicInc._lock && AtomicInc.n_nextThread176129 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176129 == AtomicInc.n_nextValue && _currentValue176129 == _currentValue && ctmp160796176129 == ctmp160796 && tmp3176129 == tmp3 && tmp2176129 == tmp2 && x176129 == x && tmp1176129 == tmp1 && this176129 == this && tid176129 == tid && $pc176129 == $pc;
    assume $recorded.state176129 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
                                                                                                    
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    _currentValue := AtomicInc.n[this];                                                             
                                                                                                    
                                                                                                    
    // 13.13: this.n := x as B;                                                                     
                                                                                                    
                                                                                                    
    moverPath176132 := WriteEval.AtomicInc.n(tid: Tid,this: AtomicInc,x: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176132 := m#moverPath(moverPath176132);                                                    
    path176132 := p#moverPath(moverPath176132);                                                     
    assume AtomicInc._state176132 == AtomicInc._state && AtomicInc.n176132 == AtomicInc.n && AtomicInc._lock176132 == AtomicInc._lock && AtomicInc.n_nextThread176132 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176132 == AtomicInc.n_nextValue && _currentValue176132 == _currentValue && ctmp160796176132 == ctmp160796 && tmp3176132 == tmp3 && tmp2176132 == tmp2 && x176132 == x && tmp1176132 == tmp1 && this176132 == this && tid176132 == tid && $pc176132 == $pc;
    assume $recorded.state176132 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicInc.n[this] := x;                                                                         
                                                                                                    
    // 13.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 13.13: _m = writePermission(this.n, tmp3);                                                   
                                                                                                    
    _m := m#moverPath(WriteEval.AtomicInc.n(tid: Tid,this: AtomicInc,tmp3: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue));
                                                                                                    
                                                                                                    
    // 13.13: this.n := _currentValue as B;                                                         
                                                                                                    
                                                                                                    
    moverPath176144 := WriteEval.AtomicInc.n(tid: Tid,this: AtomicInc,_currentValue: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176144 := m#moverPath(moverPath176144);                                                    
    path176144 := p#moverPath(moverPath176144);                                                     
    assume AtomicInc._state176144 == AtomicInc._state && AtomicInc.n176144 == AtomicInc.n && AtomicInc._lock176144 == AtomicInc._lock && AtomicInc.n_nextThread176144 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176144 == AtomicInc.n_nextValue && _m176144 == _m && _currentValue176144 == _currentValue && ctmp160796176144 == ctmp160796 && tmp3176144 == tmp3 && tmp2176144 == tmp2 && x176144 == x && tmp1176144 == tmp1 && this176144 == this && tid176144 == tid && $pc176144 == $pc;
    assume $recorded.state176144 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicInc.n[this] := _currentValue;                                                             
                                                                                                    
    // 13.13: assume goesWrong(_m);                                                                 
                                                                                                    
    assume transition($pc, _m) == PhaseError;                                                       
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 13.13: this.n := tmp3;                                                                       
                                                                                                    
                                                                                                    
    moverPath176151 := WriteEval.AtomicInc.n(tid: Tid,this: AtomicInc,tmp3: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
    mover176151 := m#moverPath(moverPath176151);                                                    
    path176151 := p#moverPath(moverPath176151);                                                     
    assume AtomicInc._state176151 == AtomicInc._state && AtomicInc.n176151 == AtomicInc.n && AtomicInc._lock176151 == AtomicInc._lock && AtomicInc.n_nextThread176151 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176151 == AtomicInc.n_nextValue && _m176151 == _m && _currentValue176151 == _currentValue && ctmp160796176151 == ctmp160796 && tmp3176151 == tmp3 && tmp2176151 == tmp2 && x176151 == x && tmp1176151 == tmp1 && this176151 == this && tid176151 == tid && $pc176151 == $pc;
    assume $recorded.state176151 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != AtomicInc.null;                                                                 
    } else {                                                                                        
     assert this != AtomicInc.null;                                                                        // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover176151);                                                            
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    AtomicInc.n[this] := tmp3;                                                                      
                                                                                                    
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
                                                                                                    
  assume AtomicInc._state176166 == AtomicInc._state && AtomicInc.n176166 == AtomicInc.n && AtomicInc._lock176166 == AtomicInc._lock && AtomicInc.n_nextThread176166 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176166 == AtomicInc.n_nextValue && tmp3176166 == tmp3 && tmp2176166 == tmp2 && x176166 == x && tmp1176166 == tmp1 && this176166 == this && tid176166 == tid;
  assume $recorded.state176166 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume AtomicInc._state176166_post == AtomicInc._state && AtomicInc.n176166_post == AtomicInc.n && AtomicInc._lock176166_post == AtomicInc._lock && AtomicInc.n_nextThread176166_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue176166_post == AtomicInc.n_nextValue && tmp3176166_post == tmp3 && tmp2176166_post == tmp2 && x176166_post == x && tmp1176166_post == tmp1 && this176166_post == this && tid176166_post == tid;
  assume $recorded.state176166_post == 1;                                                           
  assume AtomicInc._state176169_bottom == AtomicInc._state && AtomicInc.n176169_bottom == AtomicInc.n && AtomicInc._lock176169_bottom == AtomicInc._lock && AtomicInc.n_nextThread176169_bottom == AtomicInc.n_nextThread && AtomicInc.n_nextValue176169_bottom == AtomicInc.n_nextValue && this176169_bottom == this && tid176169_bottom == tid;
  assume $recorded.state176169_bottom == 1;                                                         
  assert phase176169 == $pc;                                                                               // (11.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 10.23: // return;                                                                               
                                                                                                    
 assume AtomicInc._state176170 == AtomicInc._state && AtomicInc.n176170 == AtomicInc.n && AtomicInc._lock176170 == AtomicInc._lock && AtomicInc.n_nextThread176170 == AtomicInc.n_nextThread && AtomicInc.n_nextValue176170 == AtomicInc.n_nextValue && this176170 == this && tid176170 == tid;
 assume $recorded.state176170 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(AtomicInc._state: [AtomicInc]State,AtomicInc.n: [AtomicInc]int,AtomicInc._lock: [AtomicInc]Tid,AtomicInc.n_nextThread: [AtomicInc]Tid,AtomicInc.n_nextValue: [AtomicInc]int) returns (bool) {
  true &&                                                                                           
  (forall _i: AtomicInc  :: _i == AtomicInc.null <==> isNull(AtomicInc._state[_i])) &&              
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, x: AtomicInc)    
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[x], u);                                                     
 modifies AtomicInc.n;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 AtomicInc.n[x] := v;                                                                               
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.AtomicInc.n(u: Tid,x: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): AtomicInc.n failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, x: AtomicInc)     
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[x], u);                                                     
 modifies AtomicInc.n;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 AtomicInc.n[x] := v;                                                                               
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.AtomicInc.n(u: Tid,x: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.2): AtomicInc.n failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, x: AtomicInc)     
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[x], u);                                                     
 modifies AtomicInc.n;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == AtomicInc.n[x];                                                                        
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 AtomicInc.n[x] := havocValue;                                                                      
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.AtomicInc.n(u: Tid,x: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): AtomicInc.n failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, x: AtomicInc)      
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[x], u);                                                     
 modifies AtomicInc.n;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == AtomicInc.n[x];                                                                        
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.AtomicInc.n(u: Tid,x: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.2): AtomicInc.n failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, x: AtomicInc)          
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[x], u);                                                     
 modifies AtomicInc.n;                                                                              
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.AtomicInc.n(t: Tid,x: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.AtomicInc.n(u: Tid,x: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): AtomicInc.n failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, x: AtomicInc)           
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[x], u);                                                     
 modifies AtomicInc.n;                                                                              
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == AtomicInc.n[x];                                                                        
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.AtomicInc.n(t: Tid,x: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 AtomicInc.n[x] := havocValue;                                                                      
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.AtomicInc.n(u: Tid,x: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): AtomicInc.n failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var y_pre: AtomicInc;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 AtomicInc.n[x] := v;                                                                               
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var y_pre: AtomicInc;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var x_mid: AtomicInc;                                                                              
 var t_mid: Tid;                                                                                    
 var y_mid: AtomicInc;                                                                              
 var AtomicInc.n_nextValue_mid: [AtomicInc]int;                                                     
 var AtomicInc.n_nextThread_mid: [AtomicInc]Tid;                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var AtomicInc._state_mid: [AtomicInc]State;                                                        
 var v_mid: int;                                                                                    
 var AtomicInc._lock_mid: [AtomicInc]Tid;                                                           
 var AtomicInc.n_mid: [AtomicInc]int;                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := AtomicInc.n[x];                                                                            
 AtomicInc.n[x] := v;                                                                               
                                                                                                    
 assume AtomicInc._state_mid == AtomicInc._state && AtomicInc.n_mid == AtomicInc.n && AtomicInc._lock_mid == AtomicInc._lock && AtomicInc.n_nextThread_mid == AtomicInc.n_nextThread && AtomicInc.n_nextValue_mid == AtomicInc.n_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 AtomicInc.n[x] := tmpV;                                                                            
 AtomicInc.n[y] := w;                                                                               
 _writeByTPost := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var y_pre: AtomicInc;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var x_mid: AtomicInc;                                                                              
 var t_mid: Tid;                                                                                    
 var y_mid: AtomicInc;                                                                              
 var AtomicInc.n_nextValue_mid: [AtomicInc]int;                                                     
 var AtomicInc.n_nextThread_mid: [AtomicInc]Tid;                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var AtomicInc._state_mid: [AtomicInc]State;                                                        
 var v_mid: int;                                                                                    
 var AtomicInc._lock_mid: [AtomicInc]Tid;                                                           
 var AtomicInc.n_mid: [AtomicInc]int;                                                               
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := AtomicInc.n[x];                                                                            
 AtomicInc.n[x] := v;                                                                               
 assume AtomicInc._state_mid == AtomicInc._state && AtomicInc.n_mid == AtomicInc.n && AtomicInc._lock_mid == AtomicInc._lock && AtomicInc.n_nextThread_mid == AtomicInc.n_nextThread && AtomicInc.n_nextValue_mid == AtomicInc.n_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 AtomicInc.n[x] := tmpV;                                                                            
 AtomicInc.n[y] := w;                                                                               
 _writeByTPost := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var y_pre: AtomicInc;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.AtomicInc.n(t: Tid,x: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 AtomicInc.n[y] := w;                                                                               
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.AtomicInc.n(t: Tid,x: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): AtomicInc.n is not Read-Write Stable with respect to AtomicInc.n (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): AtomicInc.n is not Read-Write Stable with respect to AtomicInc.n (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): AtomicInc.n is not Read-Write Stable with respect to AtomicInc.n (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v: int, w: int, w0: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var v_pre: int;                                                                                    
 var y_pre: AtomicInc;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.AtomicInc.n(u: Tid,y: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 AtomicInc.n[x] := v;                                                                               
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.AtomicInc.n(u: Tid,y: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): AtomicInc.n is not Write-Read Stable with respect to AtomicInc.n (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): AtomicInc.n is not Write-Read Stable with respect to AtomicInc.n (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.2): AtomicInc.n is not Write-Read Stable with respect to AtomicInc.n (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v: int, w1: int, w2: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var w2_pre: int;                                                                                   
 var v_pre: int;                                                                                    
 var y_pre: AtomicInc;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var $pc_pre: Phase;                                                                                
 var w1_pre: int;                                                                                   
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var x_mid: AtomicInc;                                                                              
 var t_mid: Tid;                                                                                    
 var y_mid: AtomicInc;                                                                              
 var AtomicInc.n_nextValue_mid: [AtomicInc]int;                                                     
 var AtomicInc.n_nextThread_mid: [AtomicInc]Tid;                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var AtomicInc._state_mid: [AtomicInc]State;                                                        
 var v_mid: int;                                                                                    
 var AtomicInc._lock_mid: [AtomicInc]Tid;                                                           
 var w2_mid: int;                                                                                   
 var AtomicInc.n_mid: [AtomicInc]int;                                                               
 var w1_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var w2_post: int;                                                                                  
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var w1_post: int;                                                                                  
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var v_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w1: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := AtomicInc.n[y];                                                                            
 AtomicInc.n[y] := w1;                                                                              
                                                                                                    
 assume AtomicInc._state_mid == AtomicInc._state && AtomicInc.n_mid == AtomicInc.n && AtomicInc._lock_mid == AtomicInc._lock && AtomicInc.n_nextThread_mid == AtomicInc.n_nextThread && AtomicInc.n_nextValue_mid == AtomicInc.n_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w2: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 AtomicInc.n[y] := tmpW;                                                                            
                                                                                                    
 AtomicInc.n[x] := v;                                                                               
 AtomicInc.n[y] := w1;                                                                              
                                                                                                    
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w2: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.AtomicInc.n.AtomicInc.n(t: Tid, u: Tid, v1: int, v2: int, w: int, x: AtomicInc, y: AtomicInc)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(AtomicInc._state[x], t);                                                     
 requires isAccessible(AtomicInc._state[y], u);                                                     
 modifies AtomicInc.n;                                                                              
 modifies AtomicInc.n;                                                                              
                                                                                                    
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
 var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                    
 var x_pre: AtomicInc;                                                                              
 var y_pre: AtomicInc;                                                                              
 var v1_pre: int;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var AtomicInc.n_pre: [AtomicInc]int;                                                               
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v2_pre: int;                                                                                   
 var AtomicInc._state_pre: [AtomicInc]State;                                                        
 var t_pre: Tid;                                                                                    
 var AtomicInc._lock_pre: [AtomicInc]Tid;                                                           
 var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                     
                                                                                                    
 var x_mid: AtomicInc;                                                                              
 var t_mid: Tid;                                                                                    
 var y_mid: AtomicInc;                                                                              
 var AtomicInc.n_nextValue_mid: [AtomicInc]int;                                                     
 var AtomicInc.n_nextThread_mid: [AtomicInc]Tid;                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v1_mid: int;                                                                                   
 var AtomicInc._state_mid: [AtomicInc]State;                                                        
 var AtomicInc._lock_mid: [AtomicInc]Tid;                                                           
 var AtomicInc.n_mid: [AtomicInc]int;                                                               
 var v2_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var AtomicInc._lock_post: [AtomicInc]Tid;                                                          
 var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                   
 var $recorded.state_post: int;                                                                     
 var AtomicInc._state_post: [AtomicInc]State;                                                       
 var v1_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var x_post: AtomicInc;                                                                             
 var $pc_post: Phase;                                                                               
 var AtomicInc.n_post: [AtomicInc]int;                                                              
 var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                    
 var w_post: int;                                                                                   
 var y_post: AtomicInc;                                                                             
 var v2_post: int;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.AtomicInc.n(u: Tid,y: AtomicInc,w: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := AtomicInc.n[x];                                                                            
 AtomicInc.n[x] := v1;                                                                              
 _writeByTAfterT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v2: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 AtomicInc.n[x] := tmpV;                                                                            
                                                                                                    
 AtomicInc.n[y] := w;                                                                               
 assume AtomicInc._state_mid == AtomicInc._state && AtomicInc.n_mid == AtomicInc.n && AtomicInc._lock_mid == AtomicInc._lock && AtomicInc.n_nextThread_mid == AtomicInc.n_nextThread && AtomicInc.n_nextValue_mid == AtomicInc.n_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v1: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 AtomicInc.n[x] := v1;                                                                              
 _writeByTAfterUAndT := WriteEval.AtomicInc.n(t: Tid,x: AtomicInc,v2: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
requires ValidTid(tid);                                                                             
modifies AtomicInc._state;                                                                          
modifies AtomicInc.n;                                                                               
modifies AtomicInc._lock;                                                                           
modifies AtomicInc.n_nextThread;                                                                    
modifies AtomicInc.n_nextValue;                                                                     
ensures StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
ensures Y(tid , old(AtomicInc._state), old(AtomicInc.n), old(AtomicInc._lock), old(AtomicInc.n_nextThread), old(AtomicInc.n_nextValue) , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
                                                                                                    
// AtomicInc.n:                                                                                     
                                                                                                    
function {:inline} Y_AtomicInc.n(tid : Tid, this: AtomicInc, newValue: int , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 ((isAccessible(AtomicInc._state[this], tid) && leq(m#moverPath(ReadEval.AtomicInc.n(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)), _R)) ==> (AtomicInc.n[this] == newValue))
 &&((newValue>=AtomicInc.n[this]))                                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicInc.n(tid : Tid, this: AtomicInc, newValue: int , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 true                                                                                               
 &&((newValue>=AtomicInc.n[this]))                                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_AtomicInc.n.Subsumes.W(tid : Tid, u : Tid, this: AtomicInc, newValue: int , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: AtomicInc;                                                                          
var AtomicInc._state_yield: [AtomicInc]State;                                                       
var tid_yield: Tid;                                                                                 
var AtomicInc.n_nextValue_yield: [AtomicInc]int;                                                    
var $pc_yield: Phase;                                                                               
var AtomicInc.n_nextThread_yield: [AtomicInc]Tid;                                                   
var newValue_yield: int;                                                                            
var AtomicInc.n_yield: [AtomicInc]int;                                                              
var u_yield: Tid;                                                                                   
var AtomicInc._lock_yield: [AtomicInc]Tid;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicInc._state[this], tid);                                                  
 assume isAccessible(AtomicInc._state[this], u);                                                    
 assume !isError(m#moverPath(WriteEval.AtomicInc.n(u: Tid,this: AtomicInc,newValue: int,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)));
                                                                                                    
assume AtomicInc._state_yield == AtomicInc._state && AtomicInc.n_yield == AtomicInc.n && AtomicInc._lock_yield == AtomicInc._lock && AtomicInc.n_nextThread_yield == AtomicInc.n_nextThread && AtomicInc.n_nextValue_yield == AtomicInc.n_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicInc.n(tid, this, newValue , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicInc.n.Reflexive(tid : Tid, this: AtomicInc , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: AtomicInc;                                                                          
var AtomicInc._state_yield: [AtomicInc]State;                                                       
var tid_yield: Tid;                                                                                 
var AtomicInc.n_nextValue_yield: [AtomicInc]int;                                                    
var $pc_yield: Phase;                                                                               
var AtomicInc.n_nextThread_yield: [AtomicInc]Tid;                                                   
var AtomicInc.n_yield: [AtomicInc]int;                                                              
var AtomicInc._lock_yield: [AtomicInc]Tid;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicInc._state[this], tid);                                                  
assume AtomicInc._state_yield == AtomicInc._state && AtomicInc.n_yield == AtomicInc.n && AtomicInc._lock_yield == AtomicInc._lock && AtomicInc.n_nextThread_yield == AtomicInc.n_nextThread && AtomicInc.n_nextValue_yield == AtomicInc.n_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicInc.n(tid, this, AtomicInc.n[this] , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicInc.n.Transitive(tid : Tid, this: AtomicInc, newValue : int , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int , AtomicInc._state_p: [AtomicInc]State, AtomicInc.n_p: [AtomicInc]int, AtomicInc._lock_p: [AtomicInc]Tid, AtomicInc.n_nextThread_p: [AtomicInc]Tid, AtomicInc.n_nextValue_p: [AtomicInc]int)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires StateInvariant(AtomicInc._state_p, AtomicInc.n_p, AtomicInc._lock_p, AtomicInc.n_nextThread_p, AtomicInc.n_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                     
var this_pre: AtomicInc;                                                                            
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var AtomicInc.n_pre: [AtomicInc]int;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var AtomicInc._state_pre: [AtomicInc]State;                                                         
var AtomicInc._lock_pre: [AtomicInc]Tid;                                                            
var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                      
                                                                                                    
var AtomicInc._lock_post: [AtomicInc]Tid;                                                           
var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                    
var $recorded.state_post: int;                                                                      
var AtomicInc._state_post: [AtomicInc]State;                                                        
var newValue_post: int;                                                                             
var this_post: AtomicInc;                                                                           
var $pc_post: Phase;                                                                                
var AtomicInc.n_post: [AtomicInc]int;                                                               
var tid_post: Tid;                                                                                  
var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                     
                                                                                                    
assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(AtomicInc._state[this], tid);                                                  
 assume Y(tid , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue , AtomicInc._state_p, AtomicInc.n_p, AtomicInc._lock_p, AtomicInc.n_nextThread_p, AtomicInc.n_nextValue_p);
 assume Y_AtomicInc.n(tid, this, newValue , AtomicInc._state_p, AtomicInc.n_p, AtomicInc._lock_p, AtomicInc.n_nextThread_p, AtomicInc.n_nextValue_p);
assume AtomicInc._state_post == AtomicInc._state_p && AtomicInc.n_post == AtomicInc.n_p && AtomicInc._lock_post == AtomicInc._lock_p && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread_p && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_AtomicInc.n(tid, this, newValue , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Check_AtomicInc.n.ABAFree(tid : Tid, this: AtomicInc, A : int, B : int)                   
 modifies AtomicInc.n;                                                                              
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires AtomicInc.n[this] == A;                                                                   
 requires isAccessible(AtomicInc._state[this], tid);                                                
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                     
var this_pre: AtomicInc;                                                                            
var A_pre: int;                                                                                     
var B_pre: int;                                                                                     
var $recorded.state_pre: int;                                                                       
var AtomicInc.n_pre: [AtomicInc]int;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var AtomicInc._state_pre: [AtomicInc]State;                                                         
var AtomicInc._lock_pre: [AtomicInc]Tid;                                                            
var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                      
                                                                                                    
var AtomicInc._lock_post: [AtomicInc]Tid;                                                           
var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                    
var $recorded.state_post: int;                                                                      
var AtomicInc._state_post: [AtomicInc]State;                                                        
var B_post: int;                                                                                    
var this_post: AtomicInc;                                                                           
var $pc_post: Phase;                                                                                
var AtomicInc.n_post: [AtomicInc]int;                                                               
var tid_post: Tid;                                                                                  
var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                     
var A_post: int;                                                                                    
                                                                                                    
assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_AtomicInc.n(tid, this, B , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 assume A != B;                                                                                     
AtomicInc.n[this] := B;                                                                             
assume AtomicInc._state_post == AtomicInc._state && AtomicInc.n_post == AtomicInc.n && AtomicInc._lock_post == AtomicInc._lock && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_AtomicInc.n(tid, this, A , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue));
}                                                                                                   
// AtomicInc._lock:                                                                                 
                                                                                                    
function {:inline} Y_AtomicInc._lock(tid : Tid, this: AtomicInc, newValue: Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 ((isAccessible(AtomicInc._state[this], tid) && leq(m#moverPath(ReadEval.AtomicInc._lock(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)), _R)) ==> (AtomicInc._lock[this] == newValue))
 &&(((AtomicInc._lock[this]==tid)==(newValue==tid)))                                                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicInc._lock(tid : Tid, this: AtomicInc, newValue: Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_AtomicInc._lock.Subsumes.W(tid : Tid, u : Tid, this: AtomicInc, newValue: Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var this_yield: AtomicInc;                                                                          
var newValue_yield: Tid;                                                                            
var AtomicInc._state_yield: [AtomicInc]State;                                                       
var tid_yield: Tid;                                                                                 
var AtomicInc.n_nextValue_yield: [AtomicInc]int;                                                    
var $pc_yield: Phase;                                                                               
var AtomicInc.n_nextThread_yield: [AtomicInc]Tid;                                                   
var AtomicInc.n_yield: [AtomicInc]int;                                                              
var u_yield: Tid;                                                                                   
var AtomicInc._lock_yield: [AtomicInc]Tid;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicInc._state[this], tid);                                                  
 assume isAccessible(AtomicInc._state[this], u);                                                    
 assume !isError(m#moverPath(WriteEval.AtomicInc._lock(u: Tid,this: AtomicInc,newValue: Tid,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)));
 assume leq(m#moverPath(ReadEval.AtomicInc._lock(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)), _N);
assume AtomicInc._state_yield == AtomicInc._state && AtomicInc.n_yield == AtomicInc.n && AtomicInc._lock_yield == AtomicInc._lock && AtomicInc.n_nextThread_yield == AtomicInc.n_nextThread && AtomicInc.n_nextValue_yield == AtomicInc.n_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicInc._lock(tid, this, newValue , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicInc._lock.Reflexive(tid : Tid, this: AtomicInc , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_yield: AtomicInc;                                                                          
var AtomicInc._state_yield: [AtomicInc]State;                                                       
var tid_yield: Tid;                                                                                 
var AtomicInc.n_nextValue_yield: [AtomicInc]int;                                                    
var $pc_yield: Phase;                                                                               
var AtomicInc.n_nextThread_yield: [AtomicInc]Tid;                                                   
var AtomicInc.n_yield: [AtomicInc]int;                                                              
var AtomicInc._lock_yield: [AtomicInc]Tid;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(AtomicInc._state[this], tid);                                                  
assume AtomicInc._state_yield == AtomicInc._state && AtomicInc.n_yield == AtomicInc.n && AtomicInc._lock_yield == AtomicInc._lock && AtomicInc.n_nextThread_yield == AtomicInc.n_nextThread && AtomicInc.n_nextValue_yield == AtomicInc.n_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_AtomicInc._lock(tid, this, AtomicInc._lock[this] , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_AtomicInc._lock.Transitive(tid : Tid, this: AtomicInc, newValue : Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int , AtomicInc._state_p: [AtomicInc]State, AtomicInc.n_p: [AtomicInc]int, AtomicInc._lock_p: [AtomicInc]Tid, AtomicInc.n_nextThread_p: [AtomicInc]Tid, AtomicInc.n_nextValue_p: [AtomicInc]int)
 requires StateInvariant(AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
 requires StateInvariant(AtomicInc._state_p, AtomicInc.n_p, AtomicInc._lock_p, AtomicInc.n_nextThread_p, AtomicInc.n_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var AtomicInc.n_nextThread_pre: [AtomicInc]Tid;                                                     
var this_pre: AtomicInc;                                                                            
var $recorded.state_pre: int;                                                                       
var AtomicInc.n_pre: [AtomicInc]int;                                                                
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var AtomicInc._state_pre: [AtomicInc]State;                                                         
var newValue_pre: Tid;                                                                              
var AtomicInc._lock_pre: [AtomicInc]Tid;                                                            
var AtomicInc.n_nextValue_pre: [AtomicInc]int;                                                      
                                                                                                    
var AtomicInc._lock_post: [AtomicInc]Tid;                                                           
var AtomicInc.n_nextThread_post: [AtomicInc]Tid;                                                    
var $recorded.state_post: int;                                                                      
var AtomicInc._state_post: [AtomicInc]State;                                                        
var this_post: AtomicInc;                                                                           
var $pc_post: Phase;                                                                                
var AtomicInc.n_post: [AtomicInc]int;                                                               
var tid_post: Tid;                                                                                  
var AtomicInc.n_nextValue_post: [AtomicInc]int;                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume AtomicInc._state_pre == AtomicInc._state && AtomicInc.n_pre == AtomicInc.n && AtomicInc._lock_pre == AtomicInc._lock && AtomicInc.n_nextThread_pre == AtomicInc.n_nextThread && AtomicInc.n_nextValue_pre == AtomicInc.n_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(AtomicInc._state[this], tid);                                                  
 assume Y(tid , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue , AtomicInc._state_p, AtomicInc.n_p, AtomicInc._lock_p, AtomicInc.n_nextThread_p, AtomicInc.n_nextValue_p);
 assume Y_AtomicInc._lock(tid, this, newValue , AtomicInc._state_p, AtomicInc.n_p, AtomicInc._lock_p, AtomicInc.n_nextThread_p, AtomicInc.n_nextValue_p);
assume AtomicInc._state_post == AtomicInc._state_p && AtomicInc.n_post == AtomicInc.n_p && AtomicInc._lock_post == AtomicInc._lock_p && AtomicInc.n_nextThread_post == AtomicInc.n_nextThread_p && AtomicInc.n_nextValue_post == AtomicInc.n_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_AtomicInc._lock(tid, this, newValue , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue);
}                                                                                                   
// AtomicInc.n_nextThread:                                                                          
                                                                                                    
function {:inline} Y_AtomicInc.n_nextThread(tid : Tid, this: AtomicInc, newValue: Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 ((isAccessible(AtomicInc._state[this], tid) && leq(m#moverPath(ReadEval.AtomicInc.n_nextThread(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)), _R)) ==> (AtomicInc.n_nextThread[this] == newValue))
 &&(((AtomicInc.n_nextThread[this]==tid)==>(newValue==tid)))                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicInc.n_nextThread(tid : Tid, this: AtomicInc, newValue: Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// AtomicInc.n_nextValue:                                                                           
                                                                                                    
function {:inline} Y_AtomicInc.n_nextValue(tid : Tid, this: AtomicInc, newValue: int , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 ((isAccessible(AtomicInc._state[this], tid) && leq(m#moverPath(ReadEval.AtomicInc.n_nextValue(tid: Tid,this: AtomicInc,AtomicInc._state,AtomicInc.n,AtomicInc._lock,AtomicInc.n_nextThread,AtomicInc.n_nextValue)), _R)) ==> (AtomicInc.n_nextValue[this] == newValue))
 &&(((AtomicInc.n_nextThread[this]==tid)==>(newValue==AtomicInc.n_nextValue[this])))                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_AtomicInc.n_nextValue(tid : Tid, this: AtomicInc, newValue: int , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , AtomicInc._state: [AtomicInc]State, AtomicInc.n: [AtomicInc]int, AtomicInc._lock: [AtomicInc]Tid, AtomicInc.n_nextThread: [AtomicInc]Tid, AtomicInc.n_nextValue: [AtomicInc]int , AtomicInc._state_p: [AtomicInc]State, AtomicInc.n_p: [AtomicInc]int, AtomicInc._lock_p: [AtomicInc]Tid, AtomicInc.n_nextThread_p: [AtomicInc]Tid, AtomicInc.n_nextValue_p: [AtomicInc]int): bool
{                                                                                                   
 (forall this: AtomicInc :: Y_AtomicInc.n(tid : Tid, this, AtomicInc.n_p[this] , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue))
 && (forall this: AtomicInc :: Y_AtomicInc._lock(tid : Tid, this, AtomicInc._lock_p[this] , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue))
 && (forall this: AtomicInc :: Y_AtomicInc.n_nextThread(tid : Tid, this, AtomicInc.n_nextThread_p[this] , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue))
 && (forall this: AtomicInc :: Y_AtomicInc.n_nextValue(tid : Tid, this, AtomicInc.n_nextValue_p[this] , AtomicInc._state, AtomicInc.n, AtomicInc._lock, AtomicInc.n_nextThread, AtomicInc.n_nextValue))
 && (forall _i : AtomicInc :: isShared(AtomicInc._state[_i]) ==> isShared(AtomicInc._state_p[_i]))  
 && (forall _i : AtomicInc :: isLocal(AtomicInc._state[_i], tid) <==> isLocal(AtomicInc._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 803.1-1509.2: (Method:9.2)
// 812.1-812.24: (9.2): Bad tid
// 813.1-813.43: (9.2): this is not global
// 1113.2-1117.14: (class anchor.sink.While:11.9)
// 1119.1-1119.27: (9.2): Bad tid
// 1120.1-1120.46: (9.2): this is not global
// 1123.1-1123.226: (11.9): Loop does not preserve yields_as annotation for field n
// 1124.1-1124.32: (11.9): Phase must be invariant at loop head
// 1125.1-1125.30: (11.9): Potentially infinite loop cannot be in post-commit phase.
// 1127.3-1129.3: (class anchor.sink.VarDeclStmt:11.16)
// 1130.3-1133.16: (class anchor.sink.Assign:11.16)
// 1135.4-1138.10: (class anchor.sink.Break:11.9)
// 1141.3-1143.3: (class anchor.sink.VarDeclStmt:12.13)
// 1145.3-1147.3: (class anchor.sink.VarDeclStmt:12.13)
// 1148.3-1165.40: (class anchor.sink.Read:12.13)
// 1160.1-1160.34: (12.13): Cannot have potential null deference in left-mover part.
// 1164.1-1164.28: (12.13): Reduction failure
// 1166.3-1168.3: (class anchor.sink.VarDeclStmt:12.13)
// 1169.3-1186.39: (class anchor.sink.Read:12.13)
// 1181.1-1181.34: (12.13): Cannot have potential null deference in left-mover part.
// 1185.1-1185.28: (12.13): Reduction failure
// 1187.3-1189.3: (class anchor.sink.VarDeclStmt:12.13)
// 1190.3-1207.38: (class anchor.sink.Read:12.13)
// 1202.1-1202.34: (12.13): Cannot have potential null deference in left-mover part.
// 1206.1-1206.28: (12.13): Reduction failure
// 1208.3-1210.3: (class anchor.sink.VarDeclStmt:12.13)
// 1211.3-1214.161: (class anchor.sink.Assign:12.13)
// 1215.3-1217.3: (class anchor.sink.VarDeclStmt:12.13)
// 1218.3-1221.74: (class anchor.sink.Assign:12.13)
// 1224.4-1241.27: (class anchor.sink.Read:12.13)
// 1236.1-1236.35: (12.13): Cannot have potential null deference in left-mover part.
// 1240.1-1240.29: (12.13): Reduction failure
// 1244.4-1261.27: (class anchor.sink.Read:12.13)
// 1256.1-1256.35: (12.13): Cannot have potential null deference in left-mover part.
// 1260.1-1260.29: (12.13): Reduction failure
// 1263.3-1265.3: (class anchor.sink.VarDeclStmt:13.13)
// 1266.3-1268.3: (class anchor.sink.VarDeclStmt:13.13)
// 1269.3-1272.17: (class anchor.sink.Assign:13.13)
// 1274.3-1276.3: (class anchor.sink.VarDeclStmt:13.13)
// 1277.3-1280.20: (class anchor.sink.Assign:13.13)
// 1283.4-1286.18: (class anchor.sink.Assign:13.13)
// 1288.4-1291.21: (class anchor.sink.Assign:13.13)
// 1293.5-1295.5: (class anchor.sink.VarDeclStmt:13.13)
// 1296.5-1298.5: (class anchor.sink.VarDeclStmt:13.13)
// 1299.5-1301.5: (class anchor.sink.VarDeclStmt:13.13)
// 1302.5-1305.172: (class anchor.sink.Assign:13.13)
// 1306.5-1309.35: (class anchor.sink.Assume:13.13)
// 1310.5-1313.49: (class anchor.sink.Assume:13.13)
// 1314.5-1317.48: (class anchor.sink.Assume:13.13)
// 1318.5-1321.45: (class anchor.sink.Assume:13.13)
// 1323.5-1339.44: (class anchor.sink.Write:13.13)
// 1335.1-1335.36: (13.13): Cannot have potential null deference in left-mover part.
// 1338.1-1338.30: (13.13): Reduction failure
// 1341.5-1357.45: (class anchor.sink.Write:13.13)
// 1353.1-1353.36: (13.13): Cannot have potential null deference in left-mover part.
// 1356.1-1356.30: (13.13): Reduction failure
// 1360.5-1376.31: (class anchor.sink.Write:13.13)
// 1372.1-1372.36: (13.13): Cannot have potential null deference in left-mover part.
// 1375.1-1375.30: (13.13): Reduction failure
// 1377.5-1380.18: (class anchor.sink.Assign:13.13)
// 1382.5-1385.48: (class anchor.sink.Assume:13.13)
// 1386.5-1389.45: (class anchor.sink.Assume:13.13)
// 1390.5-1392.5: (class anchor.sink.VarDeclStmt:13.13)
// 1393.5-1410.40: (class anchor.sink.Read:13.13)
// 1405.1-1405.36: (13.13): Cannot have potential null deference in left-mover part.
// 1409.1-1409.30: (13.13): Reduction failure
// 1412.5-1428.28: (class anchor.sink.Write:13.13)
// 1424.1-1424.36: (13.13): Cannot have potential null deference in left-mover part.
// 1427.1-1427.30: (13.13): Reduction failure
// 1429.5-1431.5: (class anchor.sink.VarDeclStmt:13.13)
// 1432.5-1435.172: (class anchor.sink.Assign:13.13)
// 1437.5-1453.40: (class anchor.sink.Write:13.13)
// 1449.1-1449.36: (13.13): Cannot have potential null deference in left-mover part.
// 1452.1-1452.30: (13.13): Reduction failure
// 1454.5-1457.46: (class anchor.sink.Assume:13.13)
// 1460.5-1476.31: (class anchor.sink.Write:13.13)
// 1472.1-1472.36: (13.13): Cannot have potential null deference in left-mover part.
// 1475.1-1475.30: (13.13): Reduction failure
// 1477.5-1480.19: (class anchor.sink.Assign:13.13)
// 1484.4-1487.10: (class anchor.sink.Break:14.17)
// 1490.3-1498.42: (class anchor.sink.Yield:16.13)
// 1501.1-1501.29: (11.9): Phase must be invariant at loop head
// 1503.2-1508.9: (class anchor.sink.Return:10.23)
// 1587.1-1587.34: (5.2): AtomicInc.n failed Write-Write Right-Mover Check
// 1648.1-1648.30: (5.2): AtomicInc.n failed Write-Read Right-Mover Check
// 1713.1-1713.34: (5.2): AtomicInc.n failed Write-Write Left-Mover Check
// 1775.1-1775.30: (5.2): AtomicInc.n failed Write-Read Left-Mover Check
// 1834.1-1834.34: (5.2): AtomicInc.n failed Read-Write Right-Mover Check
// 1896.1-1896.34: (5.2): AtomicInc.n failed Read-Write Left-Mover Check
// 1969.1-1969.140: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case A.1)
// 1970.1-1970.101: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case A.2)
// 1971.1-1971.158: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case A.3)
// 2070.1-2070.140: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case C)
// 2174.1-2174.144: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case D)
// 2175.1-2175.144: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case R)
// 2248.1-2248.136: (5.2): AtomicInc.n is not Read-Write Stable with respect to AtomicInc.n (case F)
// 2249.1-2249.136: (5.2): AtomicInc.n is not Read-Write Stable with respect to AtomicInc.n (case H)
// 2250.1-2250.146: (5.2): AtomicInc.n is not Read-Write Stable with respect to AtomicInc.n (case I)
// 2322.1-2322.136: (5.2): AtomicInc.n is not Write-Read Stable with respect to AtomicInc.n (case J)
// 2323.1-2323.136: (5.2): AtomicInc.n is not Write-Read Stable with respect to AtomicInc.n (case K)
// 2324.1-2324.99: (5.2): AtomicInc.n is not Write-Read Stable with respect to AtomicInc.n (case L)
// 2433.1-2433.142: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case M)
// 2540.1-2540.130: (5.2): AtomicInc.n is not Write-Write Stable with respect to AtomicInc.n (case N)
// 2576.1-2597.2: (7.23): yields_as clause for AtomicInc.n is not valid
// 2602.1-2618.2: (7.23): yields_as clause for AtomicInc.n is not reflexive
// 2624.1-2656.2: (7.23): yields_as clause for AtomicInc.n is not transitive
// 2664.1-2698.2: (7.23): AtomicInc.n is not ABA-free
// 2718.1-2739.2: (7.32): yields_as clause for AtomicInc._lock is not valid
// 2744.1-2760.2: (7.32): yields_as clause for AtomicInc._lock is not reflexive
// 2766.1-2798.2: (7.32): yields_as clause for AtomicInc._lock is not transitive
