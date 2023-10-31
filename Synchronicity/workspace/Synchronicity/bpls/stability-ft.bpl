                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/artifact/Synchronicity/workspace/Synchronicity/tests/stability-ft.anchor:                    
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      array VarState_VC = int[this.read != -1                                                       
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid)                                                                         
           ? B                                                                                      
           : tid == index ? B : E                                                                   
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      void init() {                                                                                 
        assume this.read == 0;                                                                      
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      array VarState_VC = int[this.read != -1                                                       
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid)                                                                         
           ? B                                                                                      
           : tid == index ? B : E                                                                   
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
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
        assume this.read == 0;                                                                      
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      array VarState_VC = int[this.read != -1                                                       
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid)                                                                         
           ? B                                                                                      
           : tid == index ? B : E                                                                   
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
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
        assume this.read == 0;                                                                      
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class VarState {                                                                                
      array VarState_VC = int[this.read != -1                                                       
       ? holds(this, tid) ? B : E                                                                   
       : isRead                                                                                     
         ? holds(this, tid)                                                                         
           ? B                                                                                      
           : tid == index ? B : E                                                                   
         : holds(this, tid) && tid == index ? B : E]                                                
                                                                                                    
      volatile int read this.read != -1                                                             
       ? holds(this, tid)                                                                           
         ? isRead ? B : N                                                                           
         : isRead ? N : E                                                                           
       : isRead ? R : E                                                                             
                                                                                                    
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
        assume this.read == 0;                                                                      
        {                                                                                           
          {                                                                                         
            // return;                                                                              
          }                                                                                         
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
                                                                                                    
                                                                                                    
/*** Class Decl VarState ***/                                                                       
                                                                                                    
type VarState;                                                                                      
const unique VarState.null: VarState;                                                               
var VarState._state: [VarState]State;                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var VarState.read: [VarState]int;                                                                   
                                                                                                    
function {:inline} ReadEval.VarState.read(tid: Tid,this : VarState,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := 0;                                                                                
 if ((VarState.read[this]!=-(1))) then                                                              
  if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then               
   if (isRead) then                                                                                 
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_R, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.VarState.read(tid: Tid,this : VarState,newValue: int,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((VarState.read[this]!=-(1))) then                                                              
  if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then               
   if (isRead) then                                                                                 
    moverPath(_B, 7)                                                                                
   else                                                                                             
    moverPath(_N, 3)                                                                                
  else                                                                                              
   if (isRead) then                                                                                 
    moverPath(_N, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_R, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var VarState._lock: [VarState]Tid;                                                                  
                                                                                                    
function {:inline} ReadEval.VarState._lock(tid: Tid,this : VarState,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(VarState._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((VarState._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((VarState._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((VarState._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.VarState._lock(tid: Tid,this : VarState,newValue: Tid,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(VarState._state[this], tid)) then                                                      
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((VarState._lock[this]==tid)) then                                                            
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((VarState._lock[this]==Tid.null)&&(newValue==tid))) then                                    
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((VarState._lock[this]==tid)&&(newValue==Tid.null))) then                                   
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/*** Array Array.VarState.VarState_VC ***/                                                          
                                                                                                    
type Array.VarState.VarState_VC;                                                                    
const unique Array.VarState.VarState_VC.null: Array.VarState.VarState_VC;                           
var Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State;                           
                                                                                                    
const Array.VarState.VarState_VC._this : [Array.VarState.VarState_VC]VarState;                      
const Array.VarState.VarState_VC._length : [Array.VarState.VarState_VC]int;                         
var Array.VarState.VarState_VC._elems  : [Array.VarState.VarState_VC]([int]int);                    
                                                                                                    
axiom (forall $this : Array.VarState.VarState_VC :: Array.VarState.VarState_VC._length[$this] >= 0);
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.VarState.VarState_VC: Spec(Cond(BinaryExpr(FieldAccess(VarAccess(this),read),UnaryExpr(ConstExpr(IntConst(1)),Neg()),NE()),Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),Cond(BinaryExpr(Holds(VarAccess(this),VarAccess(tid)),BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),And()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.VarState.VarState_VC(tid: Tid,this : VarState,athis : Array.VarState.VarState_VC,index : int,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((VarState.read[this]!=-(1))) then                                                              
  if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then               
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then              
    moverPath(_B, 6)                                                                                
   else                                                                                             
    if ((tid==index)) then                                                                          
     moverPath(_B, 10)                                                                              
    else                                                                                            
     moverPath(_E, 2)                                                                               
  else                                                                                              
   if (((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)&&(tid==index))) then
    moverPath(_B, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.VarState.VarState_VC: Spec(Cond(BinaryExpr(FieldAccess(VarAccess(this),read),UnaryExpr(ConstExpr(IntConst(1)),Neg()),NE()),Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))),Cond(VarAccess(isRead),Cond(Holds(VarAccess(this),VarAccess(tid)),ConstExpr(MoverConst(B())),Cond(BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E())))),Cond(BinaryExpr(Holds(VarAccess(this),VarAccess(tid)),BinaryExpr(VarAccess(tid),VarAccess(index),EQ()),And()),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(E()))))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.VarState.VarState_VC(tid: Tid,this : VarState,athis : Array.VarState.VarState_VC,index : int,newValue: int,VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((VarState.read[this]!=-(1))) then                                                              
  if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then               
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_E, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   if ((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)) then              
    moverPath(_B, 6)                                                                                
   else                                                                                             
    if ((tid==index)) then                                                                          
     moverPath(_B, 10)                                                                              
    else                                                                                            
     moverPath(_E, 2)                                                                               
  else                                                                                              
   if (((isAccessible(VarState._state[this], tid) && VarState._lock[this] == tid)&&(tid==index))) then
    moverPath(_B, 4)                                                                                
   else                                                                                             
    moverPath(_E, 0)                                                                                
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(VarState._state: [VarState]State,VarState.read: [VarState]int,VarState._lock: [VarState]Tid,Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State,Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int),Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int) returns (bool) {
  true &&                                                                                           
  (forall _i: VarState  :: _i == VarState.null <==> isNull(VarState._state[_i])) &&                 
  (forall _i: Array.VarState.VarState_VC  :: _i == Array.VarState.VarState_VC.null <==> isNull(Array.VarState.VarState_VC._state[_i])) &&
  (forall _t: Tid, _i: Array.VarState.VarState_VC  :: ValidTid(_t) && isAccessible(Array.VarState.VarState_VC._state[_i], _t) ==> isAccessible(VarState._state[Array.VarState.VarState_VC._this[_i]], _t)) &&
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)   
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): VarState.read failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)    
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.VarState.read(u: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (12.5): VarState.read failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)    
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == VarState.read[x];                                                                      
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 VarState.read[x] := havocValue;                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (12.5): VarState.read failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)     
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == VarState.read[x];                                                                      
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.VarState.read(u: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (12.5): VarState.read failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)         
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): VarState.read failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.VarState.read(t: Tid, u: Tid, v: int, w: int, x: VarState)          
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[x], u);                                                      
 modifies VarState.read;                                                                            
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == VarState.read[x];                                                                      
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 VarState.read[x] := havocValue;                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.VarState.read(u: Tid,x: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (12.5): VarState.read failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[x], u);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.VarState.VarState_VC failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[x], u);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.VarState.VarState_VC(u: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (3.5): Array Array.VarState.VarState_VC failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[x], u);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.VarState.VarState_VC._elems[x][i];                                               
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := havocValue;                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.VarState.VarState_VC failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[x], u);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume w == Array.VarState.VarState_VC._elems[x][i];                                               
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.VarState.VarState_VC(u: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (3.5): Array Array.VarState.VarState_VC failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[x], u);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.VarState.VarState_VC failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[x], u);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
 assume w == Array.VarState.VarState_VC._elems[x][i];                                               
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.VarState.VarState_VC._elems[x][i] := havocValue;                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (3.5): Array Array.VarState.VarState_VC failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var y_mid: VarState;                                                                               
 var u_mid: Tid;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var v_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_mid: VarState;                                                                               
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := VarState.read[x];                                                                          
 VarState.read[x] := v;                                                                             
                                                                                                    
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 VarState.read[x] := tmpV;                                                                          
 VarState.read[y] := w;                                                                             
 _writeByTPost := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var t_mid: Tid;                                                                                    
 var y_mid: VarState;                                                                               
 var u_mid: Tid;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var v_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_mid: VarState;                                                                               
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := VarState.read[x];                                                                          
 VarState.read[x] := v;                                                                             
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 VarState.read[x] := tmpV;                                                                          
 VarState.read[y] := w;                                                                             
 _writeByTPost := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[y] := w;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): VarState.read is not Read-Write Stable with respect to VarState.read (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): VarState.read is not Read-Write Stable with respect to VarState.read (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): VarState.read is not Read-Write Stable with respect to VarState.read (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.VarState.read.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(VarState._state[y], u);                                                      
 modifies VarState.read;                                                                            
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.VarState.read(u: Tid,y: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.VarState.read(u: Tid,y: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): VarState.read is not Write-Read Stable with respect to VarState.read (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): VarState.read is not Write-Read Stable with respect to VarState.read (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): VarState.read is not Write-Read Stable with respect to VarState.read (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.VarState.read.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies VarState.read;                                                                            
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.VarState.read.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies VarState.read;                                                                            
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var y_owner_mid: VarState;                                                                         
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var y_mid: Array.VarState.VarState_VC;                                                             
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_mid: VarState;                                                                               
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := VarState.read[x];                                                                          
 VarState.read[x] := v;                                                                             
                                                                                                    
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 VarState.read[x] := tmpV;                                                                          
 Array.VarState.VarState_VC._elems[y][j] := w;                                                      
 _writeByTPost := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.VarState.read.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies VarState.read;                                                                            
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var y_owner_mid: VarState;                                                                         
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var y_mid: Array.VarState.VarState_VC;                                                             
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var x_mid: VarState;                                                                               
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := VarState.read[x];                                                                          
 VarState.read[x] := v;                                                                             
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 VarState.read[x] := tmpV;                                                                          
 Array.VarState.VarState_VC._elems[y][j] := w;                                                      
 _writeByTPost := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.VarState.read.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies VarState.read;                                                                            
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _readByT := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.VarState.VarState_VC._elems[y][j] := w;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.VarState.read(t: Tid,x: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): VarState.read is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): VarState.read is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (12.5): VarState.read is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.VarState.read.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x: VarState, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(VarState._state[x], t);                                                      
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies VarState.read;                                                                            
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var t_pre: Tid;                                                                                    
 var x_pre: VarState;                                                                               
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var x_post: VarState;                                                                              
 var VarState._lock_post: [VarState]Tid;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.VarState.read(t: Tid,x: VarState,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[x] := v;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to VarState.read (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to VarState.read (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to VarState.read (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.VarState.VarState_VC._elems.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(VarState._state[y], u);                                                      
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.VarState.VarState_VC._elems.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(VarState._state[y], u);                                                      
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_owner_mid: VarState;                                                                         
 var t_mid: Tid;                                                                                    
 var x_mid: Array.VarState.VarState_VC;                                                             
 var y_mid: VarState;                                                                               
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var v_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.VarState.VarState_VC._elems[x][i];                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
                                                                                                    
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := tmpV;                                                   
 VarState.read[y] := w;                                                                             
 _writeByTPost := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.VarState.VarState_VC._elems.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(VarState._state[y], u);                                                      
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var x_owner_mid: VarState;                                                                         
 var t_mid: Tid;                                                                                    
 var x_mid: Array.VarState.VarState_VC;                                                             
 var y_mid: VarState;                                                                               
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var v_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.VarState.VarState_VC._elems[x][i];                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := tmpV;                                                   
 VarState.read[y] := w;                                                                             
 _writeByTPost := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.VarState.VarState_VC._elems.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(VarState._state[y], u);                                                      
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.VarState.read(u: Tid,y: VarState,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 VarState.read[y] := w;                                                                             
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to VarState.read (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to VarState.read (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to VarState.read (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.VarState.VarState_VC._elems.VarState.read(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y: VarState)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(VarState._state[y], u);                                                      
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies VarState.read;                                                                            
                                                                                                    
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
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var y_pre: VarState;                                                                               
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: VarState;                                                                              
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
                                                                                                    
                                                                                                    
 _readByU := ReadEval.VarState.read(u: Tid,y: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.VarState.read(u: Tid,y: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): VarState.read is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (12.5): VarState.read is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (12.5): VarState.read is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.VarState.VarState_VC._elems.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.VarState.VarState_VC._elems.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var x_owner_mid: VarState;                                                                         
 var t_mid: Tid;                                                                                    
 var x_mid: Array.VarState.VarState_VC;                                                             
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var y_owner_mid: VarState;                                                                         
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var y_mid: Array.VarState.VarState_VC;                                                             
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.VarState.VarState_VC._elems[x][i];                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
                                                                                                    
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := tmpV;                                                   
 Array.VarState.VarState_VC._elems[y][j] := w;                                                      
 _writeByTPost := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.VarState.VarState_VC._elems.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var x_owner_mid: VarState;                                                                         
 var t_mid: Tid;                                                                                    
 var x_mid: Array.VarState.VarState_VC;                                                             
 var u_mid: Tid;                                                                                    
 var i_mid: int;                                                                                    
 var Array.VarState.VarState_VC._state_mid: [Array.VarState.VarState_VC]State;                      
 var $recorded.state_mid: int;                                                                      
 var w_mid: int;                                                                                    
 var VarState._lock_mid: [VarState]Tid;                                                             
 var y_owner_mid: VarState;                                                                         
 var Array.VarState.VarState_VC._elems_mid: [Array.VarState.VarState_VC]([int]int);                 
 var y_mid: Array.VarState.VarState_VC;                                                             
 var v_mid: int;                                                                                    
 var j_mid: int;                                                                                    
 var Array.VarState.VarState_VC._length_mid: [Array.VarState.VarState_VC]int;                       
 var VarState._state_mid: [VarState]State;                                                          
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
 var VarState.read_mid: [VarState]int;                                                              
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.VarState.VarState_VC._elems[x][i];                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_mid == VarState._state && VarState.read_mid == VarState.read && VarState._lock_mid == VarState._lock && Array.VarState.VarState_VC._state_mid == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_mid == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_mid == Array.VarState.VarState_VC._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.VarState.VarState_VC._elems[x][i] := tmpV;                                                   
 Array.VarState.VarState_VC._elems[y][j] := w;                                                      
 _writeByTPost := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.VarState.VarState_VC._elems.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,w: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.VarState.VarState_VC._elems[y][j] := w;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.VarState.VarState_VC._elems.Array.VarState.VarState_VC._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: VarState, x: Array.VarState.VarState_VC, i: int, y_owner: VarState, y: Array.VarState.VarState_VC, j: int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.VarState.VarState_VC._state[x], t);                                    
 requires Array.VarState.VarState_VC._this[x] == x_owner;                                           
 requires isAccessible(Array.VarState.VarState_VC._state[y], u);                                    
 requires Array.VarState.VarState_VC._this[y] == y_owner;                                           
 modifies Array.VarState.VarState_VC._elems;                                                        
 modifies Array.VarState.VarState_VC._elems;                                                        
                                                                                                    
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
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var VarState.read_pre: [VarState]int;                                                              
 var $recorded.state_pre: int;                                                                      
 var VarState._state_pre: [VarState]State;                                                          
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var x_pre: Array.VarState.VarState_VC;                                                             
 var i_pre: int;                                                                                    
 var y_pre: Array.VarState.VarState_VC;                                                             
 var w_pre: int;                                                                                    
 var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                       
 var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                      
 var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                 
 var $pc_pre: Phase;                                                                                
 var VarState._lock_pre: [VarState]Tid;                                                             
 var x_owner_pre: VarState;                                                                         
 var t_pre: Tid;                                                                                    
 var y_owner_pre: VarState;                                                                         
                                                                                                    
 var VarState._state_post: [VarState]State;                                                         
 var VarState.read_post: [VarState]int;                                                             
 var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                     
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                
 var y_owner_post: VarState;                                                                        
 var VarState._lock_post: [VarState]Tid;                                                            
 var x_post: Array.VarState.VarState_VC;                                                            
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                      
 var x_owner_post: VarState;                                                                        
 var u_post: Tid;                                                                                   
 var y_post: Array.VarState.VarState_VC;                                                            
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.VarState.VarState_VC(t: Tid,x_owner: VarState,x: Array.VarState.VarState_VC,i: int,v: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.VarState.VarState_VC._elems[x][i] := v;                                                      
 assume VarState._state_post == VarState._state && VarState.read_post == VarState.read && VarState._lock_post == VarState._lock && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.VarState.VarState_VC(u: Tid,y_owner: VarState,y: Array.VarState.VarState_VC,j: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
requires ValidTid(tid);                                                                             
modifies VarState._state;                                                                           
modifies VarState.read;                                                                             
modifies VarState._lock;                                                                            
modifies Array.VarState.VarState_VC._state;                                                         
modifies Array.VarState.VarState_VC._elems;                                                         
ensures StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
ensures Y(tid , old(VarState._state), old(VarState.read), old(VarState._lock), old(Array.VarState.VarState_VC._state), old(Array.VarState.VarState_VC._elems), old(Array.VarState.VarState_VC._length) , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
                                                                                                    
// VarState.read:                                                                                   
                                                                                                    
function {:inline} Y_VarState.read(tid : Tid, this: VarState, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
 ((isAccessible(VarState._state[this], tid) && leq(m#moverPath(ReadEval.VarState.read(tid: Tid,this: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)), _R)) ==> (VarState.read[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_VarState.read(tid : Tid, this: VarState, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_VarState.read.Subsumes.W(tid : Tid, u : Tid, this: VarState, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var Array.VarState.VarState_VC._elems_yield: [Array.VarState.VarState_VC]([int]int);                
var Array.VarState.VarState_VC._state_yield: [Array.VarState.VarState_VC]State;                     
var newValue_yield: int;                                                                            
var VarState._state_yield: [VarState]State;                                                         
var u_yield: Tid;                                                                                   
var Array.VarState.VarState_VC._length_yield: [Array.VarState.VarState_VC]int;                      
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume isAccessible(VarState._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.VarState.read(u: Tid,this: VarState,newValue: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)));
                                                                                                    
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && Array.VarState.VarState_VC._state_yield == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_yield == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_yield == Array.VarState.VarState_VC._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState.read(tid, this, newValue , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
procedure Y_VarState.read.Reflexive(tid : Tid, this: VarState , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var Array.VarState.VarState_VC._elems_yield: [Array.VarState.VarState_VC]([int]int);                
var Array.VarState.VarState_VC._state_yield: [Array.VarState.VarState_VC]State;                     
var VarState._state_yield: [VarState]State;                                                         
var Array.VarState.VarState_VC._length_yield: [Array.VarState.VarState_VC]int;                      
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && Array.VarState.VarState_VC._state_yield == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_yield == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_yield == Array.VarState.VarState_VC._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState.read(tid, this, VarState.read[this] , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
procedure Y_VarState.read.Transitive(tid : Tid, this: VarState, newValue : int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid, Array.VarState.VarState_VC._state_p: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems_p: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length_p: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires StateInvariant(VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: VarState;                                                                             
var VarState.read_pre: [VarState]int;                                                               
var $recorded.state_pre: int;                                                                       
var VarState._state_pre: [VarState]State;                                                           
var newValue_pre: int;                                                                              
var tid_pre: Tid;                                                                                   
var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                        
var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                       
var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                  
var $pc_pre: Phase;                                                                                 
var VarState._lock_pre: [VarState]Tid;                                                              
                                                                                                    
var VarState._state_post: [VarState]State;                                                          
var VarState.read_post: [VarState]int;                                                              
var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                      
var $recorded.state_post: int;                                                                      
var newValue_post: int;                                                                             
var $pc_post: Phase;                                                                                
var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                 
var this_post: VarState;                                                                            
var tid_post: Tid;                                                                                  
var VarState._lock_post: [VarState]Tid;                                                             
var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                       
                                                                                                    
assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume Y(tid , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length , VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
 assume Y_VarState.read(tid, this, newValue , VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
assume VarState._state_post == VarState._state_p && VarState.read_post == VarState.read_p && VarState._lock_post == VarState._lock_p && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state_p && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems_p && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_VarState.read(tid, this, newValue , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
// VarState._lock:                                                                                  
                                                                                                    
function {:inline} Y_VarState._lock(tid : Tid, this: VarState, newValue: Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
 ((isAccessible(VarState._state[this], tid) && leq(m#moverPath(ReadEval.VarState._lock(tid: Tid,this: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)), _R)) ==> (VarState._lock[this] == newValue))
 &&(((VarState._lock[this]==tid)==(newValue==tid)))                                                 
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_VarState._lock(tid : Tid, this: VarState, newValue: Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_VarState._lock.Subsumes.W(tid : Tid, u : Tid, this: VarState, newValue: Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var Array.VarState.VarState_VC._elems_yield: [Array.VarState.VarState_VC]([int]int);                
var Array.VarState.VarState_VC._state_yield: [Array.VarState.VarState_VC]State;                     
var VarState._state_yield: [VarState]State;                                                         
var u_yield: Tid;                                                                                   
var Array.VarState.VarState_VC._length_yield: [Array.VarState.VarState_VC]int;                      
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume isAccessible(VarState._state[this], u);                                                     
 assume !isError(m#moverPath(WriteEval.VarState._lock(u: Tid,this: VarState,newValue: Tid,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)));
 assume leq(m#moverPath(ReadEval.VarState._lock(tid: Tid,this: VarState,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)), _N);
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && Array.VarState.VarState_VC._state_yield == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_yield == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_yield == Array.VarState.VarState_VC._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState._lock(tid, this, newValue , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
procedure Y_VarState._lock.Reflexive(tid : Tid, this: VarState , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var Array.VarState.VarState_VC._elems_yield: [Array.VarState.VarState_VC]([int]int);                
var Array.VarState.VarState_VC._state_yield: [Array.VarState.VarState_VC]State;                     
var VarState._state_yield: [VarState]State;                                                         
var Array.VarState.VarState_VC._length_yield: [Array.VarState.VarState_VC]int;                      
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && Array.VarState.VarState_VC._state_yield == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_yield == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_yield == Array.VarState.VarState_VC._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_VarState._lock(tid, this, VarState._lock[this] , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
procedure Y_VarState._lock.Transitive(tid : Tid, this: VarState, newValue : Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid, Array.VarState.VarState_VC._state_p: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems_p: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length_p: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires StateInvariant(VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var this_pre: VarState;                                                                             
var VarState.read_pre: [VarState]int;                                                               
var $recorded.state_pre: int;                                                                       
var VarState._state_pre: [VarState]State;                                                           
var tid_pre: Tid;                                                                                   
var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                        
var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                       
var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                  
var $pc_pre: Phase;                                                                                 
var VarState._lock_pre: [VarState]Tid;                                                              
var newValue_pre: Tid;                                                                              
                                                                                                    
var VarState._state_post: [VarState]State;                                                          
var VarState.read_post: [VarState]int;                                                              
var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                      
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                 
var this_post: VarState;                                                                            
var tid_post: Tid;                                                                                  
var VarState._lock_post: [VarState]Tid;                                                             
var newValue_post: Tid;                                                                             
var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                       
                                                                                                    
assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(VarState._state[this], tid);                                                   
 assume Y(tid , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length , VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
 assume Y_VarState._lock(tid, this, newValue , VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
assume VarState._state_post == VarState._state_p && VarState.read_post == VarState.read_p && VarState._lock_post == VarState._lock_p && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state_p && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems_p && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_VarState._lock(tid, this, newValue , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
// Array.VarState.VarState_VC:                                                                      
                                                                                                    
function {:inline} Y_Array.VarState.VarState_VC(tid : Tid, athis: Array.VarState.VarState_VC, index: int, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
(var this := Array.VarState.VarState_VC._this[athis];                                               
 ((isAccessible(Array.VarState.VarState_VC._state[athis], tid) && leq(m#moverPath(ReadEval.Array.VarState.VarState_VC(tid: Tid,Array.VarState.VarState_VC._this[athis]: VarState,athis: Array.VarState.VarState_VC,index: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)), _R)) ==> (Array.VarState.VarState_VC._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.VarState.VarState_VC(tid : Tid, athis: Array.VarState.VarState_VC, index: int, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
(var this := Array.VarState.VarState_VC._this[athis];                                               
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.VarState.VarState_VC.Subsumes.W(tid : Tid, u : Tid, this: VarState, athis: Array.VarState.VarState_VC, index: int, newValue: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.VarState.VarState_VC._this[athis];                                          
{                                                                                                   
var athis_yield: Array.VarState.VarState_VC;                                                        
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var Array.VarState.VarState_VC._elems_yield: [Array.VarState.VarState_VC]([int]int);                
var Array.VarState.VarState_VC._state_yield: [Array.VarState.VarState_VC]State;                     
var VarState._state_yield: [VarState]State;                                                         
var Array.VarState.VarState_VC._length_yield: [Array.VarState.VarState_VC]int;                      
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var index_yield: int;                                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.VarState.VarState_VC._state[athis], u);                                  
 assume !isError(m#moverPath(WriteEval.Array.VarState.VarState_VC(u: Tid,Array.VarState.VarState_VC._this[athis]: VarState,athis: Array.VarState.VarState_VC,index: int,newValue: int,VarState._state,VarState.read,VarState._lock,Array.VarState.VarState_VC._state,Array.VarState.VarState_VC._elems,Array.VarState.VarState_VC._length)));
                                                                                                    
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && Array.VarState.VarState_VC._state_yield == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_yield == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_yield == Array.VarState.VarState_VC._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.VarState.VarState_VC(tid, athis, index, newValue , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.VarState.VarState_VC.Reflexive(tid : Tid, this: VarState, athis: Array.VarState.VarState_VC, index: int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.VarState.VarState_VC._this[athis];                                          
{                                                                                                   
var athis_yield: Array.VarState.VarState_VC;                                                        
var tid_yield: Tid;                                                                                 
var VarState.read_yield: [VarState]int;                                                             
var $pc_yield: Phase;                                                                               
var Array.VarState.VarState_VC._elems_yield: [Array.VarState.VarState_VC]([int]int);                
var Array.VarState.VarState_VC._state_yield: [Array.VarState.VarState_VC]State;                     
var VarState._state_yield: [VarState]State;                                                         
var Array.VarState.VarState_VC._length_yield: [Array.VarState.VarState_VC]int;                      
var VarState._lock_yield: [VarState]Tid;                                                            
var this_yield: VarState;                                                                           
var index_yield: int;                                                                               
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.VarState.VarState_VC._state[athis], tid);                                
assume VarState._state_yield == VarState._state && VarState.read_yield == VarState.read && VarState._lock_yield == VarState._lock && Array.VarState.VarState_VC._state_yield == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_yield == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_yield == Array.VarState.VarState_VC._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.VarState.VarState_VC(tid, athis, index, Array.VarState.VarState_VC._elems[athis][index] , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.VarState.VarState_VC.Transitive(tid : Tid, this: VarState, athis: Array.VarState.VarState_VC, index: int, newValue : int , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid, Array.VarState.VarState_VC._state_p: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems_p: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length_p: [Array.VarState.VarState_VC]int)
 requires StateInvariant(VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
 requires StateInvariant(VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
                                                                                                    
 requires this == Array.VarState.VarState_VC._this[athis];                                          
 requires ValidTid(tid);                                                                            
{                                                                                                   
var athis_pre: Array.VarState.VarState_VC;                                                          
var this_pre: VarState;                                                                             
var VarState.read_pre: [VarState]int;                                                               
var $recorded.state_pre: int;                                                                       
var VarState._state_pre: [VarState]State;                                                           
var index_pre: int;                                                                                 
var tid_pre: Tid;                                                                                   
var Array.VarState.VarState_VC._length_pre: [Array.VarState.VarState_VC]int;                        
var Array.VarState.VarState_VC._state_pre: [Array.VarState.VarState_VC]State;                       
var Array.VarState.VarState_VC._elems_pre: [Array.VarState.VarState_VC]([int]int);                  
var $pc_pre: Phase;                                                                                 
var VarState._lock_pre: [VarState]Tid;                                                              
                                                                                                    
var VarState._state_post: [VarState]State;                                                          
var VarState.read_post: [VarState]int;                                                              
var Array.VarState.VarState_VC._state_post: [Array.VarState.VarState_VC]State;                      
var $recorded.state_post: int;                                                                      
var $pc_post: Phase;                                                                                
var Array.VarState.VarState_VC._elems_post: [Array.VarState.VarState_VC]([int]int);                 
var this_post: VarState;                                                                            
var athis_post: Array.VarState.VarState_VC;                                                         
var tid_post: Tid;                                                                                  
var VarState._lock_post: [VarState]Tid;                                                             
var index_post: int;                                                                                
var Array.VarState.VarState_VC._length_post: [Array.VarState.VarState_VC]int;                       
                                                                                                    
assume VarState._state_pre == VarState._state && VarState.read_pre == VarState.read && VarState._lock_pre == VarState._lock && Array.VarState.VarState_VC._state_pre == Array.VarState.VarState_VC._state && Array.VarState.VarState_VC._elems_pre == Array.VarState.VarState_VC._elems && Array.VarState.VarState_VC._length_pre == Array.VarState.VarState_VC._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume VarState._state_post == VarState._state_p && VarState.read_post == VarState.read_p && VarState._lock_post == VarState._lock_p && Array.VarState.VarState_VC._state_post == Array.VarState.VarState_VC._state_p && Array.VarState.VarState_VC._elems_post == Array.VarState.VarState_VC._elems_p && Array.VarState.VarState_VC._length_post == Array.VarState.VarState_VC._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.VarState.VarState_VC._state[athis], tid);                                
 assume Y(tid , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length , VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
 assume Y_Array.VarState.VarState_VC(tid, athis, index, newValue , VarState._state_p, VarState.read_p, VarState._lock_p, Array.VarState.VarState_VC._state_p, Array.VarState.VarState_VC._elems_p, Array.VarState.VarState_VC._length_p);
 assert Y_Array.VarState.VarState_VC(tid, athis, index, newValue , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , VarState._state: [VarState]State, VarState.read: [VarState]int, VarState._lock: [VarState]Tid, Array.VarState.VarState_VC._state: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length: [Array.VarState.VarState_VC]int , VarState._state_p: [VarState]State, VarState.read_p: [VarState]int, VarState._lock_p: [VarState]Tid, Array.VarState.VarState_VC._state_p: [Array.VarState.VarState_VC]State, Array.VarState.VarState_VC._elems_p: [Array.VarState.VarState_VC]([int]int), Array.VarState.VarState_VC._length_p: [Array.VarState.VarState_VC]int): bool
{                                                                                                   
 (forall this: VarState :: Y_VarState.read(tid : Tid, this, VarState.read_p[this] , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length))
 && (forall this: VarState :: Y_VarState._lock(tid : Tid, this, VarState._lock_p[this] , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length))
 && (forall athis: Array.VarState.VarState_VC, index: int :: Y_Array.VarState.VarState_VC(tid : Tid, athis, index, Array.VarState.VarState_VC._elems_p[athis][index] , VarState._state, VarState.read, VarState._lock, Array.VarState.VarState_VC._state, Array.VarState.VarState_VC._elems, Array.VarState.VarState_VC._length))
 && (forall _i : VarState :: isShared(VarState._state[_i]) ==> isShared(VarState._state_p[_i]))     
 && (forall _i : VarState :: isLocal(VarState._state[_i], tid) <==> isLocal(VarState._state_p[_i], tid))
 && (forall _i : Array.VarState.VarState_VC :: isShared(Array.VarState.VarState_VC._state[_i]) ==> isShared(Array.VarState.VarState_VC._state_p[_i]))
 && (forall _i : Array.VarState.VarState_VC :: Array.VarState.VarState_VC._length[_i] == Array.VarState.VarState_VC._length_p[_i])
 && (forall _i : Array.VarState.VarState_VC :: isLocal(Array.VarState.VarState_VC._state[_i], tid) <==> isLocal(Array.VarState.VarState_VC._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 596.1-596.34: (12.5): VarState.read failed Write-Write Right-Mover Check
// 659.1-659.30: (12.5): VarState.read failed Write-Read Right-Mover Check
// 726.1-726.34: (12.5): VarState.read failed Write-Write Left-Mover Check
// 790.1-790.30: (12.5): VarState.read failed Write-Read Left-Mover Check
// 851.1-851.34: (12.5): VarState.read failed Read-Write Right-Mover Check
// 915.1-915.34: (12.5): VarState.read failed Read-Write Left-Mover Check
// 984.1-984.34: (3.5): Array Array.VarState.VarState_VC failed Write-Write Right-Mover Check
// 1053.1-1053.30: (3.5): Array Array.VarState.VarState_VC failed Write-Read Right-Mover Check
// 1126.1-1126.34: (3.5): Array Array.VarState.VarState_VC failed Write-Write Left-Mover Check
// 1196.1-1196.30: (3.5): Array Array.VarState.VarState_VC failed Write-Read Left-Mover Check
// 1263.1-1263.34: (3.5): Array Array.VarState.VarState_VC failed Read-Write Right-Mover Check
// 1333.1-1333.34: (3.5): Array Array.VarState.VarState_VC failed Read-Write Left-Mover Check
// 1408.1-1408.140: (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case A.1)
// 1409.1-1409.101: (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case A.2)
// 1410.1-1410.158: (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case A.3)
// 1512.1-1512.140: (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case C)
// 1619.1-1619.144: (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case D)
// 1620.1-1620.144: (12.5): VarState.read is not Write-Write Stable with respect to VarState.read (case R)
// 1695.1-1695.136: (12.5): VarState.read is not Read-Write Stable with respect to VarState.read (case F)
// 1696.1-1696.136: (12.5): VarState.read is not Read-Write Stable with respect to VarState.read (case H)
// 1697.1-1697.146: (12.5): VarState.read is not Read-Write Stable with respect to VarState.read (case I)
// 1771.1-1771.136: (12.5): VarState.read is not Write-Read Stable with respect to VarState.read (case J)
// 1772.1-1772.136: (12.5): VarState.read is not Write-Read Stable with respect to VarState.read (case K)
// 1773.1-1773.99: (12.5): VarState.read is not Write-Read Stable with respect to VarState.read (case L)
// 1854.1-1854.140: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case A.1)
// 1855.1-1855.101: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case A.2)
// 1856.1-1856.156: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case A.3)
// 1965.1-1965.140: (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case C)
// 2079.1-2079.144: (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case D)
// 2080.1-2080.144: (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case R)
// 2160.1-2160.136: (12.5): VarState.read is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case F)
// 2161.1-2161.136: (12.5): VarState.read is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case H)
// 2162.1-2162.144: (12.5): VarState.read is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case I)
// 2241.1-2241.136: (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to VarState.read (case J)
// 2242.1-2242.136: (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to VarState.read (case K)
// 2243.1-2243.99: (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to VarState.read (case L)
// 2324.1-2324.140: (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.1)
// 2325.1-2325.101: (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.2)
// 2326.1-2326.156: (12.5): VarState.read is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.3)
// 2435.1-2435.140: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case C)
// 2549.1-2549.144: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case D)
// 2550.1-2550.144: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to VarState.read (case R)
// 2630.1-2630.136: (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to VarState.read (case F)
// 2631.1-2631.136: (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to VarState.read (case H)
// 2632.1-2632.144: (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to VarState.read (case I)
// 2711.1-2711.136: (12.5): VarState.read is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case J)
// 2712.1-2712.136: (12.5): VarState.read is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case K)
// 2713.1-2713.99: (12.5): VarState.read is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case L)
// 2799.1-2799.140: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.1)
// 2800.1-2800.101: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.2)
// 2801.1-2801.156: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case A.3)
// 2917.1-2917.140: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case C)
// 3038.1-3038.144: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case D)
// 3039.1-3039.144: (3.5): Array Array.VarState.VarState_VC is not Write-Write Stable with respect to Array Array.VarState.VarState_VC (case R)
// 3124.1-3124.136: (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case F)
// 3125.1-3125.136: (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case H)
// 3126.1-3126.144: (3.5): Array Array.VarState.VarState_VC is not Read-Write Stable with respect to Array Array.VarState.VarState_VC (case I)
// 3210.1-3210.136: (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case J)
// 3211.1-3211.136: (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case K)
// 3212.1-3212.99: (3.5): Array Array.VarState.VarState_VC is not Write-Read Stable with respect to Array Array.VarState.VarState_VC (case L)
// 3245.1-3267.2: (12.5): yields_as clause for VarState.read is not valid
// 3272.1-3289.2: (12.5): yields_as clause for VarState.read is not reflexive
// 3295.1-3329.2: (12.5): yields_as clause for VarState.read is not transitive
// 3349.1-3371.2: (7.32): yields_as clause for VarState._lock is not valid
// 3376.1-3393.2: (7.32): yields_as clause for VarState._lock is not reflexive
// 3399.1-3433.2: (7.32): yields_as clause for VarState._lock is not transitive
// 3451.1-3477.2: (3.5): yields_as clause for Array.VarState.VarState_VC is not valid
// 3478.1-3501.2: (3.5): yields_as clause for Array.VarState.VarState_VC is not reflexive
// 3506.1-3544.2: (3.5): yields_as clause for Array.VarState.VarState_VC is not transitive
