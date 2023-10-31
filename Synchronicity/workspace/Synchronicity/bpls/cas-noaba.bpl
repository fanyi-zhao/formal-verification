                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/cas-noaba.anchor:                        
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc2 {                                                                                    
      volatile int counter isRead                                                                   
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
        int nnn;                                                                                    
        nnn := this.counter;                                                                        
        boolean x;                                                                                  
        int tmp1;                                                                                   
        tmp1 = nnn + 1;                                                                             
        x = this.counter@nnn :~ tmp1;                                                               
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc2 {                                                                                    
      hasCASOperation volatile int counter isRead                                                   
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
        int nnn;                                                                                    
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
            nnn := this.counter  as R;                                                              
          } else {                                                                                  
            noop(TraceOn);                                                                          
            nnn := this.counter;                                                                    
          }                                                                                         
        }                                                                                           
        boolean x;                                                                                  
        int tmp1;                                                                                   
        tmp1 = nnn + 1;                                                                             
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp658774;                                                                       
          ctmp658774 = *;                                                                           
          if (ctmp658774) {                                                                         
            noop(TraceOn);                                                                          
            x = false;                                                                              
          } else {                                                                                  
            ctmp658774 = *;                                                                         
            if (ctmp658774) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.counter, tmp1);                                             
              assume this.counter == nnn;                                                           
              assume !goesWrong(_m);                                                                
              assume this.counter_nextThread == tid;                                                
              assume this.counter_nextValue == nnn;                                                 
              this.counter_nextThread := tmpTid as B;                                               
              this.counter_nextValue := tmpValue as B;                                              
              noop(TraceOn);                                                                        
              this.counter := tmp1;                                                                 
              x = true;                                                                             
            } else {                                                                                
              assume this.counter_nextThread == tid;                                                
              assume this.counter_nextValue == nnn;                                                 
              int _currentValue;                                                                    
              _currentValue := this.counter  as B;                                                  
              this.counter := nnn as B;                                                             
              Mover _m;                                                                             
              _m = writePermission(this.counter, tmp1);                                             
              this.counter := _currentValue as B;                                                   
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.counter := tmp1;                                                                 
              x = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc2 {                                                                                    
      hasCASOperation volatile int counter isRead                                                   
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
        int nnn;                                                                                    
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
            nnn := this.counter  as R;                                                              
          } else {                                                                                  
            noop(TraceOn);                                                                          
            nnn := this.counter;                                                                    
          }                                                                                         
        }                                                                                           
        boolean x;                                                                                  
        int tmp1;                                                                                   
        tmp1 = nnn + 1;                                                                             
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp658774;                                                                       
          ctmp658774 = *;                                                                           
          if (ctmp658774) {                                                                         
            noop(TraceOn);                                                                          
            x = false;                                                                              
          } else {                                                                                  
            ctmp658774 = *;                                                                         
            if (ctmp658774) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.counter, tmp1);                                             
              assume this.counter == nnn;                                                           
              assume !goesWrong(_m);                                                                
              assume this.counter_nextThread == tid;                                                
              assume this.counter_nextValue == nnn;                                                 
              this.counter_nextThread := tmpTid as B;                                               
              this.counter_nextValue := tmpValue as B;                                              
              noop(TraceOn);                                                                        
              this.counter := tmp1;                                                                 
              x = true;                                                                             
            } else {                                                                                
              assume this.counter_nextThread == tid;                                                
              assume this.counter_nextValue == nnn;                                                 
              int _currentValue;                                                                    
              _currentValue := this.counter  as B;                                                  
              this.counter := nnn as B;                                                             
              Mover _m;                                                                             
              _m = writePermission(this.counter, tmp1);                                             
              this.counter := _currentValue as B;                                                   
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.counter := tmp1;                                                                 
              x = false;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Inc2 {                                                                                    
      hasCASOperation volatile int counter isRead                                                   
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
        int nnn;                                                                                    
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
            nnn := this.counter  as R;                                                              
          } else {                                                                                  
            noop(TraceOn);                                                                          
            nnn := this.counter;                                                                    
          }                                                                                         
        }                                                                                           
        boolean x;                                                                                  
        int tmp1;                                                                                   
        tmp1 = nnn + 1;                                                                             
        {                                                                                           
          noop(TraceOff);                                                                           
          boolean ctmp658774;                                                                       
          ctmp658774 = *;                                                                           
          if (ctmp658774) {                                                                         
            noop(TraceOn);                                                                          
            x = false;                                                                              
          } else {                                                                                  
            ctmp658774 = *;                                                                         
            if (ctmp658774) {                                                                       
              Tid tmpTid;                                                                           
              int tmpValue;                                                                         
              Mover _m;                                                                             
              _m = writePermission(this.counter, tmp1);                                             
              assume this.counter == nnn;                                                           
              assume !goesWrong(_m);                                                                
              assume this.counter_nextThread == tid;                                                
              assume this.counter_nextValue == nnn;                                                 
              this.counter_nextThread := tmpTid as B;                                               
              this.counter_nextValue := tmpValue as B;                                              
              noop(TraceOn);                                                                        
              this.counter := tmp1;                                                                 
              x = true;                                                                             
            } else {                                                                                
              assume this.counter_nextThread == tid;                                                
              assume this.counter_nextValue == nnn;                                                 
              int _currentValue;                                                                    
              _currentValue := this.counter  as B;                                                  
              this.counter := nnn as B;                                                             
              Mover _m;                                                                             
              _m = writePermission(this.counter, tmp1);                                             
              this.counter := _currentValue as B;                                                   
              assume goesWrong(_m);                                                                 
              noop(TraceOn);                                                                        
              this.counter := tmp1;                                                                 
              x = false;                                                                            
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
                                                                                                    
                                                                                                    
/*** Class Decl Inc2 ***/                                                                           
                                                                                                    
type Inc2;                                                                                          
const unique Inc2.null: Inc2;                                                                       
var Inc2._state: [Inc2]State;                                                                       
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc2.counter: [Inc2]int;                                                                        
                                                                                                    
function {:inline} ReadEval.Inc2.counter(tid: Tid,this : Inc2,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if ((newValue==(Inc2.counter[this]+1))) then                                                      
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc2.counter(tid: Tid,this : Inc2,newValue: int,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isRead) then                                                                                   
  moverPath(_N, 1)                                                                                  
 else                                                                                               
  if ((newValue==(Inc2.counter[this]+1))) then                                                      
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc2._lock: [Inc2]Tid;                                                                          
                                                                                                    
function {:inline} ReadEval.Inc2._lock(tid: Tid,this : Inc2,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc2._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc2._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc2._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc2._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc2._lock(tid: Tid,this : Inc2,newValue: Tid,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc2._state[this], tid)) then                                                          
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Inc2._lock[this]==tid)) then                                                                
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Inc2._lock[this]==Tid.null)&&(newValue==tid))) then                                        
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Inc2._lock[this]==tid)&&(newValue==Tid.null))) then                                       
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc2.counter_nextThread: [Inc2]Tid;                                                             
                                                                                                    
function {:inline} ReadEval.Inc2.counter_nextThread(tid: Tid,this : Inc2,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Inc2._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc2.counter_nextThread[this]==tid)) then                                                    
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc2.counter_nextThread(tid: Tid,this : Inc2,newValue: Tid,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc2._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc2.counter_nextThread[this]==tid)) then                                                    
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Inc2.counter_nextValue: [Inc2]int;                                                              
                                                                                                    
function {:inline} ReadEval.Inc2.counter_nextValue(tid: Tid,this : Inc2,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if (isLocal(Inc2._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc2.counter_nextThread[this]==tid)) then                                                    
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Inc2.counter_nextValue(tid: Tid,this : Inc2,newValue: int,Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Inc2._state[this], tid)) then                                                          
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  if ((Inc2.counter_nextThread[this]==tid)) then                                                    
   moverPath(_N, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Inc2.inc(tid:Tid, this : Inc2)                                                           
modifies Inc2._state;                                                                               
modifies Inc2.counter;                                                                              
modifies Inc2._lock;                                                                                
modifies Inc2.counter_nextThread;                                                                   
modifies Inc2.counter_nextValue;                                                                    
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.5): Bad tid
requires isShared(Inc2._state[this]);                                                                      // (6.5): this is not global
                                                                                                    
requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
                                                                                                    
