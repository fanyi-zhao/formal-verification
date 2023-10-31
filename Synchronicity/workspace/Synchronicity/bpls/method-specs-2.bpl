                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/method-specs-2.anchor:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Stack {                                                                                   
      volatile int top isLocal(this, tid)                                                           
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.top == 0;                                                                       
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.top == old(this.top) + 1;                                                      
      }                                                                                             
      public void push(int v) {                                                                     
        while (true)   {                                                                            
          boolean tmp1;                                                                             
          tmp1 = true;                                                                              
          if (!tmp1) break; else {                                                                  
                                                                                                    
          }                                                                                         
          {                                                                                         
            int x;                                                                                  
            x := this.top;                                                                          
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            tmp2 = this.top@x :~ tmp3;                                                              
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Stack {                                                                                   
      hasCASOperation volatile int top isLocal(this, tid)                                           
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid top_nextThread isLocal(this, tid)                                           
       ? B                                                                                          
       : this.top_nextThread == tid ? N : E                                                         
        yields_as this.top_nextThread == tid ==> newValue == tid;                                   
                                                                                                    
                                                                                                    
      updatesViaCAS int top_nextValue isLocal(this, tid)                                            
       ? B                                                                                          
       : this.top_nextThread == tid ? N : E                                                         
        yields_as this.top_nextThread == tid ==> newValue == this.top_nextValue;                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.top == 0;                                                                       
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.top == old(this.top) + 1;                                                      
      }                                                                                             
      public void push(int v) {                                                                     
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
              _C_t := this.top_nextThread  as B;                                                    
              int _C_v;                                                                             
              _C_v := this.top_nextValue  as B;                                                     
              int _currentValue;                                                                    
              _currentValue := this.top  as B;                                                      
              Mover _R_t;                                                                           
              _R_t = readPermission(this.top);                                                      
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.top  as R;                                                                
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.top;                                                                      
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp2607527;                                                                  
              ctmp2607527 = *;                                                                      
              if (ctmp2607527) {                                                                    
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp2607527 = *;                                                                    
                if (ctmp2607527) {                                                                  
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.top, tmp3);                                             
                  assume this.top == x;                                                             
                  assume !goesWrong(_m);                                                            
                  assume this.top_nextThread == tid;                                                
                  assume this.top_nextValue == x;                                                   
                  this.top_nextThread := tmpTid as B;                                               
                  this.top_nextValue := tmpValue as B;                                              
                  noop(TraceOn);                                                                    
                  this.top := tmp3;                                                                 
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.top_nextThread == tid;                                                
                  assume this.top_nextValue == x;                                                   
                  int _currentValue;                                                                
                  _currentValue := this.top  as B;                                                  
                  this.top := x as B;                                                               
                  Mover _m;                                                                         
                  _m = writePermission(this.top, tmp3);                                             
                  this.top := _currentValue as B;                                                   
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.top := tmp3;                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Stack {                                                                                   
      hasCASOperation volatile int top isLocal(this, tid)                                           
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid top_nextThread isLocal(this, tid)                                           
       ? B                                                                                          
       : this.top_nextThread == tid ? N : E                                                         
        yields_as this.top_nextThread == tid ==> newValue == tid;                                   
                                                                                                    
                                                                                                    
      updatesViaCAS int top_nextValue isLocal(this, tid)                                            
       ? B                                                                                          
       : this.top_nextThread == tid ? N : E                                                         
        yields_as this.top_nextThread == tid ==> newValue == this.top_nextValue;                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.top == 0;                                                                       
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.top == old(this.top) + 1;                                                      
      }                                                                                             
      public void push(int v) {                                                                     
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
              _C_t := this.top_nextThread  as B;                                                    
              int _C_v;                                                                             
              _C_v := this.top_nextValue  as B;                                                     
              int _currentValue;                                                                    
              _currentValue := this.top  as B;                                                      
              Mover _R_t;                                                                           
              _R_t = readPermission(this.top);                                                      
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.top  as R;                                                                
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.top;                                                                      
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp2607527;                                                                  
              ctmp2607527 = *;                                                                      
              if (ctmp2607527) {                                                                    
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp2607527 = *;                                                                    
                if (ctmp2607527) {                                                                  
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.top, tmp3);                                             
                  assume this.top == x;                                                             
                  assume !goesWrong(_m);                                                            
                  assume this.top_nextThread == tid;                                                
                  assume this.top_nextValue == x;                                                   
                  this.top_nextThread := tmpTid as B;                                               
                  this.top_nextValue := tmpValue as B;                                              
                  noop(TraceOn);                                                                    
                  this.top := tmp3;                                                                 
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.top_nextThread == tid;                                                
                  assume this.top_nextValue == x;                                                   
                  int _currentValue;                                                                
                  _currentValue := this.top  as B;                                                  
                  this.top := x as B;                                                               
                  Mover _m;                                                                         
                  _m = writePermission(this.top, tmp3);                                             
                  this.top := _currentValue as B;                                                   
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.top := tmp3;                                                                 
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
                                                                                                    
                                                                                                    
                                                                                                    
    class Stack {                                                                                   
      hasCASOperation volatile int top isLocal(this, tid)                                           
       ? isLocal(this, tid) ? B : E                                                                 
       : N                                                                                          
                                                                                                    
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
                                                                                                    
                                                                                                    
      updatesViaCAS Tid top_nextThread isLocal(this, tid)                                           
       ? B                                                                                          
       : this.top_nextThread == tid ? N : E                                                         
        yields_as this.top_nextThread == tid ==> newValue == tid;                                   
                                                                                                    
                                                                                                    
      updatesViaCAS int top_nextValue isLocal(this, tid)                                            
       ? B                                                                                          
       : this.top_nextThread == tid ? N : E                                                         
        yields_as this.top_nextThread == tid ==> newValue == this.top_nextValue;                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.top == 0;                                                                       
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
        ensures this.top == old(this.top) + 1;                                                      
      }                                                                                             
      public void push(int v) {                                                                     
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
              _C_t := this.top_nextThread  as B;                                                    
              int _C_v;                                                                             
              _C_v := this.top_nextValue  as B;                                                     
              int _currentValue;                                                                    
              _currentValue := this.top  as B;                                                      
              Mover _R_t;                                                                           
              _R_t = readPermission(this.top);                                                      
              boolean _casable;                                                                     
              _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                
              if (_casable) {                                                                       
                noop(TraceOn);                                                                      
                x := this.top  as R;                                                                
              } else {                                                                              
                noop(TraceOn);                                                                      
                x := this.top;                                                                      
              }                                                                                     
            }                                                                                       
            boolean tmp2;                                                                           
            int tmp3;                                                                               
            tmp3 = x + 1;                                                                           
            {                                                                                       
              noop(TraceOff);                                                                       
              boolean ctmp2607527;                                                                  
              ctmp2607527 = *;                                                                      
              if (ctmp2607527) {                                                                    
                noop(TraceOn);                                                                      
                tmp2 = false;                                                                       
              } else {                                                                              
                ctmp2607527 = *;                                                                    
                if (ctmp2607527) {                                                                  
                  Tid tmpTid;                                                                       
                  int tmpValue;                                                                     
                  Mover _m;                                                                         
                  _m = writePermission(this.top, tmp3);                                             
                  assume this.top == x;                                                             
                  assume !goesWrong(_m);                                                            
                  assume this.top_nextThread == tid;                                                
                  assume this.top_nextValue == x;                                                   
                  this.top_nextThread := tmpTid as B;                                               
                  this.top_nextValue := tmpValue as B;                                              
                  noop(TraceOn);                                                                    
                  this.top := tmp3;                                                                 
                  tmp2 = true;                                                                      
                } else {                                                                            
                  assume this.top_nextThread == tid;                                                
                  assume this.top_nextValue == x;                                                   
                  int _currentValue;                                                                
                  _currentValue := this.top  as B;                                                  
                  this.top := x as B;                                                               
                  Mover _m;                                                                         
                  _m = writePermission(this.top, tmp3);                                             
                  this.top := _currentValue as B;                                                   
                  assume goesWrong(_m);                                                             
                  noop(TraceOn);                                                                    
                  this.top := tmp3;                                                                 
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
                                                                                                    
                                                                                                    
/*** Class Decl Stack ***/                                                                          
                                                                                                    
type Stack;                                                                                         
const unique Stack.null: Stack;                                                                     
var Stack._state: [Stack]State;                                                                     
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack.top: [Stack]int;                                                                          
                                                                                                    
function {:inline} ReadEval.Stack.top(tid: Tid,this : Stack,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isLocal(Stack._state[this], tid)) then                                                        
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack.top(tid: Tid,this : Stack,newValue: int,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isLocal(Stack._state[this], tid)) then                                                        
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  moverPath(_N, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack._lock: [Stack]Tid;                                                                        
                                                                                                    
function {:inline} ReadEval.Stack._lock(tid: Tid,this : Stack,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Stack._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Stack._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Stack._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack._lock(tid: Tid,this : Stack,newValue: Tid,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Stack._state[this], tid)) then                                                         
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Stack._lock[this]==tid)) then                                                               
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Stack._lock[this]==Tid.null)&&(newValue==tid))) then                                       
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Stack._lock[this]==tid)&&(newValue==Tid.null))) then                                      
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack.top_nextThread: [Stack]Tid;                                                               
                                                                                                    
function {:inline} ReadEval.Stack.top_nextThread(tid: Tid,this : Stack,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Stack._state[this], tid)) then                                                         
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Stack.top_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack.top_nextThread(tid: Tid,this : Stack,newValue: Tid,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Stack._state[this], tid)) then                                                         
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Stack.top_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Stack.top_nextValue: [Stack]int;                                                                
                                                                                                    
function {:inline} ReadEval.Stack.top_nextValue(tid: Tid,this : Stack,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Stack._state[this], tid)) then                                                         
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Stack.top_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Stack.top_nextValue(tid: Tid,this : Stack,newValue: int,Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Stack._state[this], tid)) then                                                         
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Stack.top_nextThread[this]==tid)) then                                                       
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Stack.push(tid:Tid, this : Stack, v : int)                                               
modifies Stack._state;                                                                              
modifies Stack.top;                                                                                 
modifies Stack._lock;                                                                               
modifies Stack.top_nextThread;                                                                      
modifies Stack.top_nextValue;                                                                       
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.5): Bad tid
requires isShared(Stack._state[this]);                                                                     // (8.5): this is not global
                                                                                                    
requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
                                                                                                    
ensures StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
{                                                                                                   
 var moverPath2622696: MoverPath;                                                                   
 var tid2622885_post: Tid;                                                                          
 var ctmp26075272622848: bool;                                                                      
 var tmp22622821: bool;                                                                             
 var _currentValue: int;                                                                            
 var Stack.top_nextThread2622821: [Stack]Tid;                                                       
 var _C_v2622745: int;                                                                              
 var mover2622745: Mover;                                                                           
 var path2622863: int;                                                                              
 var tmp12622885: bool;                                                                             
 var _currentValue2622745: int;                                                                     
 var this2622888_bottom: Stack;                                                                     
 var tmp32622818: int;                                                                              
 var Stack._state2622885_post: [Stack]State;                                                        
 var tid2622702: Tid;                                                                               
 var Stack.top_nextValue2622851: [Stack]int;                                                        
 var $pc2622870: Phase;                                                                             
 var _C_t: Tid;                                                                                     
 var Stack._lock2622885_post: [Stack]Tid;                                                           
 var tmp12622885_post: bool;                                                                        
 var phase2622888: Phase;                                                                           
 var $pc2622889: Phase;                                                                             
 var x2622702: int;                                                                                 
 var _casable2622740: bool;                                                                         
 var tmp32622870: int;                                                                              
 var Stack.top_nextValue2622889: [Stack]int;                                                        
 var tid2622825: Tid;                                                                               
 var Stack.top_nextValue2622888: [Stack]int;                                                        
 var this2622818: Stack;                                                                            
 var _m2622825: Mover;                                                                              
 var Stack.top_nextValue2622740: [Stack]int;                                                        
 var ctmp26075272622818: bool;                                                                      
 var path2622745: int;                                                                              
 var Stack.top_nextThread2622870: [Stack]Tid;                                                       
 var Stack.top_nextThread2622740: [Stack]Tid;                                                       
 var Stack.top_nextThread2622851: [Stack]Tid;                                                       
 var ctmp26075272622863: bool;                                                                      
 var _casable: bool;                                                                                
 var tmpTid2622825: Tid;                                                                            
 var $recorded.state2622740: int;                                                                   
 var v2622745: int;                                                                                 
 var tmp32622848: int;                                                                              
 var moverPath2622702: MoverPath;                                                                   
 var _C_t2622702: Tid;                                                                              
 var Stack.top_nextThread2622885_post: [Stack]Tid;                                                  
 var _C_t2622696: Tid;                                                                              
 var v2622870: int;                                                                                 
 var tid2622889: Tid;                                                                               
 var x: int;                                                                                        
 var mover2622821: Mover;                                                                           
 var tid2622818: Tid;                                                                               
 var tmp22622851: bool;                                                                             
 var x2622745: int;                                                                                 
 var _currentValue2622848: int;                                                                     
 var tmp12622696: bool;                                                                             
 var Stack.top_nextThread2622696: [Stack]Tid;                                                       
 var moverPath2622863: MoverPath;                                                                   
 var tmp22622863: bool;                                                                             
 var tmp12622870: bool;                                                                             
 var x2622863: int;                                                                                 
 var $pc2622818: Phase;                                                                             
 var _m2622821: Mover;                                                                              
 var $pc2622825: Phase;                                                                             
 var tmp1: bool;                                                                                    
 var moverPath2622690: MoverPath;                                                                   
 var tmpValue: int;                                                                                 
 var Stack._state2622825: [Stack]State;                                                             
 var $recorded.state2622863: int;                                                                   
 var _m2622870: Mover;                                                                              
 var _currentValue2622863: int;                                                                     
 var x2622740: int;                                                                                 
 var mover2622702: Mover;                                                                           
 var x2622821: int;                                                                                 
 var Stack._lock2622888: [Stack]Tid;                                                                
 var _C_v2622696: int;                                                                              
 var Stack._state2622863: [Stack]State;                                                             
 var Stack._lock2622888_bottom: [Stack]Tid;                                                         
 var tmp12622690: bool;                                                                             
 var moverPath2622870: MoverPath;                                                                   
 var ctmp26075272622821: bool;                                                                      
 var tmp2: bool;                                                                                    
 var v2622851: int;                                                                                 
 var Stack._lock2622870: [Stack]Tid;                                                                
 var $pc2622888: Phase;                                                                             
 var ctmp2607527: bool;                                                                             
 var this2622863: Stack;                                                                            
 var _R_t2622740: Mover;                                                                            
 var Stack.top_nextThread2622745: [Stack]Tid;                                                       
 var Stack.top2622745: [Stack]int;                                                                  
 var moverPath2622848: MoverPath;                                                                   
 var Stack.top_nextValue2622702: [Stack]int;                                                        
 var Stack.top_nextThread2622848: [Stack]Tid;                                                       
 var Stack.top2622889: [Stack]int;                                                                  
 var Stack._state2622702: [Stack]State;                                                             
 var $recorded.state2622851: int;                                                                   
 var _currentValue2622851: int;                                                                     
 var x2622690: int;                                                                                 
 var tid2622690: Tid;                                                                               
 var Stack._lock2622825: [Stack]Tid;                                                                
 var Stack._state2622889: [Stack]State;                                                             
 var Stack._lock2622696: [Stack]Tid;                                                                
 var v2622889: int;                                                                                 
 var path2622740: int;                                                                              
 var tmp22622885: bool;                                                                             
 var $recorded.state2622745: int;                                                                   
 var tid2622851: Tid;                                                                               
 var tid2622848: Tid;                                                                               
 var tmp12622848: bool;                                                                             
 var _currentValue2622870: int;                                                                     
 var this2622848: Stack;                                                                            
 var Stack.top_nextValue2622848: [Stack]int;                                                        
 var _C_v: int;                                                                                     
 var Stack._state2622745: [Stack]State;                                                             
 var tmp32622851: int;                                                                              
 var this2622885: Stack;                                                                            
 var _currentValue2622740: int;                                                                     
 var _casable2622745: bool;                                                                         
 var v2622888: int;                                                                                 
 var tmp12622825: bool;                                                                             
 var x2622870: int;                                                                                 
 var Stack.top_nextThread2622888: [Stack]Tid;                                                       
 var Stack._state2622818: [Stack]State;                                                             
 var moverPath2622740: MoverPath;                                                                   
 var this2622696: Stack;                                                                            
 var Stack._state2622888: [Stack]State;                                                             
 var $recorded.state2622696: int;                                                                   
 var path2622848: int;                                                                              
 var $recorded.state2622690: int;                                                                   
 var Stack.top_nextValue2622885: [Stack]int;                                                        
 var moverPath2622825: MoverPath;                                                                   
 var this2622885_post: Stack;                                                                       
 var tmpTid2622818: Tid;                                                                            
 var tmp12622740: bool;                                                                             
 var path2622702: int;                                                                              
 var tmp32622885_post: int;                                                                         
 var tmp22622885_post: bool;                                                                        
 var this2622821: Stack;                                                                            
 var _m2622818: Mover;                                                                              
 var $recorded.state2622888_bottom: int;                                                            
 var $recorded.state2622870: int;                                                                   
 var $pc2622863: Phase;                                                                             
 var Stack._state2622888_bottom: [Stack]State;                                                      
 var tmp12622851: bool;                                                                             
 var Stack.top2622888_bottom: [Stack]int;                                                           
 var Stack._lock2622848: [Stack]Tid;                                                                
 var tmp22622870: bool;                                                                             
 var $pc2622888_bottom: Phase;                                                                      
 var v2622821: int;                                                                                 
 var moverPath2622818: MoverPath;                                                                   
 var tmp32622821: int;                                                                              
 var tid2622745: Tid;                                                                               
 var Stack.top_nextValue2622690: [Stack]int;                                                        
 var tmp22622848: bool;                                                                             
 var moverPath2622821: MoverPath;                                                                   
 var $recorded.state2622889: int;                                                                   
 var Stack.top_nextThread2622690: [Stack]Tid;                                                       
 var this2622851: Stack;                                                                            
 var ctmp26075272622851: bool;                                                                      
 var $recorded.state2622702: int;                                                                   
 var _C_t2622690: Tid;                                                                              
 var tmp32622863: int;                                                                              
 var x2622818: int;                                                                                 
 var v2622818: int;                                                                                 
 var ctmp26075272622825: bool;                                                                      
 var Stack._lock2622851: [Stack]Tid;                                                                
 var Stack._state2622851: [Stack]State;                                                             
 var Stack.top2622702: [Stack]int;                                                                  
 var $pc2622745: Phase;                                                                             
 var $recorded.state2622825: int;                                                                   
 var mover2622740: Mover;                                                                           
 var tmp12622863: bool;                                                                             
 var mover2622690: Mover;                                                                           
 var tid2622888_bottom: Tid;                                                                        
 var $recorded.state2622818: int;                                                                   
 var Stack._lock2622690: [Stack]Tid;                                                                
 var tid2622821: Tid;                                                                               
 var v2622888_bottom: int;                                                                          
 var path2622821: int;                                                                              
 var $recorded.state2622848: int;                                                                   
 var Stack._state2622696: [Stack]State;                                                             
 var Stack._lock2622702: [Stack]Tid;                                                                
 var Stack.top_nextValue2622885_post: [Stack]int;                                                   
 var this2622690: Stack;                                                                            
 var v2622702: int;                                                                                 
 var _R_t: Mover;                                                                                   
 var $pc2622851: Phase;                                                                             
 var Stack._lock2622740: [Stack]Tid;                                                                
 var tmp32622885: int;                                                                              
 var Stack.top_nextThread2622818: [Stack]Tid;                                                       
 var path2622818: int;                                                                              
 var Stack._state2622870: [Stack]State;                                                             
 var v2622690: int;                                                                                 
 var _m: Mover;                                                                                     
 var v2622885: int;                                                                                 
 var tid2622696: Tid;                                                                               
 var Stack.top2622690: [Stack]int;                                                                  
 var mover2622851: Mover;                                                                           
 var mover2622825: Mover;                                                                           
 var Stack.top_nextThread2622702: [Stack]Tid;                                                       
 var this2622745: Stack;                                                                            
 var this2622702: Stack;                                                                            
 var tid2622863: Tid;                                                                               
 var Stack.top_nextValue2622745: [Stack]int;                                                        
 var this2622870: Stack;                                                                            
 var Stack._lock2622889: [Stack]Tid;                                                                
 var Stack.top_nextThread2622863: [Stack]Tid;                                                       
 var Stack.top2622740: [Stack]int;                                                                  
 var Stack.top2622818: [Stack]int;                                                                  
 var Stack.top2622825: [Stack]int;                                                                  
 var x2622848: int;                                                                                 
 var Stack.top_nextValue2622818: [Stack]int;                                                        
 var tmpValue2622825: int;                                                                          
 var Stack.top_nextThread2622885: [Stack]Tid;                                                       
 var tmp22622825: bool;                                                                             
 var v2622825: int;                                                                                 
 var Stack.top2622888: [Stack]int;                                                                  
 var _C_v2622702: int;                                                                              
 var this2622740: Stack;                                                                            
 var Stack._state2622690: [Stack]State;                                                             
 var $pc2622885: Phase;                                                                             
 var this2622889: Stack;                                                                            
 var Stack._state2622848: [Stack]State;                                                             
 var $pc2622696: Phase;                                                                             
 var $pc2622740: Phase;                                                                             
 var tid2622870: Tid;                                                                               
 var _currentValue2622702: int;                                                                     
 var Stack.top2622851: [Stack]int;                                                                  
 var Stack.top_nextValue2622888_bottom: [Stack]int;                                                 
 var Stack.top_nextValue2622821: [Stack]int;                                                        
 var tmp12622821: bool;                                                                             
 var tmp12622702: bool;                                                                             
 var Stack.top2622848: [Stack]int;                                                                  
 var tmpTid2622821: Tid;                                                                            
 var tmpValue2622821: int;                                                                          
 var Stack.top_nextValue2622863: [Stack]int;                                                        
 var Stack._lock2622863: [Stack]Tid;                                                                
 var moverPath2622851: MoverPath;                                                                   
 var v2622885_post: int;                                                                            
 var Stack.top_nextThread2622825: [Stack]Tid;                                                       
 var Stack.top_nextThread2622889: [Stack]Tid;                                                       
 var mover2622818: Mover;                                                                           
 var tmp32622825: int;                                                                              
 var tmpTid: Tid;                                                                                   
 var Stack._state2622740: [Stack]State;                                                             
 var $recorded.state2622821: int;                                                                   
 var _C_v2622740: int;                                                                              
 var x2622885: int;                                                                                 
 var _R_t2622745: Mover;                                                                            
 var tmp3: int;                                                                                     
 var Stack._lock2622885: [Stack]Tid;                                                                
 var v2622863: int;                                                                                 
 var Stack._state2622885: [Stack]State;                                                             
 var Stack.top_nextValue2622825: [Stack]int;                                                        
 var path2622851: int;                                                                              
 var v2622740: int;                                                                                 
 var tmp22622818: bool;                                                                             
 var $pc2622702: Phase;                                                                             
 var path2622870: int;                                                                              
 var moverPath2622745: MoverPath;                                                                   
 var x2622885_post: int;                                                                            
 var mover2622696: Mover;                                                                           
 var $pc2622690: Phase;                                                                             
 var tmpValue2622818: int;                                                                          
 var tid2622885: Tid;                                                                               
 var $pc2622848: Phase;                                                                             
 var v2622696: int;                                                                                 
 var $recorded.state2622885_post: int;                                                              
 var Stack.top2622696: [Stack]int;                                                                  
 var x2622696: int;                                                                                 
 var path2622825: int;                                                                              
 var $pc2622821: Phase;                                                                             
 var x2622851: int;                                                                                 
 var $recorded.state2622885: int;                                                                   
 var Stack.top_nextValue2622870: [Stack]int;                                                        
 var Stack._lock2622818: [Stack]Tid;                                                                
 var mover2622863: Mover;                                                                           
 var Stack.top2622821: [Stack]int;                                                                  
 var _C_t2622740: Tid;                                                                              
 var this2622888: Stack;                                                                            
 var Stack.top2622885_post: [Stack]int;                                                             
 var tmp12622745: bool;                                                                             
 var _m2622863: Mover;                                                                              
 var Stack.top_nextThread2622888_bottom: [Stack]Tid;                                                
 var Stack._state2622821: [Stack]State;                                                             
 var tid2622888: Tid;                                                                               
 var tid2622740: Tid;                                                                               
 var _C_t2622745: Tid;                                                                              
 var this2622825: Stack;                                                                            
 var Stack._lock2622821: [Stack]Tid;                                                                
 var $pc2622885_post: Phase;                                                                        
 var Stack._lock2622745: [Stack]Tid;                                                                
 var $recorded.state2622888: int;                                                                   
 var mover2622848: Mover;                                                                           
 var Stack.top_nextValue2622696: [Stack]int;                                                        
 var ctmp26075272622870: bool;                                                                      
 var Stack.top2622870: [Stack]int;                                                                  
 var Stack.top2622885: [Stack]int;                                                                  
 var x2622825: int;                                                                                 
 var Stack.top2622863: [Stack]int;                                                                  
 var tmp12622818: bool;                                                                             
 var path2622696: int;                                                                              
 var path2622690: int;                                                                              
 var v2622848: int;                                                                                 
 var mover2622870: Mover;                                                                           
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 assume Stack._state2622888 == Stack._state && Stack.top2622888 == Stack.top && Stack._lock2622888 == Stack._lock && Stack.top_nextThread2622888 == Stack.top_nextThread && Stack.top_nextValue2622888 == Stack.top_nextValue && v2622888 == v && this2622888 == this && tid2622888 == tid;
 assume $recorded.state2622888 == 1;                                                                
                                                                                                    
 // 10.9: while (true)   {                                                                          
                                                                                                    
 phase2622888 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (8.5): Bad tid
  invariant isShared(Stack._state[this]);                                                                  // (8.5): this is not global
                                                                                                    
  invariant StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
  invariant (forall _this : Stack :: Invariant.Y_Stack.top(tid : Tid, _this, Stack.top[_this] ,Stack._state2622888,Stack.top2622888,Stack._lock2622888,Stack.top_nextThread2622888,Stack.top_nextValue2622888));       // (10.9): Loop does not preserve yields_as annotation for field top
  invariant phase2622888 == $pc;                                                                           // (10.9): Phase must be invariant at loop head
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
                                                                                                    
  // 13.13: int x;                                                                                  
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 13.13: Tid _C_t;                                                                               
                                                                                                    
                                                                                                    
  // 13.13: _C_t := this.top_nextThread  as B;                                                      
                                                                                                    
                                                                                                    
  moverPath2622690 := ReadEval.Stack.top_nextThread(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
  mover2622690 := m#moverPath(moverPath2622690);                                                    
  path2622690 := p#moverPath(moverPath2622690);                                                     
  assume Stack._state2622690 == Stack._state && Stack.top2622690 == Stack.top && Stack._lock2622690 == Stack._lock && Stack.top_nextThread2622690 == Stack.top_nextThread && Stack.top_nextValue2622690 == Stack.top_nextValue && _C_t2622690 == _C_t && x2622690 == x && tmp12622690 == tmp1 && v2622690 == v && this2622690 == this && tid2622690 == tid && $pc2622690 == $pc;
  assume $recorded.state2622690 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (13.13): Reduction failure
  _C_t := Stack.top_nextThread[this];                                                               
                                                                                                    
  // 13.13: int _C_v;                                                                               
                                                                                                    
                                                                                                    
  // 13.13: _C_v := this.top_nextValue  as B;                                                       
                                                                                                    
                                                                                                    
  moverPath2622696 := ReadEval.Stack.top_nextValue(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
  mover2622696 := m#moverPath(moverPath2622696);                                                    
  path2622696 := p#moverPath(moverPath2622696);                                                     
  assume Stack._state2622696 == Stack._state && Stack.top2622696 == Stack.top && Stack._lock2622696 == Stack._lock && Stack.top_nextThread2622696 == Stack.top_nextThread && Stack.top_nextValue2622696 == Stack.top_nextValue && _C_v2622696 == _C_v && _C_t2622696 == _C_t && x2622696 == x && tmp12622696 == tmp1 && v2622696 == v && this2622696 == this && tid2622696 == tid && $pc2622696 == $pc;
  assume $recorded.state2622696 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (13.13): Reduction failure
  _C_v := Stack.top_nextValue[this];                                                                
                                                                                                    
  // 13.13: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
  // 13.13: _currentValue := this.top  as B;                                                        
                                                                                                    
                                                                                                    
  moverPath2622702 := ReadEval.Stack.top(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
  mover2622702 := m#moverPath(moverPath2622702);                                                    
  path2622702 := p#moverPath(moverPath2622702);                                                     
  assume Stack._state2622702 == Stack._state && Stack.top2622702 == Stack.top && Stack._lock2622702 == Stack._lock && Stack.top_nextThread2622702 == Stack.top_nextThread && Stack.top_nextValue2622702 == Stack.top_nextValue && _currentValue2622702 == _currentValue && _C_v2622702 == _C_v && _C_t2622702 == _C_t && x2622702 == x && tmp12622702 == tmp1 && v2622702 == v && this2622702 == this && tid2622702 == tid && $pc2622702 == $pc;
  assume $recorded.state2622702 == 1;                                                               
  if ($pc == PreCommit) {                                                                           
   assume this != Stack.null;                                                                       
  } else {                                                                                          
   assert this != Stack.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (13.13): Reduction failure
  _currentValue := Stack.top[this];                                                                 
                                                                                                    
  // 13.13: Mover _R_t;                                                                             
                                                                                                    
                                                                                                    
  // 13.13: _R_t = readPermission(this.top);                                                        
                                                                                                    
  _R_t := m#moverPath(ReadEval.Stack.top(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue));
                                                                                                    
  // 13.13: boolean _casable;                                                                       
                                                                                                    
                                                                                                    
  // 13.13: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
                                                                                                    
  _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                          
  if (_casable) {                                                                                   
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 13.13: x := this.top  as R;                                                                   
                                                                                                    
                                                                                                    
   moverPath2622740 := ReadEval.Stack.top(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
   mover2622740 := m#moverPath(moverPath2622740);                                                   
   path2622740 := p#moverPath(moverPath2622740);                                                    
   assume Stack._state2622740 == Stack._state && Stack.top2622740 == Stack.top && Stack._lock2622740 == Stack._lock && Stack.top_nextThread2622740 == Stack.top_nextThread && Stack.top_nextValue2622740 == Stack.top_nextValue && _casable2622740 == _casable && _R_t2622740 == _R_t && _currentValue2622740 == _currentValue && _C_v2622740 == _C_v && _C_t2622740 == _C_t && x2622740 == x && tmp12622740 == tmp1 && v2622740 == v && this2622740 == this && tid2622740 == tid && $pc2622740 == $pc;
   assume $recorded.state2622740 == 1;                                                              
   if ($pc == PreCommit) {                                                                          
    assume this != Stack.null;                                                                      
   } else {                                                                                         
    assert this != Stack.null;                                                                             // (13.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _R);                                                                      
   assert $pc != PhaseError;                                                                               // (13.13): Reduction failure
   x := Stack.top[this];                                                                            
  } else {                                                                                          
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 13.13: x := this.top;                                                                         
                                                                                                    
                                                                                                    
   moverPath2622745 := ReadEval.Stack.top(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
   mover2622745 := m#moverPath(moverPath2622745);                                                   
   path2622745 := p#moverPath(moverPath2622745);                                                    
   assume Stack._state2622745 == Stack._state && Stack.top2622745 == Stack.top && Stack._lock2622745 == Stack._lock && Stack.top_nextThread2622745 == Stack.top_nextThread && Stack.top_nextValue2622745 == Stack.top_nextValue && _casable2622745 == _casable && _R_t2622745 == _R_t && _currentValue2622745 == _currentValue && _C_v2622745 == _C_v && _C_t2622745 == _C_t && x2622745 == x && tmp12622745 == tmp1 && v2622745 == v && this2622745 == this && tid2622745 == tid && $pc2622745 == $pc;
   assume $recorded.state2622745 == 1;                                                              
   if ($pc == PreCommit) {                                                                          
    assume this != Stack.null;                                                                      
   } else {                                                                                         
    assert this != Stack.null;                                                                             // (13.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover2622745);                                                            
   assert $pc != PhaseError;                                                                               // (13.13): Reduction failure
   x := Stack.top[this];                                                                            
  }                                                                                                 
                                                                                                    
  // 14.13: boolean tmp2;                                                                           
                                                                                                    
                                                                                                    
  // 14.13: int tmp3;                                                                               
                                                                                                    
                                                                                                    
  // 14.13: tmp3 = x + 1;                                                                           
                                                                                                    
  tmp3 := (x+1);                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 14.13: boolean ctmp2607527;                                                                    
                                                                                                    
                                                                                                    
  // 14.13: ctmp2607527 = *;                                                                        
                                                                                                    
  havoc ctmp2607527;                                                                                
  if (ctmp2607527) {                                                                                
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 14.13: tmp2 = false;                                                                          
                                                                                                    
   tmp2 := false;                                                                                   
  } else {                                                                                          
                                                                                                    
   // 14.13: ctmp2607527 = *;                                                                       
                                                                                                    
   havoc ctmp2607527;                                                                               
   if (ctmp2607527) {                                                                               
                                                                                                    
    // 14.13: Tid tmpTid;                                                                           
                                                                                                    
                                                                                                    
    // 14.13: int tmpValue;                                                                         
                                                                                                    
                                                                                                    
    // 14.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 14.13: _m = writePermission(this.top, tmp3);                                                 
                                                                                                    
    _m := m#moverPath(WriteEval.Stack.top(tid: Tid,this: Stack,tmp3: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue));
                                                                                                    
    // 14.13: assume this.top == x;                                                                 
                                                                                                    
    assume (Stack.top[this]==x);                                                                    
                                                                                                    
    // 14.13: assume !goesWrong(_m);                                                                
                                                                                                    
    assume !(transition($pc, _m) == PhaseError);                                                    
                                                                                                    
    // 14.13: assume this.top_nextThread == tid;                                                    
                                                                                                    
    assume (Stack.top_nextThread[this]==tid);                                                       
                                                                                                    
    // 14.13: assume this.top_nextValue == x;                                                       
                                                                                                    
    assume (Stack.top_nextValue[this]==x);                                                          
                                                                                                    
                                                                                                    
    // 14.13: this.top_nextThread := tmpTid as B;                                                   
                                                                                                    
                                                                                                    
    moverPath2622818 := WriteEval.Stack.top_nextThread(tid: Tid,this: Stack,tmpTid: Tid,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622818 := m#moverPath(moverPath2622818);                                                  
    path2622818 := p#moverPath(moverPath2622818);                                                   
    assume Stack._state2622818 == Stack._state && Stack.top2622818 == Stack.top && Stack._lock2622818 == Stack._lock && Stack.top_nextThread2622818 == Stack.top_nextThread && Stack.top_nextValue2622818 == Stack.top_nextValue && _m2622818 == _m && tmpValue2622818 == tmpValue && tmpTid2622818 == tmpTid && ctmp26075272622818 == ctmp2607527 && tmp32622818 == tmp3 && tmp22622818 == tmp2 && x2622818 == x && tmp12622818 == tmp1 && v2622818 == v && this2622818 == this && tid2622818 == tid && $pc2622818 == $pc;
    assume $recorded.state2622818 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    Stack.top_nextThread[this] := tmpTid;                                                           
                                                                                                    
                                                                                                    
    // 14.13: this.top_nextValue := tmpValue as B;                                                  
                                                                                                    
                                                                                                    
    moverPath2622821 := WriteEval.Stack.top_nextValue(tid: Tid,this: Stack,tmpValue: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622821 := m#moverPath(moverPath2622821);                                                  
    path2622821 := p#moverPath(moverPath2622821);                                                   
    assume Stack._state2622821 == Stack._state && Stack.top2622821 == Stack.top && Stack._lock2622821 == Stack._lock && Stack.top_nextThread2622821 == Stack.top_nextThread && Stack.top_nextValue2622821 == Stack.top_nextValue && _m2622821 == _m && tmpValue2622821 == tmpValue && tmpTid2622821 == tmpTid && ctmp26075272622821 == ctmp2607527 && tmp32622821 == tmp3 && tmp22622821 == tmp2 && x2622821 == x && tmp12622821 == tmp1 && v2622821 == v && this2622821 == this && tid2622821 == tid && $pc2622821 == $pc;
    assume $recorded.state2622821 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    Stack.top_nextValue[this] := tmpValue;                                                          
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 14.13: this.top := tmp3;                                                                     
                                                                                                    
                                                                                                    
    moverPath2622825 := WriteEval.Stack.top(tid: Tid,this: Stack,tmp3: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622825 := m#moverPath(moverPath2622825);                                                  
    path2622825 := p#moverPath(moverPath2622825);                                                   
    assume Stack._state2622825 == Stack._state && Stack.top2622825 == Stack.top && Stack._lock2622825 == Stack._lock && Stack.top_nextThread2622825 == Stack.top_nextThread && Stack.top_nextValue2622825 == Stack.top_nextValue && _m2622825 == _m && tmpValue2622825 == tmpValue && tmpTid2622825 == tmpTid && ctmp26075272622825 == ctmp2607527 && tmp32622825 == tmp3 && tmp22622825 == tmp2 && x2622825 == x && tmp12622825 == tmp1 && v2622825 == v && this2622825 == this && tid2622825 == tid && $pc2622825 == $pc;
    assume $recorded.state2622825 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover2622825);                                                           
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    Stack.top[this] := tmp3;                                                                        
                                                                                                    
    // 14.13: tmp2 = true;                                                                          
                                                                                                    
    tmp2 := true;                                                                                   
   } else {                                                                                         
                                                                                                    
    // 14.13: assume this.top_nextThread == tid;                                                    
                                                                                                    
    assume (Stack.top_nextThread[this]==tid);                                                       
                                                                                                    
    // 14.13: assume this.top_nextValue == x;                                                       
                                                                                                    
    assume (Stack.top_nextValue[this]==x);                                                          
                                                                                                    
    // 14.13: int _currentValue;                                                                    
                                                                                                    
                                                                                                    
    // 14.13: _currentValue := this.top  as B;                                                      
                                                                                                    
                                                                                                    
    moverPath2622848 := ReadEval.Stack.top(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622848 := m#moverPath(moverPath2622848);                                                  
    path2622848 := p#moverPath(moverPath2622848);                                                   
    assume Stack._state2622848 == Stack._state && Stack.top2622848 == Stack.top && Stack._lock2622848 == Stack._lock && Stack.top_nextThread2622848 == Stack.top_nextThread && Stack.top_nextValue2622848 == Stack.top_nextValue && _currentValue2622848 == _currentValue && ctmp26075272622848 == ctmp2607527 && tmp32622848 == tmp3 && tmp22622848 == tmp2 && x2622848 == x && tmp12622848 == tmp1 && v2622848 == v && this2622848 == this && tid2622848 == tid && $pc2622848 == $pc;
    assume $recorded.state2622848 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
                                                                                                    
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    _currentValue := Stack.top[this];                                                               
                                                                                                    
                                                                                                    
    // 14.13: this.top := x as B;                                                                   
                                                                                                    
                                                                                                    
    moverPath2622851 := WriteEval.Stack.top(tid: Tid,this: Stack,x: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622851 := m#moverPath(moverPath2622851);                                                  
    path2622851 := p#moverPath(moverPath2622851);                                                   
    assume Stack._state2622851 == Stack._state && Stack.top2622851 == Stack.top && Stack._lock2622851 == Stack._lock && Stack.top_nextThread2622851 == Stack.top_nextThread && Stack.top_nextValue2622851 == Stack.top_nextValue && _currentValue2622851 == _currentValue && ctmp26075272622851 == ctmp2607527 && tmp32622851 == tmp3 && tmp22622851 == tmp2 && x2622851 == x && tmp12622851 == tmp1 && v2622851 == v && this2622851 == this && tid2622851 == tid && $pc2622851 == $pc;
    assume $recorded.state2622851 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    Stack.top[this] := x;                                                                           
                                                                                                    
    // 14.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 14.13: _m = writePermission(this.top, tmp3);                                                 
                                                                                                    
    _m := m#moverPath(WriteEval.Stack.top(tid: Tid,this: Stack,tmp3: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue));
                                                                                                    
                                                                                                    
    // 14.13: this.top := _currentValue as B;                                                       
                                                                                                    
                                                                                                    
    moverPath2622863 := WriteEval.Stack.top(tid: Tid,this: Stack,_currentValue: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622863 := m#moverPath(moverPath2622863);                                                  
    path2622863 := p#moverPath(moverPath2622863);                                                   
    assume Stack._state2622863 == Stack._state && Stack.top2622863 == Stack.top && Stack._lock2622863 == Stack._lock && Stack.top_nextThread2622863 == Stack.top_nextThread && Stack.top_nextValue2622863 == Stack.top_nextValue && _m2622863 == _m && _currentValue2622863 == _currentValue && ctmp26075272622863 == ctmp2607527 && tmp32622863 == tmp3 && tmp22622863 == tmp2 && x2622863 == x && tmp12622863 == tmp1 && v2622863 == v && this2622863 == this && tid2622863 == tid && $pc2622863 == $pc;
    assume $recorded.state2622863 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    Stack.top[this] := _currentValue;                                                               
                                                                                                    
    // 14.13: assume goesWrong(_m);                                                                 
                                                                                                    
    assume transition($pc, _m) == PhaseError;                                                       
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 14.13: this.top := tmp3;                                                                     
                                                                                                    
                                                                                                    
    moverPath2622870 := WriteEval.Stack.top(tid: Tid,this: Stack,tmp3: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
    mover2622870 := m#moverPath(moverPath2622870);                                                  
    path2622870 := p#moverPath(moverPath2622870);                                                   
    assume Stack._state2622870 == Stack._state && Stack.top2622870 == Stack.top && Stack._lock2622870 == Stack._lock && Stack.top_nextThread2622870 == Stack.top_nextThread && Stack.top_nextValue2622870 == Stack.top_nextValue && _m2622870 == _m && _currentValue2622870 == _currentValue && ctmp26075272622870 == ctmp2607527 && tmp32622870 == tmp3 && tmp22622870 == tmp2 && x2622870 == x && tmp12622870 == tmp1 && v2622870 == v && this2622870 == this && tid2622870 == tid && $pc2622870 == $pc;
    assume $recorded.state2622870 == 1;                                                             
    if ($pc == PreCommit) {                                                                         
     assume this != Stack.null;                                                                     
    } else {                                                                                        
     assert this != Stack.null;                                                                            // (14.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover2622870);                                                           
    assert $pc != PhaseError;                                                                              // (14.13): Reduction failure
    Stack.top[this] := tmp3;                                                                        
                                                                                                    
    // 14.13: tmp2 = false;                                                                         
                                                                                                    
    tmp2 := false;                                                                                  
   }                                                                                                
  }                                                                                                 
  if (tmp2) {                                                                                       
                                                                                                    
   // 15.17: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 17.13: yield;                                                                                  
                                                                                                    
  assume Stack._state2622885 == Stack._state && Stack.top2622885 == Stack.top && Stack._lock2622885 == Stack._lock && Stack.top_nextThread2622885 == Stack.top_nextThread && Stack.top_nextValue2622885 == Stack.top_nextValue && tmp32622885 == tmp3 && tmp22622885 == tmp2 && x2622885 == x && tmp12622885 == tmp1 && v2622885 == v && this2622885 == this && tid2622885 == tid;
  assume $recorded.state2622885 == 1;                                                               
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Stack._state2622885_post == Stack._state && Stack.top2622885_post == Stack.top && Stack._lock2622885_post == Stack._lock && Stack.top_nextThread2622885_post == Stack.top_nextThread && Stack.top_nextValue2622885_post == Stack.top_nextValue && tmp32622885_post == tmp3 && tmp22622885_post == tmp2 && x2622885_post == x && tmp12622885_post == tmp1 && v2622885_post == v && this2622885_post == this && tid2622885_post == tid;
  assume $recorded.state2622885_post == 1;                                                          
  assume Stack._state2622888_bottom == Stack._state && Stack.top2622888_bottom == Stack.top && Stack._lock2622888_bottom == Stack._lock && Stack.top_nextThread2622888_bottom == Stack.top_nextThread && Stack.top_nextValue2622888_bottom == Stack.top_nextValue && v2622888_bottom == v && this2622888_bottom == this && tid2622888_bottom == tid;
  assume $recorded.state2622888_bottom == 1;                                                        
  assert phase2622888 == $pc;                                                                              // (10.9): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 9.26: // return;                                                                                
                                                                                                    
 assume Stack._state2622889 == Stack._state && Stack.top2622889 == Stack.top && Stack._lock2622889 == Stack._lock && Stack.top_nextThread2622889 == Stack.top_nextThread && Stack.top_nextValue2622889 == Stack.top_nextValue && v2622889 == v && this2622889 == this && tid2622889 == tid;
 assume $recorded.state2622889 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Stack._state: [Stack]State,Stack.top: [Stack]int,Stack._lock: [Stack]Tid,Stack.top_nextThread: [Stack]Tid,Stack.top_nextValue: [Stack]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Stack  :: _i == Stack.null <==> isNull(Stack._state[_i])) &&                          
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Stack.top(t: Tid, u: Tid, v: int, w: int, x: Stack)          
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.top;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Stack.top[x] := v;                                                                                 
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Stack.top(u: Tid,x: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Stack.top failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Stack.top(t: Tid, u: Tid, v: int, w: int, x: Stack)           
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.top;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Stack.top[x] := v;                                                                                 
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Stack.top(u: Tid,x: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.3): Stack.top failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Stack.top(t: Tid, u: Tid, v: int, w: int, x: Stack)           
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.top;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Stack.top[x];                                                                          
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Stack.top[x] := havocValue;                                                                        
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Stack.top(u: Tid,x: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.3): Stack.top failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Stack.top(t: Tid, u: Tid, v: int, w: int, x: Stack)            
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.top;                                                                                
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Stack.top[x];                                                                          
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Stack.top(u: Tid,x: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.3): Stack.top failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Stack.top(t: Tid, u: Tid, v: int, w: int, x: Stack)                
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.top;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Stack.top(t: Tid,x: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Stack.top(u: Tid,x: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Stack.top failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Stack.top(t: Tid, u: Tid, v: int, w: int, x: Stack)                 
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[x], u);                                                         
 modifies Stack.top;                                                                                
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
                                                                                                    
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Stack.top[x];                                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Stack.top(t: Tid,x: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Stack.top[x] := havocValue;                                                                        
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Stack.top(u: Tid,x: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.3): Stack.top failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Stack.top.Stack.top(t: Tid, u: Tid, v: int, w: int, w0: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.top[x] := v;                                                                                 
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Stack.top.Stack.top(t: Tid, u: Tid, v: int, w: int, w0: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack._state_mid: [Stack]State;                                                                
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Stack.top_nextValue_mid: [Stack]int;                                                           
 var w_mid: int;                                                                                    
 var Stack.top_nextThread_mid: [Stack]Tid;                                                          
 var y_mid: Stack;                                                                                  
 var Stack.top_mid: [Stack]int;                                                                     
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var x_mid: Stack;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Stack.top[x];                                                                              
 Stack.top[x] := v;                                                                                 
                                                                                                    
 assume Stack._state_mid == Stack._state && Stack.top_mid == Stack.top && Stack._lock_mid == Stack._lock && Stack.top_nextThread_mid == Stack.top_nextThread && Stack.top_nextValue_mid == Stack.top_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Stack.top[x] := tmpV;                                                                              
 Stack.top[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Stack.top.Stack.top(t: Tid, u: Tid, v: int, w: int, w0: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack._state_mid: [Stack]State;                                                                
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Stack.top_nextValue_mid: [Stack]int;                                                           
 var w_mid: int;                                                                                    
 var Stack.top_nextThread_mid: [Stack]Tid;                                                          
 var y_mid: Stack;                                                                                  
 var Stack.top_mid: [Stack]int;                                                                     
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var x_mid: Stack;                                                                                  
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Stack.top[x];                                                                              
 Stack.top[x] := v;                                                                                 
 assume Stack._state_mid == Stack._state && Stack.top_mid == Stack.top && Stack._lock_mid == Stack._lock && Stack.top_nextThread_mid == Stack.top_nextThread && Stack.top_nextValue_mid == Stack.top_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Stack.top[x] := tmpV;                                                                              
 Stack.top[y] := w;                                                                                 
 _writeByTPost := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Stack.top.Stack.top(t: Tid, u: Tid, v: int, w: int, w0: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Stack.top(t: Tid,x: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.top[y] := w;                                                                                 
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Stack.top(t: Tid,x: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Stack.top is not Read-Write Stable with respect to Stack.top (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Stack.top is not Read-Write Stable with respect to Stack.top (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.3): Stack.top is not Read-Write Stable with respect to Stack.top (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Stack.top.Stack.top(t: Tid, u: Tid, v: int, w: int, w0: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Stack.top(u: Tid,y: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Stack.top[x] := v;                                                                                 
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Stack.top(u: Tid,y: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Stack.top is not Write-Read Stable with respect to Stack.top (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.3): Stack.top is not Write-Read Stable with respect to Stack.top (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.3): Stack.top is not Write-Read Stable with respect to Stack.top (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.Stack.top.Stack.top(t: Tid, u: Tid, v: int, w1: int, w2: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var w1_pre: int;                                                                                   
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack._state_mid: [Stack]State;                                                                
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Stack.top_nextValue_mid: [Stack]int;                                                           
 var Stack.top_nextThread_mid: [Stack]Tid;                                                          
 var y_mid: Stack;                                                                                  
 var Stack.top_mid: [Stack]int;                                                                     
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var v_mid: int;                                                                                    
 var w2_mid: int;                                                                                   
 var x_mid: Stack;                                                                                  
 var w1_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Stack;                                                                                 
 var w2_post: int;                                                                                  
 var Stack._state_post: [Stack]State;                                                               
 var w1_post: int;                                                                                  
 var $recorded.state_post: int;                                                                     
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var v_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.top(u: Tid,y: Stack,w1: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := Stack.top[y];                                                                              
 Stack.top[y] := w1;                                                                                
                                                                                                    
 assume Stack._state_mid == Stack._state && Stack.top_mid == Stack.top && Stack._lock_mid == Stack._lock && Stack.top_nextThread_mid == Stack.top_nextThread && Stack.top_nextValue_mid == Stack.top_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.Stack.top(u: Tid,y: Stack,w2: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 Stack.top[y] := tmpW;                                                                              
                                                                                                    
 Stack.top[x] := v;                                                                                 
 Stack.top[y] := w1;                                                                                
                                                                                                    
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.Stack.top(u: Tid,y: Stack,w2: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.Stack.top.Stack.top(t: Tid, u: Tid, v1: int, v2: int, w: int, x: Stack, y: Stack)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Stack._state[x], t);                                                         
 requires isAccessible(Stack._state[y], u);                                                         
 modifies Stack.top;                                                                                
 modifies Stack.top;                                                                                
                                                                                                    
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
 var v1_pre: int;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Stack.top_pre: [Stack]int;                                                                     
 var x_pre: Stack;                                                                                  
 var w_pre: int;                                                                                    
 var Stack._lock_pre: [Stack]Tid;                                                                   
 var $pc_pre: Phase;                                                                                
 var v2_pre: int;                                                                                   
 var Stack.top_nextThread_pre: [Stack]Tid;                                                          
 var Stack._state_pre: [Stack]State;                                                                
 var Stack.top_nextValue_pre: [Stack]int;                                                           
 var t_pre: Tid;                                                                                    
 var y_pre: Stack;                                                                                  
                                                                                                    
 var Stack._state_mid: [Stack]State;                                                                
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Stack.top_nextValue_mid: [Stack]int;                                                           
 var w_mid: int;                                                                                    
 var v1_mid: int;                                                                                   
 var Stack.top_nextThread_mid: [Stack]Tid;                                                          
 var y_mid: Stack;                                                                                  
 var Stack.top_mid: [Stack]int;                                                                     
 var Stack._lock_mid: [Stack]Tid;                                                                   
 var x_mid: Stack;                                                                                  
 var v2_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Stack;                                                                                 
 var Stack._state_post: [Stack]State;                                                               
 var $recorded.state_post: int;                                                                     
 var v1_post: int;                                                                                  
 var Stack.top_nextValue_post: [Stack]int;                                                          
 var t_post: Tid;                                                                                   
 var Stack.top_nextThread_post: [Stack]Tid;                                                         
 var $pc_post: Phase;                                                                               
 var Stack._lock_post: [Stack]Tid;                                                                  
 var w_post: int;                                                                                   
 var Stack.top_post: [Stack]int;                                                                    
 var x_post: Stack;                                                                                 
 var v2_post: int;                                                                                  
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Stack.top(u: Tid,y: Stack,w: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := Stack.top[x];                                                                              
 Stack.top[x] := v1;                                                                                
 _writeByTAfterT := WriteEval.Stack.top(t: Tid,x: Stack,v2: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 Stack.top[x] := tmpV;                                                                              
                                                                                                    
 Stack.top[y] := w;                                                                                 
 assume Stack._state_mid == Stack._state && Stack.top_mid == Stack.top && Stack._lock_mid == Stack._lock && Stack.top_nextThread_mid == Stack.top_nextThread && Stack.top_nextValue_mid == Stack.top_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.Stack.top(t: Tid,x: Stack,v1: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 Stack.top[x] := v1;                                                                                
 _writeByTAfterUAndT := WriteEval.Stack.top(t: Tid,x: Stack,v2: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume Stack._state_post == Stack._state && Stack.top_post == Stack.top && Stack._lock_post == Stack._lock && Stack.top_nextThread_post == Stack.top_nextThread && Stack.top_nextValue_post == Stack.top_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
requires ValidTid(tid);                                                                             
modifies Stack._state;                                                                              
modifies Stack.top;                                                                                 
modifies Stack._lock;                                                                               
modifies Stack.top_nextThread;                                                                      
modifies Stack.top_nextValue;                                                                       
ensures StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
ensures Y(tid , old(Stack._state), old(Stack.top), old(Stack._lock), old(Stack.top_nextThread), old(Stack.top_nextValue) , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
                                                                                                    
// Stack.top:                                                                                       
                                                                                                    
function {:inline} Y_Stack.top(tid : Tid, this: Stack, newValue: int , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack.top(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)), _R)) ==> (Stack.top[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack.top(tid : Tid, this: Stack, newValue: int , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Stack.top.Subsumes.W(tid : Tid, u : Tid, this: Stack, newValue: int , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Stack._lock_yield: [Stack]Tid;                                                                  
var Stack.top_nextThread_yield: [Stack]Tid;                                                         
var Stack.top_yield: [Stack]int;                                                                    
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var u_yield: Tid;                                                                                   
var Stack._state_yield: [Stack]State;                                                               
var Stack.top_nextValue_yield: [Stack]int;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume isAccessible(Stack._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Stack.top(u: Tid,this: Stack,newValue: int,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)));
                                                                                                    
assume Stack._state_yield == Stack._state && Stack.top_yield == Stack.top && Stack._lock_yield == Stack._lock && Stack.top_nextThread_yield == Stack.top_nextThread && Stack.top_nextValue_yield == Stack.top_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack.top(tid, this, newValue , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Stack.top.Reflexive(tid : Tid, this: Stack , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Stack._lock_yield: [Stack]Tid;                                                                  
var Stack.top_nextThread_yield: [Stack]Tid;                                                         
var Stack.top_yield: [Stack]int;                                                                    
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var Stack._state_yield: [Stack]State;                                                               
var Stack.top_nextValue_yield: [Stack]int;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
assume Stack._state_yield == Stack._state && Stack.top_yield == Stack.top && Stack._lock_yield == Stack._lock && Stack.top_nextThread_yield == Stack.top_nextThread && Stack.top_nextValue_yield == Stack.top_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack.top(tid, this, Stack.top[this] , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Stack.top.Transitive(tid : Tid, this: Stack, newValue : int , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int , Stack._state_p: [Stack]State, Stack.top_p: [Stack]int, Stack._lock_p: [Stack]Tid, Stack.top_nextThread_p: [Stack]Tid, Stack.top_nextValue_p: [Stack]int)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires StateInvariant(Stack._state_p, Stack.top_p, Stack._lock_p, Stack.top_nextThread_p, Stack.top_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Stack.top_pre: [Stack]int;                                                                      
var this_pre: Stack;                                                                                
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Stack.top_nextThread_pre: [Stack]Tid;                                                           
var Stack._state_pre: [Stack]State;                                                                 
var Stack.top_nextValue_pre: [Stack]int;                                                            
                                                                                                    
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var this_post: Stack;                                                                               
var Stack.top_nextValue_post: [Stack]int;                                                           
var Stack.top_nextThread_post: [Stack]Tid;                                                          
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Stack.top_post: [Stack]int;                                                                     
                                                                                                    
assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume Y(tid , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue , Stack._state_p, Stack.top_p, Stack._lock_p, Stack.top_nextThread_p, Stack.top_nextValue_p);
 assume Y_Stack.top(tid, this, newValue , Stack._state_p, Stack.top_p, Stack._lock_p, Stack.top_nextThread_p, Stack.top_nextValue_p);
assume Stack._state_post == Stack._state_p && Stack.top_post == Stack.top_p && Stack._lock_post == Stack._lock_p && Stack.top_nextThread_post == Stack.top_nextThread_p && Stack.top_nextValue_post == Stack.top_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Stack.top(tid, this, newValue , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
}                                                                                                   
// Stack._lock:                                                                                     
                                                                                                    
function {:inline} Y_Stack._lock(tid : Tid, this: Stack, newValue: Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack._lock(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)), _R)) ==> (Stack._lock[this] == newValue))
 &&(((Stack._lock[this]==tid)==(newValue==tid)))                                                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack._lock(tid : Tid, this: Stack, newValue: Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Subsumes.W(tid : Tid, u : Tid, this: Stack, newValue: Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Stack._lock_yield: [Stack]Tid;                                                                  
var Stack.top_nextThread_yield: [Stack]Tid;                                                         
var newValue_yield: Tid;                                                                            
var Stack.top_yield: [Stack]int;                                                                    
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Stack._state_yield: [Stack]State;                                                               
var Stack.top_nextValue_yield: [Stack]int;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume isAccessible(Stack._state[this], u);                                                        
 assume !isError(m#moverPath(WriteEval.Stack._lock(u: Tid,this: Stack,newValue: Tid,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)));
 assume leq(m#moverPath(ReadEval.Stack._lock(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)), _N);
assume Stack._state_yield == Stack._state && Stack.top_yield == Stack.top && Stack._lock_yield == Stack._lock && Stack.top_nextThread_yield == Stack.top_nextThread && Stack.top_nextValue_yield == Stack.top_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack._lock(tid, this, newValue , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Reflexive(tid : Tid, this: Stack , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Stack._lock_yield: [Stack]Tid;                                                                  
var Stack.top_nextThread_yield: [Stack]Tid;                                                         
var Stack.top_yield: [Stack]int;                                                                    
var tid_yield: Tid;                                                                                 
var this_yield: Stack;                                                                              
var $pc_yield: Phase;                                                                               
var Stack._state_yield: [Stack]State;                                                               
var Stack.top_nextValue_yield: [Stack]int;                                                          
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
assume Stack._state_yield == Stack._state && Stack.top_yield == Stack.top && Stack._lock_yield == Stack._lock && Stack.top_nextThread_yield == Stack.top_nextThread && Stack.top_nextValue_yield == Stack.top_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Stack._lock(tid, this, Stack._lock[this] , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Stack._lock.Transitive(tid : Tid, this: Stack, newValue : Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int , Stack._state_p: [Stack]State, Stack.top_p: [Stack]int, Stack._lock_p: [Stack]Tid, Stack.top_nextThread_p: [Stack]Tid, Stack.top_nextValue_p: [Stack]int)
 requires StateInvariant(Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
 requires StateInvariant(Stack._state_p, Stack.top_p, Stack._lock_p, Stack.top_nextThread_p, Stack.top_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var $recorded.state_pre: int;                                                                       
var Stack.top_pre: [Stack]int;                                                                      
var this_pre: Stack;                                                                                
var tid_pre: Tid;                                                                                   
var Stack._lock_pre: [Stack]Tid;                                                                    
var $pc_pre: Phase;                                                                                 
var Stack.top_nextThread_pre: [Stack]Tid;                                                           
var Stack._state_pre: [Stack]State;                                                                 
var Stack.top_nextValue_pre: [Stack]int;                                                            
var newValue_pre: Tid;                                                                              
                                                                                                    
var Stack._state_post: [Stack]State;                                                                
var $recorded.state_post: int;                                                                      
var this_post: Stack;                                                                               
var Stack.top_nextValue_post: [Stack]int;                                                           
var Stack.top_nextThread_post: [Stack]Tid;                                                          
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var Stack._lock_post: [Stack]Tid;                                                                   
var Stack.top_post: [Stack]int;                                                                     
var newValue_post: Tid;                                                                             
                                                                                                    
assume Stack._state_pre == Stack._state && Stack.top_pre == Stack.top && Stack._lock_pre == Stack._lock && Stack.top_nextThread_pre == Stack.top_nextThread && Stack.top_nextValue_pre == Stack.top_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Stack._state[this], tid);                                                      
 assume Y(tid , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue , Stack._state_p, Stack.top_p, Stack._lock_p, Stack.top_nextThread_p, Stack.top_nextValue_p);
 assume Y_Stack._lock(tid, this, newValue , Stack._state_p, Stack.top_p, Stack._lock_p, Stack.top_nextThread_p, Stack.top_nextValue_p);
assume Stack._state_post == Stack._state_p && Stack.top_post == Stack.top_p && Stack._lock_post == Stack._lock_p && Stack.top_nextThread_post == Stack.top_nextThread_p && Stack.top_nextValue_post == Stack.top_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Stack._lock(tid, this, newValue , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue);
}                                                                                                   
// Stack.top_nextThread:                                                                            
                                                                                                    
function {:inline} Y_Stack.top_nextThread(tid : Tid, this: Stack, newValue: Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack.top_nextThread(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)), _R)) ==> (Stack.top_nextThread[this] == newValue))
 &&(((Stack.top_nextThread[this]==tid)==>(newValue==tid)))                                          
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack.top_nextThread(tid : Tid, this: Stack, newValue: Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// Stack.top_nextValue:                                                                             
                                                                                                    
function {:inline} Y_Stack.top_nextValue(tid : Tid, this: Stack, newValue: int , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 ((isAccessible(Stack._state[this], tid) && leq(m#moverPath(ReadEval.Stack.top_nextValue(tid: Tid,this: Stack,Stack._state,Stack.top,Stack._lock,Stack.top_nextThread,Stack.top_nextValue)), _R)) ==> (Stack.top_nextValue[this] == newValue))
 &&(((Stack.top_nextThread[this]==tid)==>(newValue==Stack.top_nextValue[this])))                    
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Stack.top_nextValue(tid : Tid, this: Stack, newValue: int , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Stack._state: [Stack]State, Stack.top: [Stack]int, Stack._lock: [Stack]Tid, Stack.top_nextThread: [Stack]Tid, Stack.top_nextValue: [Stack]int , Stack._state_p: [Stack]State, Stack.top_p: [Stack]int, Stack._lock_p: [Stack]Tid, Stack.top_nextThread_p: [Stack]Tid, Stack.top_nextValue_p: [Stack]int): bool
{                                                                                                   
 (forall this: Stack :: Y_Stack.top(tid : Tid, this, Stack.top_p[this] , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue))
 && (forall this: Stack :: Y_Stack._lock(tid : Tid, this, Stack._lock_p[this] , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue))
 && (forall this: Stack :: Y_Stack.top_nextThread(tid : Tid, this, Stack.top_nextThread_p[this] , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue))
 && (forall this: Stack :: Y_Stack.top_nextValue(tid : Tid, this, Stack.top_nextValue_p[this] , Stack._state, Stack.top, Stack._lock, Stack.top_nextThread, Stack.top_nextValue))
 && (forall _i : Stack :: isShared(Stack._state[_i]) ==> isShared(Stack._state_p[_i]))              
 && (forall _i : Stack :: isLocal(Stack._state[_i], tid) <==> isLocal(Stack._state_p[_i], tid))     
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 795.1-1518.2: (Method:8.5)
// 804.1-804.24: (8.5): Bad tid
// 805.1-805.39: (8.5): this is not global
// 1122.2-1126.14: (class anchor.sink.While:10.9)
// 1128.1-1128.27: (8.5): Bad tid
// 1129.1-1129.42: (8.5): this is not global
// 1132.1-1132.209: (10.9): Loop does not preserve yields_as annotation for field top
// 1133.1-1133.33: (10.9): Phase must be invariant at loop head
// 1134.1-1134.30: (10.9): Potentially infinite loop cannot be in post-commit phase.
// 1136.3-1138.3: (class anchor.sink.VarDeclStmt:10.16)
// 1139.3-1142.16: (class anchor.sink.Assign:10.16)
// 1144.4-1147.10: (class anchor.sink.Break:10.9)
// 1150.3-1152.3: (class anchor.sink.VarDeclStmt:13.13)
// 1154.3-1156.3: (class anchor.sink.VarDeclStmt:13.13)
// 1157.3-1174.38: (class anchor.sink.Read:13.13)
// 1169.1-1169.30: (13.13): Cannot have potential null deference in left-mover part.
// 1173.1-1173.28: (13.13): Reduction failure
// 1175.3-1177.3: (class anchor.sink.VarDeclStmt:13.13)
// 1178.3-1195.37: (class anchor.sink.Read:13.13)
// 1190.1-1190.30: (13.13): Cannot have potential null deference in left-mover part.
// 1194.1-1194.28: (13.13): Reduction failure
// 1196.3-1198.3: (class anchor.sink.VarDeclStmt:13.13)
// 1199.3-1216.36: (class anchor.sink.Read:13.13)
// 1211.1-1211.30: (13.13): Cannot have potential null deference in left-mover part.
// 1215.1-1215.28: (13.13): Reduction failure
// 1217.3-1219.3: (class anchor.sink.VarDeclStmt:13.13)
// 1220.3-1223.141: (class anchor.sink.Assign:13.13)
// 1224.3-1226.3: (class anchor.sink.VarDeclStmt:13.13)
// 1227.3-1230.75: (class anchor.sink.Assign:13.13)
// 1233.4-1250.25: (class anchor.sink.Read:13.13)
// 1245.1-1245.31: (13.13): Cannot have potential null deference in left-mover part.
// 1249.1-1249.29: (13.13): Reduction failure
// 1253.4-1270.25: (class anchor.sink.Read:13.13)
// 1265.1-1265.31: (13.13): Cannot have potential null deference in left-mover part.
// 1269.1-1269.29: (13.13): Reduction failure
// 1272.3-1274.3: (class anchor.sink.VarDeclStmt:14.13)
// 1275.3-1277.3: (class anchor.sink.VarDeclStmt:14.13)
// 1278.3-1281.17: (class anchor.sink.Assign:14.13)
// 1283.3-1285.3: (class anchor.sink.VarDeclStmt:14.13)
// 1286.3-1289.21: (class anchor.sink.Assign:14.13)
// 1292.4-1295.18: (class anchor.sink.Assign:14.13)
// 1297.4-1300.22: (class anchor.sink.Assign:14.13)
// 1302.5-1304.5: (class anchor.sink.VarDeclStmt:14.13)
// 1305.5-1307.5: (class anchor.sink.VarDeclStmt:14.13)
// 1308.5-1310.5: (class anchor.sink.VarDeclStmt:14.13)
// 1311.5-1314.152: (class anchor.sink.Assign:14.13)
// 1315.5-1318.33: (class anchor.sink.Assume:14.13)
// 1319.5-1322.49: (class anchor.sink.Assume:14.13)
// 1323.5-1326.46: (class anchor.sink.Assume:14.13)
// 1327.5-1330.43: (class anchor.sink.Assume:14.13)
// 1332.5-1348.42: (class anchor.sink.Write:14.13)
// 1344.1-1344.32: (14.13): Cannot have potential null deference in left-mover part.
// 1347.1-1347.30: (14.13): Reduction failure
// 1350.5-1366.43: (class anchor.sink.Write:14.13)
// 1362.1-1362.32: (14.13): Cannot have potential null deference in left-mover part.
// 1365.1-1365.30: (14.13): Reduction failure
// 1369.5-1385.29: (class anchor.sink.Write:14.13)
// 1381.1-1381.32: (14.13): Cannot have potential null deference in left-mover part.
// 1384.1-1384.30: (14.13): Reduction failure
// 1386.5-1389.18: (class anchor.sink.Assign:14.13)
// 1391.5-1394.46: (class anchor.sink.Assume:14.13)
// 1395.5-1398.43: (class anchor.sink.Assume:14.13)
// 1399.5-1401.5: (class anchor.sink.VarDeclStmt:14.13)
// 1402.5-1419.38: (class anchor.sink.Read:14.13)
// 1414.1-1414.32: (14.13): Cannot have potential null deference in left-mover part.
// 1418.1-1418.30: (14.13): Reduction failure
// 1421.5-1437.26: (class anchor.sink.Write:14.13)
// 1433.1-1433.32: (14.13): Cannot have potential null deference in left-mover part.
// 1436.1-1436.30: (14.13): Reduction failure
// 1438.5-1440.5: (class anchor.sink.VarDeclStmt:14.13)
// 1441.5-1444.152: (class anchor.sink.Assign:14.13)
// 1446.5-1462.38: (class anchor.sink.Write:14.13)
// 1458.1-1458.32: (14.13): Cannot have potential null deference in left-mover part.
// 1461.1-1461.30: (14.13): Reduction failure
// 1463.5-1466.46: (class anchor.sink.Assume:14.13)
// 1469.5-1485.29: (class anchor.sink.Write:14.13)
// 1481.1-1481.32: (14.13): Cannot have potential null deference in left-mover part.
// 1484.1-1484.30: (14.13): Reduction failure
// 1486.5-1489.19: (class anchor.sink.Assign:14.13)
// 1493.4-1496.10: (class anchor.sink.Break:15.17)
// 1499.3-1507.43: (class anchor.sink.Yield:17.13)
// 1510.1-1510.30: (10.9): Phase must be invariant at loop head
// 1512.2-1517.9: (class anchor.sink.Return:9.26)
// 1596.1-1596.34: (4.3): Stack.top failed Write-Write Right-Mover Check
// 1657.1-1657.30: (4.3): Stack.top failed Write-Read Right-Mover Check
// 1722.1-1722.34: (4.3): Stack.top failed Write-Write Left-Mover Check
// 1784.1-1784.30: (4.3): Stack.top failed Write-Read Left-Mover Check
// 1843.1-1843.34: (4.3): Stack.top failed Read-Write Right-Mover Check
// 1905.1-1905.34: (4.3): Stack.top failed Read-Write Left-Mover Check
// 1978.1-1978.140: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case A.1)
// 1979.1-1979.101: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case A.2)
// 1980.1-1980.158: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case A.3)
// 2079.1-2079.140: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case C)
// 2183.1-2183.144: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case D)
// 2184.1-2184.144: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case R)
// 2257.1-2257.136: (4.3): Stack.top is not Read-Write Stable with respect to Stack.top (case F)
// 2258.1-2258.136: (4.3): Stack.top is not Read-Write Stable with respect to Stack.top (case H)
// 2259.1-2259.146: (4.3): Stack.top is not Read-Write Stable with respect to Stack.top (case I)
// 2331.1-2331.136: (4.3): Stack.top is not Write-Read Stable with respect to Stack.top (case J)
// 2332.1-2332.136: (4.3): Stack.top is not Write-Read Stable with respect to Stack.top (case K)
// 2333.1-2333.99: (4.3): Stack.top is not Write-Read Stable with respect to Stack.top (case L)
// 2442.1-2442.142: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case M)
// 2549.1-2549.130: (4.3): Stack.top is not Write-Write Stable with respect to Stack.top (case N)
// 2583.1-2604.2: (4.3): yields_as clause for Stack.top is not valid
// 2609.1-2625.2: (4.3): yields_as clause for Stack.top is not reflexive
// 2631.1-2663.2: (4.3): yields_as clause for Stack.top is not transitive
// 2683.1-2704.2: (7.32): yields_as clause for Stack._lock is not valid
// 2709.1-2725.2: (7.32): yields_as clause for Stack._lock is not reflexive
// 2731.1-2763.2: (7.32): yields_as clause for Stack._lock is not transitive
