                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-increment-new.sink:                  
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
       int counter N                                                                                
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        boolean z;                                                                                  
        z = true;                                                                                   
        while (z)   {                                                                               
          int n;                                                                                    
          n := this.counter;                                                                        
          yield;                                                                                    
          int m;                                                                                    
          m = n + 1;                                                                                
          boolean x;                                                                                
          x = this.counter@n :~ m;                                                                  
          if (x) {                                                                                  
            break;                                                                                  
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          yield;                                                                                    
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      hasCASOperation int counter N                                                                 
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        boolean z;                                                                                  
        z = true;                                                                                   
        while (z)   {                                                                               
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
            _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
            if (_casable) {                                                                         
              noop(TraceOn);                                                                        
              n := this.counter  as R;                                                              
            } else {                                                                                
              noop(TraceOn);                                                                        
              n := this.counter;                                                                    
            }                                                                                       
          }                                                                                         
          yield;                                                                                    
          int m;                                                                                    
          m = n + 1;                                                                                
          boolean x;                                                                                
          {                                                                                         
            noop(TraceOff);                                                                         
            boolean ctmp650930;                                                                     
            ctmp650930 = *;                                                                         
            if (ctmp650930) {                                                                       
              noop(TraceOn);                                                                        
              x = false;                                                                            
            } else {                                                                                
              ctmp650930 = *;                                                                       
              if (ctmp650930) {                                                                     
                Tid tmpTid;                                                                         
                int tmpValue;                                                                       
                Mover _m;                                                                           
                _m = writePermission(this.counter, m);                                              
                assume this.counter == n;                                                           
                assume !goesWrong(_m);                                                              
                assume this.counter_nextThread == tid;                                              
                assume this.counter_nextValue == n;                                                 
                this.counter_nextThread := tmpTid as B;                                             
                this.counter_nextValue := tmpValue as B;                                            
                noop(TraceOn);                                                                      
                this.counter := m;                                                                  
                x = true;                                                                           
              } else {                                                                              
                assume this.counter_nextThread == tid;                                              
                assume this.counter_nextValue == n;                                                 
                int _currentValue;                                                                  
                _currentValue := this.counter  as B;                                                
                this.counter := n as B;                                                             
                Mover _m;                                                                           
                _m = writePermission(this.counter, m);                                              
                this.counter := _currentValue as B;                                                 
                assume goesWrong(_m);                                                               
                noop(TraceOn);                                                                      
                this.counter := m;                                                                  
                x = false;                                                                          
              }                                                                                     
            }                                                                                       
          }                                                                                         
          if (x) {                                                                                  
            {                                                                                       
              break;                                                                                
            }                                                                                       
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      hasCASOperation int counter N                                                                 
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        boolean z;                                                                                  
        z = true;                                                                                   
        while (z)   {                                                                               
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
            _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
            if (_casable) {                                                                         
              noop(TraceOn);                                                                        
              n := this.counter  as R;                                                              
            } else {                                                                                
              noop(TraceOn);                                                                        
              n := this.counter;                                                                    
            }                                                                                       
          }                                                                                         
          yield;                                                                                    
          int m;                                                                                    
          m = n + 1;                                                                                
          boolean x;                                                                                
          {                                                                                         
            noop(TraceOff);                                                                         
            boolean ctmp650930;                                                                     
            ctmp650930 = *;                                                                         
            if (ctmp650930) {                                                                       
              noop(TraceOn);                                                                        
              x = false;                                                                            
            } else {                                                                                
              ctmp650930 = *;                                                                       
              if (ctmp650930) {                                                                     
                Tid tmpTid;                                                                         
                int tmpValue;                                                                       
                Mover _m;                                                                           
                _m = writePermission(this.counter, m);                                              
                assume this.counter == n;                                                           
                assume !goesWrong(_m);                                                              
                assume this.counter_nextThread == tid;                                              
                assume this.counter_nextValue == n;                                                 
                this.counter_nextThread := tmpTid as B;                                             
                this.counter_nextValue := tmpValue as B;                                            
                noop(TraceOn);                                                                      
                this.counter := m;                                                                  
                x = true;                                                                           
              } else {                                                                              
                assume this.counter_nextThread == tid;                                              
                assume this.counter_nextValue == n;                                                 
                int _currentValue;                                                                  
                _currentValue := this.counter  as B;                                                
                this.counter := n as B;                                                             
                Mover _m;                                                                           
                _m = writePermission(this.counter, m);                                              
                this.counter := _currentValue as B;                                                 
                assume goesWrong(_m);                                                               
                noop(TraceOn);                                                                      
                this.counter := m;                                                                  
                x = false;                                                                          
              }                                                                                     
            }                                                                                       
          }                                                                                         
          if (x) {                                                                                  
            {                                                                                       
              break;                                                                                
            }                                                                                       
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          yield;                                                                                    
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc {                                                                                     
      hasCASOperation int counter N                                                                 
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void inc() {                                                                           
        boolean z;                                                                                  
        z = true;                                                                                   
        while (z)   {                                                                               
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
            _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
            if (_casable) {                                                                         
              noop(TraceOn);                                                                        
              n := this.counter  as R;                                                              
            } else {                                                                                
              noop(TraceOn);                                                                        
              n := this.counter;                                                                    
            }                                                                                       
          }                                                                                         
          yield;                                                                                    
          int m;                                                                                    
          m = n + 1;                                                                                
          boolean x;                                                                                
          {                                                                                         
            noop(TraceOff);                                                                         
            boolean ctmp650930;                                                                     
            ctmp650930 = *;                                                                         
            if (ctmp650930) {                                                                       
              noop(TraceOn);                                                                        
              x = false;                                                                            
            } else {                                                                                
              ctmp650930 = *;                                                                       
              if (ctmp650930) {                                                                     
                Tid tmpTid;                                                                         
                int tmpValue;                                                                       
                Mover _m;                                                                           
                _m = writePermission(this.counter, m);                                              
                assume this.counter == n;                                                           
                assume !goesWrong(_m);                                                              
                assume this.counter_nextThread == tid;                                              
                assume this.counter_nextValue == n;                                                 
                this.counter_nextThread := tmpTid as B;                                             
                this.counter_nextValue := tmpValue as B;                                            
                noop(TraceOn);                                                                      
                this.counter := m;                                                                  
                x = true;                                                                           
              } else {                                                                              
                assume this.counter_nextThread == tid;                                              
                assume this.counter_nextValue == n;                                                 
                int _currentValue;                                                                  
                _currentValue := this.counter  as B;                                                
                this.counter := n as B;                                                             
                Mover _m;                                                                           
                _m = writePermission(this.counter, m);                                              
                this.counter := _currentValue as B;                                                 
                assume goesWrong(_m);                                                               
                noop(TraceOn);                                                                      
                this.counter := m;                                                                  
                x = false;                                                                          
              }                                                                                     
            }                                                                                       
          }                                                                                         
          if (x) {                                                                                  
            {                                                                                       
              break;                                                                                
            }                                                                                       
          } else {                                                                                  
                                                                                                    
          }                                                                                         
          yield;                                                                                    
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
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc.counter(tid: Tid,this : Inc,newValue: int,Inc._state: [Inc]State,Inc.counter: [Inc]int,Inc._lock: [Inc]Tid,Inc.counter_nextThread: [Inc]Tid,Inc.counter_nextValue: [Inc]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
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
                                                                                                    
requires ValidTid(tid);                                                                                    // (7.5): Bad tid
requires isShared(Inc._state[this]);                                                                       // (7.5): this is not global
                                                                                                    
requires StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
                                                                                                    
ensures StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
{                                                                                                   
 var _C_t653776: Tid;                                                                               
 var z653850: bool;                                                                                 
 var Inc.counter_nextValue653919: [Inc]int;                                                         
 var Inc.counter653776: [Inc]int;                                                                   
 var _currentValue: int;                                                                            
 var tid653919: Tid;                                                                                
 var x653917: bool;                                                                                 
 var z653917_post: bool;                                                                            
 var Inc._lock653733: [Inc]Tid;                                                                     
 var moverPath653857: MoverPath;                                                                    
 var Inc.counter_nextThread653902: [Inc]Tid;                                                        
 var Inc.counter_nextThread653850: [Inc]Tid;                                                        
 var _C_t: Tid;                                                                                     
 var moverPath653771: MoverPath;                                                                    
 var $pc653776: Phase;                                                                              
 var z653727: bool;                                                                                 
 var Inc.counter_nextThread653780_post: [Inc]Tid;                                                   
 var this653721: Inc;                                                                               
 var tmpValue653850: int;                                                                           
 var Inc.counter653850: [Inc]int;                                                                   
 var m653917_post: int;                                                                             
 var Inc.counter_nextThread653883: [Inc]Tid;                                                        
 var tid653902: Tid;                                                                                
 var n653895: int;                                                                                  
 var Inc.counter_nextValue653721: [Inc]int;                                                         
 var ctmp650930653883: bool;                                                                        
 var m653880: int;                                                                                  
 var ctmp650930653850: bool;                                                                        
 var _C_v653771: int;                                                                               
 var tid653917_post: Tid;                                                                           
 var Inc.counter653917_post: [Inc]int;                                                              
 var n653771: int;                                                                                  
 var _currentValue653895: int;                                                                      
 var Inc._state653917: [Inc]State;                                                                  
 var Inc._state653780_post: [Inc]State;                                                             
 var x653857: bool;                                                                                 
 var this653853: Inc;                                                                               
 var m653917: int;                                                                                  
 var Inc._state653780: [Inc]State;                                                                  
 var Inc._lock653920: [Inc]Tid;                                                                     
 var _casable: bool;                                                                                
 var ctmp650930653895: bool;                                                                        
 var path653902: int;                                                                               
 var path653733: int;                                                                               
 var Inc.counter653727: [Inc]int;                                                                   
 var Inc.counter_nextValue653771: [Inc]int;                                                         
 var this653917: Inc;                                                                               
 var Inc.counter653771: [Inc]int;                                                                   
 var this653880: Inc;                                                                               
 var path653857: int;                                                                               
 var _R_t653776: Mover;                                                                             
 var tid653780_post: Tid;                                                                           
 var Inc.counter_nextThread653880: [Inc]Tid;                                                        
 var ctmp650930653857: bool;                                                                        
 var Inc._state653920: [Inc]State;                                                                  
 var Inc._lock653853: [Inc]Tid;                                                                     
 var moverPath653853: MoverPath;                                                                    
 var z653880: bool;                                                                                 
 var $pc653771: Phase;                                                                              
 var Inc.counter653857: [Inc]int;                                                                   
 var mover653857: Mover;                                                                            
 var Inc.counter653733: [Inc]int;                                                                   
 var z653920: bool;                                                                                 
 var Inc._lock653776: [Inc]Tid;                                                                     
 var this653727: Inc;                                                                               
 var z653853: bool;                                                                                 
 var tid653850: Tid;                                                                                
 var path653880: int;                                                                               
 var _C_v653727: int;                                                                               
 var Inc._state653919_bottom: [Inc]State;                                                           
 var Inc.counter653920: [Inc]int;                                                                   
 var $pc653853: Phase;                                                                              
 var $recorded.state653853: int;                                                                    
 var phase653919: Phase;                                                                            
 var tmpValue: int;                                                                                 
 var z653902: bool;                                                                                 
 var moverPath653895: MoverPath;                                                                    
 var Inc.counter_nextValue653917_post: [Inc]int;                                                    
 var z653721: bool;                                                                                 
 var this653920: Inc;                                                                               
 var m653895: int;                                                                                  
 var tid653920: Tid;                                                                                
 var tid653919_bottom: Tid;                                                                         
 var this653733: Inc;                                                                               
 var _C_v653733: int;                                                                               
 var moverPath653902: MoverPath;                                                                    
 var n653727: int;                                                                                  
 var Inc.counter653917: [Inc]int;                                                                   
 var tid653857: Tid;                                                                                
 var mover653850: Mover;                                                                            
 var tmpTid653853: Tid;                                                                             
 var Inc._lock653857: [Inc]Tid;                                                                     
 var Inc.counter_nextValue653902: [Inc]int;                                                         
 var Inc.counter_nextThread653857: [Inc]Tid;                                                        
 var Inc._lock653780_post: [Inc]Tid;                                                                
 var Inc._state653902: [Inc]State;                                                                  
 var $pc653857: Phase;                                                                              
 var $recorded.state653917: int;                                                                    
 var _m653850: Mover;                                                                               
 var mover653880: Mover;                                                                            
 var n653917_post: int;                                                                             
 var Inc.counter653780_post: [Inc]int;                                                              
 var Inc._lock653919_bottom: [Inc]Tid;                                                              
 var mover653853: Mover;                                                                            
 var n653721: int;                                                                                  
 var n653917: int;                                                                                  
 var $pc653780: Phase;                                                                              
 var moverPath653883: MoverPath;                                                                    
 var tid653895: Tid;                                                                                
 var _C_t653771: Tid;                                                                               
 var moverPath653776: MoverPath;                                                                    
 var _C_v: int;                                                                                     
 var this653780_post: Inc;                                                                          
 var $recorded.state653857: int;                                                                    
 var mover653733: Mover;                                                                            
 var moverPath653733: MoverPath;                                                                    
 var n653853: int;                                                                                  
 var path653776: int;                                                                               
 var n653780: int;                                                                                  
 var _C_t653727: Tid;                                                                               
 var mover653902: Mover;                                                                            
 var Inc.counter_nextThread653919_bottom: [Inc]Tid;                                                 
 var ctmp650930653853: bool;                                                                        
 var Inc.counter_nextThread653771: [Inc]Tid;                                                        
 var path653721: int;                                                                               
 var x653917_post: bool;                                                                            
 var z653919_bottom: bool;                                                                          
 var Inc._state653771: [Inc]State;                                                                  
 var tid653883: Tid;                                                                                
 var _R_t653771: Mover;                                                                             
 var Inc._lock653721: [Inc]Tid;                                                                     
 var Inc.counter_nextThread653721: [Inc]Tid;                                                        
 var Inc.counter_nextThread653917_post: [Inc]Tid;                                                   
 var Inc._state653733: [Inc]State;                                                                  
 var $pc653917: Phase;                                                                              
 var $recorded.state653883: int;                                                                    
 var this653850: Inc;                                                                               
 var _C_v653776: int;                                                                               
 var $pc653721: Phase;                                                                              
 var n653902: int;                                                                                  
 var Inc.counter_nextThread653895: [Inc]Tid;                                                        
 var ctmp650930653880: bool;                                                                        
 var _currentValue653880: int;                                                                      
 var mover653727: Mover;                                                                            
 var $recorded.state653917_post: int;                                                               
 var tmpTid653857: Tid;                                                                             
 var m653883: int;                                                                                  
 var Inc.counter_nextThread653917: [Inc]Tid;                                                        
 var path653883: int;                                                                               
 var _currentValue653883: int;                                                                      
 var $recorded.state653919: int;                                                                    
 var this653857: Inc;                                                                               
 var x653902: bool;                                                                                 
 var $pc653780_post: Phase;                                                                         
 var Inc.counter_nextValue653853: [Inc]int;                                                         
 var _m653895: Mover;                                                                               
 var Inc.counter653880: [Inc]int;                                                                   
 var z653780_post: bool;                                                                            
 var tid653780: Tid;                                                                                
 var tid653917: Tid;                                                                                
 var x653853: bool;                                                                                 
 var ctmp650930: bool;                                                                              
 var _currentValue653733: int;                                                                      
 var Inc._state653850: [Inc]State;                                                                  
 var n653880: int;                                                                                  
 var n653776: int;                                                                                  
 var Inc.counter_nextValue653919_bottom: [Inc]int;                                                  
 var Inc.counter_nextValue653780: [Inc]int;                                                         
 var $recorded.state653721: int;                                                                    
 var $pc653733: Phase;                                                                              
 var Inc._lock653850: [Inc]Tid;                                                                     
 var _m653853: Mover;                                                                               
 var $pc653902: Phase;                                                                              
 var Inc.counter_nextValue653850: [Inc]int;                                                         
 var ctmp650930653902: bool;                                                                        
 var Inc.counter_nextValue653776: [Inc]int;                                                         
 var Inc._state653776: [Inc]State;                                                                  
 var tid653880: Tid;                                                                                
 var _m653902: Mover;                                                                               
 var moverPath653721: MoverPath;                                                                    
 var n653883: int;                                                                                  
 var x653850: bool;                                                                                 
 var n: int;                                                                                        
 var $pc653850: Phase;                                                                              
 var _R_t: Mover;                                                                                   
 var n653850: int;                                                                                  
 var Inc.counter_nextValue653780_post: [Inc]int;                                                    
 var Inc.counter_nextThread653733: [Inc]Tid;                                                        
 var this653776: Inc;                                                                               
 var tid653727: Tid;                                                                                
 var z653895: bool;                                                                                 
 var _casable653771: bool;                                                                          
 var tmpValue653853: int;                                                                           
 var this653919: Inc;                                                                               
 var Inc.counter_nextThread653920: [Inc]Tid;                                                        
 var $recorded.state653780: int;                                                                    
 var Inc._state653880: [Inc]State;                                                                  
 var x653880: bool;                                                                                 
 var _m: Mover;                                                                                     
 var Inc.counter_nextValue653895: [Inc]int;                                                         
 var $pc653919_bottom: Phase;                                                                       
 var m653902: int;                                                                                  
 var Inc.counter653883: [Inc]int;                                                                   
 var m653850: int;                                                                                  
 var Inc.counter_nextValue653917: [Inc]int;                                                         
 var Inc.counter_nextThread653727: [Inc]Tid;                                                        
 var Inc.counter653919: [Inc]int;                                                                   
 var moverPath653850: MoverPath;                                                                    
 var $pc653880: Phase;                                                                              
 var Inc._lock653780: [Inc]Tid;                                                                     
 var this653883: Inc;                                                                               
 var x: bool;                                                                                       
 var Inc._state653919: [Inc]State;                                                                  
 var $recorded.state653776: int;                                                                    
 var tmpValue653857: int;                                                                           
 var Inc.counter_nextThread653780: [Inc]Tid;                                                        
 var this653895: Inc;                                                                               
 var moverPath653727: MoverPath;                                                                    
 var _currentValue653902: int;                                                                      
 var Inc._state653895: [Inc]State;                                                                  
 var _C_t653733: Tid;                                                                               
 var tid653853: Tid;                                                                                
 var Inc._lock653919: [Inc]Tid;                                                                     
 var $recorded.state653727: int;                                                                    
 var Inc._lock653771: [Inc]Tid;                                                                     
 var mover653883: Mover;                                                                            
 var Inc._state653917_post: [Inc]State;                                                             
 var m653853: int;                                                                                  
 var z653780: bool;                                                                                 
 var mover653721: Mover;                                                                            
 var _currentValue653771: int;                                                                      
 var tid653776: Tid;                                                                                
 var Inc._lock653917: [Inc]Tid;                                                                     
 var Inc._state653883: [Inc]State;                                                                  
 var Inc.counter653895: [Inc]int;                                                                   
 var z653919: bool;                                                                                 
 var Inc._state653727: [Inc]State;                                                                  
 var Inc.counter653721: [Inc]int;                                                                   
 var z653857: bool;                                                                                 
 var $recorded.state653880: int;                                                                    
 var Inc.counter653780: [Inc]int;                                                                   
 var $pc653727: Phase;                                                                              
 var path653853: int;                                                                               
 var n653733: int;                                                                                  
 var tid653771: Tid;                                                                                
 var $recorded.state653902: int;                                                                    
 var tmpTid: Tid;                                                                                   
 var $recorded.state653850: int;                                                                    
 var $pc653920: Phase;                                                                              
 var Inc._lock653727: [Inc]Tid;                                                                     
 var z653733: bool;                                                                                 
 var Inc.counter_nextValue653883: [Inc]int;                                                         
 var Inc._lock653895: [Inc]Tid;                                                                     
 var $pc653883: Phase;                                                                              
 var Inc.counter_nextThread653853: [Inc]Tid;                                                        
 var x653883: bool;                                                                                 
 var this653780: Inc;                                                                               
 var Inc._state653853: [Inc]State;                                                                  
 var Inc.counter653919_bottom: [Inc]int;                                                            
 var Inc.counter653902: [Inc]int;                                                                   
 var Inc.counter_nextValue653920: [Inc]int;                                                         
 var moverPath653880: MoverPath;                                                                    
 var x653895: bool;                                                                                 
 var n653857: int;                                                                                  
 var m653857: int;                                                                                  
 var _m653857: Mover;                                                                               
 var z: bool;                                                                                       
 var path653895: int;                                                                               
 var Inc.counter_nextValue653727: [Inc]int;                                                         
 var _currentValue653776: int;                                                                      
 var Inc.counter_nextThread653919: [Inc]Tid;                                                        
 var tmpTid653850: Tid;                                                                             
 var _C_t653721: Tid;                                                                               
 var this653902: Inc;                                                                               
 var tid653721: Tid;                                                                                
 var $pc653917_post: Phase;                                                                         
 var Inc._state653857: [Inc]State;                                                                  
 var path653771: int;                                                                               
 var $pc653895: Phase;                                                                              
 var _casable653776: bool;                                                                          
 var Inc.counter_nextThread653776: [Inc]Tid;                                                        
 var m: int;                                                                                        
 var Inc.counter_nextValue653880: [Inc]int;                                                         
 var Inc._state653721: [Inc]State;                                                                  
 var Inc.counter653853: [Inc]int;                                                                   
 var $recorded.state653895: int;                                                                    
 var tid653733: Tid;                                                                                
 var $recorded.state653780_post: int;                                                               
 var n653780_post: int;                                                                             
 var z653776: bool;                                                                                 
 var mover653771: Mover;                                                                            
 var z653771: bool;                                                                                 
 var path653727: int;                                                                               
 var mover653776: Mover;                                                                            
 var mover653895: Mover;                                                                            
 var $recorded.state653733: int;                                                                    
 var $recorded.state653920: int;                                                                    
 var Inc._lock653880: [Inc]Tid;                                                                     
 var Inc._lock653883: [Inc]Tid;                                                                     
 var z653917: bool;                                                                                 
 var z653883: bool;                                                                                 
 var this653771: Inc;                                                                               
 var this653919_bottom: Inc;                                                                        
 var path653850: int;                                                                               
 var $recorded.state653771: int;                                                                    
 var $pc653919: Phase;                                                                              
 var Inc._lock653902: [Inc]Tid;                                                                     
 var Inc.counter_nextValue653733: [Inc]int;                                                         
 var Inc._lock653917_post: [Inc]Tid;                                                                
 var $recorded.state653919_bottom: int;                                                             
 var Inc.counter_nextValue653857: [Inc]int;                                                         
 var this653917_post: Inc;                                                                          
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 8.9: boolean z;                                                                                 
                                                                                                    
                                                                                                    
 // 8.21: z = true;                                                                                 
                                                                                                    
 z := true;                                                                                         
 assume Inc._state653919 == Inc._state && Inc.counter653919 == Inc.counter && Inc._lock653919 == Inc._lock && Inc.counter_nextThread653919 == Inc.counter_nextThread && Inc.counter_nextValue653919 == Inc.counter_nextValue && z653919 == z && this653919 == this && tid653919 == tid;
 assume $recorded.state653919 == 1;                                                                 
                                                                                                    
 // 8.27: while (z)   {                                                                             
                                                                                                    
 phase653919 := $pc;                                                                                
 while (z)                                                                                          
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (7.5): Bad tid
  invariant isShared(Inc._state[this]);                                                                    // (7.5): this is not global
                                                                                                    
  invariant StateInvariant(Inc._state, Inc.counter, Inc._lock, Inc.counter_nextThread, Inc.counter_nextValue);
  invariant (forall _this : Inc :: Invariant.Y_Inc.counter(tid : Tid, _this, Inc.counter[_this] ,Inc._state653919,Inc.counter653919,Inc._lock653919,Inc.counter_nextThread653919,Inc.counter_nextValue653919));       // (8.27): Loop does not preserve yields_as annotation for field counter
  invariant phase653919 == $pc;                                                                            // (8.27): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (8.27): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 10.13: int n;                                                                                  
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 10.13: Tid _C_t;                                                                               
                                                                                                    
                                                                                                    
  // 10.13: _C_t := this.counter_nextThread  as B;                                                  
                                                                                                    
                                                                                                    
  moverPath653721 := ReadEval.Inc.counter_nextThread(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
  mover653721 := m#moverPath(moverPath653721);                                                      
  path653721 := p#moverPath(moverPath653721);                                                       
  assume Inc._state653721 == Inc._state && Inc.counter653721 == Inc.counter && Inc._lock653721 == Inc._lock && Inc.counter_nextThread653721 == Inc.counter_nextThread && Inc.counter_nextValue653721 == Inc.counter_nextValue && _C_t653721 == _C_t && n653721 == n && z653721 == z && this653721 == this && tid653721 == tid && $pc653721 == $pc;
  assume $recorded.state653721 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (10.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (10.13): Reduction failure
  _C_t := Inc.counter_nextThread[this];                                                             
                                                                                                    
  // 10.13: int _C_v;                                                                               
                                                                                                    
                                                                                                    
  // 10.13: _C_v := this.counter_nextValue  as B;                                                   
                                                                                                    
                                                                                                    
  moverPath653727 := ReadEval.Inc.counter_nextValue(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
  mover653727 := m#moverPath(moverPath653727);                                                      
  path653727 := p#moverPath(moverPath653727);                                                       
  assume Inc._state653727 == Inc._state && Inc.counter653727 == Inc.counter && Inc._lock653727 == Inc._lock && Inc.counter_nextThread653727 == Inc.counter_nextThread && Inc.counter_nextValue653727 == Inc.counter_nextValue && _C_v653727 == _C_v && _C_t653727 == _C_t && n653727 == n && z653727 == z && this653727 == this && tid653727 == tid && $pc653727 == $pc;
  assume $recorded.state653727 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (10.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (10.13): Reduction failure
  _C_v := Inc.counter_nextValue[this];                                                              
                                                                                                    
  // 10.13: int _currentValue;                                                                      
                                                                                                    
                                                                                                    
  // 10.13: _currentValue := this.counter  as B;                                                    
                                                                                                    
                                                                                                    
  moverPath653733 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
  mover653733 := m#moverPath(moverPath653733);                                                      
  path653733 := p#moverPath(moverPath653733);                                                       
  assume Inc._state653733 == Inc._state && Inc.counter653733 == Inc.counter && Inc._lock653733 == Inc._lock && Inc.counter_nextThread653733 == Inc.counter_nextThread && Inc.counter_nextValue653733 == Inc.counter_nextValue && _currentValue653733 == _currentValue && _C_v653733 == _C_v && _C_t653733 == _C_t && n653733 == n && z653733 == z && this653733 == this && tid653733 == tid && $pc653733 == $pc;
  assume $recorded.state653733 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc.null;                                                                         
  } else {                                                                                          
   assert this != Inc.null;                                                                                // (10.13): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _B);                                                                       
  assert $pc != PhaseError;                                                                                // (10.13): Reduction failure
  _currentValue := Inc.counter[this];                                                               
                                                                                                    
  // 10.13: Mover _R_t;                                                                             
                                                                                                    
                                                                                                    
  // 10.13: _R_t = readPermission(this.counter);                                                    
                                                                                                    
  _R_t := m#moverPath(ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue));
                                                                                                    
  // 10.13: boolean _casable;                                                                       
                                                                                                    
                                                                                                    
  // 10.13: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                  
                                                                                                    
  _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                          
  if (_casable) {                                                                                   
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 10.13: n := this.counter  as R;                                                               
                                                                                                    
                                                                                                    
   moverPath653771 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
   mover653771 := m#moverPath(moverPath653771);                                                     
   path653771 := p#moverPath(moverPath653771);                                                      
   assume Inc._state653771 == Inc._state && Inc.counter653771 == Inc.counter && Inc._lock653771 == Inc._lock && Inc.counter_nextThread653771 == Inc.counter_nextThread && Inc.counter_nextValue653771 == Inc.counter_nextValue && _casable653771 == _casable && _R_t653771 == _R_t && _currentValue653771 == _currentValue && _C_v653771 == _C_v && _C_t653771 == _C_t && n653771 == n && z653771 == z && this653771 == this && tid653771 == tid && $pc653771 == $pc;
   assume $recorded.state653771 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc.null;                                                                        
   } else {                                                                                         
    assert this != Inc.null;                                                                               // (10.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _R);                                                                      
   assert $pc != PhaseError;                                                                               // (10.13): Reduction failure
   n := Inc.counter[this];                                                                          
  } else {                                                                                          
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 10.13: n := this.counter;                                                                     
                                                                                                    
                                                                                                    
   moverPath653776 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
   mover653776 := m#moverPath(moverPath653776);                                                     
   path653776 := p#moverPath(moverPath653776);                                                      
   assume Inc._state653776 == Inc._state && Inc.counter653776 == Inc.counter && Inc._lock653776 == Inc._lock && Inc.counter_nextThread653776 == Inc.counter_nextThread && Inc.counter_nextValue653776 == Inc.counter_nextValue && _casable653776 == _casable && _R_t653776 == _R_t && _currentValue653776 == _currentValue && _C_v653776 == _C_v && _C_t653776 == _C_t && n653776 == n && z653776 == z && this653776 == this && tid653776 == tid && $pc653776 == $pc;
   assume $recorded.state653776 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc.null;                                                                        
   } else {                                                                                         
    assert this != Inc.null;                                                                               // (10.13): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, mover653776);                                                             
   assert $pc != PhaseError;                                                                               // (10.13): Reduction failure
   n := Inc.counter[this];                                                                          
  }                                                                                                 
                                                                                                    
  // 11.13: yield;                                                                                  
                                                                                                    
  assume Inc._state653780 == Inc._state && Inc.counter653780 == Inc.counter && Inc._lock653780 == Inc._lock && Inc.counter_nextThread653780 == Inc.counter_nextThread && Inc.counter_nextValue653780 == Inc.counter_nextValue && n653780 == n && z653780 == z && this653780 == this && tid653780 == tid;
  assume $recorded.state653780 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Inc._state653780_post == Inc._state && Inc.counter653780_post == Inc.counter && Inc._lock653780_post == Inc._lock && Inc.counter_nextThread653780_post == Inc.counter_nextThread && Inc.counter_nextValue653780_post == Inc.counter_nextValue && n653780_post == n && z653780_post == z && this653780_post == this && tid653780_post == tid;
  assume $recorded.state653780_post == 1;                                                           
                                                                                                    
  // 12.13: int m;                                                                                  
                                                                                                    
                                                                                                    
  // 12.23: m = n + 1;                                                                              
                                                                                                    
  m := (n+1);                                                                                       
                                                                                                    
  // 13.13: boolean x;                                                                              
                                                                                                    
  // NoOp: 'TraceOff'                                                                               
                                                                                                    
  // 13.13: boolean ctmp650930;                                                                     
                                                                                                    
                                                                                                    
  // 13.13: ctmp650930 = *;                                                                         
                                                                                                    
  havoc ctmp650930;                                                                                 
  if (ctmp650930) {                                                                                 
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
   // 13.13: x = false;                                                                             
                                                                                                    
   x := false;                                                                                      
  } else {                                                                                          
                                                                                                    
   // 13.13: ctmp650930 = *;                                                                        
                                                                                                    
   havoc ctmp650930;                                                                                
   if (ctmp650930) {                                                                                
                                                                                                    
    // 13.13: Tid tmpTid;                                                                           
                                                                                                    
                                                                                                    
    // 13.13: int tmpValue;                                                                         
                                                                                                    
                                                                                                    
    // 13.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 13.13: _m = writePermission(this.counter, m);                                                
                                                                                                    
    _m := m#moverPath(WriteEval.Inc.counter(tid: Tid,this: Inc,m: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue));
                                                                                                    
    // 13.13: assume this.counter == n;                                                             
                                                                                                    
    assume (Inc.counter[this]==n);                                                                  
                                                                                                    
    // 13.13: assume !goesWrong(_m);                                                                
                                                                                                    
    assume !(transition($pc, _m) == PhaseError);                                                    
                                                                                                    
    // 13.13: assume this.counter_nextThread == tid;                                                
                                                                                                    
    assume (Inc.counter_nextThread[this]==tid);                                                     
                                                                                                    
    // 13.13: assume this.counter_nextValue == n;                                                   
                                                                                                    
    assume (Inc.counter_nextValue[this]==n);                                                        
                                                                                                    
                                                                                                    
    // 13.13: this.counter_nextThread := tmpTid as B;                                               
                                                                                                    
                                                                                                    
    moverPath653850 := WriteEval.Inc.counter_nextThread(tid: Tid,this: Inc,tmpTid: Tid,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653850 := m#moverPath(moverPath653850);                                                    
    path653850 := p#moverPath(moverPath653850);                                                     
    assume Inc._state653850 == Inc._state && Inc.counter653850 == Inc.counter && Inc._lock653850 == Inc._lock && Inc.counter_nextThread653850 == Inc.counter_nextThread && Inc.counter_nextValue653850 == Inc.counter_nextValue && _m653850 == _m && tmpValue653850 == tmpValue && tmpTid653850 == tmpTid && ctmp650930653850 == ctmp650930 && x653850 == x && m653850 == m && n653850 == n && z653850 == z && this653850 == this && tid653850 == tid && $pc653850 == $pc;
    assume $recorded.state653850 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    Inc.counter_nextThread[this] := tmpTid;                                                         
                                                                                                    
                                                                                                    
    // 13.13: this.counter_nextValue := tmpValue as B;                                              
                                                                                                    
                                                                                                    
    moverPath653853 := WriteEval.Inc.counter_nextValue(tid: Tid,this: Inc,tmpValue: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653853 := m#moverPath(moverPath653853);                                                    
    path653853 := p#moverPath(moverPath653853);                                                     
    assume Inc._state653853 == Inc._state && Inc.counter653853 == Inc.counter && Inc._lock653853 == Inc._lock && Inc.counter_nextThread653853 == Inc.counter_nextThread && Inc.counter_nextValue653853 == Inc.counter_nextValue && _m653853 == _m && tmpValue653853 == tmpValue && tmpTid653853 == tmpTid && ctmp650930653853 == ctmp650930 && x653853 == x && m653853 == m && n653853 == n && z653853 == z && this653853 == this && tid653853 == tid && $pc653853 == $pc;
    assume $recorded.state653853 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    Inc.counter_nextValue[this] := tmpValue;                                                        
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 13.13: this.counter := m;                                                                    
                                                                                                    
                                                                                                    
    moverPath653857 := WriteEval.Inc.counter(tid: Tid,this: Inc,m: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653857 := m#moverPath(moverPath653857);                                                    
    path653857 := p#moverPath(moverPath653857);                                                     
    assume Inc._state653857 == Inc._state && Inc.counter653857 == Inc.counter && Inc._lock653857 == Inc._lock && Inc.counter_nextThread653857 == Inc.counter_nextThread && Inc.counter_nextValue653857 == Inc.counter_nextValue && _m653857 == _m && tmpValue653857 == tmpValue && tmpTid653857 == tmpTid && ctmp650930653857 == ctmp650930 && x653857 == x && m653857 == m && n653857 == n && z653857 == z && this653857 == this && tid653857 == tid && $pc653857 == $pc;
    assume $recorded.state653857 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover653857);                                                            
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    Inc.counter[this] := m;                                                                         
                                                                                                    
    // 13.13: x = true;                                                                             
                                                                                                    
    x := true;                                                                                      
   } else {                                                                                         
                                                                                                    
    // 13.13: assume this.counter_nextThread == tid;                                                
                                                                                                    
    assume (Inc.counter_nextThread[this]==tid);                                                     
                                                                                                    
    // 13.13: assume this.counter_nextValue == n;                                                   
                                                                                                    
    assume (Inc.counter_nextValue[this]==n);                                                        
                                                                                                    
    // 13.13: int _currentValue;                                                                    
                                                                                                    
                                                                                                    
    // 13.13: _currentValue := this.counter  as B;                                                  
                                                                                                    
                                                                                                    
    moverPath653880 := ReadEval.Inc.counter(tid: Tid,this: Inc,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653880 := m#moverPath(moverPath653880);                                                    
    path653880 := p#moverPath(moverPath653880);                                                     
    assume Inc._state653880 == Inc._state && Inc.counter653880 == Inc.counter && Inc._lock653880 == Inc._lock && Inc.counter_nextThread653880 == Inc.counter_nextThread && Inc.counter_nextValue653880 == Inc.counter_nextValue && _currentValue653880 == _currentValue && ctmp650930653880 == ctmp650930 && x653880 == x && m653880 == m && n653880 == n && z653880 == z && this653880 == this && tid653880 == tid && $pc653880 == $pc;
    assume $recorded.state653880 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
                                                                                                    
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    _currentValue := Inc.counter[this];                                                             
                                                                                                    
                                                                                                    
    // 13.13: this.counter := n as B;                                                               
                                                                                                    
                                                                                                    
    moverPath653883 := WriteEval.Inc.counter(tid: Tid,this: Inc,n: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653883 := m#moverPath(moverPath653883);                                                    
    path653883 := p#moverPath(moverPath653883);                                                     
    assume Inc._state653883 == Inc._state && Inc.counter653883 == Inc.counter && Inc._lock653883 == Inc._lock && Inc.counter_nextThread653883 == Inc.counter_nextThread && Inc.counter_nextValue653883 == Inc.counter_nextValue && _currentValue653883 == _currentValue && ctmp650930653883 == ctmp650930 && x653883 == x && m653883 == m && n653883 == n && z653883 == z && this653883 == this && tid653883 == tid && $pc653883 == $pc;
    assume $recorded.state653883 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    Inc.counter[this] := n;                                                                         
                                                                                                    
    // 13.13: Mover _m;                                                                             
                                                                                                    
                                                                                                    
    // 13.13: _m = writePermission(this.counter, m);                                                
                                                                                                    
    _m := m#moverPath(WriteEval.Inc.counter(tid: Tid,this: Inc,m: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue));
                                                                                                    
                                                                                                    
    // 13.13: this.counter := _currentValue as B;                                                   
                                                                                                    
                                                                                                    
    moverPath653895 := WriteEval.Inc.counter(tid: Tid,this: Inc,_currentValue: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653895 := m#moverPath(moverPath653895);                                                    
    path653895 := p#moverPath(moverPath653895);                                                     
    assume Inc._state653895 == Inc._state && Inc.counter653895 == Inc.counter && Inc._lock653895 == Inc._lock && Inc.counter_nextThread653895 == Inc.counter_nextThread && Inc.counter_nextValue653895 == Inc.counter_nextValue && _m653895 == _m && _currentValue653895 == _currentValue && ctmp650930653895 == ctmp650930 && x653895 == x && m653895 == m && n653895 == n && z653895 == z && this653895 == this && tid653895 == tid && $pc653895 == $pc;
    assume $recorded.state653895 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, _B);                                                                     
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    Inc.counter[this] := _currentValue;                                                             
                                                                                                    
    // 13.13: assume goesWrong(_m);                                                                 
                                                                                                    
    assume transition($pc, _m) == PhaseError;                                                       
    // NoOp: 'TraceOn'                                                                              
                                                                                                    
                                                                                                    
    // 13.13: this.counter := m;                                                                    
                                                                                                    
                                                                                                    
    moverPath653902 := WriteEval.Inc.counter(tid: Tid,this: Inc,m: int,Inc._state,Inc.counter,Inc._lock,Inc.counter_nextThread,Inc.counter_nextValue);
    mover653902 := m#moverPath(moverPath653902);                                                    
    path653902 := p#moverPath(moverPath653902);                                                     
    assume Inc._state653902 == Inc._state && Inc.counter653902 == Inc.counter && Inc._lock653902 == Inc._lock && Inc.counter_nextThread653902 == Inc.counter_nextThread && Inc.counter_nextValue653902 == Inc.counter_nextValue && _m653902 == _m && _currentValue653902 == _currentValue && ctmp650930653902 == ctmp650930 && x653902 == x && m653902 == m && n653902 == n && z653902 == z && this653902 == this && tid653902 == tid && $pc653902 == $pc;
    assume $recorded.state653902 == 1;                                                              
    if ($pc == PreCommit) {                                                                         
     assume this != Inc.null;                                                                       
    } else {                                                                                        
     assert this != Inc.null;                                                                              // (13.13): Cannot have potential null deference in left-mover part.
    }                                                                                               
    $pc := transition($pc, mover653902);                                                            
    assert $pc != PhaseError;                                                                              // (13.13): Reduction failure
    Inc.counter[this] := m;                                                                         
                                                                                                    
    // 13.13: x = false;                                                                            
                                                                                                    
    x := false;                                                                                     
   }                                                                                                
  }                                                                                                 
  if (x) {                                                                                          
                                                                                                    
   // 15.17: break;                                                                                 
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 17.13: yield;                                                                                  
                                                                                                    
  assume Inc._state653917 == Inc._state && Inc.counter653917 == Inc.counter && Inc._lock653917 == Inc._lock && Inc.counter_nextThread653917 == Inc.counter_nextThread && Inc.counter_nextValue653917 == Inc.counter_nextValue && x653917 == x && m653917 == m && n653917 == n && z653917 == z && this653917 == this && tid653917 == tid;
  assume $recorded.state653917 == 1;                                                                
  call Yield(tid);                                                                                  
  $pc := PreCommit;                                                                                 
  assume Inc._state653917_post == Inc._state && Inc.counter653917_post == Inc.counter && Inc._lock653917_post == Inc._lock && Inc.counter_nextThread653917_post == Inc.counter_nextThread && Inc.counter_nextValue653917_post == Inc.counter_nextValue && x653917_post == x && m653917_post == m && n653917_post == n && z653917_post == z && this653917_post == this && tid653917_post == tid;
  assume $recorded.state653917_post == 1;                                                           
  assume Inc._state653919_bottom == Inc._state && Inc.counter653919_bottom == Inc.counter && Inc._lock653919_bottom == Inc._lock && Inc.counter_nextThread653919_bottom == Inc.counter_nextThread && Inc.counter_nextValue653919_bottom == Inc.counter_nextValue && z653919_bottom == z && this653919_bottom == this && tid653919_bottom == tid;
  assume $recorded.state653919_bottom == 1;                                                         
  assert phase653919 == $pc;                                                                               // (8.27): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 7.23: // return;                                                                                
                                                                                                    
 assume Inc._state653920 == Inc._state && Inc.counter653920 == Inc.counter && Inc._lock653920 == Inc._lock && Inc.counter_nextThread653920 == Inc.counter_nextThread && Inc.counter_nextValue653920 == Inc.counter_nextValue && z653920 == z && this653920 == this && tid653920 == tid;
 assume $recorded.state653920 == 1;                                                                 
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
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc.counter(tid : Tid, this: Inc, newValue: int , Inc._state: [Inc]State, Inc.counter: [Inc]int, Inc._lock: [Inc]Tid, Inc.counter_nextThread: [Inc]Tid, Inc.counter_nextValue: [Inc]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
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
                                                                                                    
                                                                                                    
// 707.1-1440.2: (Method:7.5)
// 716.1-716.24: (7.5): Bad tid
// 717.1-717.37: (7.5): this is not global
// 1040.2-1042.2: (class anchor.sink.VarDeclStmt:8.9)
// 1043.2-1046.12: (class anchor.sink.Assign:8.21)
// 1049.2-1053.11: (class anchor.sink.While:8.27)
// 1055.1-1055.27: (7.5): Bad tid
// 1056.1-1056.40: (7.5): this is not global
// 1059.1-1059.208: (8.27): Loop does not preserve yields_as annotation for field counter
// 1060.1-1060.32: (8.27): Phase must be invariant at loop head
// 1061.1-1061.30: (8.27): Potentially infinite loop cannot be in post-commit phase.
// 1063.3-1065.3: (class anchor.sink.VarDeclStmt:10.13)
// 1067.3-1069.3: (class anchor.sink.VarDeclStmt:10.13)
// 1070.3-1087.40: (class anchor.sink.Read:10.13)
// 1082.1-1082.28: (10.13): Cannot have potential null deference in left-mover part.
// 1086.1-1086.28: (10.13): Reduction failure
// 1088.3-1090.3: (class anchor.sink.VarDeclStmt:10.13)
// 1091.3-1108.39: (class anchor.sink.Read:10.13)
// 1103.1-1103.28: (10.13): Cannot have potential null deference in left-mover part.
// 1107.1-1107.28: (10.13): Reduction failure
// 1109.3-1111.3: (class anchor.sink.VarDeclStmt:10.13)
// 1112.3-1129.38: (class anchor.sink.Read:10.13)
// 1124.1-1124.28: (10.13): Cannot have potential null deference in left-mover part.
// 1128.1-1128.28: (10.13): Reduction failure
// 1130.3-1132.3: (class anchor.sink.VarDeclStmt:10.13)
// 1133.3-1136.143: (class anchor.sink.Assign:10.13)
// 1137.3-1139.3: (class anchor.sink.VarDeclStmt:10.13)
// 1140.3-1143.75: (class anchor.sink.Assign:10.13)
// 1146.4-1163.27: (class anchor.sink.Read:10.13)
// 1158.1-1158.29: (10.13): Cannot have potential null deference in left-mover part.
// 1162.1-1162.29: (10.13): Reduction failure
// 1166.4-1183.27: (class anchor.sink.Read:10.13)
// 1178.1-1178.29: (10.13): Cannot have potential null deference in left-mover part.
// 1182.1-1182.29: (10.13): Reduction failure
// 1185.3-1193.42: (class anchor.sink.Yield:11.13)
// 1194.3-1196.3: (class anchor.sink.VarDeclStmt:12.13)
// 1197.3-1200.14: (class anchor.sink.Assign:12.23)
// 1201.3-1203.3: (class anchor.sink.VarDeclStmt:13.13)
// 1205.3-1207.3: (class anchor.sink.VarDeclStmt:13.13)
// 1208.3-1211.20: (class anchor.sink.Assign:13.13)
// 1214.4-1217.15: (class anchor.sink.Assign:13.13)
// 1219.4-1222.21: (class anchor.sink.Assign:13.13)
// 1224.5-1226.5: (class anchor.sink.VarDeclStmt:13.13)
// 1227.5-1229.5: (class anchor.sink.VarDeclStmt:13.13)
// 1230.5-1232.5: (class anchor.sink.VarDeclStmt:13.13)
// 1233.5-1236.151: (class anchor.sink.Assign:13.13)
// 1237.5-1240.35: (class anchor.sink.Assume:13.13)
// 1241.5-1244.49: (class anchor.sink.Assume:13.13)
// 1245.5-1248.48: (class anchor.sink.Assume:13.13)
// 1249.5-1252.45: (class anchor.sink.Assume:13.13)
// 1254.5-1270.44: (class anchor.sink.Write:13.13)
// 1266.1-1266.30: (13.13): Cannot have potential null deference in left-mover part.
// 1269.1-1269.30: (13.13): Reduction failure
// 1272.5-1288.45: (class anchor.sink.Write:13.13)
// 1284.1-1284.30: (13.13): Cannot have potential null deference in left-mover part.
// 1287.1-1287.30: (13.13): Reduction failure
// 1291.5-1307.28: (class anchor.sink.Write:13.13)
// 1303.1-1303.30: (13.13): Cannot have potential null deference in left-mover part.
// 1306.1-1306.30: (13.13): Reduction failure
// 1308.5-1311.15: (class anchor.sink.Assign:13.13)
// 1313.5-1316.48: (class anchor.sink.Assume:13.13)
// 1317.5-1320.45: (class anchor.sink.Assume:13.13)
// 1321.5-1323.5: (class anchor.sink.VarDeclStmt:13.13)
// 1324.5-1341.40: (class anchor.sink.Read:13.13)
// 1336.1-1336.30: (13.13): Cannot have potential null deference in left-mover part.
// 1340.1-1340.30: (13.13): Reduction failure
// 1343.5-1359.28: (class anchor.sink.Write:13.13)
// 1355.1-1355.30: (13.13): Cannot have potential null deference in left-mover part.
// 1358.1-1358.30: (13.13): Reduction failure
// 1360.5-1362.5: (class anchor.sink.VarDeclStmt:13.13)
// 1363.5-1366.151: (class anchor.sink.Assign:13.13)
// 1368.5-1384.40: (class anchor.sink.Write:13.13)
// 1380.1-1380.30: (13.13): Cannot have potential null deference in left-mover part.
// 1383.1-1383.30: (13.13): Reduction failure
// 1385.5-1388.46: (class anchor.sink.Assume:13.13)
// 1391.5-1407.28: (class anchor.sink.Write:13.13)
// 1403.1-1403.30: (13.13): Cannot have potential null deference in left-mover part.
// 1406.1-1406.30: (13.13): Reduction failure
// 1408.5-1411.16: (class anchor.sink.Assign:13.13)
// 1415.4-1418.10: (class anchor.sink.Break:15.17)
// 1421.3-1429.42: (class anchor.sink.Yield:17.13)
// 1432.1-1432.29: (8.27): Phase must be invariant at loop head
// 1434.2-1439.9: (class anchor.sink.Return:7.23)
// 1518.1-1518.34: (5.2): Inc.counter failed Write-Write Right-Mover Check
// 1579.1-1579.30: (5.2): Inc.counter failed Write-Read Right-Mover Check
// 1644.1-1644.34: (5.2): Inc.counter failed Write-Write Left-Mover Check
// 1706.1-1706.30: (5.2): Inc.counter failed Write-Read Left-Mover Check
// 1765.1-1765.34: (5.2): Inc.counter failed Read-Write Right-Mover Check
// 1827.1-1827.34: (5.2): Inc.counter failed Read-Write Left-Mover Check
// 1900.1-1900.140: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.1)
// 1901.1-1901.101: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.2)
// 1902.1-1902.158: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case A.3)
// 2001.1-2001.140: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case C)
// 2105.1-2105.144: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case D)
// 2106.1-2106.144: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case R)
// 2179.1-2179.136: (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case F)
// 2180.1-2180.136: (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case H)
// 2181.1-2181.146: (5.2): Inc.counter is not Read-Write Stable with respect to Inc.counter (case I)
// 2253.1-2253.136: (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case J)
// 2254.1-2254.136: (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case K)
// 2255.1-2255.99: (5.2): Inc.counter is not Write-Read Stable with respect to Inc.counter (case L)
// 2364.1-2364.142: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case M)
// 2471.1-2471.130: (5.2): Inc.counter is not Write-Write Stable with respect to Inc.counter (case N)
// 2505.1-2526.2: (5.2): yields_as clause for Inc.counter is not valid
// 2531.1-2547.2: (5.2): yields_as clause for Inc.counter is not reflexive
// 2553.1-2585.2: (5.2): yields_as clause for Inc.counter is not transitive
// 2605.1-2626.2: (7.32): yields_as clause for Inc._lock is not valid
// 2631.1-2647.2: (7.32): yields_as clause for Inc._lock is not reflexive
// 2653.1-2685.2: (7.32): yields_as clause for Inc._lock is not transitive