ensures StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
{                                                                                                   
 var Inc2.counter_nextValue673921: [Inc2]int;                                                       
 var tid673798: Tid;                                                                                
 var moverPath673754: MoverPath;                                                                    
 var Inc2._state673938: [Inc2]State;                                                                
 var Inc2._state673798: [Inc2]State;                                                                
 var ctmp658774673883: bool;                                                                        
 var $recorded.state673921: int;                                                                    
 var _currentValue: int;                                                                            
 var ctmp658774673906: bool;                                                                        
 var tid673909: Tid;                                                                                
 var nnn673748: int;                                                                                
 var Inc2.counter_nextValue673760: [Inc2]int;                                                       
 var this673909: Inc2;                                                                              
 var mover673921: Mover;                                                                            
 var tmpValue673879: int;                                                                           
 var $pc673938: Phase;                                                                              
 var _C_t: Tid;                                                                                     
 var _C_t673748: Tid;                                                                               
 var Inc2._state673803: [Inc2]State;                                                                
 var path673876: int;                                                                               
 var moverPath673906: MoverPath;                                                                    
 var this673883: Inc2;                                                                              
 var $pc673748: Phase;                                                                              
 var $pc673798: Phase;                                                                              
 var _C_t673798: Tid;                                                                               
 var this673754: Inc2;                                                                              
 var _currentValue673909: int;                                                                      
 var _m673876: Mover;                                                                               
 var $pc673754: Phase;                                                                              
 var _casable: bool;                                                                                
 var mover673928: Mover;                                                                            
 var tmp1673928: int;                                                                               
 var $pc673906: Phase;                                                                              
 var Inc2.counter_nextThread673803: [Inc2]Tid;                                                      
 var Inc2._lock673883: [Inc2]Tid;                                                                   
 var moverPath673928: MoverPath;                                                                    
 var Inc2.counter_nextThread673876: [Inc2]Tid;                                                      
 var tid673906: Tid;                                                                                
 var $recorded.state673906: int;                                                                    
 var Inc2._lock673748: [Inc2]Tid;                                                                   
 var this673760: Inc2;                                                                              
 var $recorded.state673760: int;                                                                    
 var _m673928: Mover;                                                                               
 var tmpValue: int;                                                                                 
 var tmp1673883: int;                                                                               
 var tmpTid673883: Tid;                                                                             
 var Inc2.counter_nextValue673748: [Inc2]int;                                                       
 var Inc2.counter_nextValue673909: [Inc2]int;                                                       
 var $pc673909: Phase;                                                                              
 var Inc2.counter673879: [Inc2]int;                                                                 
 var tmpValue673883: int;                                                                           
 var moverPath673760: MoverPath;                                                                    
 var path673921: int;                                                                               
 var Inc2.counter_nextThread673883: [Inc2]Tid;                                                      
 var Inc2.counter_nextValue673798: [Inc2]int;                                                       
 var Inc2._lock673876: [Inc2]Tid;                                                                   
 var x673906: bool;                                                                                 
 var ctmp658774673928: bool;                                                                        
 var ctmp658774673909: bool;                                                                        
 var $recorded.state673883: int;                                                                    
 var x673909: bool;                                                                                 
 var Inc2._lock673803: [Inc2]Tid;                                                                   
 var _currentValue673921: int;                                                                      
 var Inc2.counter_nextValue673906: [Inc2]int;                                                       
 var ctmp658774673921: bool;                                                                        
 var Inc2._state673909: [Inc2]State;                                                                
 var Inc2.counter_nextThread673928: [Inc2]Tid;                                                      
 var Inc2._lock673938: [Inc2]Tid;                                                                   
 var Inc2._lock673906: [Inc2]Tid;                                                                   
 var nnn673883: int;                                                                                
 var tmp1673879: int;                                                                               
 var _C_v: int;                                                                                     
 var _C_v673803: int;                                                                               
 var Inc2.counter673876: [Inc2]int;                                                                 
 var tmpTid673876: Tid;                                                                             
 var this673876: Inc2;                                                                              
 var Inc2.counter673798: [Inc2]int;                                                                 
 var Inc2.counter_nextValue673803: [Inc2]int;                                                       
 var tid673876: Tid;                                                                                
 var Inc2.counter_nextValue673938: [Inc2]int;                                                       
 var $recorded.state673938: int;                                                                    
 var _currentValue673803: int;                                                                      
 var path673906: int;                                                                               
 var $pc673803: Phase;                                                                              
 var moverPath673883: MoverPath;                                                                    
 var nnn673928: int;                                                                                
 var $recorded.state673928: int;                                                                    
 var Inc2.counter673754: [Inc2]int;                                                                 
 var $recorded.state673909: int;                                                                    
 var Inc2._state673928: [Inc2]State;                                                                
 var Inc2.counter_nextThread673938: [Inc2]Tid;                                                      
 var tmp1673921: int;                                                                               
 var nnn673876: int;                                                                                
 var nnn673879: int;                                                                                
 var this673879: Inc2;                                                                              
 var Inc2.counter_nextThread673754: [Inc2]Tid;                                                      
 var $pc673760: Phase;                                                                              
 var $pc673883: Phase;                                                                              
 var Inc2.counter_nextThread673748: [Inc2]Tid;                                                      
 var Inc2._lock673909: [Inc2]Tid;                                                                   
 var $recorded.state673748: int;                                                                    
 var _R_t673798: Mover;                                                                             
 var Inc2.counter_nextValue673879: [Inc2]int;                                                       
 var _C_t673754: Tid;                                                                               
 var Inc2.counter_nextThread673879: [Inc2]Tid;                                                      
 var nnn: int;                                                                                      
 var Inc2.counter_nextValue673928: [Inc2]int;                                                       
 var Inc2._lock673921: [Inc2]Tid;                                                                   
 var tid673803: Tid;                                                                                
 var ctmp658774: bool;                                                                              
 var _m673879: Mover;                                                                               
 var tmpValue673876: int;                                                                           
 var tid673879: Tid;                                                                                
 var tmp1673876: int;                                                                               
 var $recorded.state673798: int;                                                                    
 var $recorded.state673879: int;                                                                    
 var ctmp658774673876: bool;                                                                        
 var tid673748: Tid;                                                                                
 var Inc2._state673754: [Inc2]State;                                                                
 var tid673760: Tid;                                                                                
 var this673938: Inc2;                                                                              
 var nnn673938: int;                                                                                
 var Inc2.counter673803: [Inc2]int;                                                                 
 var Inc2.counter673906: [Inc2]int;                                                                 
 var this673803: Inc2;                                                                              
 var path673909: int;                                                                               
 var Inc2._state673876: [Inc2]State;                                                                
 var Inc2.counter_nextThread673906: [Inc2]Tid;                                                      
 var nnn673803: int;                                                                                
 var $pc673921: Phase;                                                                              
 var Inc2.counter_nextValue673876: [Inc2]int;                                                       
 var Inc2._state673760: [Inc2]State;                                                                
 var tmp1: int;                                                                                     
 var _R_t: Mover;                                                                                   
 var _C_v673760: int;                                                                               
 var path673754: int;                                                                               
 var moverPath673876: MoverPath;                                                                    
 var x673928: bool;                                                                                 
 var moverPath673909: MoverPath;                                                                    
 var tid673928: Tid;                                                                                
 var path673879: int;                                                                               
 var mover673883: Mover;                                                                            
 var tid673938: Tid;                                                                                
 var tid673921: Tid;                                                                                
 var _m: Mover;                                                                                     
 var path673748: int;                                                                               
 var _C_t673803: Tid;                                                                               
 var _currentValue673798: int;                                                                      
 var _currentValue673760: int;                                                                      
 var nnn673909: int;                                                                                
 var tmp1673909: int;                                                                               
 var path673760: int;                                                                               
 var this673906: Inc2;                                                                              
 var Inc2._lock673879: [Inc2]Tid;                                                                   
 var tmp1673938: int;                                                                               
 var x: bool;                                                                                       
 var mover673754: Mover;                                                                            
 var Inc2.counter_nextThread673798: [Inc2]Tid;                                                      
 var Inc2._lock673928: [Inc2]Tid;                                                                   
 var Inc2._state673879: [Inc2]State;                                                                
 var Inc2.counter_nextValue673754: [Inc2]int;                                                       
 var $recorded.state673754: int;                                                                    
 var Inc2._state673883: [Inc2]State;                                                                
 var nnn673760: int;                                                                                
 var x673938: bool;                                                                                 
 var path673803: int;                                                                               
 var Inc2._lock673760: [Inc2]Tid;                                                                   
 var Inc2.counter_nextThread673921: [Inc2]Tid;                                                      
 var path673883: int;                                                                               
 var _C_v673754: int;                                                                               
 var $recorded.state673803: int;                                                                    
 var tid673883: Tid;                                                                                
 var nnn673798: int;                                                                                
 var _currentValue673928: int;                                                                      
 var mover673876: Mover;                                                                            
 var tmp1673906: int;                                                                               
 var _m673883: Mover;                                                                               
 var mover673760: Mover;                                                                            
 var $pc673928: Phase;                                                                              
 var mover673906: Mover;                                                                            
 var _casable673798: bool;                                                                          
 var x673879: bool;                                                                                 
 var tmpTid: Tid;                                                                                   
 var nnn673906: int;                                                                                
 var tmpTid673879: Tid;                                                                             
 var this673928: Inc2;                                                                              
 var _currentValue673906: int;                                                                      
 var Inc2._state673921: [Inc2]State;                                                                
 var path673928: int;                                                                               
 var Inc2.counter673921: [Inc2]int;                                                                 
 var mover673798: Mover;                                                                            
 var Inc2.counter_nextValue673883: [Inc2]int;                                                       
 var moverPath673921: MoverPath;                                                                    
 var nnn673921: int;                                                                                
 var mover673909: Mover;                                                                            
 var moverPath673879: MoverPath;                                                                    
 var _R_t673803: Mover;                                                                             
 var Inc2._lock673798: [Inc2]Tid;                                                                   
 var Inc2._state673906: [Inc2]State;                                                                
 var path673798: int;                                                                               
 var this673748: Inc2;                                                                              
 var moverPath673803: MoverPath;                                                                    
 var x673883: bool;                                                                                 
 var x673876: bool;                                                                                 
 var nnn673754: int;                                                                                
 var Inc2._state673748: [Inc2]State;                                                                
 var Inc2._lock673754: [Inc2]Tid;                                                                   
 var mover673803: Mover;                                                                            
 var Inc2.counter673938: [Inc2]int;                                                                 
 var $pc673876: Phase;                                                                              
 var Inc2.counter673928: [Inc2]int;                                                                 
 var ctmp658774673879: bool;                                                                        
 var _C_v673798: int;                                                                               
 var Inc2.counter673748: [Inc2]int;                                                                 
 var this673921: Inc2;                                                                              
 var Inc2.counter_nextThread673909: [Inc2]Tid;                                                      
 var tid673754: Tid;                                                                                
 var Inc2.counter673909: [Inc2]int;                                                                 
 var mover673879: Mover;                                                                            
 var this673798: Inc2;                                                                              
 var x673921: bool;                                                                                 
 var moverPath673798: MoverPath;                                                                    
 var moverPath673748: MoverPath;                                                                    
 var _C_t673760: Tid;                                                                               
 var Inc2.counter673760: [Inc2]int;                                                                 
 var Inc2.counter673883: [Inc2]int;                                                                 
 var _casable673803: bool;                                                                          
 var Inc2.counter_nextThread673760: [Inc2]Tid;                                                      
 var mover673748: Mover;                                                                            
 var _m673921: Mover;                                                                               
 var $recorded.state673876: int;                                                                    
 var $pc673879: Phase;                                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 7.9: int nnn;                                                                                   
                                                                                                    
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 7.9: Tid _C_t;                                                                                  
                                                                                                    
                                                                                                    
 // 7.9: _C_t := this.counter_nextThread  as B;                                                     
                                                                                                    
                                                                                                    
 moverPath673748 := ReadEval.Inc2.counter_nextThread(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 mover673748 := m#moverPath(moverPath673748);                                                       
 path673748 := p#moverPath(moverPath673748);                                                        
 assume Inc2._state673748 == Inc2._state && Inc2.counter673748 == Inc2.counter && Inc2._lock673748 == Inc2._lock && Inc2.counter_nextThread673748 == Inc2.counter_nextThread && Inc2.counter_nextValue673748 == Inc2.counter_nextValue && _C_t673748 == _C_t && nnn673748 == nnn && this673748 == this && tid673748 == tid && $pc673748 == $pc;
 assume $recorded.state673748 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Inc2.null;                                                                         
 } else {                                                                                           
  assert this != Inc2.null;                                                                                // (7.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (7.9): Reduction failure
 _C_t := Inc2.counter_nextThread[this];                                                             
                                                                                                    
 // 7.9: int _C_v;                                                                                  
                                                                                                    
                                                                                                    
 // 7.9: _C_v := this.counter_nextValue  as B;                                                      
                                                                                                    
                                                                                                    
 moverPath673754 := ReadEval.Inc2.counter_nextValue(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 mover673754 := m#moverPath(moverPath673754);                                                       
 path673754 := p#moverPath(moverPath673754);                                                        
 assume Inc2._state673754 == Inc2._state && Inc2.counter673754 == Inc2.counter && Inc2._lock673754 == Inc2._lock && Inc2.counter_nextThread673754 == Inc2.counter_nextThread && Inc2.counter_nextValue673754 == Inc2.counter_nextValue && _C_v673754 == _C_v && _C_t673754 == _C_t && nnn673754 == nnn && this673754 == this && tid673754 == tid && $pc673754 == $pc;
 assume $recorded.state673754 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Inc2.null;                                                                         
 } else {                                                                                           
  assert this != Inc2.null;                                                                                // (7.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (7.9): Reduction failure
 _C_v := Inc2.counter_nextValue[this];                                                              
                                                                                                    
 // 7.9: int _currentValue;                                                                         
                                                                                                    
                                                                                                    
 // 7.9: _currentValue := this.counter  as B;                                                       
                                                                                                    
                                                                                                    
 moverPath673760 := ReadEval.Inc2.counter(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 mover673760 := m#moverPath(moverPath673760);                                                       
 path673760 := p#moverPath(moverPath673760);                                                        
 assume Inc2._state673760 == Inc2._state && Inc2.counter673760 == Inc2.counter && Inc2._lock673760 == Inc2._lock && Inc2.counter_nextThread673760 == Inc2.counter_nextThread && Inc2.counter_nextValue673760 == Inc2.counter_nextValue && _currentValue673760 == _currentValue && _C_v673760 == _C_v && _C_t673760 == _C_t && nnn673760 == nnn && this673760 == this && tid673760 == tid && $pc673760 == $pc;
 assume $recorded.state673760 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Inc2.null;                                                                         
 } else {                                                                                           
  assert this != Inc2.null;                                                                                // (7.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, _B);                                                                        
 assert $pc != PhaseError;                                                                                 // (7.9): Reduction failure
 _currentValue := Inc2.counter[this];                                                               
                                                                                                    
 // 7.9: Mover _R_t;                                                                                
                                                                                                    
                                                                                                    
 // 7.9: _R_t = readPermission(this.counter);                                                       
                                                                                                    
 _R_t := m#moverPath(ReadEval.Inc2.counter(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue));
                                                                                                    
 // 7.9: boolean _casable;                                                                          
                                                                                                    
                                                                                                    
 // 7.9: _casable = _R_t != E && false && _C_t == tid && _C_v == _currentValue;                     
                                                                                                    
 _casable := ((((_R_t!=_E)&&false)&&(_C_t==tid))&&(_C_v==_currentValue));                           
 if (_casable) {                                                                                    
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 7.9: nnn := this.counter  as R;                                                                
                                                                                                    
                                                                                                    
  moverPath673798 := ReadEval.Inc2.counter(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
  mover673798 := m#moverPath(moverPath673798);                                                      
  path673798 := p#moverPath(moverPath673798);                                                       
  assume Inc2._state673798 == Inc2._state && Inc2.counter673798 == Inc2.counter && Inc2._lock673798 == Inc2._lock && Inc2.counter_nextThread673798 == Inc2.counter_nextThread && Inc2.counter_nextValue673798 == Inc2.counter_nextValue && _casable673798 == _casable && _R_t673798 == _R_t && _currentValue673798 == _currentValue && _C_v673798 == _C_v && _C_t673798 == _C_t && nnn673798 == nnn && this673798 == this && tid673798 == tid && $pc673798 == $pc;
  assume $recorded.state673798 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc2.null;                                                                        
  } else {                                                                                          
   assert this != Inc2.null;                                                                               // (7.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, _R);                                                                       
  assert $pc != PhaseError;                                                                                // (7.9): Reduction failure
  nnn := Inc2.counter[this];                                                                        
 } else {                                                                                           
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 7.9: nnn := this.counter;                                                                      
                                                                                                    
                                                                                                    
  moverPath673803 := ReadEval.Inc2.counter(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
  mover673803 := m#moverPath(moverPath673803);                                                      
  path673803 := p#moverPath(moverPath673803);                                                       
  assume Inc2._state673803 == Inc2._state && Inc2.counter673803 == Inc2.counter && Inc2._lock673803 == Inc2._lock && Inc2.counter_nextThread673803 == Inc2.counter_nextThread && Inc2.counter_nextValue673803 == Inc2.counter_nextValue && _casable673803 == _casable && _R_t673803 == _R_t && _currentValue673803 == _currentValue && _C_v673803 == _C_v && _C_t673803 == _C_t && nnn673803 == nnn && this673803 == this && tid673803 == tid && $pc673803 == $pc;
  assume $recorded.state673803 == 1;                                                                
  if ($pc == PreCommit) {                                                                           
   assume this != Inc2.null;                                                                        
  } else {                                                                                          
   assert this != Inc2.null;                                                                               // (7.9): Cannot have potential null deference in left-mover part.
  }                                                                                                 
                                                                                                    
  $pc := transition($pc, mover673803);                                                              
  assert $pc != PhaseError;                                                                                // (7.9): Reduction failure
  nnn := Inc2.counter[this];                                                                        
 }                                                                                                  
                                                                                                    
 // 8.9: boolean x;                                                                                 
                                                                                                    
                                                                                                    
 // 8.9: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 8.9: tmp1 = nnn + 1;                                                                            
                                                                                                    
 tmp1 := (nnn+1);                                                                                   
 // NoOp: 'TraceOff'                                                                                
                                                                                                    
 // 8.9: boolean ctmp658774;                                                                        
                                                                                                    
                                                                                                    
 // 8.9: ctmp658774 = *;                                                                            
                                                                                                    
 havoc ctmp658774;                                                                                  
 if (ctmp658774) {                                                                                  
  // NoOp: 'TraceOn'                                                                                
                                                                                                    
  // 8.9: x = false;                                                                                
                                                                                                    
  x := false;                                                                                       
 } else {                                                                                           
                                                                                                    
  // 8.9: ctmp658774 = *;                                                                           
                                                                                                    
  havoc ctmp658774;                                                                                 
  if (ctmp658774) {                                                                                 
                                                                                                    
   // 8.9: Tid tmpTid;                                                                              
                                                                                                    
                                                                                                    
   // 8.9: int tmpValue;                                                                            
                                                                                                    
                                                                                                    
   // 8.9: Mover _m;                                                                                
                                                                                                    
                                                                                                    
   // 8.9: _m = writePermission(this.counter, tmp1);                                                
                                                                                                    
   _m := m#moverPath(WriteEval.Inc2.counter(tid: Tid,this: Inc2,tmp1: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue));
                                                                                                    
   // 8.9: assume this.counter == nnn;                                                              
                                                                                                    
   assume (Inc2.counter[this]==nnn);                                                                
                                                                                                    
   // 8.9: assume !goesWrong(_m);                                                                   
                                                                                                    
   assume !(transition($pc, _m) == PhaseError);                                                     
                                                                                                    
   // 8.9: assume this.counter_nextThread == tid;                                                   
                                                                                                    
   assume (Inc2.counter_nextThread[this]==tid);                                                     
                                                                                                    
   // 8.9: assume this.counter_nextValue == nnn;                                                    
                                                                                                    
   assume (Inc2.counter_nextValue[this]==nnn);                                                      
                                                                                                    
                                                                                                    
   // 8.9: this.counter_nextThread := tmpTid as B;                                                  
                                                                                                    
                                                                                                    
   moverPath673876 := WriteEval.Inc2.counter_nextThread(tid: Tid,this: Inc2,tmpTid: Tid,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673876 := m#moverPath(moverPath673876);                                                     
   path673876 := p#moverPath(moverPath673876);                                                      
   assume Inc2._state673876 == Inc2._state && Inc2.counter673876 == Inc2.counter && Inc2._lock673876 == Inc2._lock && Inc2.counter_nextThread673876 == Inc2.counter_nextThread && Inc2.counter_nextValue673876 == Inc2.counter_nextValue && _m673876 == _m && tmpValue673876 == tmpValue && tmpTid673876 == tmpTid && ctmp658774673876 == ctmp658774 && tmp1673876 == tmp1 && x673876 == x && nnn673876 == nnn && this673876 == this && tid673876 == tid && $pc673876 == $pc;
   assume $recorded.state673876 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   Inc2.counter_nextThread[this] := tmpTid;                                                         
                                                                                                    
                                                                                                    
   // 8.9: this.counter_nextValue := tmpValue as B;                                                 
                                                                                                    
                                                                                                    
   moverPath673879 := WriteEval.Inc2.counter_nextValue(tid: Tid,this: Inc2,tmpValue: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673879 := m#moverPath(moverPath673879);                                                     
   path673879 := p#moverPath(moverPath673879);                                                      
   assume Inc2._state673879 == Inc2._state && Inc2.counter673879 == Inc2.counter && Inc2._lock673879 == Inc2._lock && Inc2.counter_nextThread673879 == Inc2.counter_nextThread && Inc2.counter_nextValue673879 == Inc2.counter_nextValue && _m673879 == _m && tmpValue673879 == tmpValue && tmpTid673879 == tmpTid && ctmp658774673879 == ctmp658774 && tmp1673879 == tmp1 && x673879 == x && nnn673879 == nnn && this673879 == this && tid673879 == tid && $pc673879 == $pc;
   assume $recorded.state673879 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   Inc2.counter_nextValue[this] := tmpValue;                                                        
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 8.9: this.counter := tmp1;                                                                    
                                                                                                    
                                                                                                    
   moverPath673883 := WriteEval.Inc2.counter(tid: Tid,this: Inc2,tmp1: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673883 := m#moverPath(moverPath673883);                                                     
   path673883 := p#moverPath(moverPath673883);                                                      
   assume Inc2._state673883 == Inc2._state && Inc2.counter673883 == Inc2.counter && Inc2._lock673883 == Inc2._lock && Inc2.counter_nextThread673883 == Inc2.counter_nextThread && Inc2.counter_nextValue673883 == Inc2.counter_nextValue && _m673883 == _m && tmpValue673883 == tmpValue && tmpTid673883 == tmpTid && ctmp658774673883 == ctmp658774 && tmp1673883 == tmp1 && x673883 == x && nnn673883 == nnn && this673883 == this && tid673883 == tid && $pc673883 == $pc;
   assume $recorded.state673883 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover673883);                                                             
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   Inc2.counter[this] := tmp1;                                                                      
                                                                                                    
   // 8.9: x = true;                                                                                
                                                                                                    
   x := true;                                                                                       
  } else {                                                                                          
                                                                                                    
   // 8.9: assume this.counter_nextThread == tid;                                                   
                                                                                                    
   assume (Inc2.counter_nextThread[this]==tid);                                                     
                                                                                                    
   // 8.9: assume this.counter_nextValue == nnn;                                                    
                                                                                                    
   assume (Inc2.counter_nextValue[this]==nnn);                                                      
                                                                                                    
   // 8.9: int _currentValue;                                                                       
                                                                                                    
                                                                                                    
   // 8.9: _currentValue := this.counter  as B;                                                     
                                                                                                    
                                                                                                    
   moverPath673906 := ReadEval.Inc2.counter(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673906 := m#moverPath(moverPath673906);                                                     
   path673906 := p#moverPath(moverPath673906);                                                      
   assume Inc2._state673906 == Inc2._state && Inc2.counter673906 == Inc2.counter && Inc2._lock673906 == Inc2._lock && Inc2.counter_nextThread673906 == Inc2.counter_nextThread && Inc2.counter_nextValue673906 == Inc2.counter_nextValue && _currentValue673906 == _currentValue && ctmp658774673906 == ctmp658774 && tmp1673906 == tmp1 && x673906 == x && nnn673906 == nnn && this673906 == this && tid673906 == tid && $pc673906 == $pc;
   assume $recorded.state673906 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
                                                                                                    
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   _currentValue := Inc2.counter[this];                                                             
                                                                                                    
                                                                                                    
   // 8.9: this.counter := nnn as B;                                                                
                                                                                                    
                                                                                                    
   moverPath673909 := WriteEval.Inc2.counter(tid: Tid,this: Inc2,nnn: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673909 := m#moverPath(moverPath673909);                                                     
   path673909 := p#moverPath(moverPath673909);                                                      
   assume Inc2._state673909 == Inc2._state && Inc2.counter673909 == Inc2.counter && Inc2._lock673909 == Inc2._lock && Inc2.counter_nextThread673909 == Inc2.counter_nextThread && Inc2.counter_nextValue673909 == Inc2.counter_nextValue && _currentValue673909 == _currentValue && ctmp658774673909 == ctmp658774 && tmp1673909 == tmp1 && x673909 == x && nnn673909 == nnn && this673909 == this && tid673909 == tid && $pc673909 == $pc;
   assume $recorded.state673909 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   Inc2.counter[this] := nnn;                                                                       
                                                                                                    
   // 8.9: Mover _m;                                                                                
                                                                                                    
                                                                                                    
   // 8.9: _m = writePermission(this.counter, tmp1);                                                
                                                                                                    
   _m := m#moverPath(WriteEval.Inc2.counter(tid: Tid,this: Inc2,tmp1: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue));
                                                                                                    
                                                                                                    
   // 8.9: this.counter := _currentValue as B;                                                      
                                                                                                    
                                                                                                    
   moverPath673921 := WriteEval.Inc2.counter(tid: Tid,this: Inc2,_currentValue: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673921 := m#moverPath(moverPath673921);                                                     
   path673921 := p#moverPath(moverPath673921);                                                      
   assume Inc2._state673921 == Inc2._state && Inc2.counter673921 == Inc2.counter && Inc2._lock673921 == Inc2._lock && Inc2.counter_nextThread673921 == Inc2.counter_nextThread && Inc2.counter_nextValue673921 == Inc2.counter_nextValue && _m673921 == _m && _currentValue673921 == _currentValue && ctmp658774673921 == ctmp658774 && tmp1673921 == tmp1 && x673921 == x && nnn673921 == nnn && this673921 == this && tid673921 == tid && $pc673921 == $pc;
   assume $recorded.state673921 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, _B);                                                                      
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   Inc2.counter[this] := _currentValue;                                                             
                                                                                                    
   // 8.9: assume goesWrong(_m);                                                                    
                                                                                                    
   assume transition($pc, _m) == PhaseError;                                                        
   // NoOp: 'TraceOn'                                                                               
                                                                                                    
                                                                                                    
   // 8.9: this.counter := tmp1;                                                                    
                                                                                                    
                                                                                                    
   moverPath673928 := WriteEval.Inc2.counter(tid: Tid,this: Inc2,tmp1: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
   mover673928 := m#moverPath(moverPath673928);                                                     
   path673928 := p#moverPath(moverPath673928);                                                      
   assume Inc2._state673928 == Inc2._state && Inc2.counter673928 == Inc2.counter && Inc2._lock673928 == Inc2._lock && Inc2.counter_nextThread673928 == Inc2.counter_nextThread && Inc2.counter_nextValue673928 == Inc2.counter_nextValue && _m673928 == _m && _currentValue673928 == _currentValue && ctmp658774673928 == ctmp658774 && tmp1673928 == tmp1 && x673928 == x && nnn673928 == nnn && this673928 == this && tid673928 == tid && $pc673928 == $pc;
   assume $recorded.state673928 == 1;                                                               
   if ($pc == PreCommit) {                                                                          
    assume this != Inc2.null;                                                                       
   } else {                                                                                         
    assert this != Inc2.null;                                                                              // (8.9): Cannot have potential null deference in left-mover part.
   }                                                                                                
   $pc := transition($pc, mover673928);                                                             
   assert $pc != PhaseError;                                                                               // (8.9): Reduction failure
   Inc2.counter[this] := tmp1;                                                                      
                                                                                                    
   // 8.9: x = false;                                                                               
                                                                                                    
   x := false;                                                                                      
  }                                                                                                 
 }                                                                                                  
                                                                                                    
 // 6.23: // return;                                                                                
                                                                                                    
 assume Inc2._state673938 == Inc2._state && Inc2.counter673938 == Inc2.counter && Inc2._lock673938 == Inc2._lock && Inc2.counter_nextThread673938 == Inc2.counter_nextThread && Inc2.counter_nextValue673938 == Inc2.counter_nextValue && tmp1673938 == tmp1 && x673938 == x && nnn673938 == nnn && this673938 == this && tid673938 == tid;
 assume $recorded.state673938 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Inc2._state: [Inc2]State,Inc2.counter: [Inc2]int,Inc2._lock: [Inc2]Tid,Inc2.counter_nextThread: [Inc2]Tid,Inc2.counter_nextValue: [Inc2]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Inc2  :: _i == Inc2.null <==> isNull(Inc2._state[_i])) &&                             
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Inc2.counter(t: Tid, u: Tid, v: int, w: int, x: Inc2)        
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.counter;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc2.counter[x] := v;                                                                              
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc2.counter(u: Tid,x: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Inc2.counter failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Inc2.counter(t: Tid, u: Tid, v: int, w: int, x: Inc2)         
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.counter;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Inc2.counter[x] := v;                                                                              
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Inc2.counter(u: Tid,x: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): Inc2.counter failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Inc2.counter(t: Tid, u: Tid, v: int, w: int, x: Inc2)         
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.counter;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 assume w == Inc2.counter[x];                                                                       
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Inc2.counter[x] := havocValue;                                                                     
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Inc2.counter(u: Tid,x: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Inc2.counter failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Inc2.counter(t: Tid, u: Tid, v: int, w: int, x: Inc2)          
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.counter;                                                                             
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 assume w == Inc2.counter[x];                                                                       
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Inc2.counter(u: Tid,x: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Inc2.counter failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Inc2.counter(t: Tid, u: Tid, v: int, w: int, x: Inc2)              
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.counter;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc2.counter(t: Tid,x: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Inc2.counter(u: Tid,x: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Inc2.counter failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Inc2.counter(t: Tid, u: Tid, v: int, w: int, x: Inc2)               
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[x], u);                                                          
 modifies Inc2.counter;                                                                             
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
 assume w == Inc2.counter[x];                                                                       
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Inc2.counter(t: Tid,x: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Inc2.counter[x] := havocValue;                                                                     
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Inc2.counter(u: Tid,x: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Inc2.counter failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.counter[x] := v;                                                                              
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2.counter_nextThread_mid: [Inc2]Tid;                                                        
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var Inc2.counter_mid: [Inc2]int;                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var x_mid: Inc2;                                                                                   
 var y_mid: Inc2;                                                                                   
 var Inc2.counter_nextValue_mid: [Inc2]int;                                                         
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Inc2.counter[x];                                                                           
 Inc2.counter[x] := v;                                                                              
                                                                                                    
 assume Inc2._state_mid == Inc2._state && Inc2.counter_mid == Inc2.counter && Inc2._lock_mid == Inc2._lock && Inc2.counter_nextThread_mid == Inc2.counter_nextThread && Inc2.counter_nextValue_mid == Inc2.counter_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Inc2.counter[x] := tmpV;                                                                           
 Inc2.counter[y] := w;                                                                              
 _writeByTPost := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2.counter_nextThread_mid: [Inc2]Tid;                                                        
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var Inc2.counter_mid: [Inc2]int;                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var Inc2._state_mid: [Inc2]State;                                                                  
 var x_mid: Inc2;                                                                                   
 var y_mid: Inc2;                                                                                   
 var Inc2.counter_nextValue_mid: [Inc2]int;                                                         
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Inc2.counter[x];                                                                           
 Inc2.counter[x] := v;                                                                              
 assume Inc2._state_mid == Inc2._state && Inc2.counter_mid == Inc2.counter && Inc2._lock_mid == Inc2._lock && Inc2.counter_nextThread_mid == Inc2.counter_nextThread && Inc2.counter_nextValue_mid == Inc2.counter_nextValue && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Inc2.counter[x] := tmpV;                                                                           
 Inc2.counter[y] := w;                                                                              
 _writeByTPost := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Inc2.counter(t: Tid,x: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.counter[y] := w;                                                                              
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Inc2.counter(t: Tid,x: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Inc2.counter is not Read-Write Stable with respect to Inc2.counter (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Inc2.counter is not Read-Write Stable with respect to Inc2.counter (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Inc2.counter is not Read-Write Stable with respect to Inc2.counter (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v: int, w: int, w0: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Inc2.counter(u: Tid,y: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Inc2.counter[x] := v;                                                                              
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Inc2.counter(u: Tid,y: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Inc2.counter is not Write-Read Stable with respect to Inc2.counter (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Inc2.counter is not Write-Read Stable with respect to Inc2.counter (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Inc2.counter is not Write-Read Stable with respect to Inc2.counter (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.M.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v: int, w1: int, w2: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var w1_pre: int;                                                                                   
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2.counter_nextThread_mid: [Inc2]Tid;                                                        
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var Inc2.counter_mid: [Inc2]int;                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Inc2._state_mid: [Inc2]State;                                                                  
 var x_mid: Inc2;                                                                                   
 var y_mid: Inc2;                                                                                   
 var Inc2.counter_nextValue_mid: [Inc2]int;                                                         
 var v_mid: int;                                                                                    
 var w2_mid: int;                                                                                   
 var w1_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var w2_post: int;                                                                                  
 var w1_post: int;                                                                                  
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var Inc2._state_post: [Inc2]State;                                                                 
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w1: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v_pre == v && w1_pre == w1 && w2_pre == w2 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpW := Inc2.counter[y];                                                                           
 Inc2.counter[y] := w1;                                                                             
                                                                                                    
 assume Inc2._state_mid == Inc2._state && Inc2.counter_mid == Inc2.counter && Inc2._lock_mid == Inc2._lock && Inc2.counter_nextThread_mid == Inc2.counter_nextThread && Inc2.counter_nextValue_mid == Inc2.counter_nextValue && t_mid == t && u_mid == u && v_mid == v && w1_mid == w1 && w2_mid == w2 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUAfterU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w2: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByUAfterU_Mover := m#moverPath(_writeByUAfterU);                                             
 _writeByUAfterU_Path := p#moverPath(_writeByUAfterU);                                              
 Inc2.counter[y] := tmpW;                                                                           
                                                                                                    
 Inc2.counter[x] := v;                                                                              
 Inc2.counter[y] := w1;                                                                             
                                                                                                    
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v_post == v && w1_post == w1 && w2_post == w2 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUAfterTAndU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w2: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByUAfterTAndU_Mover := m#moverPath(_writeByUAfterTAndU);                                     
 _writeByUAfterTAndU_Path := p#moverPath(_writeByUAfterTAndU);                                      
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _N) && true && true) ==> ((_writeByUAfterU_Mover == _writeByUAfterTAndU_Mover || _writeByUAfterU_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case M)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.N.Inc2.counter.Inc2.counter(t: Tid, u: Tid, v1: int, v2: int, w: int, x: Inc2, y: Inc2)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Inc2._state[x], t);                                                          
 requires isAccessible(Inc2._state[y], u);                                                          
 modifies Inc2.counter;                                                                             
 modifies Inc2.counter;                                                                             
                                                                                                    
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
 var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                        
 var Inc2.counter_nextValue_pre: [Inc2]int;                                                         
 var v1_pre: int;                                                                                   
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var y_pre: Inc2;                                                                                   
 var Inc2._lock_pre: [Inc2]Tid;                                                                     
 var Inc2.counter_pre: [Inc2]int;                                                                   
 var w_pre: int;                                                                                    
 var Inc2._state_pre: [Inc2]State;                                                                  
 var $pc_pre: Phase;                                                                                
 var v2_pre: int;                                                                                   
 var t_pre: Tid;                                                                                    
 var x_pre: Inc2;                                                                                   
                                                                                                    
 var t_mid: Tid;                                                                                    
 var Inc2.counter_nextThread_mid: [Inc2]Tid;                                                        
 var Inc2._lock_mid: [Inc2]Tid;                                                                     
 var Inc2.counter_mid: [Inc2]int;                                                                   
 var u_mid: Tid;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var v1_mid: int;                                                                                   
 var Inc2._state_mid: [Inc2]State;                                                                  
 var x_mid: Inc2;                                                                                   
 var y_mid: Inc2;                                                                                   
 var Inc2.counter_nextValue_mid: [Inc2]int;                                                         
 var v2_mid: int;                                                                                   
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var Inc2.counter_nextThread_post: [Inc2]Tid;                                                       
 var $recorded.state_post: int;                                                                     
 var v1_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Inc2._lock_post: [Inc2]Tid;                                                                    
 var y_post: Inc2;                                                                                  
 var Inc2.counter_nextValue_post: [Inc2]int;                                                        
 var x_post: Inc2;                                                                                  
 var w_post: int;                                                                                   
 var Inc2._state_post: [Inc2]State;                                                                 
 var v2_post: int;                                                                                  
 var u_post: Tid;                                                                                   
 var Inc2.counter_post: [Inc2]int;                                                                  
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Inc2.counter(u: Tid,y: Inc2,w: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && t_pre == t && u_pre == u && v1_pre == v1 && v2_pre == v2 && w_pre == w && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
                                                                                                    
 tmpV := Inc2.counter[x];                                                                           
 Inc2.counter[x] := v1;                                                                             
 _writeByTAfterT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v2: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByTAfterT_Mover := m#moverPath(_writeByTAfterT);                                             
 _writeByTAfterT_Path := p#moverPath(_writeByTAfterT);                                              
 Inc2.counter[x] := tmpV;                                                                           
                                                                                                    
 Inc2.counter[y] := w;                                                                              
 assume Inc2._state_mid == Inc2._state && Inc2.counter_mid == Inc2.counter && Inc2._lock_mid == Inc2._lock && Inc2.counter_nextThread_mid == Inc2.counter_nextThread && Inc2.counter_nextValue_mid == Inc2.counter_nextValue && t_mid == t && u_mid == u && v1_mid == v1 && v2_mid == v2 && w_mid == w && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v1: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 Inc2.counter[x] := v1;                                                                             
 _writeByTAfterUAndT := WriteEval.Inc2.counter(t: Tid,x: Inc2,v2: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue);
 _writeByTAfterUAndT_Mover := m#moverPath(_writeByTAfterUAndT);                                     
 _writeByTAfterUAndT_Path := p#moverPath(_writeByTAfterUAndT);                                      
                                                                                                    
 assume Inc2._state_post == Inc2._state && Inc2.counter_post == Inc2.counter && Inc2._lock_post == Inc2._lock && Inc2.counter_nextThread_post == Inc2.counter_nextThread && Inc2.counter_nextValue_post == Inc2.counter_nextValue && t_post == t && u_post == u && v1_post == v1 && v2_post == v2 && w_post == w && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByU_Mover, _L)) ==> ((_writeByTAfterUAndT_Mover == _writeByTAfterT_Mover || _writeByTAfterUAndT_Mover == _E));       // (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case N)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
requires ValidTid(tid);                                                                             
modifies Inc2._state;                                                                               
modifies Inc2.counter;                                                                              
modifies Inc2._lock;                                                                                
modifies Inc2.counter_nextThread;                                                                   
modifies Inc2.counter_nextValue;                                                                    
ensures StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
ensures Y(tid , old(Inc2._state), old(Inc2.counter), old(Inc2._lock), old(Inc2.counter_nextThread), old(Inc2.counter_nextValue) , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
                                                                                                    
// Inc2.counter:                                                                                    
                                                                                                    
function {:inline} Y_Inc2.counter(tid : Tid, this: Inc2, newValue: int , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 ((isAccessible(Inc2._state[this], tid) && leq(m#moverPath(ReadEval.Inc2.counter(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)), _R)) ==> (Inc2.counter[this] == newValue))
 &&((newValue>=Inc2.counter[this]))                                                                 
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc2.counter(tid : Tid, this: Inc2, newValue: int , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 true                                                                                               
 &&((newValue>=Inc2.counter[this]))                                                                 
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc2.counter.Subsumes.W(tid : Tid, u : Tid, this: Inc2, newValue: int , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc2.counter_yield: [Inc2]int;                                                                  
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var Inc2.counter_nextThread_yield: [Inc2]Tid;                                                       
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc2.counter_nextValue_yield: [Inc2]int;                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume isAccessible(Inc2._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Inc2.counter(u: Tid,this: Inc2,newValue: int,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)));
                                                                                                    
assume Inc2._state_yield == Inc2._state && Inc2.counter_yield == Inc2.counter && Inc2._lock_yield == Inc2._lock && Inc2.counter_nextThread_yield == Inc2.counter_nextThread && Inc2.counter_nextValue_yield == Inc2.counter_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2.counter(tid, this, newValue , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc2.counter.Reflexive(tid : Tid, this: Inc2 , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc2.counter_yield: [Inc2]int;                                                                  
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc2.counter_nextThread_yield: [Inc2]Tid;                                                       
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc2.counter_nextValue_yield: [Inc2]int;                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
assume Inc2._state_yield == Inc2._state && Inc2.counter_yield == Inc2.counter && Inc2._lock_yield == Inc2._lock && Inc2.counter_nextThread_yield == Inc2.counter_nextThread && Inc2.counter_nextValue_yield == Inc2.counter_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2.counter(tid, this, Inc2.counter[this] , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc2.counter.Transitive(tid : Tid, this: Inc2, newValue : int , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int , Inc2._state_p: [Inc2]State, Inc2.counter_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Inc2.counter_nextThread_p: [Inc2]Tid, Inc2.counter_nextValue_p: [Inc2]int)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires StateInvariant(Inc2._state_p, Inc2.counter_p, Inc2._lock_p, Inc2.counter_nextThread_p, Inc2.counter_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                         
var Inc2.counter_nextValue_pre: [Inc2]int;                                                          
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var Inc2.counter_pre: [Inc2]int;                                                                    
var tid_pre: Tid;                                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Inc2;                                                                                 
                                                                                                    
var Inc2.counter_nextThread_post: [Inc2]Tid;                                                        
var this_post: Inc2;                                                                                
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var Inc2.counter_nextValue_post: [Inc2]int;                                                         
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var Inc2.counter_post: [Inc2]int;                                                                   
                                                                                                    
assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume Y(tid , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue , Inc2._state_p, Inc2.counter_p, Inc2._lock_p, Inc2.counter_nextThread_p, Inc2.counter_nextValue_p);
 assume Y_Inc2.counter(tid, this, newValue , Inc2._state_p, Inc2.counter_p, Inc2._lock_p, Inc2.counter_nextThread_p, Inc2.counter_nextValue_p);
assume Inc2._state_post == Inc2._state_p && Inc2.counter_post == Inc2.counter_p && Inc2._lock_post == Inc2._lock_p && Inc2.counter_nextThread_post == Inc2.counter_nextThread_p && Inc2.counter_nextValue_post == Inc2.counter_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc2.counter(tid, this, newValue , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
}                                                                                                   
// Inc2._lock:                                                                                      
                                                                                                    
function {:inline} Y_Inc2._lock(tid : Tid, this: Inc2, newValue: Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 ((isAccessible(Inc2._state[this], tid) && leq(m#moverPath(ReadEval.Inc2._lock(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)), _R)) ==> (Inc2._lock[this] == newValue))
 &&(((Inc2._lock[this]==tid)==(newValue==tid)))                                                     
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc2._lock(tid : Tid, this: Inc2, newValue: Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Inc2._lock.Subsumes.W(tid : Tid, u : Tid, this: Inc2, newValue: Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Inc2.counter_yield: [Inc2]int;                                                                  
var newValue_yield: Tid;                                                                            
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc2.counter_nextThread_yield: [Inc2]Tid;                                                       
var u_yield: Tid;                                                                                   
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc2.counter_nextValue_yield: [Inc2]int;                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume isAccessible(Inc2._state[this], u);                                                         
 assume !isError(m#moverPath(WriteEval.Inc2._lock(u: Tid,this: Inc2,newValue: Tid,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)));
 assume leq(m#moverPath(ReadEval.Inc2._lock(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)), _N);
assume Inc2._state_yield == Inc2._state && Inc2.counter_yield == Inc2.counter && Inc2._lock_yield == Inc2._lock && Inc2.counter_nextThread_yield == Inc2.counter_nextThread && Inc2.counter_nextValue_yield == Inc2.counter_nextValue && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2._lock(tid, this, newValue , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc2._lock.Reflexive(tid : Tid, this: Inc2 , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc2.counter_yield: [Inc2]int;                                                                  
var Inc2._lock_yield: [Inc2]Tid;                                                                    
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var Inc2.counter_nextThread_yield: [Inc2]Tid;                                                       
var Inc2._state_yield: [Inc2]State;                                                                 
var this_yield: Inc2;                                                                               
var Inc2.counter_nextValue_yield: [Inc2]int;                                                        
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
assume Inc2._state_yield == Inc2._state && Inc2.counter_yield == Inc2.counter && Inc2._lock_yield == Inc2._lock && Inc2.counter_nextThread_yield == Inc2.counter_nextThread && Inc2.counter_nextValue_yield == Inc2.counter_nextValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Inc2._lock(tid, this, Inc2._lock[this] , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
}                                                                                                   
                                                                                                    
procedure Y_Inc2._lock.Transitive(tid : Tid, this: Inc2, newValue : Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int , Inc2._state_p: [Inc2]State, Inc2.counter_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Inc2.counter_nextThread_p: [Inc2]Tid, Inc2.counter_nextValue_p: [Inc2]int)
 requires StateInvariant(Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
 requires StateInvariant(Inc2._state_p, Inc2.counter_p, Inc2._lock_p, Inc2.counter_nextThread_p, Inc2.counter_nextValue_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Inc2.counter_nextThread_pre: [Inc2]Tid;                                                         
var Inc2.counter_nextValue_pre: [Inc2]int;                                                          
var $recorded.state_pre: int;                                                                       
var Inc2._lock_pre: [Inc2]Tid;                                                                      
var Inc2.counter_pre: [Inc2]int;                                                                    
var tid_pre: Tid;                                                                                   
var Inc2._state_pre: [Inc2]State;                                                                   
var $pc_pre: Phase;                                                                                 
var this_pre: Inc2;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var Inc2.counter_nextThread_post: [Inc2]Tid;                                                        
var this_post: Inc2;                                                                                
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Inc2._lock_post: [Inc2]Tid;                                                                     
var Inc2.counter_nextValue_post: [Inc2]int;                                                         
var tid_post: Tid;                                                                                  
var Inc2._state_post: [Inc2]State;                                                                  
var newValue_post: Tid;                                                                             
var Inc2.counter_post: [Inc2]int;                                                                   
                                                                                                    
assume Inc2._state_pre == Inc2._state && Inc2.counter_pre == Inc2.counter && Inc2._lock_pre == Inc2._lock && Inc2.counter_nextThread_pre == Inc2.counter_nextThread && Inc2.counter_nextValue_pre == Inc2.counter_nextValue && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Inc2._state[this], tid);                                                       
 assume Y(tid , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue , Inc2._state_p, Inc2.counter_p, Inc2._lock_p, Inc2.counter_nextThread_p, Inc2.counter_nextValue_p);
 assume Y_Inc2._lock(tid, this, newValue , Inc2._state_p, Inc2.counter_p, Inc2._lock_p, Inc2.counter_nextThread_p, Inc2.counter_nextValue_p);
assume Inc2._state_post == Inc2._state_p && Inc2.counter_post == Inc2.counter_p && Inc2._lock_post == Inc2._lock_p && Inc2.counter_nextThread_post == Inc2.counter_nextThread_p && Inc2.counter_nextValue_post == Inc2.counter_nextValue_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Inc2._lock(tid, this, newValue , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue);
}                                                                                                   
// Inc2.counter_nextThread:                                                                         
                                                                                                    
function {:inline} Y_Inc2.counter_nextThread(tid : Tid, this: Inc2, newValue: Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 ((isAccessible(Inc2._state[this], tid) && leq(m#moverPath(ReadEval.Inc2.counter_nextThread(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)), _R)) ==> (Inc2.counter_nextThread[this] == newValue))
 &&(((Inc2.counter_nextThread[this]==tid)==>(newValue==tid)))                                       
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc2.counter_nextThread(tid : Tid, this: Inc2, newValue: Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
// Inc2.counter_nextValue:                                                                          
                                                                                                    
function {:inline} Y_Inc2.counter_nextValue(tid : Tid, this: Inc2, newValue: int , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 ((isAccessible(Inc2._state[this], tid) && leq(m#moverPath(ReadEval.Inc2.counter_nextValue(tid: Tid,this: Inc2,Inc2._state,Inc2.counter,Inc2._lock,Inc2.counter_nextThread,Inc2.counter_nextValue)), _R)) ==> (Inc2.counter_nextValue[this] == newValue))
 &&(((Inc2.counter_nextThread[this]==tid)==>(newValue==Inc2.counter_nextValue[this])))              
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Inc2.counter_nextValue(tid : Tid, this: Inc2, newValue: int , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Inc2._state: [Inc2]State, Inc2.counter: [Inc2]int, Inc2._lock: [Inc2]Tid, Inc2.counter_nextThread: [Inc2]Tid, Inc2.counter_nextValue: [Inc2]int , Inc2._state_p: [Inc2]State, Inc2.counter_p: [Inc2]int, Inc2._lock_p: [Inc2]Tid, Inc2.counter_nextThread_p: [Inc2]Tid, Inc2.counter_nextValue_p: [Inc2]int): bool
{                                                                                                   
 (forall this: Inc2 :: Y_Inc2.counter(tid : Tid, this, Inc2.counter_p[this] , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue))
 && (forall this: Inc2 :: Y_Inc2._lock(tid : Tid, this, Inc2._lock_p[this] , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue))
 && (forall this: Inc2 :: Y_Inc2.counter_nextThread(tid : Tid, this, Inc2.counter_nextThread_p[this] , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue))
 && (forall this: Inc2 :: Y_Inc2.counter_nextValue(tid : Tid, this, Inc2.counter_nextValue_p[this] , Inc2._state, Inc2.counter, Inc2._lock, Inc2.counter_nextThread, Inc2.counter_nextValue))
 && (forall _i : Inc2 :: isShared(Inc2._state[_i]) ==> isShared(Inc2._state_p[_i]))                 
 && (forall _i : Inc2 :: isLocal(Inc2._state[_i], tid) <==> isLocal(Inc2._state_p[_i], tid))        
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 723.1-1324.2: (Method:6.5)
// 732.1-732.24: (6.5): Bad tid
// 733.1-733.38: (6.5): this is not global
// 976.2-978.2: (class anchor.sink.VarDeclStmt:7.9)
// 980.2-982.2: (class anchor.sink.VarDeclStmt:7.9)
// 983.2-1000.40: (class anchor.sink.Read:7.9)
// 995.1-995.28: (7.9): Cannot have potential null deference in left-mover part.
// 999.1-999.27: (7.9): Reduction failure
// 1001.2-1003.2: (class anchor.sink.VarDeclStmt:7.9)
// 1004.2-1021.39: (class anchor.sink.Read:7.9)
// 1016.1-1016.28: (7.9): Cannot have potential null deference in left-mover part.
// 1020.1-1020.27: (7.9): Reduction failure
// 1022.2-1024.2: (class anchor.sink.VarDeclStmt:7.9)
// 1025.2-1042.38: (class anchor.sink.Read:7.9)
// 1037.1-1037.28: (7.9): Cannot have potential null deference in left-mover part.
// 1041.1-1041.27: (7.9): Reduction failure
// 1043.2-1045.2: (class anchor.sink.VarDeclStmt:7.9)
// 1046.2-1049.149: (class anchor.sink.Assign:7.9)
// 1050.2-1052.2: (class anchor.sink.VarDeclStmt:7.9)
// 1053.2-1056.74: (class anchor.sink.Assign:7.9)
// 1059.3-1076.29: (class anchor.sink.Read:7.9)
// 1071.1-1071.29: (7.9): Cannot have potential null deference in left-mover part.
// 1075.1-1075.28: (7.9): Reduction failure
// 1079.3-1096.29: (class anchor.sink.Read:7.9)
// 1091.1-1091.29: (7.9): Cannot have potential null deference in left-mover part.
// 1095.1-1095.28: (7.9): Reduction failure
// 1098.2-1100.2: (class anchor.sink.VarDeclStmt:8.9)
// 1101.2-1103.2: (class anchor.sink.VarDeclStmt:8.9)
// 1104.2-1107.18: (class anchor.sink.Assign:8.9)
// 1109.2-1111.2: (class anchor.sink.VarDeclStmt:8.9)
// 1112.2-1115.19: (class anchor.sink.Assign:8.9)
// 1118.3-1121.14: (class anchor.sink.Assign:8.9)
// 1123.3-1126.20: (class anchor.sink.Assign:8.9)
// 1128.4-1130.4: (class anchor.sink.VarDeclStmt:8.9)
// 1131.4-1133.4: (class anchor.sink.VarDeclStmt:8.9)
// 1134.4-1136.4: (class anchor.sink.VarDeclStmt:8.9)
// 1137.4-1140.160: (class anchor.sink.Assign:8.9)
// 1141.4-1144.37: (class anchor.sink.Assume:8.9)
// 1145.4-1148.48: (class anchor.sink.Assume:8.9)
// 1149.4-1152.48: (class anchor.sink.Assume:8.9)
// 1153.4-1156.47: (class anchor.sink.Assume:8.9)
// 1158.4-1174.44: (class anchor.sink.Write:8.9)
// 1170.1-1170.30: (8.9): Cannot have potential null deference in left-mover part.
// 1173.1-1173.29: (8.9): Reduction failure
// 1176.4-1192.45: (class anchor.sink.Write:8.9)
// 1188.1-1188.30: (8.9): Cannot have potential null deference in left-mover part.
// 1191.1-1191.29: (8.9): Reduction failure
// 1195.4-1211.31: (class anchor.sink.Write:8.9)
// 1207.1-1207.30: (8.9): Cannot have potential null deference in left-mover part.
// 1210.1-1210.29: (8.9): Reduction failure
// 1212.4-1215.14: (class anchor.sink.Assign:8.9)
// 1217.4-1220.48: (class anchor.sink.Assume:8.9)
// 1221.4-1224.47: (class anchor.sink.Assume:8.9)
// 1225.4-1227.4: (class anchor.sink.VarDeclStmt:8.9)
// 1228.4-1245.40: (class anchor.sink.Read:8.9)
// 1240.1-1240.30: (8.9): Cannot have potential null deference in left-mover part.
// 1244.1-1244.29: (8.9): Reduction failure
// 1247.4-1263.30: (class anchor.sink.Write:8.9)
// 1259.1-1259.30: (8.9): Cannot have potential null deference in left-mover part.
// 1262.1-1262.29: (8.9): Reduction failure
// 1264.4-1266.4: (class anchor.sink.VarDeclStmt:8.9)
// 1267.4-1270.160: (class anchor.sink.Assign:8.9)
// 1272.4-1288.40: (class anchor.sink.Write:8.9)
// 1284.1-1284.30: (8.9): Cannot have potential null deference in left-mover part.
// 1287.1-1287.29: (8.9): Reduction failure
// 1289.4-1292.45: (class anchor.sink.Assume:8.9)
// 1295.4-1311.31: (class anchor.sink.Write:8.9)
// 1307.1-1307.30: (8.9): Cannot have potential null deference in left-mover part.
// 1310.1-1310.29: (8.9): Reduction failure
// 1312.4-1315.15: (class anchor.sink.Assign:8.9)
// 1318.2-1323.9: (class anchor.sink.Return:6.23)
// 1402.1-1402.34: (3.5): Inc2.counter failed Write-Write Right-Mover Check
// 1463.1-1463.30: (3.5): Inc2.counter failed Write-Read Right-Mover Check
// 1528.1-1528.34: (3.5): Inc2.counter failed Write-Write Left-Mover Check
// 1590.1-1590.30: (3.5): Inc2.counter failed Write-Read Left-Mover Check
// 1649.1-1649.34: (3.5): Inc2.counter failed Read-Write Right-Mover Check
// 1711.1-1711.34: (3.5): Inc2.counter failed Read-Write Left-Mover Check
// 1784.1-1784.140: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case A.1)
// 1785.1-1785.101: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case A.2)
// 1786.1-1786.158: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case A.3)
// 1885.1-1885.140: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case C)
// 1989.1-1989.144: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case D)
// 1990.1-1990.144: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case R)
// 2063.1-2063.136: (3.5): Inc2.counter is not Read-Write Stable with respect to Inc2.counter (case F)
// 2064.1-2064.136: (3.5): Inc2.counter is not Read-Write Stable with respect to Inc2.counter (case H)
// 2065.1-2065.146: (3.5): Inc2.counter is not Read-Write Stable with respect to Inc2.counter (case I)
// 2137.1-2137.136: (3.5): Inc2.counter is not Write-Read Stable with respect to Inc2.counter (case J)
// 2138.1-2138.136: (3.5): Inc2.counter is not Write-Read Stable with respect to Inc2.counter (case K)
// 2139.1-2139.99: (3.5): Inc2.counter is not Write-Read Stable with respect to Inc2.counter (case L)
// 2248.1-2248.142: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case M)
// 2355.1-2355.130: (3.5): Inc2.counter is not Write-Write Stable with respect to Inc2.counter (case N)
// 2391.1-2412.2: (4.24): yields_as clause for Inc2.counter is not valid
// 2417.1-2433.2: (4.24): yields_as clause for Inc2.counter is not reflexive
// 2439.1-2471.2: (4.24): yields_as clause for Inc2.counter is not transitive
// 2491.1-2512.2: (7.32): yields_as clause for Inc2._lock is not valid
// 2517.1-2533.2: (7.32): yields_as clause for Inc2._lock is not reflexive
// 2539.1-2571.2: (7.32): yields_as clause for Inc2._lock is not transitive
