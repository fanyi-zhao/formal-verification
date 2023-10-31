                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/inv-10.anchor:                          
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class P {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
      invariant  this.x == this.y;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        assume this.y == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        synchronized (this) {                                                                       
          int tmp1;                                                                                 
          int tmp2;                                                                                 
          tmp2 := this.x;                                                                           
          tmp1 = tmp2 + 1;                                                                          
          this.x := tmp1;                                                                           
          int tmp3;                                                                                 
          int tmp4;                                                                                 
          tmp4 := this.y;                                                                           
          tmp3 = tmp4 + 1;                                                                          
          this.y := tmp3;                                                                           
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class P {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x == this.y;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        assume this.y == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.x;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.x := tmp1;                                                                         
            int tmp3;                                                                               
            int tmp4;                                                                               
            tmp4 := this.y;                                                                         
            tmp3 = tmp4 + 1;                                                                        
            this.y := tmp3;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class P {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x == this.y;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        assume this.y == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.x;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.x := tmp1;                                                                         
            int tmp3;                                                                               
            int tmp4;                                                                               
            tmp4 := this.y;                                                                         
            tmp3 = tmp4 + 1;                                                                        
            this.y := tmp3;                                                                         
          }                                                                                         
          release(this);                                                                            
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class P {                                                                                       
       int x holds(this, tid) ? B : E                                                               
                                                                                                    
       int y holds(this, tid) ? B : E                                                               
                                                                                                    
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
                                                                                                    
                                                                                                    
      invariant  this.x == this.y;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        assume this.y == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        {                                                                                           
          acquire(this);                                                                            
          {                                                                                         
            int tmp1;                                                                               
            int tmp2;                                                                               
            tmp2 := this.x;                                                                         
            tmp1 = tmp2 + 1;                                                                        
            this.x := tmp1;                                                                         
            int tmp3;                                                                               
            int tmp4;                                                                               
            tmp4 := this.y;                                                                         
            tmp3 = tmp4 + 1;                                                                        
            this.y := tmp3;                                                                         
          }                                                                                         
          release(this);                                                                            
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
                                                                                                    
                                                                                                    
/*** Class Decl P ***/                                                                              
                                                                                                    
type P;                                                                                             
const unique P.null: P;                                                                             
var P._state: [P]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var P.x: [P]int;                                                                                    
                                                                                                    
function {:inline} ReadEval.P.x(tid: Tid,this : P,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(P._state[this], tid) && P._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.P.x(tid: Tid,this : P,newValue: int,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(P._state[this], tid) && P._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var P.y: [P]int;                                                                                    
                                                                                                    
function {:inline} ReadEval.P.y(tid: Tid,this : P,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((isAccessible(P._state[this], tid) && P._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.P.y(tid: Tid,this : P,newValue: int,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((isAccessible(P._state[this], tid) && P._lock[this] == tid)) then                              
  moverPath(_B, 1)                                                                                  
 else                                                                                               
  moverPath(_E, 0)                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var P._lock: [P]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.P._lock(tid: Tid,this : P,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(P._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((P._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((P._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((P._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.P._lock(tid: Tid,this : P,newValue: Tid,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(P._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((P._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((P._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((P._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
function {:inline} Invariant.P.2294691(tid: Tid,this : P,P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (bool) {
 (P.x[this]==P.y[this])                                                                             
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  P.f(tid:Tid, this : P)                                                                   
modifies P._state;                                                                                  
modifies P.x;                                                                                       
modifies P.y;                                                                                       
modifies P._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (6.5): Bad tid
requires isShared(P._state[this]);                                                                         // (6.5): this is not global
                                                                                                    
requires StateInvariant(P._state, P.x, P.y, P._lock);                                               
requires  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (6.5): Object invariant may not hold.
                                                                                                    
ensures StateInvariant(P._state, P.x, P.y, P._lock);                                                
ensures  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (6.5): Object invariant may not hold.
{                                                                                                   
 var tmp22300273: int;                                                                              
 var P._state2300254: [P]State;                                                                     
 var P._lock2300278: [P]Tid;                                                                        
 var tmp12300244: int;                                                                              
 var P.x2300273: [P]int;                                                                            
 var $recorded.state2300273: int;                                                                   
 var this2300273: P;                                                                                
 var mover2300254: Mover;                                                                           
 var tmp12300273: int;                                                                              
 var P._lock2300244: [P]Tid;                                                                        
 var $pc2300254: Phase;                                                                             
 var tmp32300263: int;                                                                              
 var P._lock2300254: [P]Tid;                                                                        
 var P.y2300254: [P]int;                                                                            
 var P.y2300263: [P]int;                                                                            
 var P._state2300263: [P]State;                                                                     
 var moverPath2300244: MoverPath;                                                                   
 var $pc2300273: Phase;                                                                             
 var $pc2300278: Phase;                                                                             
 var mover2300244: Mover;                                                                           
 var P._lock2300273: [P]Tid;                                                                        
 var P.y2300244: [P]int;                                                                            
 var P.x2300263: [P]int;                                                                            
 var tmp32300273: int;                                                                              
 var tmp22300263: int;                                                                              
 var $recorded.state2300263: int;                                                                   
 var this2300263: P;                                                                                
 var tid2300244: Tid;                                                                               
 var tid2300263: Tid;                                                                               
 var $recorded.state2300254: int;                                                                   
 var mover2300273: Mover;                                                                           
 var path2300254: int;                                                                              
 var P._state2300273: [P]State;                                                                     
 var tmp42300263: int;                                                                              
 var moverPath2300263: MoverPath;                                                                   
 var tmp22300254: int;                                                                              
 var mover2300263: Mover;                                                                           
 var tmp22300244: int;                                                                              
 var $pc2300244: Phase;                                                                             
 var tid2300254: Tid;                                                                               
 var path2300263: int;                                                                              
 var tmp1: int;                                                                                     
 var tmp12300263: int;                                                                              
 var P.x2300278: [P]int;                                                                            
 var this2300254: P;                                                                                
 var P.y2300273: [P]int;                                                                            
 var path2300273: int;                                                                              
 var moverPath2300273: MoverPath;                                                                   
 var $pc2300263: Phase;                                                                             
 var $recorded.state2300244: int;                                                                   
 var P.x2300254: [P]int;                                                                            
 var P._lock2300263: [P]Tid;                                                                        
 var P.x2300244: [P]int;                                                                            
 var tmp3: int;                                                                                     
 var tmp12300254: int;                                                                              
 var tid2300278: Tid;                                                                               
 var path2300244: int;                                                                              
 var this2300278: P;                                                                                
 var tmp42300273: int;                                                                              
 var P._state2300278: [P]State;                                                                     
 var moverPath2300254: MoverPath;                                                                   
 var tmp2: int;                                                                                     
 var this2300244: P;                                                                                
 var P.y2300278: [P]int;                                                                            
 var tmp4: int;                                                                                     
 var P._state2300244: [P]State;                                                                     
 var tid2300273: Tid;                                                                               
 var $recorded.state2300278: int;                                                                   
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
 if ($pc == PreCommit) {                                                                            
  assume this != P.null;                                                                            
 } else {                                                                                           
  assert this != P.null;                                                                                   // (7.23): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assume P._lock[this] == Tid.null;                                                                  
 $pc := transition($pc, _R);                                                                        
 assert $pc != PhaseError;                                                                                 // (7.23): Reduction failure
 P._lock[this] := tid;                                                                              
                                                                                                    
 // 8.13: int tmp1;                                                                                 
                                                                                                    
                                                                                                    
 // 8.13: int tmp2;                                                                                 
                                                                                                    
                                                                                                    
 // 8.13: tmp2 := this.x;                                                                           
                                                                                                    
                                                                                                    
 moverPath2300244 := ReadEval.P.x(tid: Tid,this: P,P._state,P.x,P.y,P._lock);                       
 mover2300244 := m#moverPath(moverPath2300244);                                                     
 path2300244 := p#moverPath(moverPath2300244);                                                      
 assume P._state2300244 == P._state && P.x2300244 == P.x && P.y2300244 == P.y && P._lock2300244 == P._lock && tmp22300244 == tmp2 && tmp12300244 == tmp1 && this2300244 == this && tid2300244 == tid && $pc2300244 == $pc;
 assume $recorded.state2300244 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != P.null;                                                                            
 } else {                                                                                           
  assert this != P.null;                                                                                   // (8.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2300244);                                                              
 assert $pc != PhaseError;                                                                                 // (8.13): Reduction failure
 tmp2 := P.x[this];                                                                                 
                                                                                                    
 // 8.13: tmp1 = tmp2 + 1;                                                                          
                                                                                                    
 tmp1 := (tmp2+1);                                                                                  
                                                                                                    
                                                                                                    
 // 8.13: this.x := tmp1;                                                                           
                                                                                                    
                                                                                                    
 moverPath2300254 := WriteEval.P.x(tid: Tid,this: P,tmp1: int,P._state,P.x,P.y,P._lock);            
 mover2300254 := m#moverPath(moverPath2300254);                                                     
 path2300254 := p#moverPath(moverPath2300254);                                                      
 assume P._state2300254 == P._state && P.x2300254 == P.x && P.y2300254 == P.y && P._lock2300254 == P._lock && tmp22300254 == tmp2 && tmp12300254 == tmp1 && this2300254 == this && tid2300254 == tid && $pc2300254 == $pc;
 assume $recorded.state2300254 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != P.null;                                                                            
 } else {                                                                                           
  assert this != P.null;                                                                                   // (8.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2300254);                                                              
 assert $pc != PhaseError;                                                                                 // (8.13): Reduction failure
 P.x[this] := tmp1;                                                                                 
                                                                                                    
 // 9.13: int tmp3;                                                                                 
                                                                                                    
                                                                                                    
 // 9.13: int tmp4;                                                                                 
                                                                                                    
                                                                                                    
 // 9.13: tmp4 := this.y;                                                                           
                                                                                                    
                                                                                                    
 moverPath2300263 := ReadEval.P.y(tid: Tid,this: P,P._state,P.x,P.y,P._lock);                       
 mover2300263 := m#moverPath(moverPath2300263);                                                     
 path2300263 := p#moverPath(moverPath2300263);                                                      
 assume P._state2300263 == P._state && P.x2300263 == P.x && P.y2300263 == P.y && P._lock2300263 == P._lock && tmp42300263 == tmp4 && tmp32300263 == tmp3 && tmp22300263 == tmp2 && tmp12300263 == tmp1 && this2300263 == this && tid2300263 == tid && $pc2300263 == $pc;
 assume $recorded.state2300263 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != P.null;                                                                            
 } else {                                                                                           
  assert this != P.null;                                                                                   // (9.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover2300263);                                                              
 assert $pc != PhaseError;                                                                                 // (9.13): Reduction failure
 tmp4 := P.y[this];                                                                                 
                                                                                                    
 // 9.13: tmp3 = tmp4 + 1;                                                                          
                                                                                                    
 tmp3 := (tmp4+1);                                                                                  
                                                                                                    
                                                                                                    
 // 9.13: this.y := tmp3;                                                                           
                                                                                                    
                                                                                                    
 moverPath2300273 := WriteEval.P.y(tid: Tid,this: P,tmp3: int,P._state,P.x,P.y,P._lock);            
 mover2300273 := m#moverPath(moverPath2300273);                                                     
 path2300273 := p#moverPath(moverPath2300273);                                                      
 assume P._state2300273 == P._state && P.x2300273 == P.x && P.y2300273 == P.y && P._lock2300273 == P._lock && tmp42300273 == tmp4 && tmp32300273 == tmp3 && tmp22300273 == tmp2 && tmp12300273 == tmp1 && this2300273 == this && tid2300273 == tid && $pc2300273 == $pc;
 assume $recorded.state2300273 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != P.null;                                                                            
 } else {                                                                                           
  assert this != P.null;                                                                                   // (9.13): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover2300273);                                                              
 assert $pc != PhaseError;                                                                                 // (9.13): Reduction failure
 P.y[this] := tmp3;                                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != P.null;                                                                            
 } else {                                                                                           
  assert this != P.null;                                                                                   // (10.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 assert P._lock[this] == tid;                                                                              // (10.9): lock not held
 $pc := transition($pc, _L);                                                                        
 assert $pc != PhaseError;                                                                                 // (10.9): Reduction failure
 P._lock[this] := Tid.null;                                                                         
                                                                                                    
 // 6.21: // return;                                                                                
                                                                                                    
 assume P._state2300278 == P._state && P.x2300278 == P.x && P.y2300278 == P.y && P._lock2300278 == P._lock && this2300278 == this && tid2300278 == tid;
 assume $recorded.state2300278 == 1;                                                                
 assert  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (6.21): Object invariant may not hold.
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(P._state: [P]State,P.x: [P]int,P.y: [P]int,P._lock: [P]Tid) returns (bool) {
  true &&                                                                                           
  (forall _i: P  :: _i == P.null <==> isNull(P._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.P.x(t: Tid, u: Tid, v: int, w: int, x: P)                    
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 P.x[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.P.x(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): P.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.P.x(t: Tid, u: Tid, v: int, w: int, x: P)                     
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 P.x[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.P.x(u: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.5): P.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.P.x(t: Tid, u: Tid, v: int, w: int, x: P)                     
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == P.x[x];                                                                                
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 P.x[x] := havocValue;                                                                              
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.P.x(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): P.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.P.x(t: Tid, u: Tid, v: int, w: int, x: P)                      
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == P.x[x];                                                                                
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.P.x(u: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): P.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.P.x(t: Tid, u: Tid, v: int, w: int, x: P)                          
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.P.x(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.P.x(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): P.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.P.x(t: Tid, u: Tid, v: int, w: int, x: P)                           
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == P.x[x];                                                                                
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.P.x(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 P.x[x] := havocValue;                                                                              
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.P.x(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): P.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.P.y(t: Tid, u: Tid, v: int, w: int, x: P)                    
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.y;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 P.y[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.P.y(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): P.y failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.P.y(t: Tid, u: Tid, v: int, w: int, x: P)                     
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.y;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 P.y[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.P.y(u: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): P.y failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.P.y(t: Tid, u: Tid, v: int, w: int, x: P)                     
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.y;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == P.y[x];                                                                                
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 P.y[x] := havocValue;                                                                              
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.P.y(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): P.y failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.P.y(t: Tid, u: Tid, v: int, w: int, x: P)                      
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.y;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == P.y[x];                                                                                
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.P.y(u: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): P.y failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.P.y(t: Tid, u: Tid, v: int, w: int, x: P)                          
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.y;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.P.y(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.P.y(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): P.y failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.P.y(t: Tid, u: Tid, v: int, w: int, x: P)                           
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[x], u);                                                             
 modifies P.y;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == P.y[x];                                                                                
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.P.y(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 P.y[x] := havocValue;                                                                              
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.P.y(u: Tid,x: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): P.y failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.P.x.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.x[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): P.x is not Write-Write Stable with respect to P.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.P.x.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := P.x[x];                                                                                    
 P.x[x] := v;                                                                                       
                                                                                                    
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 P.x[x] := tmpV;                                                                                    
 P.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.P.x.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)             
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := P.x[x];                                                                                    
 P.x[x] := v;                                                                                       
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 P.x[x] := tmpV;                                                                                    
 P.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.P.x.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.P.x(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.x[y] := w;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.P.x(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): P.x is not Read-Write Stable with respect to P.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): P.x is not Read-Write Stable with respect to P.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): P.x is not Read-Write Stable with respect to P.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.P.x.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.P.x(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.x[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.P.x(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): P.x is not Write-Read Stable with respect to P.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): P.x is not Write-Read Stable with respect to P.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): P.x is not Write-Read Stable with respect to P.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.P.x.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.x[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): P.y is not Write-Write Stable with respect to P.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.P.x.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := P.x[x];                                                                                    
 P.x[x] := v;                                                                                       
                                                                                                    
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 P.x[x] := tmpV;                                                                                    
 P.y[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.P.x.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)             
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := P.x[x];                                                                                    
 P.x[x] := v;                                                                                       
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 P.x[x] := tmpV;                                                                                    
 P.y[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.P.x.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.P.x(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.y[y] := w;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.P.x(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): P.x is not Read-Write Stable with respect to P.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): P.x is not Read-Write Stable with respect to P.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): P.x is not Read-Write Stable with respect to P.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.P.x.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.x;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.P.y(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.P.x(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.x[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.P.y(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): P.y is not Write-Read Stable with respect to P.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): P.y is not Write-Read Stable with respect to P.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): P.y is not Write-Read Stable with respect to P.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.P.y.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.y[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): P.x is not Write-Write Stable with respect to P.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): P.x is not Write-Write Stable with respect to P.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.P.y.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := P.y[x];                                                                                    
 P.y[x] := v;                                                                                       
                                                                                                    
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 P.y[x] := tmpV;                                                                                    
 P.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.P.y.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)             
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := P.y[x];                                                                                    
 P.y[x] := v;                                                                                       
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 P.y[x] := tmpV;                                                                                    
 P.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.P.y.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.P.y(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.P.x(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.x[y] := w;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.P.y(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): P.y is not Read-Write Stable with respect to P.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): P.y is not Read-Write Stable with respect to P.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): P.y is not Read-Write Stable with respect to P.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.P.y.P.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.x;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.P.x(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.y[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.P.x(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): P.x is not Write-Read Stable with respect to P.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): P.x is not Write-Read Stable with respect to P.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): P.x is not Write-Read Stable with respect to P.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.P.y.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.y[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.y (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): P.y is not Write-Write Stable with respect to P.y (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.y (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.P.y.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)              
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := P.y[x];                                                                                    
 P.y[x] := v;                                                                                       
                                                                                                    
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 P.y[x] := tmpV;                                                                                    
 P.y[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.y (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.P.y.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)             
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var P.y_mid: [P]int;                                                                               
 var u_mid: Tid;                                                                                    
 var P.x_mid: [P]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var y_mid: P;                                                                                      
 var w_mid: int;                                                                                    
 var P._lock_mid: [P]Tid;                                                                           
 var x_mid: P;                                                                                      
 var P._state_mid: [P]State;                                                                        
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := P.y[x];                                                                                    
 P.y[x] := v;                                                                                       
 assume P._state_mid == P._state && P.x_mid == P.x && P.y_mid == P.y && P._lock_mid == P._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                       
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 P.y[x] := tmpV;                                                                                    
 P.y[y] := w;                                                                                       
 _writeByTPost := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                       
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.y (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): P.y is not Write-Write Stable with respect to P.y (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.P.y.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.P.y(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                    
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.P.y(u: Tid,y: P,w: int,P._state,P.x,P.y,P._lock);                           
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.y[y] := w;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.P.y(t: Tid,x: P,P._state,P.x,P.y,P._lock);                                
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): P.y is not Read-Write Stable with respect to P.y (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): P.y is not Read-Write Stable with respect to P.y (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): P.y is not Read-Write Stable with respect to P.y (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.P.y.P.y(t: Tid, u: Tid, v: int, w: int, w0: int, x: P, y: P)            
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(P._state[x], t);                                                             
 requires isAccessible(P._state[y], u);                                                             
 modifies P.y;                                                                                      
 modifies P.y;                                                                                      
                                                                                                    
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
 var P.x_pre: [P]int;                                                                               
 var v_pre: int;                                                                                    
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: P;                                                                                      
 var P._lock_pre: [P]Tid;                                                                           
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var y_pre: P;                                                                                      
 var P._state_pre: [P]State;                                                                        
 var t_pre: Tid;                                                                                    
 var P.y_pre: [P]int;                                                                               
                                                                                                    
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var P.x_post: [P]int;                                                                              
 var P.y_post: [P]int;                                                                              
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var y_post: P;                                                                                     
 var v_post: int;                                                                                   
 var P._state_post: [P]State;                                                                       
 var P._lock_post: [P]Tid;                                                                          
 var x_post: P;                                                                                     
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.P.y(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                    
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.P.y(t: Tid,x: P,v: int,P._state,P.x,P.y,P._lock);                           
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 P.y[x] := v;                                                                                       
 assume P._state_post == P._state && P.x_post == P.x && P.y_post == P.y && P._lock_post == P._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.P.y(u: Tid,y: P,P._state,P.x,P.y,P._lock);                                
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): P.y is not Write-Read Stable with respect to P.y (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): P.y is not Write-Read Stable with respect to P.y (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): P.y is not Write-Read Stable with respect to P.y (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(P._state, P.x, P.y, P._lock);                                               
requires ValidTid(tid);                                                                             
requires  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (<undefined position>): Object invariant may not hold.
modifies P._state;                                                                                  
modifies P.x;                                                                                       
modifies P.y;                                                                                       
modifies P._lock;                                                                                   
ensures StateInvariant(P._state, P.x, P.y, P._lock);                                                
ensures Y(tid , old(P._state), old(P.x), old(P.y), old(P._lock) , P._state, P.x, P.y, P._lock);     
ensures  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (<undefined position>): Object invariant may not hold.
                                                                                                    
// P.x:                                                                                             
                                                                                                    
function {:inline} Y_P.x(tid : Tid, this: P, newValue: int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid): bool
{                                                                                                   
 ((isAccessible(P._state[this], tid) && leq(m#moverPath(ReadEval.P.x(tid: Tid,this: P,P._state,P.x,P.y,P._lock)), _R)) ==> (P.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_P.x(tid : Tid, this: P, newValue: int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_P.x.Subsumes.W(tid : Tid, u : Tid, this: P, newValue: int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var P.y_yield: [P]int;                                                                              
var tid_yield: Tid;                                                                                 
var P.x_yield: [P]int;                                                                              
var P._state_yield: [P]State;                                                                       
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var P._lock_yield: [P]Tid;                                                                          
var u_yield: Tid;                                                                                   
var this_yield: P;                                                                                  
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(P._state[this], tid);                                                          
 assume isAccessible(P._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.P.x(u: Tid,this: P,newValue: int,P._state,P.x,P.y,P._lock)));
                                                                                                    
assume P._state_yield == P._state && P.x_yield == P.x && P.y_yield == P.y && P._lock_yield == P._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_P.x(tid, this, newValue , P._state, P.x, P.y, P._lock);                                   
}                                                                                                   
                                                                                                    
procedure Y_P.x.Reflexive(tid : Tid, this: P , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var P.y_yield: [P]int;                                                                              
var tid_yield: Tid;                                                                                 
var P.x_yield: [P]int;                                                                              
var P._state_yield: [P]State;                                                                       
var $pc_yield: Phase;                                                                               
var P._lock_yield: [P]Tid;                                                                          
var this_yield: P;                                                                                  
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(P._state[this], tid);                                                          
assume P._state_yield == P._state && P.x_yield == P.x && P.y_yield == P.y && P._lock_yield == P._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_P.x(tid, this, P.x[this] , P._state, P.x, P.y, P._lock);                                  
}                                                                                                   
                                                                                                    
procedure Y_P.x.Transitive(tid : Tid, this: P, newValue : int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid , P._state_p: [P]State, P.x_p: [P]int, P.y_p: [P]int, P._lock_p: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires StateInvariant(P._state_p, P.x_p, P.y_p, P._lock_p);                                      
 requires ValidTid(tid);                                                                            
requires  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (2.20): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var P.x_pre: [P]int;                                                                                
var this_pre: P;                                                                                    
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var P._lock_pre: [P]Tid;                                                                            
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var P._state_pre: [P]State;                                                                         
var P.y_pre: [P]int;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var P.x_post: [P]int;                                                                               
var newValue_post: int;                                                                             
var P.y_post: [P]int;                                                                               
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var P._state_post: [P]State;                                                                        
var P._lock_post: [P]Tid;                                                                           
var this_post: P;                                                                                   
                                                                                                    
assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(P._state[this], tid);                                                          
 assume Y(tid , P._state, P.x, P.y, P._lock , P._state_p, P.x_p, P.y_p, P._lock_p);                 
 assume Y_P.x(tid, this, newValue , P._state_p, P.x_p, P.y_p, P._lock_p);                           
assume P._state_post == P._state_p && P.x_post == P.x_p && P.y_post == P.y_p && P._lock_post == P._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_P.x(tid, this, newValue , P._state, P.x, P.y, P._lock);                                   
}                                                                                                   
// P.y:                                                                                             
                                                                                                    
function {:inline} Y_P.y(tid : Tid, this: P, newValue: int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid): bool
{                                                                                                   
 ((isAccessible(P._state[this], tid) && leq(m#moverPath(ReadEval.P.y(tid: Tid,this: P,P._state,P.x,P.y,P._lock)), _R)) ==> (P.y[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_P.y(tid : Tid, this: P, newValue: int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_P.y.Subsumes.W(tid : Tid, u : Tid, this: P, newValue: int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var P.y_yield: [P]int;                                                                              
var tid_yield: Tid;                                                                                 
var P.x_yield: [P]int;                                                                              
var P._state_yield: [P]State;                                                                       
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var P._lock_yield: [P]Tid;                                                                          
var u_yield: Tid;                                                                                   
var this_yield: P;                                                                                  
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(P._state[this], tid);                                                          
 assume isAccessible(P._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.P.y(u: Tid,this: P,newValue: int,P._state,P.x,P.y,P._lock)));
                                                                                                    
assume P._state_yield == P._state && P.x_yield == P.x && P.y_yield == P.y && P._lock_yield == P._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_P.y(tid, this, newValue , P._state, P.x, P.y, P._lock);                                   
}                                                                                                   
                                                                                                    
procedure Y_P.y.Reflexive(tid : Tid, this: P , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var P.y_yield: [P]int;                                                                              
var tid_yield: Tid;                                                                                 
var P.x_yield: [P]int;                                                                              
var P._state_yield: [P]State;                                                                       
var $pc_yield: Phase;                                                                               
var P._lock_yield: [P]Tid;                                                                          
var this_yield: P;                                                                                  
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(P._state[this], tid);                                                          
assume P._state_yield == P._state && P.x_yield == P.x && P.y_yield == P.y && P._lock_yield == P._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_P.y(tid, this, P.y[this] , P._state, P.x, P.y, P._lock);                                  
}                                                                                                   
                                                                                                    
procedure Y_P.y.Transitive(tid : Tid, this: P, newValue : int , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid , P._state_p: [P]State, P.x_p: [P]int, P.y_p: [P]int, P._lock_p: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires StateInvariant(P._state_p, P.x_p, P.y_p, P._lock_p);                                      
 requires ValidTid(tid);                                                                            
requires  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (3.20): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var P.x_pre: [P]int;                                                                                
var this_pre: P;                                                                                    
var $recorded.state_pre: int;                                                                       
var newValue_pre: int;                                                                              
var P._lock_pre: [P]Tid;                                                                            
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var P._state_pre: [P]State;                                                                         
var P.y_pre: [P]int;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var P.x_post: [P]int;                                                                               
var newValue_post: int;                                                                             
var P.y_post: [P]int;                                                                               
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var P._state_post: [P]State;                                                                        
var P._lock_post: [P]Tid;                                                                           
var this_post: P;                                                                                   
                                                                                                    
assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(P._state[this], tid);                                                          
 assume Y(tid , P._state, P.x, P.y, P._lock , P._state_p, P.x_p, P.y_p, P._lock_p);                 
 assume Y_P.y(tid, this, newValue , P._state_p, P.x_p, P.y_p, P._lock_p);                           
assume P._state_post == P._state_p && P.x_post == P.x_p && P.y_post == P.y_p && P._lock_post == P._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_P.y(tid, this, newValue , P._state, P.x, P.y, P._lock);                                   
}                                                                                                   
// P._lock:                                                                                         
                                                                                                    
function {:inline} Y_P._lock(tid : Tid, this: P, newValue: Tid , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid): bool
{                                                                                                   
 ((isAccessible(P._state[this], tid) && leq(m#moverPath(ReadEval.P._lock(tid: Tid,this: P,P._state,P.x,P.y,P._lock)), _R)) ==> (P._lock[this] == newValue))
 &&(((P._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_P._lock(tid : Tid, this: P, newValue: Tid , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_P._lock.Subsumes.W(tid : Tid, u : Tid, this: P, newValue: Tid , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var P.y_yield: [P]int;                                                                              
var tid_yield: Tid;                                                                                 
var P.x_yield: [P]int;                                                                              
var P._state_yield: [P]State;                                                                       
var $pc_yield: Phase;                                                                               
var P._lock_yield: [P]Tid;                                                                          
var u_yield: Tid;                                                                                   
var this_yield: P;                                                                                  
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(P._state[this], tid);                                                          
 assume isAccessible(P._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.P._lock(u: Tid,this: P,newValue: Tid,P._state,P.x,P.y,P._lock)));
 assume leq(m#moverPath(ReadEval.P._lock(tid: Tid,this: P,P._state,P.x,P.y,P._lock)), _N);          
assume P._state_yield == P._state && P.x_yield == P.x && P.y_yield == P.y && P._lock_yield == P._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_P._lock(tid, this, newValue , P._state, P.x, P.y, P._lock);                               
}                                                                                                   
                                                                                                    
procedure Y_P._lock.Reflexive(tid : Tid, this: P , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var P.y_yield: [P]int;                                                                              
var tid_yield: Tid;                                                                                 
var P.x_yield: [P]int;                                                                              
var P._state_yield: [P]State;                                                                       
var $pc_yield: Phase;                                                                               
var P._lock_yield: [P]Tid;                                                                          
var this_yield: P;                                                                                  
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(P._state[this], tid);                                                          
assume P._state_yield == P._state && P.x_yield == P.x && P.y_yield == P.y && P._lock_yield == P._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_P._lock(tid, this, P._lock[this] , P._state, P.x, P.y, P._lock);                          
}                                                                                                   
                                                                                                    
procedure Y_P._lock.Transitive(tid : Tid, this: P, newValue : Tid , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid , P._state_p: [P]State, P.x_p: [P]int, P.y_p: [P]int, P._lock_p: [P]Tid)
 requires StateInvariant(P._state, P.x, P.y, P._lock);                                              
 requires StateInvariant(P._state_p, P.x_p, P.y_p, P._lock_p);                                      
 requires ValidTid(tid);                                                                            
requires  (forall _this : P ::  { P._state[_this] } isAccessible(P._state[_this], tid) && true ==> Invariant.P.2294691(tid: Tid,_this : P,P._state,P.x,P.y,P._lock));       // (1.1): Object invariant may not hold.
                                                                                                    
{                                                                                                   
var P.x_pre: [P]int;                                                                                
var this_pre: P;                                                                                    
var $recorded.state_pre: int;                                                                       
var P._lock_pre: [P]Tid;                                                                            
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
var P._state_pre: [P]State;                                                                         
var P.y_pre: [P]int;                                                                                
                                                                                                    
var $recorded.state_post: int;                                                                      
var P.x_post: [P]int;                                                                               
var P.y_post: [P]int;                                                                               
var $pc_post: Phase;                                                                                
var tid_post: Tid;                                                                                  
var P._state_post: [P]State;                                                                        
var P._lock_post: [P]Tid;                                                                           
var newValue_post: Tid;                                                                             
var this_post: P;                                                                                   
                                                                                                    
assume P._state_pre == P._state && P.x_pre == P.x && P.y_pre == P.y && P._lock_pre == P._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(P._state[this], tid);                                                          
 assume Y(tid , P._state, P.x, P.y, P._lock , P._state_p, P.x_p, P.y_p, P._lock_p);                 
 assume Y_P._lock(tid, this, newValue , P._state_p, P.x_p, P.y_p, P._lock_p);                       
assume P._state_post == P._state_p && P.x_post == P.x_p && P.y_post == P.y_p && P._lock_post == P._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_P._lock(tid, this, newValue , P._state, P.x, P.y, P._lock);                               
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , P._state: [P]State, P.x: [P]int, P.y: [P]int, P._lock: [P]Tid , P._state_p: [P]State, P.x_p: [P]int, P.y_p: [P]int, P._lock_p: [P]Tid): bool
{                                                                                                   
 (forall this: P :: Y_P.x(tid : Tid, this, P.x_p[this] , P._state, P.x, P.y, P._lock))              
 && (forall this: P :: Y_P.y(tid : Tid, this, P.y_p[this] , P._state, P.x, P.y, P._lock))           
 && (forall this: P :: Y_P._lock(tid : Tid, this, P._lock_p[this] , P._state, P.x, P.y, P._lock))   
 && (forall _i : P :: isShared(P._state[_i]) ==> isShared(P._state_p[_i]))                          
 && (forall _i : P :: isLocal(P._state[_i], tid) <==> isLocal(P._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 512.1-719.2: (Method:6.5)
// 520.1-520.24: (6.5): Bad tid
// 521.1-521.35: (6.5): this is not global
// 524.1-524.166: (6.5): Object invariant may not hold.
// 527.1-527.165: (6.5): Object invariant may not hold.
// 605.1-605.25: (7.23): Cannot have potential null deference in left-mover part.
// 609.1-609.27: (7.23): Reduction failure
// 611.2-613.2: (class anchor.sink.VarDeclStmt:8.13)
// 614.2-616.2: (class anchor.sink.VarDeclStmt:8.13)
// 617.2-634.20: (class anchor.sink.Read:8.13)
// 629.1-629.25: (8.13): Cannot have potential null deference in left-mover part.
// 633.1-633.27: (8.13): Reduction failure
// 635.2-638.19: (class anchor.sink.Assign:8.13)
// 640.2-656.20: (class anchor.sink.Write:8.13)
// 652.1-652.25: (8.13): Cannot have potential null deference in left-mover part.
// 655.1-655.27: (8.13): Reduction failure
// 657.2-659.2: (class anchor.sink.VarDeclStmt:9.13)
// 660.2-662.2: (class anchor.sink.VarDeclStmt:9.13)
// 663.2-680.20: (class anchor.sink.Read:9.13)
// 675.1-675.25: (9.13): Cannot have potential null deference in left-mover part.
// 679.1-679.27: (9.13): Reduction failure
// 681.2-684.19: (class anchor.sink.Assign:9.13)
// 686.2-702.20: (class anchor.sink.Write:9.13)
// 698.1-698.25: (9.13): Cannot have potential null deference in left-mover part.
// 701.1-701.27: (9.13): Reduction failure
// 706.1-706.25: (10.9): Cannot have potential null deference in left-mover part.
// 708.1-708.30: (10.9): lock not held
// 710.1-710.27: (10.9): Reduction failure
// 712.2-718.9: (class anchor.sink.Return:6.21)
// 717.1-717.165: (6.21): Object invariant may not hold.
// 795.1-795.34: (2.5): P.x failed Write-Write Right-Mover Check
// 854.1-854.30: (2.5): P.x failed Write-Read Right-Mover Check
// 917.1-917.34: (2.5): P.x failed Write-Write Left-Mover Check
// 977.1-977.30: (2.5): P.x failed Write-Read Left-Mover Check
// 1034.1-1034.34: (2.5): P.x failed Read-Write Right-Mover Check
// 1094.1-1094.34: (2.5): P.x failed Read-Write Left-Mover Check
// 1153.1-1153.34: (3.5): P.y failed Write-Write Right-Mover Check
// 1212.1-1212.30: (3.5): P.y failed Write-Read Right-Mover Check
// 1275.1-1275.34: (3.5): P.y failed Write-Write Left-Mover Check
// 1335.1-1335.30: (3.5): P.y failed Write-Read Left-Mover Check
// 1392.1-1392.34: (3.5): P.y failed Read-Write Right-Mover Check
// 1452.1-1452.34: (3.5): P.y failed Read-Write Left-Mover Check
// 1523.1-1523.140: (2.5): P.x is not Write-Write Stable with respect to P.x (case A.1)
// 1524.1-1524.101: (2.5): P.x is not Write-Write Stable with respect to P.x (case A.2)
// 1525.1-1525.158: (2.5): P.x is not Write-Write Stable with respect to P.x (case A.3)
// 1621.1-1621.140: (2.5): P.x is not Write-Write Stable with respect to P.x (case C)
// 1722.1-1722.144: (2.5): P.x is not Write-Write Stable with respect to P.x (case D)
// 1723.1-1723.144: (2.5): P.x is not Write-Write Stable with respect to P.x (case R)
// 1794.1-1794.136: (2.5): P.x is not Read-Write Stable with respect to P.x (case F)
// 1795.1-1795.136: (2.5): P.x is not Read-Write Stable with respect to P.x (case H)
// 1796.1-1796.146: (2.5): P.x is not Read-Write Stable with respect to P.x (case I)
// 1866.1-1866.136: (2.5): P.x is not Write-Read Stable with respect to P.x (case J)
// 1867.1-1867.136: (2.5): P.x is not Write-Read Stable with respect to P.x (case K)
// 1868.1-1868.99: (2.5): P.x is not Write-Read Stable with respect to P.x (case L)
// 1940.1-1940.140: (3.5): P.y is not Write-Write Stable with respect to P.x (case A.1)
// 1941.1-1941.101: (3.5): P.y is not Write-Write Stable with respect to P.x (case A.2)
// 1942.1-1942.158: (3.5): P.y is not Write-Write Stable with respect to P.x (case A.3)
// 2038.1-2038.140: (2.5): P.x is not Write-Write Stable with respect to P.y (case C)
// 2139.1-2139.144: (2.5): P.x is not Write-Write Stable with respect to P.y (case D)
// 2140.1-2140.144: (2.5): P.x is not Write-Write Stable with respect to P.y (case R)
// 2211.1-2211.136: (2.5): P.x is not Read-Write Stable with respect to P.y (case F)
// 2212.1-2212.136: (2.5): P.x is not Read-Write Stable with respect to P.y (case H)
// 2213.1-2213.146: (2.5): P.x is not Read-Write Stable with respect to P.y (case I)
// 2283.1-2283.136: (3.5): P.y is not Write-Read Stable with respect to P.x (case J)
// 2284.1-2284.136: (3.5): P.y is not Write-Read Stable with respect to P.x (case K)
// 2285.1-2285.99: (3.5): P.y is not Write-Read Stable with respect to P.x (case L)
// 2357.1-2357.140: (2.5): P.x is not Write-Write Stable with respect to P.y (case A.1)
// 2358.1-2358.101: (2.5): P.x is not Write-Write Stable with respect to P.y (case A.2)
// 2359.1-2359.158: (2.5): P.x is not Write-Write Stable with respect to P.y (case A.3)
// 2455.1-2455.140: (3.5): P.y is not Write-Write Stable with respect to P.x (case C)
// 2556.1-2556.144: (3.5): P.y is not Write-Write Stable with respect to P.x (case D)
// 2557.1-2557.144: (3.5): P.y is not Write-Write Stable with respect to P.x (case R)
// 2628.1-2628.136: (3.5): P.y is not Read-Write Stable with respect to P.x (case F)
// 2629.1-2629.136: (3.5): P.y is not Read-Write Stable with respect to P.x (case H)
// 2630.1-2630.146: (3.5): P.y is not Read-Write Stable with respect to P.x (case I)
// 2700.1-2700.136: (2.5): P.x is not Write-Read Stable with respect to P.y (case J)
// 2701.1-2701.136: (2.5): P.x is not Write-Read Stable with respect to P.y (case K)
// 2702.1-2702.99: (2.5): P.x is not Write-Read Stable with respect to P.y (case L)
// 2774.1-2774.140: (3.5): P.y is not Write-Write Stable with respect to P.y (case A.1)
// 2775.1-2775.101: (3.5): P.y is not Write-Write Stable with respect to P.y (case A.2)
// 2776.1-2776.158: (3.5): P.y is not Write-Write Stable with respect to P.y (case A.3)
// 2872.1-2872.140: (3.5): P.y is not Write-Write Stable with respect to P.y (case C)
// 2973.1-2973.144: (3.5): P.y is not Write-Write Stable with respect to P.y (case D)
// 2974.1-2974.144: (3.5): P.y is not Write-Write Stable with respect to P.y (case R)
// 3045.1-3045.136: (3.5): P.y is not Read-Write Stable with respect to P.y (case F)
// 3046.1-3046.136: (3.5): P.y is not Read-Write Stable with respect to P.y (case H)
// 3047.1-3047.146: (3.5): P.y is not Read-Write Stable with respect to P.y (case I)
// 3117.1-3117.136: (3.5): P.y is not Write-Read Stable with respect to P.y (case J)
// 3118.1-3118.136: (3.5): P.y is not Write-Read Stable with respect to P.y (case K)
// 3119.1-3119.99: (3.5): P.y is not Write-Read Stable with respect to P.y (case L)
// 3126.1-3126.166: (<undefined position>): Object invariant may not hold.
// 3133.1-3133.165: (<undefined position>): Object invariant may not hold.
// 3153.1-3173.2: (2.5): yields_as clause for P.x is not valid
// 3178.1-3193.2: (2.5): yields_as clause for P.x is not reflexive
// 3199.1-3199.166: (2.20): Object invariant may not hold.
// 3200.1-3230.2: (2.5): yields_as clause for P.x is not transitive
// 3249.1-3269.2: (3.5): yields_as clause for P.y is not valid
// 3274.1-3289.2: (3.5): yields_as clause for P.y is not reflexive
// 3295.1-3295.166: (3.20): Object invariant may not hold.
// 3296.1-3326.2: (3.5): yields_as clause for P.y is not transitive
// 3346.1-3366.2: (7.32): yields_as clause for P._lock is not valid
// 3371.1-3386.2: (7.32): yields_as clause for P._lock is not reflexive
// 3392.1-3392.166: (1.1): Object invariant may not hold.
// 3393.1-3423.2: (7.32): yields_as clause for P._lock is not transitive
