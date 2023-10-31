                                                                                                    
 /*                                                                                                 
                                                                                                    
 /home/fzhao12/Synchronicity/workspace/Synchronicity/tests/array-ok.sink:                           
                                                                                                    
 AST:                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid                                                                    
       ? isRead ? B : B                                                                             
       : isRead ? E : E]                                                                            
                                                                                                    
       [Cow.T{this}] a N                                                                            
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        // return;                                                                                  
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Explicit:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid                                                                    
       ? isRead ? B : B                                                                             
       : isRead ? E : E]                                                                            
                                                                                                    
       [Cow.T{this}] a N                                                                            
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Inlined:                                                                                           
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid                                                                    
       ? isRead ? B : B                                                                             
       : isRead ? E : E]                                                                            
                                                                                                    
       [Cow.T{this}] a N                                                                            
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
        {                                                                                           
          // return;                                                                                
        }                                                                                           
      }                                                                                             
                                                                                                    
    }                                                                                               
                                                                                                    
                                                                                                    
                                                                                                    
 Prepared:                                                                                          
                                                                                                    
                                                                                                    
                                                                                                    
    class Cow {                                                                                     
      array T = int[index == tid                                                                    
       ? isRead ? B : B                                                                             
       : isRead ? E : E]                                                                            
                                                                                                    
       [Cow.T{this}] a N                                                                            
                                                                                                    
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
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
      {                                                                                             
                                                                                                    
      }                                                                                             
      public void f() {                                                                             
        [Cow.T{this}] a;                                                                            
        a := this.a;                                                                                
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
                                                                                                    
                                                                                                    
/*** Class Decl Cow ***/                                                                            
                                                                                                    
type Cow;                                                                                           
const unique Cow.null: Cow;                                                                         
var Cow._state: [Cow]State;                                                                         
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow.a: [Cow]Array.Cow.T;                                                                        
                                                                                                    
