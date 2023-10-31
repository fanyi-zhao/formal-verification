                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-inc-paper.anchor:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      noABA volatile int counter isRead                                                             
       ? N                                                                                          
       : newValue == this.counter + 1 ? N : E                                                       
        yields_as newValue >= this.counter;                                                         
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.counter == 0;                                                                   
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void inc() {                                                                           
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int n;                                                                                  
            n := this.counter;                                                                      
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = n + 1;                                                                           
            tmp2 = this.counter@n :~ tmp3;                                                          
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      hasCASOperation noABA volatile int counter isRead                                             
       ? N                                                                                          
       : newValue == this.counter + 1 ? N : E                                                       
        yields_as newValue >= this.counter;                                                         
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid counter_nextThread isLocal(this, tid)                                       
       ? B                                                                                          
       : this.counter_nextThread == tid ? N : E                                                     
        yields_as this.counter_nextThread == tid ==> newValue == tid;                               
                                                                                                    
                                                                                                    
      updatesViaCAS int counter_nextValue isLocal(this, tid)                                        
       ? B                                                                                          
       : this.counter_nextThread == tid ? N : E                                                     
        yields_as this.counter_nextThread == tid ==> newValue == this.counter_nextValue;            
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.counter == 0;                                                                   
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
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
            int n;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.counter_nextThread  as B;                                                
              int _C_v;                                                                             
              _C_v := this.counter_nextValue  as B;                                                 
              int _currentValue;                                                                    
              _currentValue := this.counter  as B;                                                  
              Mover _R_t;                                                                           
              _R_t = readPermission(this.counter);                                                  
              boolean _casable;                                                                     
              _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                 
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                n := this.counter  as R;                                                            
              } else {                                                                              
                noop(TraceOn);                                                                      
                n := this.counter;                                                                  
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = n + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp571771;                                                                   
              ctmp571771 = *;                                                                       
              if (ctmp571771) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp571771 = *;                                                                     
                if (ctmp571771) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.counter, tmp3);                                         
                  assume this.counter == n;                                                         
                  assume !goesWrong(_m);                                                            
                  assume this.counter_nextThread == tid;                                            
                  assume this.counter_nextValue == n;                                               
                  this.counter_nextThread := tmpTid as B;                                           
                  this.counter_nextValue := tmpValue as B;                                          
                  noop(TraceOn);                                                                    
                  this.counter := tmp3;                                                             
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.counter_nextThread == tid;                                            
                  assume this.counter_nextValue == n;                                               
                  int _currentValue;                                                                
                  _currentValue := this.counter  as B;                                              
                  this.counter := n as B;                                                           
                  Mover _m;                                                                         
                  _m = writePermission(this.counter, tmp3);                                         
                  this.counter := _currentValue as B;                                               
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.counter := tmp3;                                                             
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      hasCASOperation noABA volatile int counter isRead                                             
       ? N                                                                                          
       : newValue == this.counter + 1 ? N : E                                                       
        yields_as newValue >= this.counter;                                                         
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid counter_nextThread isLocal(this, tid)                                       
       ? B                                                                                          
       : this.counter_nextThread == tid ? N : E                                                     
        yields_as this.counter_nextThread == tid ==> newValue == tid;                               
                                                                                                    
                                                                                                    
      updatesViaCAS int counter_nextValue isLocal(this, tid)                                        
       ? B                                                                                          
       : this.counter_nextThread == tid ? N : E                                                     
        yields_as this.counter_nextThread == tid ==> newValue == this.counter_nextValue;            
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.counter == 0;                                                                   
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
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
            int n;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.counter_nextThread  as B;                                                
              int _C_v;                                                                             
              _C_v := this.counter_nextValue  as B;                                                 
              int _currentValue;                                                                    
              _currentValue := this.counter  as B;                                                  
              Mover _R_t;                                                                           
              _R_t = readPermission(this.counter);                                                  
              boolean _casable;                                                                     
              _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                 
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                n := this.counter  as R;                                                            
              } else {                                                                              
                noop(TraceOn);                                                                      
                n := this.counter;                                                                  
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = n + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp571771;                                                                   
              ctmp571771 = *;                                                                       
              if (ctmp571771) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp571771 = *;                                                                     
                if (ctmp571771) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.counter, tmp3);                                         
                  assume this.counter == n;                                                         
                  assume !goesWrong(_m);                                                            
                  assume this.counter_nextThread == tid;                                            
                  assume this.counter_nextValue == n;                                               
                  this.counter_nextThread := tmpTid as B;                                           
                  this.counter_nextValue := tmpValue as B;                                          
                  noop(TraceOn);                                                                    
                  this.counter := tmp3;                                                             
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.counter_nextThread == tid;                                            
                  assume this.counter_nextValue == n;                                               
                  int _currentValue;                                                                
                  _currentValue := this.counter  as B;                                              
                  this.counter := n as B;                                                           
                  Mover _m;                                                                         
                  _m = writePermission(this.counter, tmp3);                                         
                  this.counter := _currentValue as B;                                               
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.counter := tmp3;                                                             
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      hasCASOperation noABA volatile int counter isRead                                             
       ? N                                                                                          
       : newValue == this.counter + 1 ? N : E                                                       
        yields_as newValue >= this.counter;                                                         
                                                                                                    
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid counter_nextThread isLocal(this, tid)                                       
       ? B                                                                                          
       : this.counter_nextThread == tid ? N : E                                                     
        yields_as this.counter_nextThread == tid ==> newValue == tid;                               
                                                                                                    
                                                                                                    
      updatesViaCAS int counter_nextValue isLocal(this, tid)                                        
       ? B                                                                                          
       : this.counter_nextThread == tid ? N : E                                                     
        yields_as this.counter_nextThread == tid ==> newValue == this.counter_nextValue;            
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.counter == 0;                                                                   
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
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
            int n;                                                                                  
            {                                                                                       
              noop(TraceOff);                                                                       
              Tid _C_t;                                                                             
              _C_t := this.counter_nextThread  as B;                                                
              int _C_v;                                                                             
              _C_v := this.counter_nextValue  as B;                                                 
              int _currentValue;                                                                    
              _currentValue := this.counter  as B;                                                  
              Mover _R_t;                                                                           
              _R_t = readPermission(this.counter);                                                  
              boolean _casable;                                                                     
              _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                 
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                n := this.counter  as R;                                                            
              } else {                                                                              
                noop(TraceOn);                                                                      
                n := this.counter;                                                                  
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = n + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp571771;                                                                   
              ctmp571771 = *;                                                                       
              if (ctmp571771) {                                                                     
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp571771 = *;                                                                     
                if (ctmp571771) {                                                                   
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.counter, tmp3);                                         
                  assume this.counter == n;                                                         
                  assume !goesWrong(_m);                                                            
                  assume this.counter_nextThread == tid;                                            
                  assume this.counter_nextValue == n;                                               
                  this.counter_nextThread := tmpTid as B;                                           
                  this.counter_nextValue := tmpValue as B;                                          
                  noop(TraceOn);                                                                    
                  this.counter := tmp3;                                                             
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.counter_nextThread == tid;                                            
                  assume this.counter_nextValue == n;                                               
                  int _currentValue;                                                                
                  _currentValue := this.counter  as B;                                              
                  this.counter := n as B;                                                           
                  Mover _m;                                                                         
                  _m = writePermission(this.counter, tmp3);                                         
                  this.counter := _currentValue as B;                                               
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.counter := tmp3;                                                             
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
                                                                                                    
                                                                                                    
/*** Class Decl Inc ***/                                                                            
                                                                                                    
type Inc;                                                                                           
const unique Inc.null: Inc;                                                                         
var Inc._state: [Inc]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.counter: [Inc]int;                                                                          
                                                                                                    
function {:inline} ReadEval.Inc.counter(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if ((newValue==(Inc.counter[this]+1))) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.counter(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if ((newValue==(Inc.counter[this]+1))) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc._lock: [Inc]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Inc._lock(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc._lock(tid: Tid,this : Inc,newValue: Tid,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.counter_nextThread: [Inc]Tid;                                                               
                                                                                                    
function {:inline} ReadEval.Inc.counter_nextThread(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc.counter_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.counter_nextThread(tid: Tid,this : Inc,newValue: Tid,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc.counter_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc.counter_nextValue: [Inc]int;                                                                
                                                                                                    
function {:inline} ReadEval.Inc.counter_nextValue(tid: Tid,this : Inc,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc.counter_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.counter_nextValue(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc._state[this], tid)) then                                                           
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc.counter_nextThread[this]==tid)) then                                                     
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Inc.inc(tid:Tid, this : Inc)                                                             
modifies Inc._state;                                                                                
modifies Inc.counter;                                                                               
modifies Inc._lock;                                                                                 
modifies Inc.counter_nextThread;                                                                    
modifies Inc.counter_nextValue;                                                                     
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.5): Bad tid
requires isShared(Inc._state[this]);                                                                       // (8.5): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
                                                                                                    
ensures StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
{                                                                                                   
 var mover587069: Mover;                                                                            
 var Inc._lock587088: [Inc]Tid;                                                                     
 var ctmp571771587047: bool;                                                                        
 var this587050: Inc;                                                                               
 var n587047: int;                                                                                  
 var phase587087: Phase;                                                                            
 var tmp3587047: int;                                                                               
 var tmp2587050: bool;                                                                              
 var Inc.counter_nextThread587017: [Inc]Tid;                                                        
 var moverPath586901: MoverPath;                                                                    
 var _currentValue: int;                                                                            
 var Inc.counter_nextThread587050: [Inc]Tid;                                                        
 var Inc.counter_nextThread587087_bottom: [Inc]Tid;                                                 
 var $pc586944: Phase;                                                                              
 var Inc._lock587084: [Inc]Tid;                                                                     
 var this586944: Inc;                                                                               
 var _C_t586895: Tid;                                                                               
 var _m587062: Mover;                                                                               
 var ctmp571771587062: bool;                                                                        
 var this587024: Inc;                                                                               
 var Inc.counter587087: [Inc]int;                                                                   
 var Inc.counter_nextValue587087: [Inc]int;                                                         
 var Inc.counter587047: [Inc]int;                                                                   
 var tmp1586895: bool;                                                                              
 var Inc.counter_nextValue587024: [Inc]int;                                                         
 var _C_t: Tid;                                                                                     
 var tmp1587050: bool;                                                                              
 var Inc._state587062: [Inc]State;                                                                  
 var Inc.counter_nextValue587087_bottom: [Inc]int;                                                  
 var mover587024: Mover;                                                                            
 var tmp2587084_post: bool;                                                                         
 var Inc.counter_nextThread586939: [Inc]Tid;                                                        
 var n586944: int;                                                                                  
 var path586889: int;                                                                               
 var moverPath587017: MoverPath;                                                                    
 var Inc._lock587062: [Inc]Tid;                                                                     
 var Inc.counter_nextValue586939: [Inc]int;                                                         
 var Inc.counter_nextThread587020: [Inc]Tid;                                                        
 var tid587087_bottom: Tid;                                                                         
 var $recorded.state587088: int;                                                                    
 var mover586944: Mover;                                                                            
 var ctmp571771: bool;                                                                              
 var Inc.counter587069: [Inc]int;                                                                   
 var Inc._lock587087_bottom: [Inc]Tid;                                                              
 var _currentValue587050: int;                                                                      
 var tid586944: Tid;                                                                                
 var Inc._state587047: [Inc]State;                                                                  
 var _currentValue587047: int;                                                                      
 var _casable: bool;                                                                                
 var Inc.counter_nextValue586901: [Inc]int;                                                         
 var n587062: int;                                                                                  
 var Inc._lock587084_post: [Inc]Tid;                                                                
 var tmp3587062: int;                                                                               
 var moverPath586944: MoverPath;                                                                    
 var this586889: Inc;                                                                               
 var Inc._lock586944: [Inc]Tid;                                                                     
 var tmp1587084_post: bool;                                                                         
 var Inc._state587087: [Inc]State;                                                                  
 var tmp2587069: bool;                                                                              
 var _m587069: Mover;                                                                               
 var tmp1587069: bool;                                                                              
 var _C_t586939: Tid;                                                                               
 var this587087: Inc;                                                                               
 var Inc.counter586889: [Inc]int;                                                                   
 var _C_t586944: Tid;                                                                               
 var $recorded.state587062: int;                                                                    
 var this587062: Inc;                                                                               
 var Inc.counter_nextValue586944: [Inc]int;                                                         
 var ctmp571771587024: bool;                                                                        
 var $recorded.state587084_post: int;                                                               
 var Inc.counter587087_bottom: [Inc]int;                                                            
 var tid586895: Tid;                                                                                
 var mover587017: Mover;                                                                            
 var tmp1: bool;                                                                                    
 var tmpValue: int;                                                                                 
 var tmp2587020: bool;                                                                              
 var _C_v586944: int;                                                                               
 var this587069: Inc;                                                                               
 var mover586889: Mover;                                                                            
 var _m587020: Mover;                                                                               
 var $pc586901: Phase;                                                                              
 var tid587084_post: Tid;                                                                           
 var $recorded.state587087_bottom: int;                                                             
 var tmp3587050: int;                                                                               
 var tmpValue587017: int;                                                                           
 var tmp2: bool;                                                                                    
 var _currentValue586944: int;                                                                      
 var this587084_post: Inc;                                                                          
 var Inc.counter_nextValue587017: [Inc]int;                                                         
 var Inc.counter587088: [Inc]int;                                                                   
 var n586939: int;                                                                                  
 var moverPath587062: MoverPath;                                                                    
 var Inc.counter587017: [Inc]int;                                                                   
 var $recorded.state586901: int;                                                                    
 var $recorded.state586889: int;                                                                    
 var $pc587084: Phase;                                                                              
 var $pc587069: Phase;                                                                              
 var tmp1586889: bool;                                                                              
 var _currentValue587069: int;                                                                      
 var Inc.counter_nextValue587084_post: [Inc]int;                                                    
 var moverPath586889: MoverPath;                                                                    
 var Inc.counter_nextThread587069: [Inc]Tid;                                                        
 var _m587024: Mover;                                                                               
 var $pc587088: Phase;                                                                              
 var Inc.counter587084: [Inc]int;                                                                   
 var path587062: int;                                                                               
 var n586895: int;                                                                                  
 var _C_v: int;                                                                                     
 var $pc587050: Phase;                                                                              
 var path587020: int;                                                                               
 var tmpTid587020: Tid;                                                                             
 var Inc._state586889: [Inc]State;                                                                  
 var this586901: Inc;                                                                               
 var n587050: int;                                                                                  
 var mover586895: Mover;                                                                            
 var path587069: int;                                                                               
 var tid587047: Tid;                                                                                
 var Inc._state587088: [Inc]State;                                                                  
 var Inc.counter_nextValue587062: [Inc]int;                                                         
 var Inc._lock586901: [Inc]Tid;                                                                     
 var Inc.counter_nextThread586895: [Inc]Tid;                                                        
 var $recorded.state587069: int;                                                                    
 var _R_t586939: Mover;                                                                             
 var $pc586939: Phase;                                                                              
 var path586901: int;                                                                               
 var $pc587020: Phase;                                                                              
 var moverPath586895: MoverPath;                                                                    
 var path587017: int;                                                                               
 var Inc.counter586901: [Inc]int;                                                                   
 var this587088: Inc;                                                                               
 var $recorded.state587047: int;                                                                    
 var $pc587017: Phase;                                                                              
 var Inc.counter_nextValue587084: [Inc]int;                                                         
 var $pc587087_bottom: Phase;                                                                       
 var Inc.counter586895: [Inc]int;                                                                   
 var Inc.counter_nextThread586901: [Inc]Tid;                                                        
 var Inc.counter587024: [Inc]int;                                                                   
 var Inc.counter_nextValue586895: [Inc]int;                                                         
 var Inc._state587017: [Inc]State;                                                                  
 var this587084: Inc;                                                                               
 var Inc._lock587087: [Inc]Tid;                                                                     
 var moverPath586939: MoverPath;                                                                    
 var tmp1587017: bool;                                                                              
 var tmp2587024: bool;                                                                              
 var Inc.counter_nextThread587084: [Inc]Tid;                                                        
 var tmp2587084: bool;                                                                              
 var Inc.counter_nextValue586889: [Inc]int;                                                         
 var Inc._state586939: [Inc]State;                                                                  
 var tmp1587062: bool;                                                                              
 var tid587024: Tid;                                                                                
 var _currentValue586939: int;                                                                      
 var path587047: int;                                                                               
 var _m587017: Mover;                                                                               
 var Inc._lock587020: [Inc]Tid;                                                                     
 var Inc._state587084_post: [Inc]State;                                                             
 var tmpTid587024: Tid;                                                                             
 var tmp3587024: int;                                                                               
 var $recorded.state587020: int;                                                                    
 var _C_t586901: Tid;                                                                               
 var n586889: int;                                                                                  
 var Inc._state586944: [Inc]State;                                                                  
 var Inc._lock587024: [Inc]Tid;                                                                     
 var Inc._state587024: [Inc]State;                                                                  
 var ctmp571771587069: bool;                                                                        
 var tmp1586944: bool;                                                                              
 var $recorded.state587084: int;                                                                    
 var mover587062: Mover;                                                                            
 var Inc._lock587047: [Inc]Tid;                                                                     
 var _casable586939: bool;                                                                          
 var mover587047: Mover;                                                                            
 var _C_v586939: int;                                                                               
 var Inc.counter_nextValue587050: [Inc]int;                                                         
 var tid587084: Tid;                                                                                
 var path587024: int;                                                                               
 var ctmp571771587020: bool;                                                                        
 var n: int;                                                                                        
 var $recorded.state587017: int;                                                                    
 var Inc.counter_nextThread587088: [Inc]Tid;                                                        
 var _currentValue587062: int;                                                                      
 var moverPath587050: MoverPath;                                                                    
 var _R_t: Mover;                                                                                   
 var Inc._state587084: [Inc]State;                                                                  
 var tid587069: Tid;                                                                                
 var $recorded.state586895: int;                                                                    
 var tmpValue587024: int;                                                                           
 var tid587017: Tid;                                                                                
 var $pc586889: Phase;                                                                              
 var Inc._lock587050: [Inc]Tid;                                                                     
 var _m: Mover;                                                                                     
 var this587017: Inc;                                                                               
 var $recorded.state587087: int;                                                                    
 var Inc.counter_nextThread587087: [Inc]Tid;                                                        
 var _C_t586889: Tid;                                                                               
 var $pc587062: Phase;                                                                              
 var tmp3587084_post: int;                                                                          
 var tmp1587047: bool;                                                                              
 var Inc.counter_nextThread587062: [Inc]Tid;                                                        
 var Inc.counter587084_post: [Inc]int;                                                              
 var Inc._lock586895: [Inc]Tid;                                                                     
 var $pc587047: Phase;                                                                              
 var moverPath587069: MoverPath;                                                                    
 var $recorded.state586939: int;                                                                    
 var n586901: int;                                                                                  
 var n587020: int;                                                                                  
 var _currentValue586901: int;                                                                      
 var path586939: int;                                                                               
 var tid587050: Tid;                                                                                
 var tid587088: Tid;                                                                                
 var tid586901: Tid;                                                                                
 var $pc587024: Phase;                                                                              
 var $recorded.state586944: int;                                                                    
 var mover586901: Mover;                                                                            
 var path587050: int;                                                                               
 var tmp1587020: bool;                                                                              
 var moverPath587020: MoverPath;                                                                    
 var _C_v586901: int;                                                                               
 var Inc._state587020: [Inc]State;                                                                  
 var tid586939: Tid;                                                                                
 var Inc.counter587020: [Inc]int;                                                                   
 var n587084: int;                                                                                  
 var tmp3587069: int;                                                                               
 var Inc._lock586889: [Inc]Tid;                                                                     
 var tmp2587017: bool;                                                                              
 var tid587087: Tid;                                                                                
 var Inc._state587069: [Inc]State;                                                                  
 var tmp2587062: bool;                                                                              
 var _C_v586895: int;                                                                               
 var Inc._state586895: [Inc]State;                                                                  
 var tmpTid587017: Tid;                                                                             
 var tmp3587084: int;                                                                               
 var $pc586895: Phase;                                                                              
 var tmpTid: Tid;                                                                                   
 var tmpValue587020: int;                                                                           
 var path586944: int;                                                                               
 var Inc.counter_nextThread587084_post: [Inc]Tid;                                                   
 var Inc._lock586939: [Inc]Tid;                                                                     
 var n587024: int;                                                                                  
 var ctmp571771587050: bool;                                                                        
 var _R_t586944: Mover;                                                                             
 var Inc.counter_nextThread586944: [Inc]Tid;                                                        
 var Inc._lock587017: [Inc]Tid;                                                                     
 var this586895: Inc;                                                                               
 var tmp3: int;                                                                                     
 var Inc.counter_nextThread587047: [Inc]Tid;                                                        
 var moverPath587024: MoverPath;                                                                    
 var n587017: int;                                                                                  
 var Inc.counter_nextValue587047: [Inc]int;                                                         
 var Inc._lock587069: [Inc]Tid;                                                                     
 var mover587020: Mover;                                                                            
 var n587084_post: int;                                                                             
 var this587020: Inc;                                                                               
 var n587069: int;                                                                                  
 var this586939: Inc;                                                                               
 var tid587020: Tid;                                                                                
 var Inc._state586901: [Inc]State;                                                                  
 var moverPath587047: MoverPath;                                                                    
 var Inc.counter587050: [Inc]int;                                                                   
 var Inc.counter_nextThread587024: [Inc]Tid;                                                        
 var tmp3587020: int;                                                                               
 var tmp2587047: bool;                                                                              
 var path586895: int;                                                                               
 var tmp1587024: bool;                                                                              
 var Inc._state587087_bottom: [Inc]State;                                                           
 var Inc.counter_nextThread586889: [Inc]Tid;                                                        
 var ctmp571771587017: bool;                                                                        
 var Inc.counter586944: [Inc]int;                                                                   
 var mover587050: Mover;                                                                            
 var Inc.counter_nextValue587088: [Inc]int;                                                         
 var mover586939: Mover;                                                                            
 var Inc._state587050: [Inc]State;                                                                  
 var tmp1587084: bool;                                                                              
 var Inc.counter586939: [Inc]int;                                                                   
 var Inc.counter_nextValue587020: [Inc]int;                                                         
 var $pc587084_post: Phase;                                                                         
 var tmp1586939: bool;                                                                              
 var $recorded.state587050: int;                                                                    
 var Inc.counter587062: [Inc]int;                                                                   
 var $pc587087: Phase;                                                                              
 var this587047: Inc;                                                                               
 var tmp1586901: bool;                                                                              
 var Inc.counter_nextValue587069: [Inc]int;                                                         
 var tid587062: Tid;                                                                                
 var _casable586944: bool;                                                                          
 var this587087_bottom: Inc;                                                                        
 var tid586889: Tid;                                                                                
 var $recorded.state587024: int;                                                                    
 var tmp3587017: int;                                                                               
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Inc._state587087 == Inc._state && Inc.counter587087 == Inc.counter && Inc._lock587087 == Inc._lock && Inc.counter_nextThread587087 == Inc.counter_nextThread && Inc.counter_nextValue587087 == Inc.counter_nextValue && this587087 == this && tid587087 == tid;
 assume $recorded.state587087 == 1;                                                                 
                                                                                                    
 // 9.9: while (true)   {                                                                           
                                                                                                    
 phase587087 := $pc;                                                                                
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (8.5): Bad tid
  invariant isShared(Inc._state[this]);                                                                    // (8.5): this is not global
                                                                                                    
  invariant StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
  invariant (forall _this : Inc :: Invariant.Y_Inc.counter(tid : Tid, _this, Inc.counter[_this] ,Inc._state587087,Inc.counter587087,Inc._lock587087,Inc.counter_nextThread587087,Inc.counter_nextValue587087));       // (9.9): Loop does not preserve yields_as annotation for field counter
  invariant phase587087 == $pc;                                                                            // (9.9): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (9.9): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 9.15: boolean tmp1;                                                                            
                                                                                                    
                                                                                                    
  // 9.15: tmp1 = true;                                                                             
                                                                                                    
  tmp1 := true;                                                                                     
  if (!(tmp1)) {                                                                                    
                                                                                                    
   // 9.9: break;                                                                                   
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 11.13: int n;                                                                                  
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 11.13: Tid _C_t;                                                                               
                                                                                                    
                                                                                                    
  // 11.13: _C_t := this.counter_nextThread  as B;                                                  
                                                                                                    
                                                                                                    
  moverPath586889 := ReadEval.Inc.counter_nextThread(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
  mover586889 := m#moverPath(moverPath586889);                                                      
  path586889 := p#moverPath(moverPath586889);                                                       
  assume Inc._state586889 == Inc._state && Inc.counter586889 == Inc.counter && Inc._lock586889 == Inc._lock && Inc.counter_nextThread586889 == Inc.counter_nextThread && Inc.counter_nextValue586889 == Inc.counter_nextValue && _C_t586889 == _C_t && n586889 == n && tmp1586889 == tmp1 && this586889 == this && tid586889 == tid && $pc586889 == $pc;
  assume $recorded.state586889 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (11.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (11.13): Reduction failure
  _C_t := Inc.counter_nextThread[this];                                                             
                                                                                                    
  // 11.13: int _C_v;                                                                               
                                                                                                    
                                                                                                    
  // 11.13: _C_v := this.counter_nextValue  as B;                                                   
                                                                                                    
                                                                                                    
  moverPath586895 := ReadEval.Inc.counter_nextValue(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
  mover586895 := m#moverPath(moverPath586895);                                                      
  path586895 := p#moverPath(moverPath586895);                                                       
  assume Inc._state586895 == Inc._state && Inc.counter586895 == Inc.counter && Inc._lock586895 == Inc._lock && Inc.counter_nextThread586895 == Inc.counter_nextThread && Inc.counter_nextValue586895 == Inc.counter_nextValue && _C_v586895 == _C_v && _C_t586895 == _C_t && n586895 == n && tmp1586895 == tmp1 && this586895 == this && tid586895 == tid && $pc586895 == $pc;
  assume $recorded.state586895 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (11.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (11.13): Reduction failure
  _C_v := Inc.counter_nextValue[this];                                                              
                                                                                                    
  // 11.13: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
  // 11.13: _currentValue := this.counter  as B;                                                    
                                                                                                    
                                                                                                    
  moverPath586901 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
  mover586901 := m#moverPath(moverPath586901);                                                      
  path586901 := p#moverPath(moverPath586901);                                                       
  assume Inc._state586901 == Inc._state && Inc.counter586901 == Inc.counter && Inc._lock586901 == Inc._lock && Inc.counter_nextThread586901 == Inc.counter_nextThread && Inc.counter_nextValue586901 == Inc.counter_nextValue && _currentValue586901 == _currentValue && _C_v586901 == _C_v && _C_t586901 == _C_t && n586901 == n && tmp1586901 == tmp1 && this586901 == this && tid586901 == tid && $pc586901 == $pc;
  assume $recorded.state586901 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (11.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (11.13): Reduction failure
  _currentValue := Inc.counter[this];                                                               
                                                                                                    
  // 11.13: Mover _R_t;                                                                             
                                                                                                    
                                                                                                    
  // 11.13: _R_t = readPermission(this.counter);                                                    
                                                                                                    
  _R_t := m#moverPath(ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue));
                                                                                                    
  // 11.13: boolean _casable;                                                                       
                                                                                                    
                                                                                                    
  // 11.13: _casable = _R_t != E && true && _C_t == tid && _C_v == _currentValue;                   
                                                                                                    
  _casable := ((((_R_t!=_E)&&true)&&(_C_t==tid))&&(_C_v==_currentValue));                           
  if (_casable) {                                                                                   
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 11.13: n := this.counter  as R;                                                               
                                                                                                    
                                                                                                    
   moverPath586939 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
   mover586939 := m#moverPath(moverPath586939);                                                     
   path586939 := p#moverPath(moverPath586939);                                                      
   assume Inc._state586939 == Inc._state && Inc.counter586939 == Inc.counter && Inc._lock586939 == Inc._lock && Inc.counter_nextThread586939 == Inc.counter_nextThread && Inc.counter_nextValue586939 == Inc.counter_nextValue && _casable586939 == _casable && _R_t586939 == _R_t && _currentValue586939 == _currentValue && _C_v586939 == _C_v && _C_t586939 == _C_t && n586939 == n && tmp1586939 == tmp1 && this586939 == this && tid586939 == tid && $pc586939 == $pc;
   assume $recorded.state586939 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc.null;                                                                        
   } else {                                                                                         
    assert this != Inc.null;                                                                               // (11.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _R);                                                                      
   assert $pc != PhaseError;                                                                               // (11.13): Reduction failure
   n := Inc.counter[this];                                                                          
  } else {                                                                                          
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 11.13: n := this.counter;                                                                     
                                                                                                    
                                                                                                    
   moverPath586944 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
   mover586944 := m#moverPath(moverPath586944);                                                     
   path586944 := p#moverPath(moverPath586944);                                                      
   assume Inc._state586944 == Inc._state && Inc.counter586944 == Inc.counter && Inc._lock586944 == Inc._lock && Inc.counter_nextThread586944 == Inc.counter_nextThread && Inc.counter_nextValue586944 == Inc.counter_nextValue && _casable586944 == _casable && _R_t586944 == _R_t && _currentValue586944 == _currentValue && _C_v586944 == _C_v && _C_t586944 == _C_t && n586944 == n && tmp1586944 == tmp1 && this586944 == this && tid586944 == tid && $pc586944 == $pc;
   assume $recorded.state586944 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc.null;                                                                        
   } else {                                                                                         
    assert this != Inc.null;                                                                               // (11.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover586944);                                                             
   assert $pc != PhaseError;                                                                               // (11.13): Reduction failure
   n := Inc.counter[this];                                                                          
  }                                                                                                 
                                                                                                    
  // 12.13: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 12.13: int tmp3;                                                                               
                                                                                                    
                                                                                                    
  // 12.13: tmp3 = n + 1;                                                                           
                                                                                                    
  tmp3 := (n+1);                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 12.13: boolean ctmp571771;                                                                     
                                                                                                    
                                                                                                    
  // 12.13: ctmp571771 = *;                                                                         
                                                                                                    
  havoc ctmp571771;                                                                                 
  if (ctmp571771) {                                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 12.13: tmp2 = false;                                                                          
                                                                                                    
   tmp2 := false;                                                                                   
  } else {                                                                                          
                                                                                                    
   // 12.13: ctmp571771 = *;                                                                        
                                                                                                    
   havoc ctmp571771;                                                                                
   if (ctmp571771) {                                                                                
                                                                                                    
    // 12.13: Tid tmpTid;                                                                           
                                                                                                    
                                                                                                    
    // 12.13: int tmpValue;                                                                         
                                                                                                    
                                                                                                    
    // 12.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 12.13: _m = writePermission(this.counter, tmp3);                                             
                                                                                                    
    _m := m#moverPath(WriteEval.Inc.counter(tid: Tid,this: Inc,tmp3: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue));
                                                                                                    
    // 12.13: assume this.counter == n;                                                             
                                                                                                    
    assume (Inc.counter[this]==n);                                                                  
                                                                                                    
    // 12.13: assume !goesWrong(_m);                                                                
                                                                                                    
    assume !(transition($pc, _m) == PhaseError);                                                    
                                                                                                    
    // 12.13: assume this.counter_nextThread == tid;                                                
                                                                                                    
    assume (Inc.counter_nextThread[this]==tid);                                                     
                                                                                                    
    // 12.13: assume this.counter_nextValue == n;                                                   
                                                                                                    
    assume (Inc.counter_nextValue[this]==n);                                                        
                                                                                                    
                                                                                                    
    // 12.13: this.counter_nextThread := tmpTid as B;                                               
                                                                                                    
                                                                                                    
    moverPath587017 := WriteEval.Inc.counter_nextThread(tid: Tid,this: Inc,tmpTid: Tid,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587017 := m#moverPath(moverPath587017);                                                    
    path587017 := p#moverPath(moverPath587017);                                                     
    assume Inc._state587017 == Inc._state && Inc.counter587017 == Inc.counter && Inc._lock587017 == Inc._lock && Inc.counter_nextThread587017 == Inc.counter_nextThread && Inc.counter_nextValue587017 == Inc.counter_nextValue && _m587017 == _m && tmpValue587017 == tmpValue && tmpTid587017 == tmpTid && ctmp571771587017 == ctmp571771 && tmp3587017 == tmp3 && tmp2587017 == tmp2 && n587017 == n && tmp1587017 == tmp1 && this587017 == this && tid587017 == tid && $pc587017 == $pc;
    assume $recorded.state587017 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    Inc.counter_nextThread[this] := tmpTid;                                                         
                                                                                                    
                                                                                                    
    // 12.13: this.counter_nextValue := tmpValue as B;                                              
                                                                                                    
                                                                                                    
    moverPath587020 := WriteEval.Inc.counter_nextValue(tid: Tid,this: Inc,tmpValue: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587020 := m#moverPath(moverPath587020);                                                    
    path587020 := p#moverPath(moverPath587020);                                                     
    assume Inc._state587020 == Inc._state && Inc.counter587020 == Inc.counter && Inc._lock587020 == Inc._lock && Inc.counter_nextThread587020 == Inc.counter_nextThread && Inc.counter_nextValue587020 == Inc.counter_nextValue && _m587020 == _m && tmpValue587020 == tmpValue && tmpTid587020 == tmpTid && ctmp571771587020 == ctmp571771 && tmp3587020 == tmp3 && tmp2587020 == tmp2 && n587020 == n && tmp1587020 == tmp1 && this587020 == this && tid587020 == tid && $pc587020 == $pc;
    assume $recorded.state587020 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    Inc.counter_nextValue[this] := tmpValue;                                                        
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 12.13: this.counter := tmp3;                                                                 
                                                                                                    
                                                                                                    
    moverPath587024 := WriteEval.Inc.counter(tid: Tid,this: Inc,tmp3: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587024 := m#moverPath(moverPath587024);                                                    
    path587024 := p#moverPath(moverPath587024);                                                     
    assume Inc._state587024 == Inc._state && Inc.counter587024 == Inc.counter && Inc._lock587024 == Inc._lock && Inc.counter_nextThread587024 == Inc.counter_nextThread && Inc.counter_nextValue587024 == Inc.counter_nextValue && _m587024 == _m && tmpValue587024 == tmpValue && tmpTid587024 == tmpTid && ctmp571771587024 == ctmp571771 && tmp3587024 == tmp3 && tmp2587024 == tmp2 && n587024 == n && tmp1587024 == tmp1 && this587024 == this && tid587024 == tid && $pc587024 == $pc;
    assume $recorded.state587024 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover587024);                                                            
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    Inc.counter[this] := tmp3;                                                                      
                                                                                                    
    // 12.13: tmp2 = true;                                                                          
                                                                                                    
    tmp2 := true;                                                                                   
   } else {                                                                                         
                                                                                                    
    // 12.13: assume this.counter_nextThread == tid;                                                
                                                                                                    
    assume (Inc.counter_nextThread[this]==tid);                                                     
                                                                                                    
    // 12.13: assume this.counter_nextValue == n;                                                   
                                                                                                    
    assume (Inc.counter_nextValue[this]==n);                                                        
                                                                                                    
    // 12.13: int _currentValue;                                                                    
                                                                                                    
                                                                                                    
    // 12.13: _currentValue := this.counter  as B;                                                  
                                                                                                    
                                                                                                    
    moverPath587047 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587047 := m#moverPath(moverPath587047);                                                    
    path587047 := p#moverPath(moverPath587047);                                                     
    assume Inc._state587047 == Inc._state && Inc.counter587047 == Inc.counter && Inc._lock587047 == Inc._lock && Inc.counter_nextThread587047 == Inc.counter_nextThread && Inc.counter_nextValue587047 == Inc.counter_nextValue && _currentValue587047 == _currentValue && ctmp571771587047 == ctmp571771 && tmp3587047 == tmp3 && tmp2587047 == tmp2 && n587047 == n && tmp1587047 == tmp1 && this587047 == this && tid587047 == tid && $pc587047 == $pc;
    assume $recorded.state587047 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
                                                                                                    
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    _currentValue := Inc.counter[this];                                                             
                                                                                                    
                                                                                                    
    // 12.13: this.counter := n as B;                                                               
                                                                                                    
                                                                                                    
    moverPath587050 := WriteEval.Inc.counter(tid: Tid,this: Inc,n: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587050 := m#moverPath(moverPath587050);                                                    
    path587050 := p#moverPath(moverPath587050);                                                     
    assume Inc._state587050 == Inc._state && Inc.counter587050 == Inc.counter && Inc._lock587050 == Inc._lock && Inc.counter_nextThread587050 == Inc.counter_nextThread && Inc.counter_nextValue587050 == Inc.counter_nextValue && _currentValue587050 == _currentValue && ctmp571771587050 == ctmp571771 && tmp3587050 == tmp3 && tmp2587050 == tmp2 && n587050 == n && tmp1587050 == tmp1 && this587050 == this && tid587050 == tid && $pc587050 == $pc;
    assume $recorded.state587050 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    Inc.counter[this] := n;                                                                         
                                                                                                    
    // 12.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 12.13: _m = writePermission(this.counter, tmp3);                                             
                                                                                                    
    _m := m#moverPath(WriteEval.Inc.counter(tid: Tid,this: Inc,tmp3: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue));
                                                                                                    
                                                                                                    
    // 12.13: this.counter := _currentValue as B;                                                   
                                                                                                    
                                                                                                    
    moverPath587062 := WriteEval.Inc.counter(tid: Tid,this: Inc,_currentValue: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587062 := m#moverPath(moverPath587062);                                                    
    path587062 := p#moverPath(moverPath587062);                                                     
    assume Inc._state587062 == Inc._state && Inc.counter587062 == Inc.counter && Inc._lock587062 == Inc._lock && Inc.counter_nextThread587062 == Inc.counter_nextThread && Inc.counter_nextValue587062 == Inc.counter_nextValue && _m587062 == _m && _currentValue587062 == _currentValue && ctmp571771587062 == ctmp571771 && tmp3587062 == tmp3 && tmp2587062 == tmp2 && n587062 == n && tmp1587062 == tmp1 && this587062 == this && tid587062 == tid && $pc587062 == $pc;
    assume $recorded.state587062 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    Inc.counter[this] := _currentValue;                                                             
                                                                                                    
    // 12.13: assume goesWrong(_m);                                                                 
                                                                                                    
    assume transition($pc, _m) == PhaseError;                                                       
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 12.13: this.counter := tmp3;                                                                 
                                                                                                    
                                                                                                    
    moverPath587069 := WriteEval.Inc.counter(tid: Tid,this: Inc,tmp3: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover587069 := m#moverPath(moverPath587069);                                                    
    path587069 := p#moverPath(moverPath587069);                                                     
    assume Inc._state587069 == Inc._state && Inc.counter587069 == Inc.counter && Inc._lock587069 == Inc._lock && Inc.counter_nextThread587069 == Inc.counter_nextThread && Inc.counter_nextValue587069 == Inc.counter_nextValue && _m587069 == _m && _currentValue587069 == _currentValue && ctmp571771587069 == ctmp571771 && tmp3587069 == tmp3 && tmp2587069 == tmp2 && n587069 == n && tmp1587069 == tmp1 && this587069 == this && tid587069 == tid && $pc587069 == $pc;
    assume $recorded.state587069 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (12.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover587069);                                                            
    assert $pc != PhaseError;                                                                              // (12.13): Reduction failure
    Inc.counter[this] := tmp3;                                                                      
                                                                                                    
    // 12.13: tmp2 = false;                                                                         
                                                                                                    
    tmp2 := false;                                                                                  
   }                                                                                                
  }                                                                                                 
  if (tmp2) {                                                                                       
                                                                                                    
   // 13.17: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 15.13: yield;                                                                                  
                                                                                                    
  assume Inc._state587084 == Inc._state && Inc.counter587084 == Inc.counter && Inc._lock587084 == Inc._lock && Inc.counter_nextThread587084 == Inc.counter_nextThread && Inc.counter_nextValue587084 == Inc.counter_nextValue && tmp3587084 == tmp3 && tmp2587084 == tmp2 && n587084 == n && tmp1587084 == tmp1 && this587084 == this && tid587084 == tid;
  assume $recorded.state587084 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Inc._state587084_post == Inc._state && Inc.counter587084_post == Inc.counter && Inc._lock587084_post == Inc._lock && Inc.counter_nextThread587084_post == Inc.counter_nextThread && Inc.counter_nextValue587084_post == Inc.counter_nextValue && tmp3587084_post == tmp3 && tmp2587084_post == tmp2 && n587084_post == n && tmp1587084_post == tmp1 && this587084_post == this && tid587084_post == tid;
  assume $recorded.state587084_post == 1;                                                           
  assume Inc._state587087_bottom == Inc._state && Inc.counter587087_bottom == Inc.counter && Inc._lock587087_bottom == Inc._lock && Inc.counter_nextThread587087_bottom == Inc.counter_nextThread && Inc.counter_nextValue587087_bottom == Inc.counter_nextValue && this587087_bottom == this && tid587087_bottom == tid;
  assume $recorded.state587087_bottom == 1;                                                         
  assert phase587087 == $pc;                                                                               // (9.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 8.23: // return;                                                                                
                                                                                                    
 assume Inc._state587088 == Inc._state && Inc.counter587088 == Inc.counter && Inc._lock587088 == Inc._lock && Inc.counter_nextThread587088 == Inc.counter_nextThread && Inc.counter_nextValue587088 == Inc.counter_nextValue && this587088 == this && tid587088 == tid;
 assume $recorded.state587088 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Inc  :: _i == Inc.null <==> isNull(Inc._state[_i])) &&                                
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc.counter(t: Tid, u: Tid, v: int, w: int, x: Inc)          
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.counter;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.counter[x] := v;                                                                               
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.counter(u: Tid,x: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): Inc.counter failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc.counter(t: Tid, u: Tid, v: int, w: int, x: Inc)           
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.counter;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc.counter[x] := v;                                                                               
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc.counter(u: Tid,x: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (5.2): Inc.counter failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc.counter(t: Tid, u: Tid, v: int, w: int, x: Inc)           
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.counter;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 assume w == Inc.counter[x];                                                                        
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc.counter[x] := havocValue;                                                                      
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc.counter(u: Tid,x: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (5.2): Inc.counter failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc.counter(t: Tid, u: Tid, v: int, w: int, x: Inc)            
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.counter;                                                                              
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 assume w == Inc.counter[x];                                                                        
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc.counter(u: Tid,x: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (5.2): Inc.counter failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc.counter(t: Tid, u: Tid, v: int, w: int, x: Inc)                
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.counter;                                                                              
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.counter(t: Tid,x: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc.counter(u: Tid,x: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): Inc.counter failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc.counter(t: Tid, u: Tid, v: int, w: int, x: Inc)                 
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[x], u);                                                           
 modifies Inc.counter;                                                                              
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
 assume w == Inc.counter[x];                                                                        
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc.counter(t: Tid,x: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc.counter[x] := havocValue;                                                                      
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc.counter(u: Tid,x: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (5.2): Inc.counter failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc.counter.Inc.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.counter[x] := v;                                                                               
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc.counter.Inc.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc.counter_mid: [Inc]int;                                                                     
 var Inc.counter_nextValue_mid: [Inc]int;                                                           
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc.counter_nextThread_mid: [Inc]Tid;                                                          
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc.counter[x];                                                                            
 Inc.counter[x] := v;                                                                               
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.counter_mid == Inc.counter && Inc._lock_mid == Inc._lock && Inc.counter_nextThread_mid == Inc.counter_nextThread && Inc.counter_nextValue_mid == Inc.counter_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc.counter[x] := tmpV;                                                                            
 Inc.counter[y] := w;                                                                               
 _writeByTPost := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc.counter.Inc.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc.counter_mid: [Inc]int;                                                                     
 var Inc.counter_nextValue_mid: [Inc]int;                                                           
 var w_mid: int;                                                                                    
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc.counter_nextThread_mid: [Inc]Tid;                                                          
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc.counter[x];                                                                            
 Inc.counter[x] := v;                                                                               
 assume Inc._state_mid == Inc._state && Inc.counter_mid == Inc.counter && Inc._lock_mid == Inc._lock && Inc.counter_nextThread_mid == Inc.counter_nextThread && Inc.counter_nextValue_mid == Inc.counter_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc.counter[x] := tmpV;                                                                            
 Inc.counter[y] := w;                                                                               
 _writeByTPost := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc.counter.Inc.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc.counter(t: Tid,x: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.counter[y] := w;                                                                               
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc.counter(t: Tid,x: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc.counter.Inc.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc.counter(u: Tid,y: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc.counter[x] := v;                                                                               
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc.counter(u: Tid,y: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.Inc.counter.Inc.counter(t: Tid, u: Tid, v: int, w1: int, w2: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var w2_pre: int;                                                                                   
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var w1_pre: int;                                                                                   
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc.counter_mid: [Inc]int;                                                                     
 var Inc.counter_nextValue_mid: [Inc]int;                                                           
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc.counter_nextThread_mid: [Inc]Tid;                                                          
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v_mid: int;                                                                                    
 var w2_mid: int;                                                                                   
 var w1_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var w2_post: int;                                                                                  
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var w1_post: int;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var v_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.counter(u: Tid,y: Inc,w1: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := Inc.counter[y];                                                                            
 Inc.counter[y] := w1;                                                                              
                                                                                                    
 assume Inc._state_mid == Inc._state && Inc.counter_mid == Inc.counter && Inc._lock_mid == Inc._lock && Inc.counter_nextThread_mid == Inc.counter_nextThread && Inc.counter_nextValue_mid == Inc.counter_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.Inc.counter(u: Tid,y: Inc,w2: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 Inc.counter[y] := tmpW;                                                                            
                                                                                                    
 Inc.counter[x] := v;                                                                               
 Inc.counter[y] := w1;                                                                              
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.Inc.counter(u: Tid,y: Inc,w2: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.Inc.counter.Inc.counter(t: Tid, u: Tid, v1: int, v2: int, w: int, x: Inc, y: Inc)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc._state[x], t);                                                           
 requires isAccessible(Inc._state[y], u);                                                           
 modifies Inc.counter;                                                                              
 modifies Inc.counter;                                                                              
                                                                                                    
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
 var Inc._state_pre: [Inc]State;                                                                    
 var Inc._lock_pre: [Inc]Tid;                                                                       
 var Inc.counter_nextValue_pre: [Inc]int;                                                           
 var v1_pre: int;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc.counter_nextThread_pre: [Inc]Tid;                                                          
 var w_pre: int;                                                                                    
 var x_pre: Inc;                                                                                    
 var y_pre: Inc;                                                                                    
 var $pc_pre: Phase;                                                                                
 var v2_pre: int;                                                                                   
 var t_pre: Tid;                                                                                    
 var Inc.counter_pre: [Inc]int;                                                                     
                                                                                                    
 var t_mid: Tid;                                                                                    
 var x_mid: Inc;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc.counter_mid: [Inc]int;                                                                     
 var Inc.counter_nextValue_mid: [Inc]int;                                                           
 var w_mid: int;                                                                                    
 var v1_mid: int;                                                                                   
 var Inc._state_mid: [Inc]State;                                                                    
 var Inc.counter_nextThread_mid: [Inc]Tid;                                                          
 var Inc._lock_mid: [Inc]Tid;                                                                       
 var y_mid: Inc;                                                                                    
 var v2_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc._state_post: [Inc]State;                                                                   
 var Inc.counter_nextThread_post: [Inc]Tid;                                                         
 var $recorded.state_post: int;                                                                     
 var v1_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Inc.counter_post: [Inc]int;                                                                    
 var $pc_post: Phase;                                                                               
 var y_post: Inc;                                                                                   
 var w_post: int;                                                                                   
 var Inc._lock_post: [Inc]Tid;                                                                      
 var x_post: Inc;                                                                                   
 var v2_post: int;                                                                                  
 var u_post: Tid;                                                                                   
 var Inc.counter_nextValue_post: [Inc]int;                                                          
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc.counter(u: Tid,y: Inc,w: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := Inc.counter[x];                                                                            
 Inc.counter[x] := v1;                                                                              
 _writeByTAfterT := WriteEval.Inc.counter(t: Tid,x: Inc,v2: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 Inc.counter[x] := tmpV;                                                                            
                                                                                                    
 Inc.counter[y] := w;                                                                               
 assume Inc._state_mid == Inc._state && Inc.counter_mid == Inc.counter && Inc._lock_mid == Inc._lock && Inc.counter_nextThread_mid == Inc.counter_nextThread && Inc.counter_nextValue_mid == Inc.counter_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.Inc.counter(t: Tid,x: Inc,v1: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 Inc.counter[x] := v1;                                                                              
 _writeByTAfterUAndT := WriteEval.Inc.counter(t: Tid,x: Inc,v2: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
requires ValidTid(tid);                                                                             
modifies Inc._state;                                                                                
modifies Inc.counter;                                                                               
modifies Inc._lock;                                                                                 
modifies Inc.counter_nextThread;                                                                    
modifies Inc.counter_nextValue;                                                                     
ensures StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
ensures Y(tid , old(Inc._state), old(Inc.counter), old(Inc._lock), old(Inc.counter_nextThread), old(Inc.counter_nextValue) , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
                                                                                                    
// Inc.counter:                                                                                     
                                                                                                    
function {:inline} Y_Inc.counter(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)), _R)) ==> (Inc.counter[this] == newValue))
 &&((newValue>=Inc.counter[this]))                                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.counter(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 true                                                                                               
 &&((newValue>=Inc.counter[this]))                                                                  
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc.counter.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc.counter_yield: [Inc]int;                                                                    
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Inc.counter_nextThread_yield: [Inc]Tid;                                                         
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.counter_nextValue_yield: [Inc]int;                                                          
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc.counter(u: Tid,this: Inc,newValue: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)));
                                                                                                    
assume Inc._state_yield == Inc._state && Inc.counter_yield == Inc.counter && Inc._lock_yield == Inc._lock && Inc.counter_nextThread_yield == Inc.counter_nextThread && Inc.counter_nextValue_yield == Inc.counter_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.counter(tid, this, newValue , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc.counter.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc.counter_yield: [Inc]int;                                                                    
var Inc.counter_nextThread_yield: [Inc]Tid;                                                         
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.counter_nextValue_yield: [Inc]int;                                                          
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.counter_yield == Inc.counter && Inc._lock_yield == Inc._lock && Inc.counter_nextThread_yield == Inc.counter_nextThread && Inc.counter_nextValue_yield == Inc.counter_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc.counter(tid, this, Inc.counter[this] , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc.counter.Transitive(tid : Tid, this: Inc, newValue : int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int , Inc._state_p: [Inc]State, Inc.counter_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc.counter_nextThread_p: [Inc]Tid, Inc.counter_nextValue_p: [Inc]int)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires StateInvariant(Inc._state_p, Inc.counter_p, Inc._lock_p, Inc.counter_nextThread_p, Inc.counter_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Inc.counter_nextValue_pre: [Inc]int;                                                            
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Inc.counter_nextThread_pre: [Inc]Tid;                                                           
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var Inc.counter_pre: [Inc]int;                                                                      
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var Inc.counter_nextThread_post: [Inc]Tid;                                                          
var $recorded.state_post: int;                                                                      
var Inc.counter_post: [Inc]int;                                                                     
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc._lock_post: [Inc]Tid;                                                                       
var Inc.counter_nextValue_post: [Inc]int;                                                           
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue , Inc._state_p, Inc.counter_p, Inc._lock_p, Inc.counter_nextThread_p, Inc.counter_nextValue_p);
 assume Y_Inc.counter(tid, this, newValue , Inc._state_p, Inc.counter_p, Inc._lock_p, Inc.counter_nextThread_p, Inc.counter_nextValue_p);
assume Inc._state_post == Inc._state_p && Inc.counter_post == Inc.counter_p && Inc._lock_post == Inc._lock_p && Inc.counter_nextThread_post == Inc.counter_nextThread_p && Inc.counter_nextValue_post == Inc.counter_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc.counter(tid, this, newValue , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Check_Inc.counter.ABAFree(tid : Tid, this: Inc, A : int, B : int)                         
 modifies Inc.counter;                                                                              
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires Inc.counter[this] == A;                                                                   
 requires isAccessible(Inc._state[this], tid);                                                      
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var A_pre: int;                                                                                     
var Inc.counter_nextValue_pre: [Inc]int;                                                            
var B_pre: int;                                                                                     
var $recorded.state_pre: int;                                                                       
var Inc.counter_nextThread_pre: [Inc]Tid;                                                           
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var Inc.counter_pre: [Inc]int;                                                                      
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var Inc.counter_nextThread_post: [Inc]Tid;                                                          
var $recorded.state_post: int;                                                                      
var B_post: int;                                                                                    
var Inc.counter_post: [Inc]int;                                                                     
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc._lock_post: [Inc]Tid;                                                                       
var A_post: int;                                                                                    
var Inc.counter_nextValue_post: [Inc]int;                                                           
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && B_pre == B && A_pre == A && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume Y_Inc.counter(tid, this, B , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 assume A != B;                                                                                     
Inc.counter[this] := B;                                                                             
assume Inc._state_post == Inc._state && Inc.counter_post == Inc.counter && Inc._lock_post == Inc._lock && Inc.counter_nextThread_post == Inc.counter_nextThread && Inc.counter_nextValue_post == Inc.counter_nextValue && B_post == B && A_post == A && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert !(Y_Inc.counter(tid, this, A , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue));
}                                                                                                   
// Inc._lock:                                                                                       
                                                                                                    
function {:inline} Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)), _R)) ==> (Inc._lock[this] == newValue))
 &&(((Inc._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc._lock(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc.counter_yield: [Inc]int;                                                                    
var u_yield: Tid;                                                                                   
var Inc.counter_nextThread_yield: [Inc]Tid;                                                         
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.counter_nextValue_yield: [Inc]int;                                                          
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume isAccessible(Inc._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Inc._lock(u: Tid,this: Inc,newValue: Tid,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)));
 assume leq(m#moverPath(ReadEval.Inc._lock(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)), _N);
assume Inc._state_yield == Inc._state && Inc.counter_yield == Inc.counter && Inc._lock_yield == Inc._lock && Inc.counter_nextThread_yield == Inc.counter_nextThread && Inc.counter_nextValue_yield == Inc.counter_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Reflexive(tid : Tid, this: Inc , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_yield: [Inc]State;                                                                   
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc.counter_yield: [Inc]int;                                                                    
var Inc.counter_nextThread_yield: [Inc]Tid;                                                         
var Inc._lock_yield: [Inc]Tid;                                                                      
var this_yield: Inc;                                                                                
var $recorded.state_yield: int;                                                                     
var Inc.counter_nextValue_yield: [Inc]int;                                                          
                                                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
assume Inc._state_yield == Inc._state && Inc.counter_yield == Inc.counter && Inc._lock_yield == Inc._lock && Inc.counter_nextThread_yield == Inc.counter_nextThread && Inc.counter_nextValue_yield == Inc.counter_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc._lock(tid, this, Inc._lock[this] , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc._lock.Transitive(tid : Tid, this: Inc, newValue : Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int , Inc._state_p: [Inc]State, Inc.counter_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc.counter_nextThread_p: [Inc]Tid, Inc.counter_nextValue_p: [Inc]int)
 requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
 requires StateInvariant(Inc._state_p, Inc.counter_p, Inc._lock_p, Inc.counter_nextThread_p, Inc.counter_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc._state_pre: [Inc]State;                                                                     
var Inc._lock_pre: [Inc]Tid;                                                                        
var Inc.counter_nextValue_pre: [Inc]int;                                                            
var $recorded.state_pre: int;                                                                       
var Inc.counter_nextThread_pre: [Inc]Tid;                                                           
var tid_pre: Tid;                                                                                   
var this_pre: Inc;                                                                                  
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var Inc.counter_pre: [Inc]int;                                                                      
                                                                                                    
var Inc._state_post: [Inc]State;                                                                    
var Inc.counter_nextThread_post: [Inc]Tid;                                                          
var $recorded.state_post: int;                                                                      
var Inc.counter_post: [Inc]int;                                                                     
var $pc_post: Phase;                                                                                
var this_post: Inc;                                                                                 
var tid_post: Tid;                                                                                  
var Inc._lock_post: [Inc]Tid;                                                                       
var newValue_post: Tid;                                                                             
var Inc.counter_nextValue_post: [Inc]int;                                                           
                                                                                                    
assume Inc._state_pre == Inc._state && Inc.counter_pre == Inc.counter && Inc._lock_pre == Inc._lock && Inc.counter_nextThread_pre == Inc.counter_nextThread && Inc.counter_nextValue_pre == Inc.counter_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc._state[this], tid);                                                        
 assume Y(tid , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue , Inc._state_p, Inc.counter_p, Inc._lock_p, Inc.counter_nextThread_p, Inc.counter_nextValue_p);
 assume Y_Inc._lock(tid, this, newValue , Inc._state_p, Inc.counter_p, Inc._lock_p, Inc.counter_nextThread_p, Inc.counter_nextValue_p);
assume Inc._state_post == Inc._state_p && Inc.counter_post == Inc.counter_p && Inc._lock_post == Inc._lock_p && Inc.counter_nextThread_post == Inc.counter_nextThread_p && Inc.counter_nextValue_post == Inc.counter_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc._lock(tid, this, newValue , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
}                                                                                                   
// Inc.counter_nextThread:                                                                          
                                                                                                    
function {:inline} Y_Inc.counter_nextThread(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.counter_nextThread(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)), _R)) ==> (Inc.counter_nextThread[this] == newValue))
 &&(((Inc.counter_nextThread[this]==tid)==>(newValue==tid)))                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.counter_nextThread(tid : Tid, this: Inc, newValue: Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// Inc.counter_nextValue:                                                                           
                                                                                                    
function {:inline} Y_Inc.counter_nextValue(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 ((isAccessible(Inc._state[this], tid) && leq(m#moverPath(ReadEval.Inc.counter_nextValue(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue)), _R)) ==> (Inc.counter_nextValue[this] == newValue))
 &&(((Inc.counter_nextThread[this]==tid)==>(newValue==Inc.counter_nextValue[this])))                
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.counter_nextValue(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int , Inc._state_p: [Inc]State, Inc.counter_p: [Inc]int, Inc._lock_p: [Inc]Tid, Inc.counter_nextThread_p: [Inc]Tid, Inc.counter_nextValue_p: [Inc]int): bool
{                                                                                                   
 (forall this: Inc :: Y_Inc.counter(tid : Tid, this, Inc.counter_p[this] , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue))
 && (forall this: Inc :: Y_Inc._lock(tid : Tid, this, Inc._lock_p[this] , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue))
 && (forall this: Inc :: Y_Inc.counter_nextThread(tid : Tid, this, Inc.counter_nextThread_p[this] , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue))
 && (forall this: Inc :: Y_Inc.counter_nextValue(tid : Tid, this, Inc.counter_nextValue_p[this] , Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue))
 && (forall _i : Inc :: isShared(Inc._state[_i]) ==> isShared(Inc._state_p[_i]))                    
 && (forall _i : Inc :: isLocal(Inc._state[_i], tid) <==> isLocal(Inc._state_p[_i], tid))           
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 795.1-1501.2: (Method:8.5)
// 804.1-804.24: (8.5): Bad tid
// 805.1-805.37: (8.5): this is not global
// 1105.2-1109.14: (class anchor.sink.While:9.9)
// 1111.1-1111.27: (8.5): Bad tid
// 1112.1-1112.40: (8.5): this is not global
// 1115.1-1115.208: (9.9): Loop does not preserve yields_as annotation for field counter
// 1116.1-1116.32: (9.9): Phase must be invariant at loop head
// 1117.1-1117.30: (9.9): Potentially infinite loop cannot be in post-commit phase.
// 1119.3-1121.3: (class anchor.sink.VarDeclStmt:9.15)
// 1122.3-1125.16: (class anchor.sink.Assign:9.15)
// 1127.4-1130.10: (class anchor.sink.Break:9.9)
// 1133.3-1135.3: (class anchor.sink.VarDeclStmt:11.13)
// 1137.3-1139.3: (class anchor.sink.VarDeclStmt:11.13)
// 1140.3-1157.40: (class anchor.sink.Read:11.13)
// 1152.1-1152.28: (11.13): Cannot have potential null deference in left-mover part.
// 1156.1-1156.28: (11.13): Reduction failure
// 1158.3-1160.3: (class anchor.sink.VarDeclStmt:11.13)
// 1161.3-1178.39: (class anchor.sink.Read:11.13)
// 1173.1-1173.28: (11.13): Cannot have potential null deference in left-mover part.
// 1177.1-1177.28: (11.13): Reduction failure
// 1179.3-1181.3: (class anchor.sink.VarDeclStmt:11.13)
// 1182.3-1199.38: (class anchor.sink.Read:11.13)
// 1194.1-1194.28: (11.13): Cannot have potential null deference in left-mover part.
// 1198.1-1198.28: (11.13): Reduction failure
// 1200.3-1202.3: (class anchor.sink.VarDeclStmt:11.13)
// 1203.3-1206.143: (class anchor.sink.Assign:11.13)
// 1207.3-1209.3: (class anchor.sink.VarDeclStmt:11.13)
// 1210.3-1213.74: (class anchor.sink.Assign:11.13)
// 1216.4-1233.27: (class anchor.sink.Read:11.13)
// 1228.1-1228.29: (11.13): Cannot have potential null deference in left-mover part.
// 1232.1-1232.29: (11.13): Reduction failure
// 1236.4-1253.27: (class anchor.sink.Read:11.13)
// 1248.1-1248.29: (11.13): Cannot have potential null deference in left-mover part.
// 1252.1-1252.29: (11.13): Reduction failure
// 1255.3-1257.3: (class anchor.sink.VarDeclStmt:12.13)
// 1258.3-1260.3: (class anchor.sink.VarDeclStmt:12.13)
// 1261.3-1264.17: (class anchor.sink.Assign:12.13)
// 1266.3-1268.3: (class anchor.sink.VarDeclStmt:12.13)
// 1269.3-1272.20: (class anchor.sink.Assign:12.13)
// 1275.4-1278.18: (class anchor.sink.Assign:12.13)
// 1280.4-1283.21: (class anchor.sink.Assign:12.13)
// 1285.5-1287.5: (class anchor.sink.VarDeclStmt:12.13)
// 1288.5-1290.5: (class anchor.sink.VarDeclStmt:12.13)
// 1291.5-1293.5: (class anchor.sink.VarDeclStmt:12.13)
// 1294.5-1297.154: (class anchor.sink.Assign:12.13)
// 1298.5-1301.35: (class anchor.sink.Assume:12.13)
// 1302.5-1305.49: (class anchor.sink.Assume:12.13)
// 1306.5-1309.48: (class anchor.sink.Assume:12.13)
// 1310.5-1313.45: (class anchor.sink.Assume:12.13)
// 1315.5-1331.44: (class anchor.sink.Write:12.13)
// 1327.1-1327.30: (12.13): Cannot have potential null deference in left-mover part.
// 1330.1-1330.30: (12.13): Reduction failure
// 1333.5-1349.45: (class anchor.sink.Write:12.13)
// 1345.1-1345.30: (12.13): Cannot have potential null deference in left-mover part.
// 1348.1-1348.30: (12.13): Reduction failure
// 1352.5-1368.31: (class anchor.sink.Write:12.13)
// 1364.1-1364.30: (12.13): Cannot have potential null deference in left-mover part.
// 1367.1-1367.30: (12.13): Reduction failure
// 1369.5-1372.18: (class anchor.sink.Assign:12.13)
// 1374.5-1377.48: (class anchor.sink.Assume:12.13)
// 1378.5-1381.45: (class anchor.sink.Assume:12.13)
// 1382.5-1384.5: (class anchor.sink.VarDeclStmt:12.13)
// 1385.5-1402.40: (class anchor.sink.Read:12.13)
// 1397.1-1397.30: (12.13): Cannot have potential null deference in left-mover part.
// 1401.1-1401.30: (12.13): Reduction failure
// 1404.5-1420.28: (class anchor.sink.Write:12.13)
// 1416.1-1416.30: (12.13): Cannot have potential null deference in left-mover part.
// 1419.1-1419.30: (12.13): Reduction failure
// 1421.5-1423.5: (class anchor.sink.VarDeclStmt:12.13)
// 1424.5-1427.154: (class anchor.sink.Assign:12.13)
// 1429.5-1445.40: (class anchor.sink.Write:12.13)
// 1441.1-1441.30: (12.13): Cannot have potential null deference in left-mover part.
// 1444.1-1444.30: (12.13): Reduction failure
// 1446.5-1449.46: (class anchor.sink.Assume:12.13)
// 1452.5-1468.31: (class anchor.sink.Write:12.13)
// 1464.1-1464.30: (12.13): Cannot have potential null deference in left-mover part.
// 1467.1-1467.30: (12.13): Reduction failure
// 1469.5-1472.19: (class anchor.sink.Assign:12.13)
// 1476.4-1479.10: (class anchor.sink.Break:13.17)
// 1482.3-1490.42: (class anchor.sink.Yield:15.13)
// 1493.1-1493.29: (9.9): Phase must be invariant at loop head
// 1495.2-1500.9: (class anchor.sink.Return:8.23)
// 1579.1-1579.34: (5.2): Inc.counter failed Write-Write Right-Mover Check
// 1640.1-1640.30: (5.2): Inc.counter failed Write-Read Right-Mover Check
// 1705.1-1705.34: (5.2): Inc.counter failed Write-Write Left-Mover Check
// 1767.1-1767.30: (5.2): Inc.counter failed Write-Read Left-Mover Check
// 1826.1-1826.34: (5.2): Inc.counter failed Read-Write Right-Mover Check
// 1888.1-1888.34: (5.2): Inc.counter failed Read-Write Left-Mover Check
// 1961.1-1961.140: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.1)
// 1962.1-1962.101: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.2)
// 1963.1-1963.158: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.3)
// 2062.1-2062.140: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case C)
// 2166.1-2166.144: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case D)
// 2167.1-2167.144: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case R)
// 2240.1-2240.136: (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case F)
// 2241.1-2241.136: (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case H)
// 2242.1-2242.146: (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case I)
// 2314.1-2314.136: (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case J)
// 2315.1-2315.136: (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case K)
// 2316.1-2316.99: (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case L)
// 2425.1-2425.142: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case M)
// 2532.1-2532.130: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case N)
// 2568.1-2589.2: (6.23): yields_as clause for Inc.counter is not valid
// 2594.1-2610.2: (6.23): yields_as clause for Inc.counter is not reflexive
// 2616.1-2648.2: (6.23): yields_as clause for Inc.counter is not transitive
// 2656.1-2690.2: (6.23): Inc.counter is not ABA-free
// 2710.1-2731.2: (7.32): yields_as clause for Inc._lock is not valid
// 2736.1-2752.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 2758.1-2790.2: (7.32): yields_as clause for Inc._lock is not transitive
