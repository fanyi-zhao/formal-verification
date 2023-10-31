                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/decreasing-loop-message.anchor:         
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile int x N                                                                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.x == 0;                                                                         
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int tmp1;                                                                                   
        tmp1 = 0;                                                                                   
        this.x := tmp1;                                                                             
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp2;                                                                           
            tmp2 = i < 10;                                                                          
            if (!tmp2) break; else {                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile int x N                                                                              
                                                                                                    
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
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int tmp1;                                                                                   
        tmp1 = 0;                                                                                   
        this.x := tmp1;                                                                             
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp2;                                                                           
            tmp2 = i < 10;                                                                          
            if (!tmp2) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile int x N                                                                              
                                                                                                    
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
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int tmp1;                                                                                   
        tmp1 = 0;                                                                                   
        this.x := tmp1;                                                                             
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp2;                                                                           
            tmp2 = i < 10;                                                                          
            if (!tmp2) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              i = i + 1;                                                                            
            }                                                                                       
          }                                                                                         
        }                                                                                           
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class A {                                                                                       
      volatile int x N                                                                              
                                                                                                    
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
        assume this.x == 0;                                                                         
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      public void f() {                                                                             
        int tmp1;                                                                                   
        tmp1 = 0;                                                                                   
        this.x := tmp1;                                                                             
        {                                                                                           
          int i;                                                                                    
          i = 0;                                                                                    
          while (true)   {                                                                          
            boolean tmp2;                                                                           
            tmp2 = i < 10;                                                                          
            if (!tmp2) {                                                                            
              break;                                                                                
            } else {                                                                                
                                                                                                    
            }                                                                                       
            {                                                                                       
              i = i + 1;                                                                            
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
                                                                                                    
                                                                                                    
/*** Class Decl A ***/                                                                              
                                                                                                    
type A;                                                                                             
const unique A.null: A;                                                                             
var A._state: [A]State;                                                                             
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var A.x: [A]int;                                                                                    
                                                                                                    
function {:inline} ReadEval.A.x(tid: Tid,this : A,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A.x(tid: Tid,this : A,newValue: int,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var A._lock: [A]Tid;                                                                                
                                                                                                    
function {:inline} ReadEval.A._lock(tid: Tid,this : A,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(A._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((A._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((A._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((A._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.A._lock(tid: Tid,this : A,newValue: Tid,A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(A._state[this], tid)) then                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((A._lock[this]==tid)) then                                                                   
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((A._lock[this]==Tid.null)&&(newValue==tid))) then                                           
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((A._lock[this]==tid)&&(newValue==Tid.null))) then                                          
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  A.f(tid:Tid, this : A)                                                                   
modifies A._state;                                                                                  
modifies A.x;                                                                                       
modifies A._lock;                                                                                   
                                                                                                    
requires ValidTid(tid);                                                                                    // (3.5): Bad tid
requires isShared(A._state[this]);                                                                         // (3.5): this is not global
                                                                                                    
requires StateInvariant(A._state, A.x, A._lock);                                                    
                                                                                                    
ensures StateInvariant(A._state, A.x, A._lock);                                                     
{                                                                                                   
 var A._lock1236190: [A]Tid;                                                                        
 var moverPath1236157: MoverPath;                                                                   
 var A._state1236188: [A]State;                                                                     
 var A._state1236157: [A]State;                                                                     
 var this1236188: A;                                                                                
 var tmp11236188: int;                                                                              
 var $pc1236190: Phase;                                                                             
 var path1236157: int;                                                                              
 var $pc1236188_bottom: Phase;                                                                      
 var tid1236188_bottom: Tid;                                                                        
 var A._lock1236188: [A]Tid;                                                                        
 var $recorded.state1236188_bottom: int;                                                            
 var phase1236188: Phase;                                                                           
 var tmp2: bool;                                                                                    
 var A.x1236157: [A]int;                                                                            
 var $recorded.state1236188: int;                                                                   
 var tmp11236190: int;                                                                              
 var A._state1236190: [A]State;                                                                     
 var i: int;                                                                                        
 var A._lock1236157: [A]Tid;                                                                        
 var tid1236188: Tid;                                                                               
 var tmp11236157: int;                                                                              
 var i1236188_bottom: int;                                                                          
 var $recorded.state1236157: int;                                                                   
 var A.x1236190: [A]int;                                                                            
 var A._lock1236188_bottom: [A]Tid;                                                                 
 var mover1236157: Mover;                                                                           
 var this1236188_bottom: A;                                                                         
 var $pc1236188: Phase;                                                                             
 var tmp1: int;                                                                                     
 var this1236190: A;                                                                                
 var A.x1236188: [A]int;                                                                            
 var A.x1236188_bottom: [A]int;                                                                     
 var tmp11236188_bottom: int;                                                                       
 var tid1236157: Tid;                                                                               
 var i1236188: int;                                                                                 
 var tid1236190: Tid;                                                                               
 var this1236157: A;                                                                                
 var $recorded.state1236190: int;                                                                   
 var $pc1236157: Phase;                                                                             
 var A._state1236188_bottom: [A]State;                                                              
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 4.9: int tmp1;                                                                                  
                                                                                                    
                                                                                                    
 // 4.9: tmp1 = 0;                                                                                  
                                                                                                    
 tmp1 := 0;                                                                                         
                                                                                                    
                                                                                                    
 // 4.9: this.x := tmp1;                                                                            
                                                                                                    
                                                                                                    
 moverPath1236157 := WriteEval.A.x(tid: Tid,this: A,tmp1: int,A._state,A.x,A._lock);                
 mover1236157 := m#moverPath(moverPath1236157);                                                     
 path1236157 := p#moverPath(moverPath1236157);                                                      
 assume A._state1236157 == A._state && A.x1236157 == A.x && A._lock1236157 == A._lock && tmp11236157 == tmp1 && this1236157 == this && tid1236157 == tid && $pc1236157 == $pc;
 assume $recorded.state1236157 == 1;                                                                
 if ($pc == PreCommit) {                                                                            
  assume this != A.null;                                                                            
 } else {                                                                                           
  assert this != A.null;                                                                                   // (4.9): Cannot have potential null deference in left-mover part.
 }                                                                                                  
 $pc := transition($pc, mover1236157);                                                              
 assert $pc != PhaseError;                                                                                 // (4.9): Reduction failure
 A.x[this] := tmp1;                                                                                 
                                                                                                    
 // 5.14: int i;                                                                                    
                                                                                                    
                                                                                                    
 // 5.14: i = 0;                                                                                    
                                                                                                    
 i := 0;                                                                                            
 assume A._state1236188 == A._state && A.x1236188 == A.x && A._lock1236188 == A._lock && i1236188 == i && tmp11236188 == tmp1 && this1236188 == this && tid1236188 == tid;
 assume $recorded.state1236188 == 1;                                                                
                                                                                                    
 // 5.27: while (true)   {                                                                          
                                                                                                    
 phase1236188 := $pc;                                                                               
 while (true)                                                                                       
                                                                                                    
  invariant ValidTid(tid);                                                                                 // (3.5): Bad tid
  invariant isShared(A._state[this]);                                                                      // (3.5): this is not global
                                                                                                    
  invariant StateInvariant(A._state, A.x, A._lock);                                                 
  invariant (forall _this : A :: Invariant.Y_A.x(tid : Tid, _this, A.x[_this] ,A._state1236188,A.x1236188,A._lock1236188));       // (5.27): Loop does not preserve yields_as annotation for field x
  invariant phase1236188 == $pc;                                                                           // (5.27): Phase must be invariant at loop head
  invariant $pc == PreCommit;                                                                              // (5.27): Potentially infinite loop cannot be in post-commit phase.
 {                                                                                                  
                                                                                                    
  // 5.27: boolean tmp2;                                                                            
                                                                                                    
                                                                                                    
  // 5.27: tmp2 = i < 10;                                                                           
                                                                                                    
  tmp2 := (i<10);                                                                                   
  if (!(tmp2)) {                                                                                    
                                                                                                    
   // 5.27: break;                                                                                  
                                                                                                    
   break;                                                                                           
  } else {                                                                                          
  }                                                                                                 
                                                                                                    
  // 5.33: i = i + 1;                                                                               
                                                                                                    
  i := (i+1);                                                                                       
  assume A._state1236188_bottom == A._state && A.x1236188_bottom == A.x && A._lock1236188_bottom == A._lock && i1236188_bottom == i && tmp11236188_bottom == tmp1 && this1236188_bottom == this && tid1236188_bottom == tid;
  assume $recorded.state1236188_bottom == 1;                                                        
  assert phase1236188 == $pc;                                                                              // (5.27): Phase must be invariant at loop head
 }                                                                                                  
                                                                                                    
 // 3.21: // return;                                                                                
                                                                                                    
 assume A._state1236190 == A._state && A.x1236190 == A.x && A._lock1236190 == A._lock && tmp11236190 == tmp1 && this1236190 == this && tid1236190 == tid;
 assume $recorded.state1236190 == 1;                                                                
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(A._state: [A]State,A.x: [A]int,A._lock: [A]Tid) returns (bool) { 
  true &&                                                                                           
  (forall _i: A  :: _i == A.null <==> isNull(A._state[_i])) &&                                      
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                    
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): A.x failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                     
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.A.x(u: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (2.5): A.x failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                     
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.x[x];                                                                                
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 A.x[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (2.5): A.x failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                      
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == A.x[x];                                                                                
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.A.x(u: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (2.5): A.x failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                          
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): A.x failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.A.x(t: Tid, u: Tid, v: int, w: int, x: A)                           
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[x], u);                                                             
 modifies A.x;                                                                                      
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == A.x[x];                                                                                
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 A.x[x] := havocValue;                                                                              
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.A.x(u: Tid,x: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (2.5): A.x failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)              
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (2.5): A.x is not Write-Write Stable with respect to A.x (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (2.5): A.x is not Write-Write Stable with respect to A.x (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (2.5): A.x is not Write-Write Stable with respect to A.x (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)              
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var A.x_mid: [A]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var w_mid: int;                                                                                    
 var y_mid: A;                                                                                      
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := A.x[x];                                                                                    
 A.x[x] := v;                                                                                       
                                                                                                    
 assume A._state_mid == A._state && A.x_mid == A.x && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 A.x[x] := tmpV;                                                                                    
 A.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): A.x is not Write-Write Stable with respect to A.x (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)             
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var t_mid: Tid;                                                                                    
 var A._lock_mid: [A]Tid;                                                                           
 var u_mid: Tid;                                                                                    
 var A.x_mid: [A]int;                                                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: A;                                                                                      
 var w_mid: int;                                                                                    
 var y_mid: A;                                                                                      
 var v_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var A._state_mid: [A]State;                                                                        
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := A.x[x];                                                                                    
 A.x[x] := v;                                                                                       
 assume A._state_mid == A._state && A.x_mid == A.x && A._lock_mid == A._lock && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                           
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 A.x[x] := tmpV;                                                                                    
 A.x[y] := w;                                                                                       
 _writeByTPost := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                           
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): A.x is not Write-Write Stable with respect to A.x (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (2.5): A.x is not Write-Write Stable with respect to A.x (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)            
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _readByT := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                        
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.A.x(u: Tid,y: A,w: int,A._state,A.x,A._lock);                               
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[y] := w;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.A.x(t: Tid,x: A,A._state,A.x,A._lock);                                    
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): A.x is not Read-Write Stable with respect to A.x (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): A.x is not Read-Write Stable with respect to A.x (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (2.5): A.x is not Read-Write Stable with respect to A.x (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.A.x.A.x(t: Tid, u: Tid, v: int, w: int, w0: int, x: A, y: A)            
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(A._state[x], t);                                                             
 requires isAccessible(A._state[y], u);                                                             
 modifies A.x;                                                                                      
 modifies A.x;                                                                                      
                                                                                                    
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
 var y_pre: A;                                                                                      
 var v_pre: int;                                                                                    
 var A.x_pre: [A]int;                                                                               
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: A;                                                                                      
 var A._lock_pre: [A]Tid;                                                                           
 var A._state_pre: [A]State;                                                                        
 var w_pre: int;                                                                                    
 var $pc_pre: Phase;                                                                                
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_post: A;                                                                                     
 var $recorded.state_post: int;                                                                     
 var A.x_post: [A]int;                                                                              
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var A._state_post: [A]State;                                                                       
 var A._lock_post: [A]Tid;                                                                          
 var u_post: Tid;                                                                                   
 var y_post: A;                                                                                     
                                                                                                    
                                                                                                    
 _readByU := ReadEval.A.x(u: Tid,y: A,A._state,A.x,A._lock);                                        
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.A.x(t: Tid,x: A,v: int,A._state,A.x,A._lock);                               
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 A.x[x] := v;                                                                                       
 assume A._state_post == A._state && A.x_post == A.x && A._lock_post == A._lock && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.A.x(u: Tid,y: A,A._state,A.x,A._lock);                                    
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): A.x is not Write-Read Stable with respect to A.x (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (2.5): A.x is not Write-Read Stable with respect to A.x (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (2.5): A.x is not Write-Read Stable with respect to A.x (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(A._state, A.x, A._lock);                                                    
requires ValidTid(tid);                                                                             
modifies A._state;                                                                                  
modifies A.x;                                                                                       
modifies A._lock;                                                                                   
ensures StateInvariant(A._state, A.x, A._lock);                                                     
ensures Y(tid , old(A._state), old(A.x), old(A._lock) , A._state, A.x, A._lock);                    
                                                                                                    
// A.x:                                                                                             
                                                                                                    
function {:inline} Y_A.x(tid : Tid, this: A, newValue: int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A.x(tid: Tid,this: A,A._state,A.x,A._lock)), _R)) ==> (A.x[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A.x(tid : Tid, this: A, newValue: int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A.x.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var newValue_yield: int;                                                                            
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A.x(u: Tid,this: A,newValue: int,A._state,A.x,A._lock)));    
                                                                                                    
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.x(tid, this, newValue , A._state, A.x, A._lock);                                        
}                                                                                                   
                                                                                                    
procedure Y_A.x.Reflexive(tid : Tid, this: A , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)    
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A.x(tid, this, A.x[this] , A._state, A.x, A._lock);                                       
}                                                                                                   
                                                                                                    
procedure Y_A.x.Transitive(tid : Tid, this: A, newValue : int , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]int, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires StateInvariant(A._state_p, A.x_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.x_pre: [A]int;                                                                                
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var newValue_pre: int;                                                                              
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.x_post: [A]int;                                                                               
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.x, A._lock , A._state_p, A.x_p, A._lock_p);                             
 assume Y_A.x(tid, this, newValue , A._state_p, A.x_p, A._lock_p);                                  
assume A._state_post == A._state_p && A.x_post == A.x_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A.x(tid, this, newValue , A._state, A.x, A._lock);                                        
}                                                                                                   
// A._lock:                                                                                         
                                                                                                    
function {:inline} Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 ((isAccessible(A._state[this], tid) && leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.x,A._lock)), _R)) ==> (A._lock[this] == newValue))
 &&(((A._lock[this]==tid)==(newValue==tid)))                                                        
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_A._lock(tid : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Subsumes.W(tid : Tid, u : Tid, this: A, newValue: Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var u_yield: Tid;                                                                                   
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume isAccessible(A._state[this], u);                                                            
 assume !isError(m#moverPath(WriteEval.A._lock(u: Tid,this: A,newValue: Tid,A._state,A.x,A._lock)));
 assume leq(m#moverPath(ReadEval.A._lock(tid: Tid,this: A,A._state,A.x,A._lock)), _N);              
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, newValue , A._state, A.x, A._lock);                                    
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Reflexive(tid : Tid, this: A , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var A._lock_yield: [A]Tid;                                                                          
var this_yield: A;                                                                                  
var tid_yield: Tid;                                                                                 
var $pc_yield: Phase;                                                                               
var A._state_yield: [A]State;                                                                       
var $recorded.state_yield: int;                                                                     
var A.x_yield: [A]int;                                                                              
                                                                                                    
 assume isAccessible(A._state[this], tid);                                                          
assume A._state_yield == A._state && A.x_yield == A.x && A._lock_yield == A._lock && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_A._lock(tid, this, A._lock[this] , A._state, A.x, A._lock);                               
}                                                                                                   
                                                                                                    
procedure Y_A._lock.Transitive(tid : Tid, this: A, newValue : Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]int, A._lock_p: [A]Tid)
 requires StateInvariant(A._state, A.x, A._lock);                                                   
 requires StateInvariant(A._state_p, A.x_p, A._lock_p);                                             
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: A;                                                                                    
var A.x_pre: [A]int;                                                                                
var $recorded.state_pre: int;                                                                       
var A._lock_pre: [A]Tid;                                                                            
var A._state_pre: [A]State;                                                                         
var tid_pre: Tid;                                                                                   
var $pc_pre: Phase;                                                                                 
var newValue_pre: Tid;                                                                              
                                                                                                    
var $recorded.state_post: int;                                                                      
var A.x_post: [A]int;                                                                               
var $pc_post: Phase;                                                                                
var this_post: A;                                                                                   
var tid_post: Tid;                                                                                  
var newValue_post: Tid;                                                                             
var A._state_post: [A]State;                                                                        
var A._lock_post: [A]Tid;                                                                           
                                                                                                    
assume A._state_pre == A._state && A.x_pre == A.x && A._lock_pre == A._lock && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(A._state[this], tid);                                                          
 assume Y(tid , A._state, A.x, A._lock , A._state_p, A.x_p, A._lock_p);                             
 assume Y_A._lock(tid, this, newValue , A._state_p, A.x_p, A._lock_p);                              
assume A._state_post == A._state_p && A.x_post == A.x_p && A._lock_post == A._lock_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_A._lock(tid, this, newValue , A._state, A.x, A._lock);                                    
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , A._state: [A]State, A.x: [A]int, A._lock: [A]Tid , A._state_p: [A]State, A.x_p: [A]int, A._lock_p: [A]Tid): bool
{                                                                                                   
 (forall this: A :: Y_A.x(tid : Tid, this, A.x_p[this] , A._state, A.x, A._lock))                   
 && (forall this: A :: Y_A._lock(tid : Tid, this, A._lock_p[this] , A._state, A.x, A._lock))        
 && (forall _i : A :: isShared(A._state[_i]) ==> isShared(A._state_p[_i]))                          
 && (forall _i : A :: isLocal(A._state[_i], tid) <==> isLocal(A._state_p[_i], tid))                 
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 474.1-610.2: (Method:3.5)
// 481.1-481.24: (3.5): Bad tid
// 482.1-482.35: (3.5): this is not global
// 534.2-536.2: (class anchor.sink.VarDeclStmt:4.9)
// 537.2-540.12: (class anchor.sink.Assign:4.9)
// 542.2-558.20: (class anchor.sink.Write:4.9)
// 554.1-554.25: (4.9): Cannot have potential null deference in left-mover part.
// 557.1-557.27: (4.9): Reduction failure
// 559.2-561.2: (class anchor.sink.VarDeclStmt:5.14)
// 562.2-565.9: (class anchor.sink.Assign:5.14)
// 568.2-572.14: (class anchor.sink.While:5.27)
// 574.1-574.27: (3.5): Bad tid
// 575.1-575.38: (3.5): this is not global
// 578.1-578.124: (5.27): Loop does not preserve yields_as annotation for field x
// 579.1-579.33: (5.27): Phase must be invariant at loop head
// 580.1-580.30: (5.27): Potentially infinite loop cannot be in post-commit phase.
// 582.3-584.3: (class anchor.sink.VarDeclStmt:5.27)
// 585.3-588.18: (class anchor.sink.Assign:5.27)
// 590.4-593.10: (class anchor.sink.Break:5.27)
// 596.3-599.14: (class anchor.sink.Assign:5.33)
// 602.1-602.30: (5.27): Phase must be invariant at loop head
// 604.2-609.9: (class anchor.sink.Return:3.21)
// 684.1-684.34: (2.5): A.x failed Write-Write Right-Mover Check
// 741.1-741.30: (2.5): A.x failed Write-Read Right-Mover Check
// 802.1-802.34: (2.5): A.x failed Write-Write Left-Mover Check
// 860.1-860.30: (2.5): A.x failed Write-Read Left-Mover Check
// 915.1-915.34: (2.5): A.x failed Read-Write Right-Mover Check
// 973.1-973.34: (2.5): A.x failed Read-Write Left-Mover Check
// 1042.1-1042.140: (2.5): A.x is not Write-Write Stable with respect to A.x (case A.1)
// 1043.1-1043.101: (2.5): A.x is not Write-Write Stable with respect to A.x (case A.2)
// 1044.1-1044.158: (2.5): A.x is not Write-Write Stable with respect to A.x (case A.3)
// 1137.1-1137.140: (2.5): A.x is not Write-Write Stable with respect to A.x (case C)
// 1235.1-1235.144: (2.5): A.x is not Write-Write Stable with respect to A.x (case D)
// 1236.1-1236.144: (2.5): A.x is not Write-Write Stable with respect to A.x (case R)
// 1305.1-1305.136: (2.5): A.x is not Read-Write Stable with respect to A.x (case F)
// 1306.1-1306.136: (2.5): A.x is not Read-Write Stable with respect to A.x (case H)
// 1307.1-1307.146: (2.5): A.x is not Read-Write Stable with respect to A.x (case I)
// 1375.1-1375.136: (2.5): A.x is not Write-Read Stable with respect to A.x (case J)
// 1376.1-1376.136: (2.5): A.x is not Write-Read Stable with respect to A.x (case K)
// 1377.1-1377.99: (2.5): A.x is not Write-Read Stable with respect to A.x (case L)
// 1408.1-1427.2: (2.5): yields_as clause for A.x is not valid
// 1432.1-1446.2: (2.5): yields_as clause for A.x is not reflexive
// 1452.1-1480.2: (2.5): yields_as clause for A.x is not transitive
// 1500.1-1519.2: (7.32): yields_as clause for A._lock is not valid
// 1524.1-1538.2: (7.32): yields_as clause for A._lock is not reflexive
// 1544.1-1572.2: (7.32): yields_as clause for A._lock is not transitive