function {:inline} ReadEval.Cow.a(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Array.Cow.T.null;                                                                 
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow.a(tid: Tid,this : Cow,newValue: Array.Cow.T,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 moverPath(_N, 0)                                                                                   
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
var Cow._lock: [Cow]Tid;                                                                            
                                                                                                    
function {:inline} ReadEval.Cow._lock(tid: Tid,this : Cow,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 (var newValue := Tid.null;                                                                         
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Cow._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Cow._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Cow._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
 )                                                                                                  
}                                                                                                   
                                                                                                    
function {:inline} WriteEval.Cow._lock(tid: Tid,this : Cow,newValue: Tid,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if (isLocal(Cow._state[this], tid)) then                                                           
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   if (((newValue==tid)||(newValue==Tid.null))) then                                                
    moverPath(_B, 5)                                                                                
   else                                                                                             
    moverPath(_E, 1)                                                                                
 else                                                                                               
  if (isRead) then                                                                                  
   if ((Cow._lock[this]==tid)) then                                                                 
    moverPath(_R, 6)                                                                                
   else                                                                                             
    moverPath(_E, 2)                                                                                
  else                                                                                              
   if (((Cow._lock[this]==Tid.null)&&(newValue==tid))) then                                         
    moverPath(_R, 4)                                                                                
   else                                                                                             
    if (((Cow._lock[this]==tid)&&(newValue==Tid.null))) then                                        
     moverPath(_L, 8)                                                                               
    else                                                                                            
     moverPath(_E, 0)                                                                               
 )                                                                                                  
}                                                                                                   
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
/////                                                                                               
                                                                                                    
/////                                                                                               
                                                                                                    
                                                                                                    
procedure  Cow.f(tid:Tid, this : Cow)                                                               
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
                                                                                                    
requires ValidTid(tid);                                                                                    // (8.5): Bad tid
requires isShared(Cow._state[this]);                                                                       // (8.5): this is not global
                                                                                                    
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
{                                                                                                   
 var $recorded.state118584: int;                                                                    
 var $pc118584: Phase;                                                                              
 var this118584: Cow;                                                                               
 var moverPath118583: MoverPath;                                                                    
 var $pc118583: Phase;                                                                              
 var Cow._state118583: [Cow]State;                                                                  
 var $recorded.state118583: int;                                                                    
 var mover118583: Mover;                                                                            
 var Array.Cow.T._length118583: [Array.Cow.T]int;                                                   
 var Cow._lock118583: [Cow]Tid;                                                                     
 var path118583: int;                                                                               
 var Cow._state118584: [Cow]State;                                                                  
 var this118583: Cow;                                                                               
 var tid118583: Tid;                                                                                
 var Cow.a118584: [Cow]Array.Cow.T;                                                                 
 var Array.Cow.T._elems118584: [Array.Cow.T]([int]int);                                             
 var Array.Cow.T._state118583: [Array.Cow.T]State;                                                  
 var Array.Cow.T._length118584: [Array.Cow.T]int;                                                   
 var Cow.a118583: [Cow]Array.Cow.T;                                                                 
 var tid118584: Tid;                                                                                
 var a118583: Array.Cow.T;                                                                          
 var Array.Cow.T._elems118583: [Array.Cow.T]([int]int);                                             
 var a: Array.Cow.T;                                                                                
 var a118584: Array.Cow.T;                                                                          
 var Cow._lock118584: [Cow]Tid;                                                                     
 var Array.Cow.T._state118584: [Array.Cow.T]State;                                                  
                                                                                                    
 var $pc : Phase;                                                                                   
 $pc := PreCommit;                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 // 9.8: [Cow.T{this}] a;                                                                           
                                                                                                    
                                                                                                    
 // 9.8: a := this.a;                                                                               
                                                                                                    
                                                                                                    
 moverPath118583 := ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 mover118583 := m#moverPath(moverPath118583);                                                       
 path118583 := p#moverPath(moverPath118583);                                                        
 assume Cow._state118583 == Cow._state && Cow.a118583 == Cow.a && Cow._lock118583 == Cow._lock && Array.Cow.T._state118583 == Array.Cow.T._state && Array.Cow.T._elems118583 == Array.Cow.T._elems && Array.Cow.T._length118583 == Array.Cow.T._length && a118583 == a && this118583 == this && tid118583 == tid && $pc118583 == $pc;
 assume $recorded.state118583 == 1;                                                                 
 if ($pc == PreCommit) {                                                                            
  assume this != Cow.null;                                                                          
 } else {                                                                                           
  assert this != Cow.null;                                                                                 // (9.8): Cannot have potential null deference in left-mover part.
 }                                                                                                  
                                                                                                    
 $pc := transition($pc, mover118583);                                                               
 assert $pc != PhaseError;                                                                                 // (9.8): Reduction failure
 a := Cow.a[this];                                                                                  
                                                                                                    
 // 8.21: // return;                                                                                
                                                                                                    
 assume Cow._state118584 == Cow._state && Cow.a118584 == Cow.a && Cow._lock118584 == Cow._lock && Array.Cow.T._state118584 == Array.Cow.T._state && Array.Cow.T._elems118584 == Array.Cow.T._elems && Array.Cow.T._length118584 == Array.Cow.T._length && a118584 == a && this118584 == this && tid118584 == tid;
 assume $recorded.state118584 == 1;                                                                 
 return;                                                                                            
}                                                                                                   
                                                                                                    
                                                                                                    
/*** Array Array.Cow.T ***/                                                                         
                                                                                                    
type Array.Cow.T;                                                                                   
const unique Array.Cow.T.null: Array.Cow.T;                                                         
var Array.Cow.T._state: [Array.Cow.T]State;                                                         
                                                                                                    
const Array.Cow.T._this : [Array.Cow.T]Cow;                                                         
const Array.Cow.T._length : [Array.Cow.T]int;                                                       
var Array.Cow.T._elems  : [Array.Cow.T]([int]int);                                                  
                                                                                                    
axiom (forall $this : Array.Cow.T :: Array.Cow.T._length[$this] >= 0);                              
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
// Array.Cow.T: Spec(Cond(BinaryExpr(VarAccess(index),VarAccess(tid),EQ()),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(B()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(E())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} ReadEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := true;                                                                               
 if ((index==tid)) then                                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_B, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_E, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
// Array.Cow.T: Spec(Cond(BinaryExpr(VarAccess(index),VarAccess(tid),EQ()),Cond(VarAccess(isRead),ConstExpr(MoverConst(B())),ConstExpr(MoverConst(B()))),Cond(VarAccess(isRead),ConstExpr(MoverConst(E())),ConstExpr(MoverConst(E())))),false,List())
                                                                                                    
function {:inline} WriteEval.Array.Cow.T(tid: Tid,this : Cow,athis : Array.Cow.T,index : int,newValue: int,Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (MoverPath) {
 (var isRead := false;                                                                              
 if ((index==tid)) then                                                                             
  if (isRead) then                                                                                  
   moverPath(_B, 3)                                                                                 
  else                                                                                              
   moverPath(_B, 1)                                                                                 
 else                                                                                               
  if (isRead) then                                                                                  
   moverPath(_E, 2)                                                                                 
  else                                                                                              
   moverPath(_E, 0)                                                                                 
 )                                                                                                  
}                                                                                                   
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
//// Globals                                                                                        
                                                                                                    
                                                                                                    
//// State Invariant                                                                                
                                                                                                    
 function {:inline} StateInvariant(Cow._state: [Cow]State,Cow.a: [Cow]Array.Cow.T,Cow._lock: [Cow]Tid,Array.Cow.T._state: [Array.Cow.T]State,Array.Cow.T._elems: [Array.Cow.T]([int]int),Array.Cow.T._length: [Array.Cow.T]int) returns (bool) {
  true &&                                                                                           
  (forall _i: Cow  :: _i == Cow.null <==> isNull(Cow._state[_i])) &&                                
  (forall _i: Array.Cow.T  :: _i == Array.Cow.T.null <==> isNull(Array.Cow.T._state[_i])) &&        
  (forall _t: Tid, _i: Array.Cow.T  :: ValidTid(_t) && isAccessible(Array.Cow.T._state[_i], _t) ==> isAccessible(Cow._state[Array.Cow.T._this[_i]], _t)) &&
  (forall _i: Cow ::  (isShared(Cow._state[_i]) ==> isSharedAssignable(Array.Cow.T._state[Cow.a[_i]]))) &&
  (forall _i: Cow ::  (forall _t: Tid :: (ValidTid(_t) && isLocal(Cow._state[_i],_t) ==> isLocalAssignable(Array.Cow.T._state[Cow.a[_i]], _t)))) &&
  (forall _i: Cow :: { Cow.a[_i] } Array.Cow.T._this[Cow.a[_i]] == _i) &&                           
  _trigger(0) &&                                                                                    
  _trigger(1) &&                                                                                    
  _trigger(2) &&                                                                                    
  _trigger(3)                                                                                       
 }                                                                                                  
//// Spec Checks                                                                                    
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.a failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow) 
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Cow.a(u: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (6.5): Cow.a failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow) 
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.Cow.T;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume w == Cow.a[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Cow.a[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.a failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)  
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : Array.Cow.T;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume w == Cow.a[x];                                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Cow.a(u: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (6.5): Cow.a failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)      
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.a failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, x: Cow)       
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[x], u);                                                           
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : Array.Cow.T;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
 assume w == Cow.a[x];                                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_pre == x;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Cow.a[x] := havocValue;                                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_post == x;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,x: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (6.5): Cow.a failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.T failed Write-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_R);                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;                                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.Cow.T failed Write-Read Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteWrite.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
                                                                                                    
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;   // H[p.f = _]                                                  
 // Do we need to share writeByT.value if it is local?                                              
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.T failed Write-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckWriteRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _readByU : MoverPath;                                                                          
 var _readByU_Mover : Mover;                                                                        
 var _readByU_Path : int;                                                                           
 var havocValue : int;                                                                              
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByU := ReadEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H                                                             
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
 assume !isError(_writeByT_Mover);                                                                  
 assume leq(_writeByT_Mover,_L);                                                                    
                                                                                                    
 assert _readByU_Mover == _E;                                                                              // (4.5): Array Array.Cow.T failed Write-Read Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.RightMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1;  // H                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_R);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.T failed Read-Write Right-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure _CheckRead.LeftMover.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, x_owner: Cow, x: Array.Cow.T, i: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[x], u);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var _readByT : MoverPath;                                                                          
 var _readByT_Mover : Mover;                                                                        
 var _readByT_Path : int;                                                                           
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var havocValue : int;                                                                              
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
 assume w == Array.Cow.T._elems[x][i];                                                              
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && x_owner_pre == x_owner && x_pre == x && i_pre == i;
 assume $recorded.state_pre == 1;  // H                                                             
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 Array.Cow.T._elems[x][i] := havocValue;                                                            
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && x_owner_post == x_owner && x_post == x && i_post == i;
 assume $recorded.state_post == 1; // H[p.f := _]                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,x_owner: Cow,x: Array.Cow.T,i: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 assume leq(_readByT_Mover,_L);                                                                     
                                                                                                    
 assert isError(_writeByU_Mover);                                                                          // (4.5): Array Array.Cow.T failed Read-Write Left-Mover Check
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (x != y && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
 assert (x != y && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Cow.a(t: Tid, u: Tid, v: Array.Cow.T, w: Array.Cow.T, w0: Array.Cow.T, x: Cow, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Cow.a;                                                                                    
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var u_pre: Tid;                                                                                    
 var v_pre: Array.Cow.T;                                                                            
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
 var _writeByU : MoverPath;                                                                         
 var _writeByU_Mover : Mover;                                                                       
 var _writeByU_Path : int;                                                                          
 var _writeByT : MoverPath;                                                                         
 var _writeByT_Mover : Mover;                                                                       
 var _writeByT_Path : int;                                                                          
 var _writeByTPost : MoverPath;                                                                     
 var _writeByTPost_Mover : Mover;                                                                   
 var _writeByTPost_Path : int;                                                                      
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
 {                                                                                                  
 var tmpV : Array.Cow.T;                                                                            
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var $recorded.state_mid: int;                                                                      
 var x_mid: Cow;                                                                                    
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var v_mid: Array.Cow.T;                                                                            
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Cow.a[x];                                                                                  
 Cow.a[x] := v;                                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_mid == x && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Cow.a[x] := tmpV;                                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Cow.a(t: Tid,x: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (6.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Cow.a.Array.Cow.T._elems(t: Tid, u: Tid, v: Array.Cow.T, w: int, w0: int, x: Cow, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Cow._state[x], t);                                                           
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Cow.a;                                                                                    
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var v_pre: Array.Cow.T;                                                                            
 var w_pre: int;                                                                                    
 var x_pre: Cow;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var x_post: Cow;                                                                                   
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: Array.Cow.T;                                                                           
 var w_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Cow.a(t: Tid,x: Cow,v: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_pre == x && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[x] := v;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_post == x && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var y_mid: Cow;                                                                                    
 var i_mid: int;                                                                                    
 var w_mid: Array.Cow.T;                                                                            
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var w0_mid: Array.Cow.T;                                                                           
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var $pc_mid: Phase;                                                                                
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_mid == y;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Cow.a[y] := w;                                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Cow.a(u: Tid,y: Cow,w: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Cow.a[y] := w;                                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Cow.a(t: Tid, u: Tid, v: int, w: Array.Cow.T, w0: Array.Cow.T, x_owner: Cow, x: Array.Cow.T, i: int, y: Cow)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Cow._state[y], u);                                                           
 modifies Array.Cow.T._elems;                                                                       
 modifies Cow.a;                                                                                    
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var w0_pre: Array.Cow.T;                                                                           
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var $recorded.state_pre: int;                                                                      
 var w_pre: Array.Cow.T;                                                                            
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var i_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var y_pre: Cow;                                                                                    
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
                                                                                                    
 var y_post: Cow;                                                                                   
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var w0_post: Array.Cow.T;                                                                          
 var $pc_post: Phase;                                                                               
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var v_post: int;                                                                                   
 var w_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_pre == y;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_post == y;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Cow.a(u: Tid,y: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (6.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (6.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.A.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _E)) ==> ((_writeByU_Mover == _writeByUPost_Mover || _writeByU_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
 assert (leq(_writeByT_Mover, _N) && !leq(_writeByUPost_Mover, _L)) ==> (!leq(_writeByU_Mover, _L));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
 assert (true && leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByUPost_Mover == _writeByUPost_Mover || _writeByUPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 procedure Stable.Check.C.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
                                                                                                    
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.DE.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_mid: [Array.Cow.T]State;                                                    
 var t_mid: Tid;                                                                                    
 var u_mid: Tid;                                                                                    
 var Array.Cow.T._elems_mid: [Array.Cow.T]([int]int);                                               
 var i_mid: int;                                                                                    
 var $recorded.state_mid: int;                                                                      
 var Cow.a_mid: [Cow]Array.Cow.T;                                                                   
 var w_mid: int;                                                                                    
 var Array.Cow.T._length_mid: [Array.Cow.T]int;                                                     
 var x_mid: Array.Cow.T;                                                                            
 var Cow._lock_mid: [Cow]Tid;                                                                       
 var y_mid: Array.Cow.T;                                                                            
 var y_owner_mid: Cow;                                                                              
 var Cow._state_mid: [Cow]State;                                                                    
 var v_mid: int;                                                                                    
 var x_owner_mid: Cow;                                                                              
 var j_mid: int;                                                                                    
 var $pc_mid: Phase;                                                                                
 var w0_mid: int;                                                                                   
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 tmpV := Array.Cow.T._elems[x][i];                                                                  
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_mid == Cow._state && Cow.a_mid == Cow.a && Cow._lock_mid == Cow._lock && Array.Cow.T._state_mid == Array.Cow.T._state && Array.Cow.T._elems_mid == Array.Cow.T._elems && Array.Cow.T._length_mid == Array.Cow.T._length && t_mid == t && u_mid == u && v_mid == v && w_mid == w && w0_mid == w0 && x_owner_mid == x_owner && x_mid == x && i_mid == i && y_owner_mid == y_owner && y_mid == y && j_mid == j;
 assume $recorded.state_mid == 1;                                                                   
                                                                                                    
 _writeByUPost := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByUPost_Mover := m#moverPath(_writeByUPost);                                                 
 _writeByUPost_Path := p#moverPath(_writeByUPost);                                                  
                                                                                                    
 Array.Cow.T._elems[x][i] := tmpV;                                                                  
 Array.Cow.T._elems[y][j] := w;                                                                     
 _writeByTPost := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByTPost_Mover := m#moverPath(_writeByTPost);                                                 
 _writeByTPost_Path := p#moverPath(_writeByTPost);                                                  
                                                                                                    
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
                                                                                                    
                                                                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_writeByUPost_Mover, _N)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
 assert (leq(_writeByT_Mover, _N) && leq(_writeByUPost_Mover, _L)) ==> ((_writeByTPost_Mover == _writeByT_Mover || _writeByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
                                                                                                    
 }                                                                                                  
                                                                                                    
                                                                                                    
 procedure Stable.Check.FHI.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByT := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByT_Mover := m#moverPath(_readByT);                                                           
 _readByT_Path := p#moverPath(_readByT);                                                            
 _writeByU := WriteEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,w: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByU_Mover := m#moverPath(_writeByU);                                                         
 _writeByU_Path := p#moverPath(_writeByU);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[y][j] := w;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByTPost := ReadEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByTPost_Mover := m#moverPath(_readByTPost);                                                   
 _readByTPost_Path := p#moverPath(_readByTPost);                                                    
                                                                                                    
 assert (leq(_readByT_Mover, _R) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
 assert (leq(_readByT_Mover, _E) && leq(_writeByU_Mover, _L)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
 assert (true && leq(_readByT_Mover, _N) && leq(_writeByU_Mover, _N)) ==> ((_readByTPost_Mover == _readByT_Mover || _readByTPost_Mover == _E));       // (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
                                                                                                    
 }                                                                                                  
                                                                                                    
 procedure Stable.Check.JKL.Array.Cow.T._elems.Array.Cow.T._elems(t: Tid, u: Tid, v: int, w: int, w0: int, x_owner: Cow, x: Array.Cow.T, i: int, y_owner: Cow, y: Array.Cow.T, j: int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(t);                                                                              
 requires ValidTid(u);                                                                              
 requires t != u;                                                                                   
 requires isAccessible(Array.Cow.T._state[x], t);                                                   
 requires Array.Cow.T._this[x] == x_owner;                                                          
 requires isAccessible(Array.Cow.T._state[y], u);                                                   
 requires Array.Cow.T._this[y] == y_owner;                                                          
 modifies Array.Cow.T._elems;                                                                       
 modifies Array.Cow.T._elems;                                                                       
                                                                                                    
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
 var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                               
 var j_pre: int;                                                                                    
 var v_pre: int;                                                                                    
 var Cow._lock_pre: [Cow]Tid;                                                                       
 var y_owner_pre: Cow;                                                                              
 var $recorded.state_pre: int;                                                                      
 var x_owner_pre: Cow;                                                                              
 var u_pre: Tid;                                                                                    
 var w0_pre: int;                                                                                   
 var i_pre: int;                                                                                    
 var w_pre: int;                                                                                    
 var Cow._state_pre: [Cow]State;                                                                    
 var x_pre: Array.Cow.T;                                                                            
 var Cow.a_pre: [Cow]Array.Cow.T;                                                                   
 var $pc_pre: Phase;                                                                                
 var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                     
 var t_pre: Tid;                                                                                    
 var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                    
 var y_pre: Array.Cow.T;                                                                            
                                                                                                    
 var Array.Cow.T._state_post: [Array.Cow.T]State;                                                   
 var $recorded.state_post: int;                                                                     
 var w0_post: int;                                                                                  
 var t_post: Tid;                                                                                   
 var i_post: int;                                                                                   
 var Cow.a_post: [Cow]Array.Cow.T;                                                                  
 var y_owner_post: Cow;                                                                             
 var Array.Cow.T._length_post: [Array.Cow.T]int;                                                    
 var $pc_post: Phase;                                                                               
 var j_post: int;                                                                                   
 var Cow._state_post: [Cow]State;                                                                   
 var x_owner_post: Cow;                                                                             
 var Cow._lock_post: [Cow]Tid;                                                                      
 var w_post: int;                                                                                   
 var v_post: int;                                                                                   
 var y_post: Array.Cow.T;                                                                           
 var u_post: Tid;                                                                                   
 var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                              
 var x_post: Array.Cow.T;                                                                           
                                                                                                    
                                                                                                    
 _readByU := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByU_Mover := m#moverPath(_readByU);                                                           
 _readByU_Path := p#moverPath(_readByU);                                                            
 _writeByT := WriteEval.Array.Cow.T(t: Tid,x_owner: Cow,x: Array.Cow.T,i: int,v: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _writeByT_Mover := m#moverPath(_writeByT);                                                         
 _writeByT_Path := p#moverPath(_writeByT);                                                          
                                                                                                    
 assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && t_pre == t && u_pre == u && v_pre == v && w_pre == w && w0_pre == w0 && x_owner_pre == x_owner && x_pre == x && i_pre == i && y_owner_pre == y_owner && y_pre == y && j_pre == j;
 assume $recorded.state_pre == 1;                                                                   
 Array.Cow.T._elems[x][i] := v;                                                                     
 assume Cow._state_post == Cow._state && Cow.a_post == Cow.a && Cow._lock_post == Cow._lock && Array.Cow.T._state_post == Array.Cow.T._state && Array.Cow.T._elems_post == Array.Cow.T._elems && Array.Cow.T._length_post == Array.Cow.T._length && t_post == t && u_post == u && v_post == v && w_post == w && w0_post == w0 && x_owner_post == x_owner && x_post == x && i_post == i && y_owner_post == y_owner && y_post == y && j_post == j;
 assume $recorded.state_post == 1;                                                                  
                                                                                                    
 _readByUPost := ReadEval.Array.Cow.T(u: Tid,y_owner: Cow,y: Array.Cow.T,j: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length);
 _readByUPost_Mover := m#moverPath(_readByUPost);                                                   
 _readByUPost_Path := p#moverPath(_readByUPost);                                                    
                                                                                                    
 assert (leq(_writeByT_Mover, _R) && leq(_readByUPost_Mover, _E)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
 assert (leq(_writeByT_Mover, _N) && leq(_readByUPost_Mover, _L)) ==> ((_readByU_Mover == _readByUPost_Mover || _readByU_Mover == _E));       // (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
 assert (leq(_writeByT_Mover, _N) && !leq(_readByUPost_Mover, _L)) ==> (!leq(_readByU_Mover, _L));         // (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
                                                                                                    
 }                                                                                                  
                                                                                                    
procedure Yield(tid: Tid);                                                                          
requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
requires ValidTid(tid);                                                                             
modifies Cow._state;                                                                                
modifies Cow.a;                                                                                     
modifies Cow._lock;                                                                                 
modifies Array.Cow.T._state;                                                                        
modifies Array.Cow.T._elems;                                                                        
ensures StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
ensures Y(tid , old(Cow._state), old(Cow.a), old(Cow._lock), old(Array.Cow.T._state), old(Array.Cow.T._elems), old(Array.Cow.T._length) , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
                                                                                                    
// Cow.a:                                                                                           
                                                                                                    
function {:inline} Y_Cow.a(tid : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow.a(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow.a[this] == newValue))
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow.a(tid : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var newValue_yield: Array.Cow.T;                                                                    
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow.a(u: Tid,this: Cow,newValue: Array.Cow.T,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow.a(tid, this, Cow.a[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow.a.Transitive(tid : Tid, this: Cow, newValue : Array.Cow.T , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Array.Cow.T;                                                                    
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var newValue_pre: Array.Cow.T;                                                                      
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Array.Cow.T;                                                                     
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Cow.a(tid, this, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow.a(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
// Cow._lock:                                                                                       
                                                                                                    
function {:inline} Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 ((isAccessible(Cow._state[this], tid) && leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Cow._lock[this] == newValue))
 &&(((Cow._lock[this]==tid)==(newValue==tid)))                                                      
                                                                                                    
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Cow._lock(tid : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
 true                                                                                               
                                                                                                    
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Subsumes.W(tid : Tid, u : Tid, this: Cow, newValue: Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
                                                                                                    
{                                                                                                   
var newValue_yield: Tid;                                                                            
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var u_yield: Tid;                                                                                   
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume isAccessible(Cow._state[this], u);                                                          
 assume !isError(m#moverPath(WriteEval.Cow._lock(u: Tid,this: Cow,newValue: Tid,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
 assume leq(m#moverPath(ReadEval.Cow._lock(tid: Tid,this: Cow,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _N);
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && u_yield == u && newValue_yield == newValue && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Reflexive(tid : Tid, this: Cow , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Cow._lock(tid, this, Cow._lock[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Cow._lock.Transitive(tid : Tid, this: Cow, newValue : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 requires ValidTid(tid);                                                                            
                                                                                                    
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Array.Cow.T;                                                                    
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var newValue_pre: Tid;                                                                              
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var this_post: Cow;                                                                                 
var newValue_post: Tid;                                                                             
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && newValue_pre == newValue && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
 assume isAccessible(Cow._state[this], tid);                                                        
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Cow._lock(tid, this, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && newValue_post == newValue && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assert Y_Cow._lock(tid, this, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
// Array.Cow.T:                                                                                     
                                                                                                    
function {:inline} Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
 ((isAccessible(Array.Cow.T._state[athis], tid) && leq(m#moverPath(ReadEval.Array.Cow.T(tid: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)), _R)) ==> (Array.Cow.T._elems[athis][index] == newValue))
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
function {:inline} Invariant.Y_Array.Cow.T(tid : Tid, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int): bool
{                                                                                                   
(var this := Array.Cow.T._this[athis];                                                              
true                                                                                                
                                                                                                    
)                                                                                                   
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Subsumes.W(tid : Tid, u : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires ValidTid(u) && u != tid;                                                                  
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], u);                                                 
 assume !isError(m#moverPath(WriteEval.Array.Cow.T(u: Tid,Array.Cow.T._this[athis]: Cow,athis: Array.Cow.T,index: int,newValue: int,Cow._state,Cow.a,Cow._lock,Array.Cow.T._state,Array.Cow.T._elems,Array.Cow.T._length)));
                                                                                                    
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Reflexive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires ValidTid(tid);                                                                            
 requires this == Array.Cow.T._this[athis];                                                         
{                                                                                                   
var Cow.a_yield: [Cow]Array.Cow.T;                                                                  
var Cow._lock_yield: [Cow]Tid;                                                                      
var tid_yield: Tid;                                                                                 
var this_yield: Cow;                                                                                
var $pc_yield: Phase;                                                                               
var Cow._state_yield: [Cow]State;                                                                   
var Array.Cow.T._elems_yield: [Array.Cow.T]([int]int);                                              
var Array.Cow.T._length_yield: [Array.Cow.T]int;                                                    
var Array.Cow.T._state_yield: [Array.Cow.T]State;                                                   
var index_yield: int;                                                                               
var athis_yield: Array.Cow.T;                                                                       
var $recorded.state_yield: int;                                                                     
                                                                                                    
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
assume Cow._state_yield == Cow._state && Cow.a_yield == Cow.a && Cow._lock_yield == Cow._lock && Array.Cow.T._state_yield == Array.Cow.T._state && Array.Cow.T._elems_yield == Array.Cow.T._elems && Array.Cow.T._length_yield == Array.Cow.T._length && athis_yield == athis && index_yield == index && this_yield == this && tid_yield == tid;
assume $recorded.state_yield == 1;                                                                  
 assert Y_Array.Cow.T(tid, athis, index, Array.Cow.T._elems[athis][index] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
procedure Y_Array.Cow.T.Transitive(tid : Tid, this: Cow, athis: Array.Cow.T, index: int, newValue : int , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int)
 requires StateInvariant(Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
 requires StateInvariant(Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
                                                                                                    
 requires this == Array.Cow.T._this[athis];                                                         
 requires ValidTid(tid);                                                                            
{                                                                                                   
var Array.Cow.T._elems_pre: [Array.Cow.T]([int]int);                                                
var athis_pre: Array.Cow.T;                                                                         
var Cow._lock_pre: [Cow]Tid;                                                                        
var $recorded.state_pre: int;                                                                       
var index_pre: int;                                                                                 
var Cow._state_pre: [Cow]State;                                                                     
var tid_pre: Tid;                                                                                   
var Cow.a_pre: [Cow]Array.Cow.T;                                                                    
var $pc_pre: Phase;                                                                                 
var this_pre: Cow;                                                                                  
var Array.Cow.T._length_pre: [Array.Cow.T]int;                                                      
var Array.Cow.T._state_pre: [Array.Cow.T]State;                                                     
                                                                                                    
var Array.Cow.T._state_post: [Array.Cow.T]State;                                                    
var $recorded.state_post: int;                                                                      
var Cow.a_post: [Cow]Array.Cow.T;                                                                   
var Array.Cow.T._length_post: [Array.Cow.T]int;                                                     
var $pc_post: Phase;                                                                                
var Cow._state_post: [Cow]State;                                                                    
var athis_post: Array.Cow.T;                                                                        
var tid_post: Tid;                                                                                  
var Cow._lock_post: [Cow]Tid;                                                                       
var index_post: int;                                                                                
var this_post: Cow;                                                                                 
var Array.Cow.T._elems_post: [Array.Cow.T]([int]int);                                               
                                                                                                    
assume Cow._state_pre == Cow._state && Cow.a_pre == Cow.a && Cow._lock_pre == Cow._lock && Array.Cow.T._state_pre == Array.Cow.T._state && Array.Cow.T._elems_pre == Array.Cow.T._elems && Array.Cow.T._length_pre == Array.Cow.T._length && athis_pre == athis && index_pre == index && this_pre == this && tid_pre == tid;
assume $recorded.state_pre == 1;                                                                    
assume Cow._state_post == Cow._state_p && Cow.a_post == Cow.a_p && Cow._lock_post == Cow._lock_p && Array.Cow.T._state_post == Array.Cow.T._state_p && Array.Cow.T._elems_post == Array.Cow.T._elems_p && Array.Cow.T._length_post == Array.Cow.T._length_p && athis_post == athis && index_post == index && this_post == this && tid_post == tid;
assume $recorded.state_post == 1;                                                                   
 assume isAccessible(Array.Cow.T._state[athis], tid);                                               
 assume Y(tid , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assume Y_Array.Cow.T(tid, athis, index, newValue , Cow._state_p, Cow.a_p, Cow._lock_p, Array.Cow.T._state_p, Array.Cow.T._elems_p, Array.Cow.T._length_p);
 assert Y_Array.Cow.T(tid, athis, index, newValue , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length);
}                                                                                                   
                                                                                                    
                                                                                                    
function {:inline} Y(tid : Tid , Cow._state: [Cow]State, Cow.a: [Cow]Array.Cow.T, Cow._lock: [Cow]Tid, Array.Cow.T._state: [Array.Cow.T]State, Array.Cow.T._elems: [Array.Cow.T]([int]int), Array.Cow.T._length: [Array.Cow.T]int , Cow._state_p: [Cow]State, Cow.a_p: [Cow]Array.Cow.T, Cow._lock_p: [Cow]Tid, Array.Cow.T._state_p: [Array.Cow.T]State, Array.Cow.T._elems_p: [Array.Cow.T]([int]int), Array.Cow.T._length_p: [Array.Cow.T]int): bool
{                                                                                                   
 (forall this: Cow :: Y_Cow.a(tid : Tid, this, Cow.a_p[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall this: Cow :: Y_Cow._lock(tid : Tid, this, Cow._lock_p[this] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall athis: Array.Cow.T, index: int :: Y_Array.Cow.T(tid : Tid, athis, index, Array.Cow.T._elems_p[athis][index] , Cow._state, Cow.a, Cow._lock, Array.Cow.T._state, Array.Cow.T._elems, Array.Cow.T._length))
 && (forall _i : Cow :: isShared(Cow._state[_i]) ==> isShared(Cow._state_p[_i]))                    
 && (forall _i : Cow :: isLocal(Cow._state[_i], tid) <==> isLocal(Cow._state_p[_i], tid))           
 && (forall _i : Array.Cow.T :: isShared(Array.Cow.T._state[_i]) ==> isShared(Array.Cow.T._state_p[_i]))
 && (forall _i : Array.Cow.T :: Array.Cow.T._length[_i] == Array.Cow.T._length_p[_i])               
 && (forall _i : Array.Cow.T :: isLocal(Array.Cow.T._state[_i], tid) <==> isLocal(Array.Cow.T._state_p[_i], tid))
                                                                                                    
}                                                                                                   
                                                                                                    
                                                                                                    
// 386.1-460.2: (Method:8.5)
// 395.1-395.24: (8.5): Bad tid
// 396.1-396.37: (8.5): this is not global
// 433.2-435.2: (class anchor.sink.VarDeclStmt:9.8)
// 436.2-453.19: (class anchor.sink.Read:9.8)
// 448.1-448.27: (9.8): Cannot have potential null deference in left-mover part.
// 452.1-452.27: (9.8): Reduction failure
// 454.2-459.9: (class anchor.sink.Return:8.21)
// 598.1-598.34: (6.5): Cow.a failed Write-Write Right-Mover Check
// 661.1-661.30: (6.5): Cow.a failed Write-Read Right-Mover Check
// 728.1-728.34: (6.5): Cow.a failed Write-Write Left-Mover Check
// 792.1-792.30: (6.5): Cow.a failed Write-Read Left-Mover Check
// 853.1-853.34: (6.5): Cow.a failed Read-Write Right-Mover Check
// 917.1-917.34: (6.5): Cow.a failed Read-Write Left-Mover Check
// 986.1-986.34: (4.5): Array Array.Cow.T failed Write-Write Right-Mover Check
// 1055.1-1055.30: (4.5): Array Array.Cow.T failed Write-Read Right-Mover Check
// 1128.1-1128.34: (4.5): Array Array.Cow.T failed Write-Write Left-Mover Check
// 1198.1-1198.30: (4.5): Array Array.Cow.T failed Write-Read Left-Mover Check
// 1265.1-1265.34: (4.5): Array Array.Cow.T failed Read-Write Right-Mover Check
// 1335.1-1335.34: (4.5): Array Array.Cow.T failed Read-Write Left-Mover Check
// 1410.1-1410.140: (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.1)
// 1411.1-1411.101: (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.2)
// 1412.1-1412.158: (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case A.3)
// 1514.1-1514.140: (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case C)
// 1621.1-1621.144: (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case D)
// 1622.1-1622.144: (6.5): Cow.a is not Write-Write Stable with respect to Cow.a (case R)
// 1697.1-1697.136: (6.5): Cow.a is not Read-Write Stable with respect to Cow.a (case F)
// 1698.1-1698.136: (6.5): Cow.a is not Read-Write Stable with respect to Cow.a (case H)
// 1699.1-1699.146: (6.5): Cow.a is not Read-Write Stable with respect to Cow.a (case I)
// 1773.1-1773.136: (6.5): Cow.a is not Write-Read Stable with respect to Cow.a (case J)
// 1774.1-1774.136: (6.5): Cow.a is not Write-Read Stable with respect to Cow.a (case K)
// 1775.1-1775.99: (6.5): Cow.a is not Write-Read Stable with respect to Cow.a (case L)
// 1856.1-1856.140: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.1)
// 1857.1-1857.101: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.2)
// 1858.1-1858.156: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case A.3)
// 1967.1-1967.140: (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 2081.1-2081.144: (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 2082.1-2082.144: (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 2162.1-2162.136: (6.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 2163.1-2163.136: (6.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 2164.1-2164.144: (6.5): Cow.a is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 2243.1-2243.136: (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case J)
// 2244.1-2244.136: (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case K)
// 2245.1-2245.99: (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Cow.a (case L)
// 2326.1-2326.140: (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 2327.1-2327.101: (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 2328.1-2328.156: (6.5): Cow.a is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 2437.1-2437.140: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case C)
// 2551.1-2551.144: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case D)
// 2552.1-2552.144: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Cow.a (case R)
// 2632.1-2632.136: (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case F)
// 2633.1-2633.136: (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case H)
// 2634.1-2634.144: (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Cow.a (case I)
// 2713.1-2713.136: (6.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 2714.1-2714.136: (6.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 2715.1-2715.99: (6.5): Cow.a is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 2801.1-2801.140: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.1)
// 2802.1-2802.101: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.2)
// 2803.1-2803.156: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case A.3)
// 2919.1-2919.140: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case C)
// 3040.1-3040.144: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case D)
// 3041.1-3041.144: (4.5): Array Array.Cow.T is not Write-Write Stable with respect to Array Array.Cow.T (case R)
// 3126.1-3126.136: (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case F)
// 3127.1-3127.136: (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case H)
// 3128.1-3128.144: (4.5): Array Array.Cow.T is not Read-Write Stable with respect to Array Array.Cow.T (case I)
// 3212.1-3212.136: (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case J)
// 3213.1-3213.136: (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case K)
// 3214.1-3214.99: (4.5): Array Array.Cow.T is not Write-Read Stable with respect to Array Array.Cow.T (case L)
// 3247.1-3269.2: (6.5): yields_as clause for Cow.a is not valid
// 3274.1-3291.2: (6.5): yields_as clause for Cow.a is not reflexive
// 3297.1-3331.2: (6.5): yields_as clause for Cow.a is not transitive
// 3351.1-3373.2: (7.32): yields_as clause for Cow._lock is not valid
// 3378.1-3395.2: (7.32): yields_as clause for Cow._lock is not reflexive
// 3401.1-3435.2: (7.32): yields_as clause for Cow._lock is not transitive
// 3453.1-3479.2: (4.5): yields_as clause for Array.Cow.T is not valid
// 3480.1-3503.2: (4.5): yields_as clause for Array.Cow.T is not reflexive
// 3508.1-3546.2: (4.5): yields_as clause for Array.Cow.T is not transitive
